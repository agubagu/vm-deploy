#!/bin/bash
ICINGA_BIN="/usr/sbin/icinga2"
ICINGA_TMP_FILE="/tmp/icinga_node_count"

if [ ! -e $ICINGA_TMP_FILE ]
   then
      touch $ICINGA_TMP_FILE && echo "0" > $ICINGA_TMP_FILE
fi

ICINGA_COUNT=$( /sbin/icinga2 node list 2>&1 | grep -cE 'Node|Host|Service' )
ICINGA_CURRENT_COUNT=$(  cat $ICINGA_TMP_FILE )

#echo $ICINGA_COUNT >> /var/log/messages
#echo $ICINGA_CURRENT_COUNT

if [ $ICINGA_COUNT -ne $ICINGA_CURRENT_COUNT ];
   then
      echo "Restarting ICINGA2 service" >> /var/log/messages
      $ICINGA_BIN node update-config > /dev/null 2>&1
      systemctl restart icinga2
      echo "$ICINGA_COUNT" > "$ICINGA_TMP_FILE"
fi