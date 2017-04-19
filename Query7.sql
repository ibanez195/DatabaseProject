SELECT *
FROM CUSTOMER;

SELECT *
FROM WEB_ORDER;

/* 7. Outer join Customer tables with web order table */
SELECT *
FROM CUSTOMER
FULL OUTER JOIN WEB_ORDER ON  Email = User_email;