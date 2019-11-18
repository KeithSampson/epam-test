#!/usr/bin/env bash

if [[ `nginx -t > /dev/null 2>&1;echo $?` != "0" ]]; then
    nginx -t
    exit $?
else
    echo "nginx: configuration test is successful"
    if [[ `service nginx status > /dev/null 2>&1; echo $?` != "0" ]]; then
        echo "Nginx is not run. Will be restarted"
        service nginx restart
    else
        echo "Nginx is run. Will be reloaded"
        service nginx reload
    fi
fi
exit 0