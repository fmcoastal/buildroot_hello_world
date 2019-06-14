#!/bin/bash

REV=1.0.0
BASENAME=hello_world


HASHNAME="$BASENAME".hash
FILENAME="$BASENAME"-"$REV".tgz


banner() {
echo ""
echo "********"
echo "* $1"
echo "********"
}


banner  "ls FILENAME"
ls $FILENAME


banner "deleting old $FILENAME"
rm -rf $FILENAME

banner "create new $FILENAME"
tar -czvf $FILENAME *


#banner "move $FILENAME to original Location"
#mv $FILENAME ../.

banner "generate md5 hash of file "
hash=$(md5sum $FILENAME)    

echo "md5sum  $hash " > $HASHNAME



echo ""
echo "DONE"
echo ""
