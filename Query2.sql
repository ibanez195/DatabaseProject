SELECT *
FROM CUSTOMER;

SELECT *
FROM EMPLOYEE;
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
);
