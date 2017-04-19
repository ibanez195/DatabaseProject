SELECT *
FROM EMPLOYEE;

SELECT *
FROM FACILITY;

SELECT *
FROM STORES;
/* 3. Retrieve all facility managers who have an inventory of
   greater than 500 for all items in their facility */
SELECT e.EMP_ID, e.FirstName, e.LastName
FROM EMPLOYEE AS e, FACILITY AS f
WHERE f.FManager_ID = e.Emp_ID AND f.FManager_ID IN
((SELECT f.FManager_ID)
EXCEPT
(SELECT fm.FManager_ID
 FROM FACILITY AS fm, STORES AS s
 WHERE fm.Facility_ID = s.Facility_ID AND s.Stock < 500));