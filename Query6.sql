SELECT *
FROM CUSTOMER;

SELECT *
FROM WEB_ORDER;

SELECT *
FROM C_CONTAINS;

SELECT *
FROM PRODUCT;

SELECT *
FROM TELEVISION;

 /* 6. Retrieve Email and name of customers who purchased
	a TV as well as the TV’s model information. */
SELECT Email, LastName, FirstName, Brand, Display_Type, Display_Size, TModel_No
FROM CUSTOMER
INNER JOIN WEB_ORDER ON CUSTOMER.Email = WEB_ORDER.User_email
INNER JOIN C_CONTAINS ON WEB_ORDER.Order_ID = C_CONTAINS.Order_ID
INNER JOIN PRODUCT ON C_CONTAINS.Product_ID = PRODUCT.Product_ID
INNER JOIN TELEVISION ON Product.Product_ID = TELEVISION.TP_ID
