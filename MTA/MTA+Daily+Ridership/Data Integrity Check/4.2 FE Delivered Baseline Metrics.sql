--4.2 Derived Baseline Metrics
-- I'm creating a new column representing the Estimated Pre-Pandemic Ridership Baseline for that specific day.
-- This provides a direct, easy-to-visualize comparison metric in Power BI.

--Let's start with Subway and Bus, as these are mandatory for most analyses.
ALTER TABLE MTA_Ridership ADD COLUMN SUB_BASELINE_EST INTEGER;
ALTER TABLE MTA_Ridership ADD COLUMN BUS_BASELINE_EST INTEGER;

--Calculate and Populate Baselines
-- Calculate Subway Baseline
UPDATE MTA_Ridership
SET SUB_BASELINE_EST =
    CASE
        WHEN "SUB PPD" IS NULL OR "SUB PPD" = 0 THEN NULL
        ELSE ROUND("SUB TER" / ("SUB PPD" / 100.0))
    END;

-- Calculate Bus Baseline
UPDATE MTA_Ridership
SET BUS_BASELINE_EST =
    CASE
        WHEN "BUS PPD" IS NULL OR "BUS PPD" = 0 THEN NULL
        ELSE ROUND("BUS TER" / ("BUS PPD" / 100.0))
    END;