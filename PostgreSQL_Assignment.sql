-- problem-1 solution
INSERT INTO
    rangers (name, region)
VALUES ('Derek Fox', 'Coastal Plains');
-- problem 2 solution
SELECT COUNT(DISTINCT species_id) FROM sightings;

-- problem-3 solution
SELECT * FROM sightings WHERE location ILIKE '%pass%';

-- problem 4 solution
SELECT name, COUNT(sightings.ranger_id) as number_of_sightings
FROM rangers
    RIGHT JOIN sightings ON rangers.ranger_id = sightings.ranger_id
GROUP BY
    sightings.ranger_id,
    name;
-- Though its not declared that is the ranger name will be unique or not thats why i am using ranger_id and name for grouping

-- problem 5 solution
SELECT *
FROM species
WHERE
    species_id NOT IN (
        SELECT species_id
        FROM sightings
    );

-- Problem 6 solution
SELECT
    common_name,
    sighting_time,
    name AS ranger_name
FROM sightings
    JOIN rangers USING (ranger_id)
    JOIN species USING (species_id)
ORDER BY sightings.sighting_time DESC
limit 2;

-- Problem 7 solution
UPDATE species
SET
    conservation_status = 'Historic'
WHERE
    EXTRACT(
        YEAR
        FROM discovery_date
    ) < 1800;
-- Problem 8 solution
CREATE OR REPLACE Function format_label(dates TIMESTAMP WITH TIME ZONE)
RETURNS TEXT
LANGUAGE plpgsql
AS
$$
BEGIN
    IF EXTRACT(HOUR FROM dates) < 12 THEN 
        RETURN 'Morning';
    ELSIF EXTRACT(hour from dates) BETWEEN 12 and 17 THEN
        RETURN 'Afternoon';
    ELSE 
        RETURN 'Evening';
    END IF;
    END;
$$;

SELECT format_label (sighting_time) AS time_of_day FROM sightings;

-- Problem 9 solution
DELETE FROM rangers
WHERE
    ranger_id NOT IN (
        SELECT ranger_id
        FROM sightings
    );