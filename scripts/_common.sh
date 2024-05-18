#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

#=================================================
# PERSONAL HELPERS
#=================================================

get_synapse_db_name() {
	# Parameters: synapse instance identifier
	# Returns: database name
	ynh_app_setting_get --app="$1" --key=db_name
}

wait_for_user_to_exist_in_synapse_db() {
	# Indefinitely check if the user exists
	# This is a separate script to allow launching with timeout(1)
	# Parameters:
	#  - username (in the form @user:server)
	#  - synapse database
	# Returns 0 if user is found to exist

	local username="$1"
	local synapse_db="$2"

	sql="select exists(select 1 from users where name = '$username');"
	retval=""
	while true; do
		# A yunohost helper to do that would be welcome
		retval=$(cd / && sudo -u postgres psql --dbname="$synapse_db" -c "$sql" -q -t)
		if [ "$retval" = " t" ]; then # User exists
			break
		fi
		sleep 0.5 # Avoid retrying too eagerly
	done
	return 0
}

set_bot_admin_status() {
	# Set bot admin status in synapse DB
	# This relies on several bash variables being set in the caller environment:
	# server_name, botname, bot_synapse_adm, app

	local timeout=120
	local bot_synapse_db_user="@$botname:$server_name"
	local synapse_db_name=$(get_synapse_db_name $synapse_instance)

	ynh_print_info --message="Updating bot user admin status"
	export -f wait_for_user_to_exist_in_synapse_db # Export function to subprocesses so that it may be called with timeout
	# Wait until the user is created in synapse db
	if ! timeout $timeout bash -c "wait_for_user_to_exist_in_synapse_db \"$bot_synapse_db_user\" \"$synapse_db_name\"" 2>&1; then
		ynh_print_warn --message="Bot user $bot_synapse_db_user did not exist after $timeout seconds, skipping changing its admin status"
	fi

	# (Note that, by default, non-admins might not have your homeserver's permission to create communities.)
	if [ "$bot_synapse_adm" = true ] || [ "$bot_synapse_adm" = "1" ]; then
	    bot_synapse_adm=1
	#    #yunohost app action run $synapse_instance set_admin_user -a username=$botname
	else
	    bot_synapse_adm=0
	fi
	ynh_psql_execute_as_root --database="$synapse_db_name" --sql="UPDATE users SET admin = $bot_synapse_adm WHERE name = '$bot_synapse_db_user';"

	ynh_systemd_action --service_name="$app" --action="restart" --log_path="/var/log/$app/$app.log"
}

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
