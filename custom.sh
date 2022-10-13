#!/bin/bash
# Code here will be executed on every boot and shutdown.

case "$1" in
    start)
        # Code in here will only be executed on boot.
        if [ ! -d "/storage" ] ; then
          cd /
          ln -sf userdata storage
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
        ;;
    *)
        # Code in here will be executed in all other conditions.
        echo "all other conditions"
        ;;
esac

exit $?
