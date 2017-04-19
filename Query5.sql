SELECT *
FROM CUSTOMER;

SELECT *
FROM WEB_ORDER;
/* 5. Retrieve a sum of money spent on all orders for each customer. */
SELECT LastName, FirstName, Email, total_spent
FROM CUSTOMER
INNER JOIN
(SELECT User_email,SUM(OCost) as total_spent
 FROM WEB_ORDER 
 GROUP BY User_email) user_spent 
 ON CUSTOMER.Email = User_email;