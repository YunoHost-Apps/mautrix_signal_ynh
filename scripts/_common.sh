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

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
