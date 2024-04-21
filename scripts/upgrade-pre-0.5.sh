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

# Remove rustup
export PATH="$PATH:$install_dir/.cargo/bin:$install_dir/.local/bin:/usr/local/sbin"

if [ -e "$install_dir/.rustup" ]; then
    ynh_exec_as "$app" env "PATH=$PATH" rustup self uninstall
fi

# Remove signald executable
ynh_remove_systemd_config --service="signald"
ynh_secure_remove --file="$signald_exe"

# Remove signald data
ynh_secure_remove --file="$signald_data"
# Remove signald system user
ynh_system_user_delete --username=$signald_user

