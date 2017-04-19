SELECT *
FROM STORES;

/* 4. Retrieve a list of products that are currently stored in all warehouses. */
SELECT s.Product_ID
FROM STORES AS s
GROUP BY Product_ID
HAVING COUNT(DISTINCT Facility_ID) = (SELECT COUNT(f.Facility_ID)
						FROM FACILITY AS f);
