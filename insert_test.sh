#!/bin/bash

CSV_FILE=/home/postgres/eu.csv

cat ${CSV_FILE} | while read line; do

	id=$(echo ${line} | cut -d ',' -f 1)
	#echo "${id}"
	country=$(echo ${line} | cut -d ',' -f 2)
	#echo ${country}
	year=$(echo ${line} | cut -d ',' -f 3)
	#echo ${year}
	lat=$(echo ${line} | cut -d ',' -f 4)
	#echo ${lat}
	lon=$(echo ${line} | cut -d ',' -f 5)
	#echo ${lon}

	psql -d forumdb -h 172.16.130.19 -p 5432 -c "INSERT INTO foreigner2 VALUES ('$id','$country','$year','$lat','$lon');"

done

#for 
#	psql pgdemo -c "INSERT INTO foreigner VALUES (id,country,year,ido,keido)"




