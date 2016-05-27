#!/bin/bash
# curl script to measure load times for top level LMFDB pages
while true
do
for object in "/ArtinRepresentation/random" "/GaloisGroup/random" "/LocalField/random" "/ModularForm/GL2/TotallyReal/random" "/EllipticCurve/Q/random" "/EllipticCurve/random" "Genus2Curve/random" "/NumberField/random" "SatoTateGroup/random" "Lattice/random"
do 
url=http://www.lmfdb.org/${object};
for i in `seq 1 $1`;
do
echo -e $url : $(curl -silent -o /dev/null -w "Connect: %{time_connect} TTFB: %{time_starttransfer} Total time: %{time_total} \n" ${url});
done;
sleep 30
done;
done;