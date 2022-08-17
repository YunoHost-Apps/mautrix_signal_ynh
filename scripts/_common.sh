#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

# dependencies used by the app
pkg_dependencies="postgresql python3 python3-dev build-essential"
extra_dependencies="libunixsocket-java signald signaldctl"

# rustc is mandatory as weel is not existent for arm32 bits
if [ $YNH_ARCH == "armhf" ] 
then
	pkg_dependencies_arm="rustc"
	pkg_dependencies="$pkg_dependencies $pkg_dependencies_arm"
fi
#=================================================
# PERSONAL HELPERS
#=================================================

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
