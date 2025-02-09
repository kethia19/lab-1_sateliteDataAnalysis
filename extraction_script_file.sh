#!/bin/bash

#This script is used to extract two insights and store them in two files 

# Extract top 10 highest temperatures (and removes redundancies)

{ echo "High Temp"; cut -d',' -f3 raw_data/satelite_temperature_data.csv | sort -nr | uniq | head -n 10; } > analyzed_data/highest_temp.csv

# Extract data for a specific country, sorted by humidity in descending order

country="Rwanda"  # Here, I used Rwanda as an example for the command

grep "$country" raw_data/satelite_temperature_data.csv | sort -t',' -k4 -nr > analyzed_data/humidity_data_${country}.csv
