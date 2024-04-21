#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

enable_relaybot=true

#=================================================
# PERSONAL HELPERS
#=================================================

_install_rustup() {
    export PATH="$PATH:$install_dir/.cargo/bin:$install_dir/.local/bin:/usr/local/sbin"

    if [ -e "$install_dir/.rustup" ]; then
        ynh_exec_as "$app" env "PATH=$PATH" rustup update
    else
        ynh_exec_as "$app" bash -c 'curl -sSf -L https://static.rust-lang.org/rustup.sh | sh -s -- -y --default-toolchain=stable --profile=minimal'
    fi
}

_mautrix_signal_build_venv() {
    python3 -m venv "$install_dir/venv"
    "$install_dir/venv/bin/pip3" install --upgrade pip setuptools wheel
    "$install_dir/venv/bin/pip3" install --upgrade \
        "$install_dir/src/mautrix-signal.tar.gz[metrics,e2be,formattednumbers,qrlink,stickers]"
}

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
