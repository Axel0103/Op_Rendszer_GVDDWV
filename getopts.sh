#!/bin/bash

while getopts ":hvcpdt" opt;do
case ${opt} in
h )
bash help.sh
;;
v )
bash versenyek.sh
;;
c )
bash csapatok.sh
;;
p )
bash pilotak.sh
;;
d )
bash pvb.sh
;;
t )
bash csvb.sh
;;
\? )
echo "Szintaxis: getopts.sh [-h][-v][-c][-p][-d][-t]"
;;
esac
done
