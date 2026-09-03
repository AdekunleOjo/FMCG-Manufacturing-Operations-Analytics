SELECT * FROM Fact_Production

---checking for data types
select column_name, data_type, is_nullable
from information_schema.columns
where table_name = 'Fact_Production'
order by ORDINAL_POSITION

-- Production Date Standardization & Cleaning
ALTER TABLE Fact_Production
ADD Production_Date_Clean DATE;

UPDATE Fact_Production
SET Production_Date_Clean = 
    CASE
        -- YYYY-MM-DD (year first)
        WHEN Production_Date LIKE '[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]'
            THEN CONVERT(DATE, Production_Date, 23)
        
        -- DD/MM/YYYY (slash separator)
        WHEN Production_Date LIKE '[0-9][0-9]/[0-9][0-9]/[0-9][0-9][0-9][0-9]'
            THEN CONVERT(DATE, Production_Date, 103)
        
        -- MM-DD-YYYY (dash separator)
        WHEN Production_Date LIKE '[0-9][0-9]-[0-9][0-9]-[0-9][0-9][0-9][0-9]'
            THEN CONVERT(DATE, Production_Date, 110)
        
        ELSE NULL
    END;

ALTER TABLE Fact_Production 
DROP COLUMN Production_Date;

EXEC sp_rename 'Fact_Production.Production_Date_Clean', 
               'Production_Date', 'COLUMN';

-- Product Name Standardization
UPDATE fact_production
SET Product_Name =
CASE
    WHEN LOWER(TRIM(Product_Name)) IN ('milo','Milo Powder')
    THEN 'Milo'
    ELSE Product_Name
END;

-- Data Quality Validation: Actual Production Output
ALTER TABLE Fact_Production
ADD Data_Quality_Flag VARCHAR(20);

UPDATE Fact_Production
SET Data_Quality_Flag =
    CASE
        WHEN Actual_Output_MT < 0 THEN 'Invalid Output'
        ELSE 'Valid'
    END;

  -- Calculate Downtime Hours from Downtime Minutes
ALTER TABLE Fact_Production
ADD Downtime_Hours DECIMAL(10,2);

UPDATE Fact_Production
SET Downtime_Hours = CAST(Downtime_Minutes AS DECIMAL(10,2)) / 60;

ALTER TABLE Fact_Production
ADD Downtime_Flag VARCHAR(20);

UPDATE Fact_Production
SET Downtime_Flag =
    CASE
        WHEN Downtime_Hours > Production_Hours
            THEN 'Invalid Downtime'
        ELSE 'Valid'
    END;

 
ALTER TABLE Fact_Quality
ADD Quality_Flag VARCHAR(30);

UPDATE Fact_Quality
SET Quality_Flag =
CASE
    WHEN Defective_Units > Total_Units
         OR Rework_Units > Total_Units
         OR Defective_Units + Rework_Units > Total_Units
    THEN 'Invalid Quality Record'
    ELSE 'Valid'
END;

SELECT
    Product_Name,
    SUM(Actual_Output_MT) AS Total_Output
FROM Fact_Production
WHERE Data_Quality_Flag = 'Valid'
GROUP BY Product_Name
ORDER BY Total_Output DESC;

SELECT
    Product_Name,
    SUM(
        (Capacity_MT / Production_Hours)
        * Downtime_Hours
    ) AS Lost_Capacity_MT
FROM Fact_Production
WHERE Data_Quality_Flag = 'Valid'
GROUP BY Product_Name
ORDER BY Lost_Capacity_MT DESC;






































































