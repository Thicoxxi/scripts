#!/bin/bash
function menu {
    EXT_IFACE_4INET="em1"
    EXT_IP_4INET="177.84.241.119"
    EXT_NETMASK_4INET="255.255.248.0"
    DEFAULT_GW_4INET="177.84.240.1"
    EXT_IFACE_ALGAR="eth0"
    EXT_IP_ALGAR="201.48.5.193"
    EXT_NETMASK_ALGAR="255.255.255.240"
    DEFAULT_GW_ALGAR="201.48.5.206"
    OPTION="ok"
    while true; do
        echo "#################################################################"
        echo "                      Change gateway                             "
        echo "#################################################################"
        echo "[1] Switch to default gateway"
        echo "[2] Switch to backup gateway"
        echo "Press any key to Exit"
        echo ""
        echo -n "Enter the option: "
        read OPTION
        case $OPTION in
            1)route del default
            ifconfig $EXT_IFACE_ALGAR $EXT_IP_ALGAR netmask $EXT_NETMASK_ALGAR
            route add default gw $DEFAULT_GW_ALGAR
            echo "The gateway has switched to Algar Internet";;
            2)route del default
            ifconfig $EXT_IFACE_4INET $EXT_IP_4INET netmask $EXT_NETMASK_4INET
            route add default gw $DEFAULT_GW_4INET
            echo "The gateway has switched to 4Inet Inernet";;
            *)echo "exiting script"
              exit;;
            esac
    done
}
menu