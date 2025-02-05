CREATE OR REPLACE TABLE `Bike_project.bike_trips_cleaned` AS
SELECT * 
FROM `Bike_project.bike_trips`
WHERE ride_id IS NOT NULL 
AND started_at IS NOT NULL 
AND ended_at IS NOT NULL 
AND member_casual IS NOT NULL;

CREATE OR REPLACE TABLE `Bike_project.bike_trips_cleaned` AS
SELECT * 
FROM `Bike_project.bike_trips`
WHERE ride_id IS NOT NULL 
AND started_at IS NOT NULL 
AND ended_at IS NOT NULL 
AND member_casual IS NOT NULL
AND start_station_name IS NOT NULL
AND end_station_name IS NOT NULL;

SELECT 
    COUNT(*) AS total_rows,
    COUNT(ride_id) AS ride_id_count,
    COUNT(started_at) AS started_at_count,
    COUNT(ended_at) AS ended_at_count,
    COUNT(start_station_name) AS start_station_count,
    COUNT(end_station_name) AS end_station_count,
    COUNT(member_casual) AS member_casual_count
FROM `Bike_project.bike_trips_cleaned`;

