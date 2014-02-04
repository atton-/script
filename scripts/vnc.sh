#!/bin/sh

# global variables
install_prefix="/usr/local/bin"
tree_vnc_url="http://www.cr.ie.u-ryukyu.ac.jp/software/TreeVNC.jar"
tree_vnc_command_name="TreeVNC.jar"
tree_vnc_abs_path="${install_prefix}/${tree_vnc_command_name}"


# commands

function install_vnc() {
    if [ -e ${tree_vnc_abs_path} ]; then
        echo "TreeVNC is already installed."
        exit
    fi

    wget --directory-prefix=${install_prefix} ${tree_vnc_url}

    if [ $? -eq 0 ]; then
        echo "install success"
    else
        echo "error : command return invalid value"
        exit
    fi
}

function uninstall_vnc() {
    rm -f ${tree_vnc_abs_path}

    if [ $? -eq 0 ]; then
        echo "uninstall success"
    else
        echo "error : command return invalid value"
        exit
    fi
}

function vnc_server() {
    if [ ! -e ${tree_vnc_abs_path} ]; then
        echo "TreeVNC not found."
        echo "Please install TreeVNC"
        exit
    fi

    java -jar ${tree_vnc_abs_path} -p
}

function open_vnc()
{
    if [ ! -e ${tree_vnc_abs_path} ]; then
        echo "TreeVNC not found."
        echo "Please install TreeVNC"
        exit
    fi

    open ${tree_vnc_abs_path}
}

function usage() {
    echo "This script is wrapper for TreeVNC."
    echo "--- commands list ---"
    echo "\tinstall   : install TreeVNC into ${install_prefix}"
    echo "\tuninstall : uninstall TreeVNC in ${install_prefix}"
    echo "\tupdate    : update TreeVNC"
    echo "\tserver    : launch TreeVNC on server mode"
    echo "\topen      : open TreeVNC on 'open' command"
}



# main

command=$1

case "$command" in
    "install")
        install_vnc
        ;;

    "uninstall")
        uninstall_vnc
        ;;

    "update")
        echo "update TreeVNC"
        uninstall_vnc
        install_vnc
        ;;

    "server")
        vnc_server
        ;;

    "open")
        open_vnc
        ;;

    *)
        echo "'$command' is invalid command. Please see it."
        echo
        usage
esac
