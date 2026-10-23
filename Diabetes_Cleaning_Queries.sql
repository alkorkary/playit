USE Diabetes_DS;
GO

SELECT 
    Age,
    
    CASE 
        WHEN Age < 30 THEN 'Youth'
        WHEN Age BETWEEN 30 AND 50 THEN 'Adult'
        ELSE 'Senior'
    END AS Age_Group,
    
    Glucose,
   
    CASE 
        WHEN Glucose < 100 THEN 'Normal'
        WHEN Glucose BETWEEN 100 AND 125 THEN 'Prediabetes'
        ELSE 'High Risk'
    END AS Glucose_Risk_Level,
    
    BloodPressure,
    
    BMI,
   
    CASE 
        WHEN BMI <= 0 THEN 'Unknown'
        WHEN BMI < 18.5 THEN 'Underweight'
        WHEN BMI BETWEEN 18.5 AND 24.9 THEN 'Normal'
        ELSE 'Overweight'
    END AS BMI_Category

INTO Cleaned_Diabetes_Data  
FROM diabetes;
GO

SELECT * FROM Cleaned_Diabetes_Data;
GO

SELECT 
    Age_Group,
    Glucose_Risk_Level,
    COUNT(*) AS Patient_Count
FROM Cleaned_Diabetes_Data
GROUP BY Age_Group, Glucose_Risk_Level;