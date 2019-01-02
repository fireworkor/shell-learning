#!/bin/bash


case $1 in
    start)
        service httpd start
        echo "starting..."
        ;;
    status)
        service httpd status
        echo "status..."
        ;;
    stop)
        service httpd stop
        echo "stopping"
        ;;

    *)
	    echo "Usage:start|status|stop"
esac

