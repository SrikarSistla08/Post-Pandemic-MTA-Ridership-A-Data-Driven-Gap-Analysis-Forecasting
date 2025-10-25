--Checking the format of the date
SELECT
    Date
FROM
    MTA_Ridership
WHERE
    LENGTH(Date) != 10
    OR Date NOT LIKE '____-__-__';

-- Once we realized that the date type for the date is not good we do this
-- Date Fromation Conversion from 'MM/DD/YY' to 'YYYY-MM-DD'
UPDATE MTA_Ridership
SET Date =
    -- Concatenate the parts into YYYY-MM-DD
    '20' || SUBSTR(Date, 7, 2) || -- 20 + YY (e.g., 20)
    '-' || SUBSTR(Date, 1, 2) ||  -- - + MM (e.g., 03)
    '-' || SUBSTR(Date, 4, 2)     -- - + DD (e.g., 01)
WHERE
    Date IS NOT NULL
    AND Date LIKE '__/__/__'; -- Ensure we only update dates matching the MM/DD/YY pattern
	
-- We check the date format once again
SELECT
    Date
FROM
    MTA_Ridership
LIMIT 10;