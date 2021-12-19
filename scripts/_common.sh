#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

# dependencies used by the app
pkg_dependencies="postgresql python3"
extra_dependencies="libunixsocket-java signald>=0.15.0-27 signaldctl"

#=================================================
# PERSONAL HELPERS
#=================================================

# Usage:
# $1 URL
# $2 hash
# $3 user-friendly name
function install_deb {
	local URL="$1"
	local sha256sum="$2"
	local name="$3"

	local temp_folder="$(mktemp -d)"
	local deb_dst="$temp_folder/target_deb.deb"
	ynh_exec_quiet "wget -q -O \"$deb_dst\" \"$URL\""
	echo "$sha256sum  $deb_dst" | sha256sum -c
	DEBIAN_FRONTEND=noninteractive ynh_exec_warn_less apt-get install -yq -o Dpkg::Options::='--force-confold' "$deb_dst"
	ynh_secure_remove "$temp_folder"
}

function install_signald {
	local arch=$(dpkg --print-architecture)
	local version=0.15.0-27-88722d97
	# arch suffixes
	local URL=https://updates.signald.org/pool/main/s/signald/signald_${version}_${arch}.deb
	local -A sha256_signald # hash dictionary
	sha256_signald['amd64']=4cc1c3410c224307f24a2c224a55725efa4f620ff54e01933d7b0ce61332c87e
	sha256_signald['arm64']=797dd6764ac535345c5d58884bfa222c367b97a3b74f776896b1ef36ef39164b
	sha256_signald['armhf']=d2fd2ebbdd7fe1ca35b8491239d8665699e9e5db1ec007551cc64084c3bfca95
	install_deb "$URL" ${sha256_signald[$arch]} signald
}

function install_signaldctl {
	local arch=$(dpkg --print-architecture)
	local version=0.3.0-11-dd56e3d6
	# arch suffixes
	local URL=https://updates.signald.org/pool/main/s/signaldctl/signaldctl_${version}_${arch}.deb
	local -A sha256_signald # hash dictionary
	sha256_signald['amd64']=a4dbf79441b28026645fd61e926a7c63231f2c7a2cd81c44658b7b51ecae6eee
	sha256_signald['arm64']=15fb4f187a0756137c210fad4898bdc35fd862aeb230291a8fc7100b1fe66058
	sha256_signald['armhf']=69c2ed93fe4e3787b081ea51c889dcdbfe1baff467f93b0573bf46f0095ed889
	install_deb "$URL" ${sha256_signald[$arch]} signaldctl
}


function install_mautrix_signal_deps {
	install_signaldctl
	install_signald
}

function remove_mautrix_signal_deps {
	ynh_exec_warn_less dpkg -r signald signaldctl
}

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
