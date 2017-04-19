SELECT *
FROM PRODUCT;

SELECT *
FROM COMPUTER;

SELECT *
FROM  COMPUTER_MOUSE;

/* 1. Retrieve information about products that are either a computer or a computer mouse*/
SELECT p.Product_Name, p.Price, p.Product_ID, p.Manufacturer_ID
FROM PRODUCT as p, COMPUTER as c
WHERE c.CP_ID = p.Product_ID

UNION

SELECT p.Product_Name, p.Price, p.Product_ID, p.Manufacturer_ID
FROM PRODUCT as p, COMPUTER_MOUSE as cm
WHERE cm.CMP_ID = p.Product_ID;