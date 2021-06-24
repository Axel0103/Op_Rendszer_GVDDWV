#!/bin/bash

curl "https://ergast.com/api/f1/2021/constructorStandings.json" |jq -r .[].StandingsTable.StandingsLists[].ConstructorStandings[].positionText > tposition.txt
curl "https://ergast.com/api/f1/2021/constructorStandings.json" |jq -r .[].StandingsTable.StandingsLists[].ConstructorStandings[].Constructor.name > tname.txt
curl "https://ergast.com/api/f1/2021/constructorStandings.json" |jq -r .[].StandingsTable.StandingsLists[].ConstructorStandings[].Constructor.nationality > tnati.txt
curl "https://ergast.com/api/f1/2021/constructorStandings.json" |jq -r .[].StandingsTable.StandingsLists[].ConstructorStandings[].points > tpoints.txt
curl "https://ergast.com/api/f1/2021/constructorStandings.json" |jq -r .[].StandingsTable.StandingsLists[].ConstructorStandings[].wins > twins.txt

clear
echo "Az konstruktőri világbajnokság aktuális állása:"
echo "-----------------------------------------------"
paste tposition.txt tname.txt tnati.txt tpoints.txt twins.txt > tstand.txt
sed -i "1i\//////////	//////////	//////////	//////////	//////////" tstand.txt
sed -i "1i\Pozíció	Csapatnév	Nemzetiség	Pontok	Győzelmek" tstand.txt
cat tstand.txt | column -t -s$'\t'
rm tposition.txt
rm tname.txt
rm tnati.txt
rm tpoints.txt
rm twins.txt
rm tstand.txt
