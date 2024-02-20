#!/bin/bash
CHECK_NAME=Sully_5.sh
x=5
# Comment here
Sully(){
if [ ! -f ${CHECK_NAME} ];
then
touch ${CHECK_NAME}
export SULLY=4
else
if [ ! $SULLY ];
then
export SULLY=0
fi
x=${SULLY}
tmp=$(($x-1))
export SULLY=$tmp
fi
if [ $x -le 0 ];
then
return 0;
fi
touch Sully_$x.sh
chmod +x Sully_$x.sh
s='#!/bin/bash\12CHECK_NAME=Sully_5.sh\12x=5\12# Comment here\12Sully(){\12if [ ! -f ${CHECK_NAME} ];\12then\12touch ${CHECK_NAME}\12export SULLY=4\12else\12if [ ! $SULLY ];\12then\12export SULLY=0\12fi\12x=${SULLY}\12tmp=$(($x-1))\12export SULLY=$tmp\12fi\12if [ $x -le 0 ];\12then\12return 0;\12fi\12touch Sully_$x.sh\12chmod +x Sully_$x.sh\12s=\47%s\47\12printf "$s" "$s" > Sully_$x.sh;\12./Sully_$x.sh\12}\12Sully\12'
printf "$s" "$s" > Sully_$x.sh;
./Sully_$x.sh
}
Sully
