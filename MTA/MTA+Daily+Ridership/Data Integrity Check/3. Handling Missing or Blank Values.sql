-- Handling Missing/Blank Values
-- 
-- SELECT
--     COUNT(*)
-- FROM
--     MTA_Ridership
-- WHERE
--     "LIRR TER" IS NULL;
-- 
-- AND/OR (Check if blanks were imported as empty strings or single spaces)
-- 
-- SELECT
--     COUNT(*)
-- FROM
--     MTA_Ridership
-- WHERE
--     "LIRR TER" = '' OR "LIRR TER" = ' ';
-- 	

SELECT
    Date,
    CASE
        WHEN "SUB TER" GLOB '*[^0-9]*' THEN "SUB TER"
        WHEN "BUS TER" GLOB '*[^0-9]*' THEN "BUS TER"
        WHEN "LIRR TER" GLOB '*[^0-9]*' THEN "LIRR TER"
        WHEN "MN TER" GLOB '*[^0-9]*' THEN "MN TER"
        WHEN "SIR TER" GLOB '*[^0-9]*' THEN "SIR TER"
        WHEN "AAR TST" GLOB '*[^0-9]*' THEN "AAR TST"
        WHEN "Bnt TT" GLOB '*[^0-9]*' THEN "Bnt TT"
        -- PPD columns can have decimals, so we check for more restricted characters
        WHEN "SUB PPD" GLOB '*[^0-9.]*' THEN "SUB PPD"
        WHEN "BUS PPD" GLOB '*[^0-9.]*' THEN "BUS PPD"
        WHEN "LIRR PPD" GLOB '*[^0-9.]*' THEN "LIRR PPD"
        WHEN "MN PPD" GLOB '*[^0-9.]*' THEN "MN PPD"
        WHEN "AAR PPD" GLOB '*[^0-9.]*' THEN "AAR PPD"
        WHEN "Bnt PPD" GLOB '*[^0-9.]*' THEN "Bnt PPD"
        ELSE 'OK'
    END AS Problematic_Value,
    CASE
        WHEN "SUB TER" GLOB '*[^0-9]*' THEN 'SUB TER'
        WHEN "BUS TER" GLOB '*[^0-9]*' THEN 'BUS TER'
        WHEN "LIRR TER" GLOB '*[^0-9]*' THEN 'LIRR TER'
        WHEN "MN TER" GLOB '*[^0-9]*' THEN 'MN TER'
        WHEN "SIR TER" GLOB '*[^0-9]*' THEN 'SIR TER'
        WHEN "AAR TST" GLOB '*[^0-9]*' THEN 'AAR TST'
        WHEN "Bnt TT" GLOB '*[^0-9]*' THEN 'Bnt TT'
        WHEN "SUB PPD" GLOB '*[^0-9.]*' THEN 'SUB PPD'
        WHEN "BUS PPD" GLOB '*[^0-9.]*' THEN 'BUS PPD'
        WHEN "LIRR PPD" GLOB '*[^0-9.]*' THEN 'LIRR PPD'
        WHEN "MN PPD" GLOB '*[^0-9.]*' THEN 'MN PPD'
        WHEN "AAR PPD" GLOB '*[^0-9.]*' THEN 'AAR PPD'
        WHEN "Bnt PPD" GLOB '*[^0-9.]*' THEN 'Bnt PPD'
        ELSE 'OK'
    END AS Problem_Column
FROM
    MTA_Ridership
WHERE
    Problem_Column != 'OK'
LIMIT 10; -- Only show the first 10 errors

-- Conclusion
-- Success! The PPD data is valid (non-negative). No cleaning UPDATE statements are needed for this step.
