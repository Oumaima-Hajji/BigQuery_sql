import os
os.system("""bq query --nouse_legacy_sql \
'
SELECT COUNT(*) AS one_way_trips , duration_minutes
FROM `bigquery-public-data.austin_bikeshare.bikeshare_trips`
WHERE start_station_name != end_station_name
GROUP BY duration_minutes
ORDER BY duration_minutes ASC
LIMIT 10;
'
""")

