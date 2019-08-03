#!/bin/bash
# this script file refreshes the buildroot package tarball
# specifically:
#  -  If an old tarball exists, deletes it
#  -  creates a new tarball of the files in this directory,
#  -  If requested, Places tarball on HTTP Server
#  =  Creates an MD5 checksum of the tarball

REV=1.0.0
BASENAME=hello_world


HASHNAME="$BASENAME".hash
FILENAME="$BASENAME"-"$REV".tgz

RED=$'\e[31m'
GREEN=$'\e[32m'
YELLOW=$'\e[33m'
CYAN=$'\e[36m'
NORMAL=$'\e[0m'
INVERT=$'\e[7m'

banner() {
echo ""
echo "$GREEN********"
echo "* $1"
echo "********$NORMAL"
}


banner  "Check if  $FILENAME exists"
echo "ls $FILENAME"
ls $FILENAME

if [ -f $FILENAME] ; then
 banner "delete old $FILENAME"
 echo "rm -rf  $FILENAME"
 rm -rf $FILENAME
fi

banner "create new tarball for  $FILENAME"
echo "tar -czvf $FILENAME *"
tar -czvf $FILENAME *

banner "generate md5 hash for $FILENAME"
echo "md5sum $FILENAME"    
hash=$(md5sum $FILENAME)    
echo "md5sum  $hash " > $HASHNAME



echo "$CYAN Copy $FILENAME to hooch https server (Y/n): $INVERT"
IFS= read -r INPUT
IP_ADDRESS=10.11.65.84
if [ "$INPUT" == "" ] || [ "$INPUT" == "Y" ] || [ "$INPUT" == "y" ]
then
    echo " transferring the file: "
    echo " scp $FILENAME $IP_ADDRESS:/var/www/html/."

# CHeck the scp function works.   I have congured SSH keys to share
# files without passwords for "root"

    scp $FILENAME root@$IP_ADDRESS:/scratch/hello_world/.
    scp $HASHNAME root@$IP_ADDRESS:/scratch/hello_world/.
#    scp $FILENAME root@$IP_ADDRESS:/var/www/html/.
#    scp $HASHNAME root@$IP_ADDRESS:/var/www/html/.

#    echo " mv  $FILENAME ../."
#    mv $FILENAME ../.

fi
echo $NORMAL

echo ""
echo "DONE"
echo ""
