#!/bin/bash

curl "https://ergast.com/api/f1/2021/drivers.json" |jq -r .[].DriverTable.Drivers[].givenName > pkereszt.txt
curl "https://ergast.com/api/f1/2021/drivers.json" |jq -r .[].DriverTable.Drivers[].familyName > pcsalad.txt
curl "https://ergast.com/api/f1/2021/drivers.json" |jq -r .[].DriverTable.Drivers[].nationality > pnationality.txt
curl "https://ergast.com/api/f1/2021/drivers.json" |jq -r .[].DriverTable.Drivers[].permanentNumber > pnumber.txt
curl "https://ergast.com/api/f1/2021/drivers.json" |jq -r .[].DriverTable.Drivers[].dateOfBirth > pdate.txt
clear

paste pkereszt.txt pcsalad.txt pnationality.txt pnumber.txt pdate.txt > pilotak.txt
sed -i "1i\//////////	//////////	//////////	//////////	//////////" pilotak.txt
sed -i "1i\Keresztnév	Családnév	Nemzetiség	Rajtszám	születési dátum" pilotak.txt
cat pilotak.txt | column -t -s$'\t'
rm pkereszt.txt
rm pcsalad.txt
rm pnationality.txt
rm pnumber.txt
rm pdate.txt
rm pilotak.txt
