#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

# dependencies used by the app (must be on a single line)
pkg_dependencies="postgresql python3 python3-dev build-essential libolm-dev"
extra_dependencies="libunixsocket-java signald signaldctl"

#=================================================
# PERSONAL HELPERS
#=================================================

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================

#=================================================
# RETRIEVE ARGUMENTS FROM THE MANIFEST
#=================================================

dendritenumber=$YNH_APP_ARG_DENDRITENUMBER
botname=$YNH_APP_ARG_BOTNAME
bot_dendrite_adm=true
encryption=false
botadmin=$YNH_APP_ARG_BOTADMIN
botusers=$YNH_APP_ARG_BOTUSERS

app=$YNH_APP_INSTANCE_NAME

if [ "$botusers" == "admin" ]
then
	botusers=$botadmin
fi

# ToDo check (in manifest?) if the selected dendrite instance is not already connected to a mautrix_bridge bridge
if [ $dendritenumber -eq "1" ]
then
	dendrite_instance="dendrite"
else
	dendrite_instance="dendrite__$dendritenumber"
fi
server_name=$(ynh_app_setting_get --app $dendrite_instance --key server_name)
domain=$(ynh_app_setting_get --app $dendrite_instance --key domain)
mautrix_version=$(ynh_app_upstream_version)
enable_relaybot=true
# TODO add admin support
#bot_dendrite_db_user="@$botname:$server_name"
#dendrite_db_name="matrix_$synapse_instance"
signald_user="signald" # This is actually chosen by the signald dependency
target_app_service_config="/opt/yunohost/$dendrite_instance/app-service/$app.yaml"