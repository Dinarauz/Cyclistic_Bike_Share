--sample 60%
CREATE OR REPLACE TABLE `Bike_project.bike_trips_sampled` AS
SELECT *
FROM `Bike_project.bike_trips_processed`
WHERE RAND() < 0.6; -- Selects ~70% of data

--