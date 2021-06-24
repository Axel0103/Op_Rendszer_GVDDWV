#!/bin/bash

curl "https://ergast.com/api/f1/2021.json" |jq -r .[].RaceTable.Races[].raceName > racename.txt
curl "https://ergast.com/api/f1/2021.json" |jq -r .[].RaceTable.Races[].round > round.txt
curl "https://ergast.com/api/f1/2021.json" |jq -r .[].RaceTable.Races[].Circuit.Location.country > country.txt
curl "https://ergast.com/api/f1/2021.json" |jq -r .[].RaceTable.Races[].date > date.txt

clear

paste round.txt country.txt racename.txt date.txt > naptar.txt
sed -i "1i\/////////	//////////	/////////	/////////" naptar.txt
sed -i "1i\Forduló	Ország	VersenyNév	Dátum" naptar.txt
cat naptar.txt | column -t -s$'\t'
rm round.txt
rm country.txt
rm racename.txt
rm date.txt
rm naptar.txt
