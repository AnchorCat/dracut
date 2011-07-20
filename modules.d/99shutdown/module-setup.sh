#!/bin/bash
# -*- mode: shell-script; indent-tabs-mode: nil; sh-basic-offset: 4; -*-
# ex: ts=8 sw=4 sts=4 et filetype=sh

check() {
    return 255
}

depends() {
    echo base
    return 0
}

install() {
    local _d
    dracut_install umount
    dracut_install poweroff reboot halt
    dracut_install -o kexec
    inst "$moddir/shutdown" "$prefix/shutdown"
    [ -e "${initdir}/lib" ] || mkdir -m 0755 -p ${initdir}/lib
    mkdir -m 0755 -p ${initdir}/lib/dracut
    mkdir -m 0755 -p ${initdir}/lib/dracut/hooks
    for _d in $hookdirs shutdown shutdown-emergency; do
        mkdir -m 0755 -p ${initdir}/lib/dracut/hooks/$_d
    done
}
