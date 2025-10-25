-- Feature Engineering 
--1. Add Day of Week and Day Type
ALTER TABLE MTA_Ridership ADD COLUMN DayOfWeek TEXT;
ALTER TABLE MTA_Ridership ADD COLUMN DayType TEXT;

--2. Populate Day of Week and Day Type
-- Populate DayOfWeek (e.g., 'Sunday', 'Monday', etc. - using the numeric code initially)
UPDATE MTA_Ridership
SET DayOfWeek = strftime('%w', Date); -- %w returns 0 (Sunday) to 6 (Saturday)

-- Populate DayType ('Weekday', 'Weekend')
UPDATE MTA_Ridership
SET DayType =
    CASE strftime('%w', Date)
        WHEN '0' THEN 'Weekend' -- Sunday
        WHEN '6' THEN 'Weekend' -- Saturday
        ELSE 'Weekday'
    END;