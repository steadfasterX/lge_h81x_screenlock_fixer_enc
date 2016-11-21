#!/sbin/sh 
###################################################################################################################################
#
### LICENSE
# This code is licensed under the Creative Commons License: CC BY-SA 4.0
#
### DISCLAIMER
#
# The following deed **highlights only** some of the key features and terms of the actual license.
# It is NOT a license and has NO legal value. You should carefully review ALL of the terms and conditions of the actual
# license before using the licensed material.
#
# Please check the following link for details and the full legal content:
#
# http://creativecommons.org/licenses/by-sa/4.0/legalcode
#
##### You are free to:
#
# * Share - copy and redistribute the material in any medium or format
# * Adapt - remix, transform, and build upon the material
# 
# for any purpose, even commercially.
#
# The licensor cannot revoke these freedoms as long as you follow the license terms.
#
##### Under the following terms:
#
# * Attribution:
# 
#   You must give appropriate credit, provide a link to the license, and indicate if changes were made.
#   You may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use.
#   
# * ShareAlike:
# 
#   If you remix, transform, or build upon the material, you must distribute your contributions under the same
#   license as the original.
#
##################################################################################################################################

BAKPATH=/data/system/gk_backup
EXTCOD=0

[ ! -d $BAKPATH ]&&/tmp/busybox mkdir $BAKPATH/

# move gatekeeper files
for gk in $(/tmp/busybox find /data/system/ -maxdepth 1 -type f -name "gatekeeper.*.key");do
    mv $gk $BAKPATH/
    if [ $? -ne 0 ];then
        echo "$0 - moving gatekeeper file <$gk> to <$BAKPATH> ended with an ERROR!" >> /tmp/recovery.log
        EXTCOD=$((EXTCOD+1))
    else
        echo "$0 - moved gatekeeper file <$gk> to <$BAKPATH> successfully" >> /tmp/recovery.log
    fi
done

# move locksettings db
for LS in $(/tmp/busybox find /data/system/ -maxdepth 1 -type f -name "locksettings.db*");do
    mv $LS $BAKPATH/
    if [ $? -ne 0 ];then
        echo "$0 - moving locksettings file <$LS> to <$BAKPATH> ended with an ERROR!" >> /tmp/recovery.log
        EXTCOD=$((EXTCOD+1))
    else
        echo "$0 - moved locksettings file <$LS> to <$BAKPATH> successfully" >> /tmp/recovery.log
    fi
done

exit $EXTCOD