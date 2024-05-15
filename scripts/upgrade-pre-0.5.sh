#!/bin/bash

# This script is intended to handle the upgrade from python to go.
# It should be ran exactly once, when installing a post-v5.0 version onto a pre-v5.0 version.
#
# This script is intended to be sourced from the main upgrade script, in order to retain variables

#=================================================
# MIGRATION 1 : PYTHON TO GO BRIDGE
#=================================================

# Version 0.5.1 of Mautrix Signal Bridge is written in Go, whereas previous versions
# were written in Python. Also signald data is not needed anymore.

signald_data="/var/lib/signald"
signald_exe="/usr/bin/signald"
signald_user="signald"

# Stop signald, and force stop all processes just in case
# We do not care about data loss, since we are going to delete the data anyway
ynh_systemd_action --service_name="signald" --action="stop"
sleep 10 # Temporisation to allow signald to stop gracefully
pkill -u "$signald_user" --signal 9 || true

# Remove rustup
if [ -e "$install_dir/.rustup" ]; then
    ynh_exec_as "$app" "$install_dir/.cargo/bin/rustup" self uninstall
fi

# Remove signald executable
ynh_remove_systemd_config --service="signald"
ynh_secure_remove --file="$signald_exe"

# Remove signald data
ynh_secure_remove --file="$signald_data"

# Remove signald system user and group
ynh_system_user_delete --username=$signald_user
if ynh_system_group_exists --group="$signald_user"; then
    groupdel "$signald_user"
fi


#=================================================
# MIGRATION 2 : MISSING CONFIGURATION VARIABLES
#=================================================

# Check if variable exists
enable_relaybot="$(ynh_app_setting_get --app="$app" --key=enable_relaybot)"

if [[ ! "$enable_relaybot" = "true" && ! "$enable_relaybot" = "false" ]] # Check setting is valid
then
    enable_relaybot=$(python yaml2json.py "$install_dir/config.yaml" | jq -r .bridge.relay.enabled)
    if [[ ! "$enable_relaybot" = "true" && ! "$enable_relaybot" = "false" ]]
    then
	ynh_script_progression --message="Previous setting for enable_relaybot was invalid, defaulting to enabled" --weight=2
	enable_relaybot="true"
    else
	ynh_script_progression --message="Migrating previous configuration value for enable_relaybot: $enable_relaybot" --weight=1
    fi
    ynh_app_setting_set --app="$app" --key=enable_relaybot --value="$enable_relaybot"
fi
