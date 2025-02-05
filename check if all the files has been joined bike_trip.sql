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
    EXTRACT(MONTH FROM started_at) AS ride_month

FROM `Bike_project.bike_trips_cleaned`
WHERE TIMESTAMP_DIFF(ended_at, started_at, SECOND) > 60  -- Remove trips under 1 minute
AND TIMESTAMP_DIFF(ended_at, started_at, SECOND) < 1440;  -- Remove trips over 24 hours;

CREATE OR REPLACE TABLE `Bike_project.ride_duration_summary` AS
SELECT 
    MIN(ride_duration_min) AS min_duration,
    MAX(ride_duration_min) AS max_duration,
    AVG(ride_duration_min) AS avg_duration,
    COUNT(*) AS total_rides
FROM `Bike_project.bike_trips_processed`;

