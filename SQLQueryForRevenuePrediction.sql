SELECT *
FROM ProjectedRevenue

SELECT 
	 Hospital_ID 
FROM
	(
		SELECT 
			HospitalRevenue.Hospital_ID, 
			HospitalRevenue.District_ID,
			HospitalProfiling.Hospital_employees
		FROM
			HospitalRevenue
		LEFT JOIN
			HospitalProfiling
		ON
			HospitalProfiling.Hospital_ID= HospitalRevenue.Hospital_ID
			AND
			HospitalProfiling.District_ID= HospitalRevenue.District_ID
	)
	AS tbl1		
	
WHERE tbl1.Hospital_employees IS NOT NULL


SELECT 
	 COUNT(DISTINCT tbl1.Hospital_ID) 
FROM
	(
		SELECT 
			HospitalRevenue.Hospital_ID, 
			HospitalRevenue.District_ID,
			HospitalProfiling.Hospital_employees
		FROM
			HospitalRevenue
		LEFT JOIN
			HospitalProfiling
		ON
			HospitalProfiling.Hospital_ID= HospitalRevenue.Hospital_ID
			AND
			HospitalProfiling.District_ID= HospitalRevenue.District_ID
	)
	AS tbl1		
	
WHERE tbl1.Hospital_ID IS NULL


SELECT 
	 COUNT(DISTINCT tbl1.Hospital_ID) 
FROM
	(
		SELECT 
			HospitalRevenue.Hospital_ID
			AS RevenueHospitalID, 
			
			HospitalProfiling.Hospital_ID
			AS ProfilingHospitalID
		FROM
			HospitalRevenue
		FULL JOIN
			HospitalProfiling
		ON
			HospitalProfiling.Hospital_ID= HospitalRevenue.Hospital_ID
			
	)
	AS tbl1	

	SELECT COUNT(DISTINCT Hospital_ID) FROM Solution
	SELECT COUNT(DISTINCT Hospital_ID) FROM HospitalProfiling
	SELECT COUNT(DISTINCT Hospital_ID) FROM HospitalRevenue

SELECT COUNT(DISTINCT bjh.Hospital_ID) 
FROM
	(
	SELECT HospitalProfiling.Hospital_ID
	FROM HospitalProfiling
	LEFT JOIN
	Solution
	ON
	HospitalProfiling.Hospital_ID = Solution.Hospital_ID
	)
	AS bjh

 SELECT * 
 FROM HospitalProfiling
 WHERE Hospital_employees < 100
 ORDER BY cast(Hospital_employees as int) ASC

 ALTER TABLE HospitalProfiling
 ALTER COLUMN Hospital_employees int;

