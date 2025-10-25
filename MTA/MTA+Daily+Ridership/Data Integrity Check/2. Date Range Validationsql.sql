--Date range validation
SELECT
    MIN(Date) AS Earliest_Date,
    MAX(Date) AS Latest_Date
FROM
    MTA_Ridership;