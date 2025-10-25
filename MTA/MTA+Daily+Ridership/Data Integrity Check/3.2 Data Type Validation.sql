CREATE TABLE MTA_Ridership_Typed (
    Date DATE,
    "SUB TER" INTEGER,
    "SUB PPD" REAL,
    "BUS TER" INTEGER,
    "BUS PPD" REAL,
    "LIRR TER" INTEGER,
    "LIRR PPD" REAL,
    "MN TER" INTEGER,
    "MN PPD" REAL,
    "AAR TST" INTEGER,
    "AAR PPD" REAL,
    "Bnt TT" INTEGER,
    "Bnt PPD" REAL,
    "SIR TER" INTEGER,
    "SIR PPD" REAL
);

INSERT INTO MTA_Ridership_Typed (
    Date,
    "SUB TER", "SUB PPD",
    "BUS TER", "BUS PPD",
    "LIRR TER", "LIRR PPD",
    "MN TER", "MN PPD",
    "AAR TST", "AAR PPD",
    "Bnt TT", "Bnt PPD",
    "SIR TER", "SIR PPD"
)
SELECT
    Date,
    CAST("SUB TER" AS INTEGER), CAST("SUB PPD" AS REAL),
    CAST("BUS TER" AS INTEGER), CAST("BUS PPD" AS REAL),
    CAST("LIRR TER" AS INTEGER), CAST("LIRR PPD" AS REAL),
    CAST("MN TER" AS INTEGER), CAST("MN PPD" AS REAL),
    CAST("AAR TST" AS INTEGER), CAST("AAR PPD" AS REAL),
    CAST("Bnt TT" AS INTEGER), CAST("Bnt PPD" AS REAL),
    CAST("SIR TER" AS INTEGER), CAST("SIR PPD" AS REAL)
FROM
    MTA_Ridership;
	
	
DROP TABLE MTA_Ridership;
ALTER TABLE MTA_Ridership_Typed RENAME TO MTA_Ridership;