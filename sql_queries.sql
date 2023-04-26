---Creating schema 
---CREATE SCHEMA `liquid-virtue-382517.purchase_dataset`



--- first query : 
--- How many trips  are one-way trips , ordered by duration (aller only , duration of trip) 

SELECT COUNT(* ) AS one_way_trips , duration_minutes
FROM `bigquery-public-data.austin_bikeshare.bikeshare_trips`
WHERE start_station_name != end_station_name
GROUP BY duration_minutes
ORDER BY duration_minutes ASC
LIMIT 100;

--- most used active stations ( number of trips with top end_station_count) 

SELECT station , number_of_trips , COUNT() AS top_end_station_count
WHERE status = 'active'
GROUP BY station
ORDER BY  top_end_station_count DESC
LIMIT 1;

-- top end station count ?

SELECT end_station_id , COUNT(*) AS frequency
FROM `bigquery-public-data.austin_bikeshare.bikeshare_trips`
ORDER BY frequency;