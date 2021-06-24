#!/bin/bash

curl "https://ergast.com/api/f1/2021/driverStandings.json" |jq -r .[].StandingsTable.StandingsLists[].DriverStandings[].positionText > dposition.txt
curl "https://ergast.com/api/f1/2021/driverStandings.json" |jq -r .[].StandingsTable.StandingsLists[].DriverStandings[].Driver.givenName > dpilot1.txt
curl "https://ergast.com/api/f1/2021/driverStandings.json" |jq -r .[].StandingsTable.StandingsLists[].DriverStandings[].Driver.familyName > dpilot2.txt
curl "https://ergast.com/api/f1/2021/driverStandings.json" |jq -r .[].StandingsTable.StandingsLists[].DriverStandings[].Constructors[].name > dteam.txt
curl "https://ergast.com/api/f1/2021/driverStandings.json" |jq -r .[].StandingsTable.StandingsLists[].DriverStandings[].points > dpoints.txt
curl "https://ergast.com/api/f1/2021/driverStandings.json" |jq -r .[].StandingsTable.StandingsLists[].DriverStandings[].wins > dwins.txt

clear
echo "Az egyéni világbajnokság aktuális állása:"
echo "-----------------------------------------"
paste dposition.txt dpilot1.txt	dpilot2.txt dteam.txt dpoints.txt dwins.txt > dstand.txt
sed -i "1i\//////////	//////////	//////////	//////////	//////////	//////////" dstand.txt
sed -i "1i\Pozíció	Keresztnév	Családnév	Csapat	Pontok	Győzelmek" dstand.txt
cat dstand.txt | column -t -s$'\t'
rm dposition.txt
rm dpilot1.txt
rm dpilot2.txt
rm dteam.txt
rm dpoints.txt
rm dwins.txt
rm dstand.txt
