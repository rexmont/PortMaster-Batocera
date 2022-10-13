#!/bin/bash
# Code here will be executed on every boot and shutdown.

case "$1" in
    start)
        # Code in here will only be executed on boot.
        if [ ! -d "/storage" ] ; then
          cd /
          ln -sf userdata storage
        fi

        if [ ! -d "/roms" ] ; then
          cd /
          ln -sf userdata/roms/ roms
        fi
        ;;
    stop)
        echo "stopped"
        ;;
    restart|reload)
        if [ ! -d "/storage" ] ; then
          cd /
          ln -sf userdata storage
        fi

        if [ ! -d "/roms" ] ; then
          cd /
          ln -sf userdata/roms/ roms
        fi
        ;;
    *)
        # Code in here will be executed in all other conditions.
        echo "all other conditions"
        ;;
esac

exit $?
