/* 1. Retrieve information about products that are either a computer or a computer mouse*/
SELECT p.Product_Name, p.Price, p.Product_ID, p.Manufacturer_ID
FROM PRODUCT as p, COMPUTER as c
WHERE c.CP_ID = p.Product_ID

UNION

SELECT p.Product_Name, p.Price, p.Product_ID, p.Manufacturer_ID
FROM PRODUCT as p, COMPUTER_MOUSE as cm
WHERE cm.CMP_ID = p.Product_ID

/* 2. Retrieve information about employees (Name, email, phone number) 
   hat have the same name as customers */
SELECT FirstName, LastName, Email, Phone_No
FROM CUSTOMER
WHERE CUSTOMER.LastName = (
SELECT LastName
FROM CUSTOMER

INTERSECT

SELECT LastName
FROM EMPLOYEE
)

/* 3. Retrieve all facility managers who have an inventory of
   over 500 for an item in their facility */
SELECT e.EMP_ID, e.FirstName, e.LastName
FROM EMPLOYEE AS e, FACILITY AS f
WHERE f.FManager_ID = e.Emp_ID AND f.FManager_ID IN
((SELECT f.FManager_ID)
EXCEPT
(SELECT fm.FManager_ID
 FROM FACILITY AS fm, STORES AS s
 WHERE fm.Facility_ID = s.Facility_ID AND s.Stock < 500));

/* 4. Retrieve a list of products that are currently stored in all warehouses. */
SELECT s.Product_ID
FROM STORES AS s
GROUP BY Product_ID
HAVING COUNT(DISTINCT Facility_ID) = (SELECT COUNT(f.Facility_ID)
						FROM FACILITY AS f);

/* 5. Retrieve a sum of money spent on all orders for each customer. */
SELECT LastName, FirstName, Email, total_spent
FROM CUSTOMER
INNER JOIN
(SELECT User_email,SUM(OCost) as total_spent
 FROM WEB_ORDER 
 GROUP BY User_email) user_spent 
 ON CUSTOMER.Email = User_email;

 /* 6. Retrieve Email and name of customers who purchased
	a TV as well as the TV’s model information. */
SELECT Email, LastName, FirstName, Brand, Display_Type, Display_Size, TModel_No
FROM CUSTOMER
INNER JOIN WEB_ORDER ON CUSTOMER.Email = WEB_ORDER.User_email
INNER JOIN C_CONTAINS ON WEB_ORDER.Order_ID = C_CONTAINS.Order_ID
INNER JOIN PRODUCT ON C_CONTAINS.Product_ID = PRODUCT.Product_ID
INNER JOIN TELEVISION ON Product.Product_ID = TELEVISION.TP_ID

/* 7. Outer join Customer tables with web order table */
SELECT *
FROM CUSTOMER
FULL OUTER JOIN WEB_ORDER ON  Email = User_email
