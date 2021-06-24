#!/bin/bash

curl "https://ergast.com/api/f1/2021/constructors.json" |jq -r .[].ConstructorTable.Constructors[].name > cname.txt
curl "https://ergast.com/api/f1/2021/constructors.json" |jq -r .[].ConstructorTable.Constructors[].nationality > cnationality.txt

clear

paste cname.txt cnationality.txt > csapatok.txt
sed -i "1i\///////////	///////////" csapatok.txt
sed -i "1i\Csapat Neve	Nemzetisége" csapatok.txt
cat csapatok.txt | column -t -s$'\t'
rm cname.txt
rm cnationality.txt
rm csapatok.txt
