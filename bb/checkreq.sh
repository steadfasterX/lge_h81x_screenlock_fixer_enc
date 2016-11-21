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

# if system is not mounted abort
if [ ! -f /system/bin/bootanimation ];then
    echo "$0 - /system is NOT mounted!!!" >> /tmp/recovery.log 
    exit 3
else
    echo "$0 - /system is mounted" >> /tmp/recovery.log    
fi

# if data is not mounted abort
if [ ! -d /data/dalvik-cache ];then
    echo "$0 - /data is NOT mounted!!!" >> /tmp/recovery.log 
    exit 4
else
    echo "$0 - /data is mounted" >> /tmp/recovery.log    
fi

