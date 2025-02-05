--Data Cleaning: Remove Duplicates & Handle NULLs
CREATE OR REPLACE TABLE `Bike_project.bike_trips_cleaned` AS
SELECT DISTINCT 
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

--Data Processing
CREATE OR REPLACE TABLE `Bike_project.bike_trips_processed` AS
SELECT
    ride_id,
    rideable_type,
    started_at,
    ended_at,
    start_station_name,
    end_station_name,
    start_station_id,
    end_station_id,
    start_lat,
    start_lng,
    end_lat,
    end_lng,
    member_casual,

    -- 🚴‍♂️ Compute Ride Duration in Minutes
    ROUND(TIMESTAMP_DIFF(ended_at, started_at, SECOND) / 60, 2) AS ride_duration_min,

    -- 📆 Extract Date Components
    EXTRACT(DAYOFWEEK FROM started_at) AS ride_day_of_week,
    EXTRACT(HOUR FROM started_at) AS ride_hour,
    EXTRACT(MONTH FROM started_at) AS ride_month,

    -- 🕒 Format ride length (HH:MM:SS)
    FORMAT_TIMESTAMP('%H:%M:%S', TIMESTAMP_SECONDS(TIMESTAMP_DIFF(ended_at, started_at, SECOND))) AS ride_length

FROM `Bike_project.bike_trips_cleaned`
WHERE TIMESTAMP_DIFF(ended_at, started_at, SECOND) > 60  -- Remove trips under 1 minute
AND TIMESTAMP_DIFF(ended_at, started_at, SECOND) < 1440;  -- Remove trips over 24 hours;

--Exploratory Data Analysis
SELECT 
    COUNT(*) AS total_rows,
    SUM(CASE WHEN ride_id IS NULL THEN 1 ELSE 0 END) AS missing_ride_id,
    SUM(CASE WHEN rideable_type IS NULL THEN 1 ELSE 0 END) AS missing_rideable_type,
    SUM(CASE WHEN started_at IS NULL THEN 1 ELSE 0 END) AS missing_started_at,
    SUM(CASE WHEN ended_at IS NULL THEN 1 ELSE 0 END) AS missing_ended_at,
    SUM(CASE WHEN start_station_name IS NULL THEN 1 ELSE 0 END) AS missing_start_station_name,
    SUM(CASE WHEN end_station_name IS NULL THEN 1 ELSE 0 END) AS missing_end_station_name,
    SUM(CASE WHEN member_casual IS NULL THEN 1 ELSE 0 END) AS missing_member_casual
FROM `Bike_project.bike_trips_processed`;

--Checking duplicates for ride_id
SELECT ride_id, COUNT(*) AS count
FROM `Bike_project.bike_trips_processed`
GROUP BY ride_id
HAVING COUNT(*) > 1;

--count unique values
SELECT 
    COUNT(DISTINCT rideable_type) AS unique_bike_types,
    COUNT(DISTINCT start_station_name) AS unique_start_stations,
    COUNT(DISTINCT end_station_name) AS unique_end_stations,
    COUNT(DISTINCT member_casual) AS unique_user_types
FROM `Bike_project.bike_trips_processed`;

--Summary Statistics & Trends
CREATE OR REPLACE TABLE `Bike_project.ride_duration_summary` AS
SELECT 
    MIN(ride_duration_min) AS min_duration,
    MAX(ride_duration_min) AS max_duration,
    ROUND(AVG(ride_duration_min), 2) AS avg_duration,
    COUNT(*) AS total_rides
FROM `Bike_project.bike_trips_processed`;

--total ride by user type
CREATE OR REPLACE TABLE `Bike_project.ride_summary` AS
SELECT 
    member_casual,
    COUNT(*) AS total_rides,
    ROUND(AVG(ride_duration_min),2) AS avg_ride_duration,
    MIN(ride_duration_min) AS shortest_ride,
    MAX(ride_duration_min) AS longest_ride
FROM `Bike_project.bike_trips_processed`
GROUP BY member_casual;

--most popular start stations
CREATE OR REPLACE TABLE `Bike_project.popular_stations` AS
SELECT 
    start_station_name,
    COUNT(*) AS total_rides
FROM `Bike_project.bike_trips_processed`
GROUP BY start_station_name
ORDER BY total_rides DESC;

--ride distribution by week
CREATE OR REPLACE TABLE `Bike_project.ride_distribution` AS
SELECT 
    ride_day_of_week,
    member_casual,
    COUNT(*) AS total_rides
FROM `Bike_project.bike_trips_processed`
GROUP BY ride_day_of_week, member_casual
ORDER BY ride_day_of_week;

--peak ride hour
CREATE OR REPLACE TABLE `Bike_project.peak_hours` AS
SELECT 
    ride_hour,
    COUNT(*) AS ride_count
FROM `Bike_project.bike_trips_processed`
GROUP BY ride_hour
ORDER BY ride_hour;

--average ride by bike type
CREATE OR REPLACE TABLE `Bike_project.avg_ride_duration_by_bike` AS
SELECT 
    rideable_type,
    ROUND(AVG(ride_duration_min), 2) AS avg_ride_duration
FROM `Bike_project.bike_trips_processed`
GROUP BY rideable_type;



