CREATE OR REPLACE TABLE `Bike_project.bike_trips_cleaned` AS
SELECT 
    ride_id,
    rideable_type,
    started_at,
    ended_at,
    COALESCE(start_station_name, 'Unknown') AS start_station_name,
    COALESCE(end_station_name, 'Unknown') AS end_station_name,
    COALESCE(start_station_id, '0') AS start_station_id,
    COALESCE(end_station_id, '0') AS end_station_id,
    start_lat,
    start_lng,
    end_lat,
    end_lng,
    member_casual
FROM `Bike_project.bike_trips`
WHERE ride_id IS NOT NULL 
AND started_at IS NOT NULL 
AND ended_at IS NOT NULL 
AND member_casual IS NOT NULL;

SELECT 
    COUNT(*) AS total_rows,
    COUNT(DISTINCT ride_id) AS unique_rides,
    COUNT(start_station_name) - COUNT(*) AS missing_stations
FROM `Bike_project.bike_trips_processed`;
