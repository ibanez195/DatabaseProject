CREATE TABLE EMPLOYEE (
    Emp_ID          INT UNIQUE  NOT NULL,
    LastName        VARCHAR(15) NOT NULL,
    FirstName       VARCHAR(15) NOT NULL,
    EmpManager_ID   INT,
    Department_ID   INT         NOT NULL,
    Fac_ID          INT         NOT NULL,
        PRIMARY KEY(Emp_ID)
);

CREATE TABLE DEPARTMENT (
    Dep_ID          INT UNIQUE  NOT NULL,
    DName           VARCHAR(15) NOT NULL,
    DManager_ID     INT         NOT NULL,
        PRIMARY KEY(Dep_ID),
        CONSTRAINT fk_dm_dep FOREIGN KEY(DManager_ID) REFERENCES EMPLOYEE(Emp_ID)
);

CREATE TABLE FACILITY (
    Facility_ID     INT UNIQUE  NOT NULL,
    FManager_ID     INT         NOT NULL,
    FAddress        VARCHAR(30) NOT NULL,
        PRIMARY KEY(Facility_ID),
        CONSTRAINT fk_fm_fac FOREIGN KEY(FManager_ID) REFERENCES EMPLOYEE(Emp_ID)
);

CREATE TABLE STORES (
    Facility_ID     INT         NOT NULL,
    Product_ID      INT         NOT NULL,
    Stock           INT,
        PRIMARY KEY(Facility_ID, Product_ID),
        CONSTRAINT fk_fac_sto FOREIGN KEY(Facility_ID) REFERENCES FACILITY(Facility_ID)
);

CREATE TABLE WHOLESALE_ORDER (
    WOrder_ID       INT         NOT NULL,
    F_ID            INT         NOT NULL,
    WOrder_Cost     INT         NOT NULL,
        PRIMARY KEY(WOrder_ID),
        CONSTRAINT fk_fac_wo FOREIGN KEY(F_ID) REFERENCES FACILITY(Facility_ID)
);

CREATE TABLE PRODUCT (
    Product_ID      INT UNIQUE  NOT NULL,
    Product_Name    VARCHAR(30) NOT NULL,
    Price           INT,
    Manufacturer_ID INT         NOT NULL,
        PRIMARY KEY(Product_ID)
);

CREATE TABLE W_CONTAINS (
    WOrder_ID       INT         NOT NULL,
    Product_ID      INT,
    Quantity        INT         NOT NULL,
        PRIMARY KEY(WOrder_ID, Product_ID),
        CONSTRAINT fk_wo_wc FOREIGN KEY(WOrder_ID) REFERENCES WHOLESALE_ORDER(WOrder_ID),
        CONSTRAINT fk_pro_wc FOREIGN KEY(Product_ID) REFERENCES PRODUCT(Product_ID)
);

CREATE TABLE COMPUTER (
    CP_ID           INT         NOT NULL,
    CModel_No       INT         NOT NULL,
    Processor       VARCHAR(30),
    Memory          int,
    Storage_Size    int,
        PRIMARY KEY(CModel_No),
        CONSTRAINT fk_pro_com FOREIGN KEY(CP_ID) REFERENCES PRODUCT(Product_ID));

CREATE TABLE COMPUTER_MOUSE (
    CMP_ID          INT         NOT NULL,
    CMModel_No      INT         NOT NULL,
    DPI             INT,
    Wire_Type       VARCHAR(30),
    Sensor_Type     VARCHAR(30),
        PRIMARY KEY(CMModel_No),
        CONSTRAINT fk_pro_cm FOREIGN KEY(CMP_ID) REFERENCES PRODUCT(Product_ID)
);

CREATE TABLE TELEVISION (
    TP_ID           INT         NOT NULL,
    TModel_No       INT         NOT NULL,
    Brand           VARCHAR(30),
    Display_Type    VARCHAR(30),
    Display_Size    INT,
        PRIMARY KEY(TModel_No),
        CONSTRAINT fk_pro_te FOREIGN KEY(TP_ID) REFERENCES PRODUCT(Product_ID)
);

CREATE TABLE WEBSITE (
    Domain          VARCHAR(30) NOT NULL,
    Country         VARCHAR(30),
    Visit_Count     INT,
        PRIMARY KEY(Domain)
);

CREATE TABLE AD (
    Ad_ID           INT         NOT NULL,
    AdDomain        VARCHAR(30) NOT NULL,
    Company         VARCHAR(30),
    Display_Count   INT,
    Click_Count     INT, 
    Product_ID      INT         NOT NULL,
        PRIMARY KEY(Ad_ID, Product_ID),
        CONSTRAINT fk_pro_ad FOREIGN KEY(Product_ID) REFERENCES Product(Product_ID),
        CONSTRAINT fk_web_ad FOREIGN KEY(AdDomain) REFERENCES WEBSITE(Domain)
);

CREATE TABLE MANUFACTURER (
    Manufacturer_ID     INT     NOT NULL,
    Manufacturer_Name   VARCHAR(30),
        PRIMARY KEY(Manufacturer_ID)
);

CREATE TABLE CUSTOMER (
    Email           VARCHAR(50) NOT NULL,
    LastName        VARCHAR(30) NOT NULL,
    FirstName       VARCHAR(30) NOT NULL,
    CPassword       VARCHAR(30) NOT NULL,
    Phone_No        INT,
        PRIMARY KEY(Email)
);

CREATE TABLE CREDIT_CARD (
    CC_no           INT         NOT NULL,
    Exp_date        DATE        NOT NULL,
    User_email      VARCHAR(50) NOT NULL,
        PRIMARY KEY(CC_no),
        CONSTRAINT fk_us_cc FOREIGN KEY(User_email) REFERENCES CUSTOMER(Email)
);

CREATE TABLE WEB_ORDER (
    Order_ID        INT         NOT NULL,
    OCost           INT         NOT NULL,
    User_email      VARCHAR(50) NOT NULL,
    Disp_ID         INT         NOT NULL,
        PRIMARY KEY(Order_ID),
        CONSTRAINT fk_us_ord FOREIGN KEY(User_email) REFERENCES CUSTOMER(email)
);

CREATE TABLE C_CONTAINS (
    Order_ID        INT         NOT NULL,
    Product_ID      INT         NOT NULL,
    Quantity        INT         NOT NULL,
        PRIMARY KEY(Order_ID, Product_ID),
        CONSTRAINT fk_ord_uc FOREIGN KEY(Order_ID) REFERENCES WEB_ORDER(Order_ID),
        CONSTRAINT fk_pro_uc FOREIGN KEY(Product_ID) REFERENCES PRODUCT(Product_ID)
);

CREATE TABLE C_PLACES (
    User_email      VARCHAR(50) NOT NULL,
    Order_ID        INT         NOT NULL,
        PRIMARY KEY(User_email, Order_ID),
        CONSTRAINT fk_em_up FOREIGN KEY(User_email) REFERENCES CUSTOMER(Email),
        CONSTRAINT fk_ord_up FOREIGN KEY(Order_ID) REFERENCES WEB_ORDER(Order_ID)
);

CREATE TABLE DISPATCHER (
    Dispatcher_ID   INT         NOT NULL,
    D_Name          VARCHAR(30) NOT NULL,
        PRIMARY KEY(Dispatcher_ID)
);

/* TODO: Add check that rating is between 0 and 10 */
CREATE TABLE REVIEWS (
    Email           VARCHAR(50) NOT NULL,
    Product_ID      INT         NOT NULL,
    RText           VARCHAR(150),
    Rating          INT         NOT NULL,
        PRIMARY KEY(Email, Product_ID),
        CONSTRAINT fk_us_rev FOREIGN KEY(Email) REFERENCES CUSTOMER(Email),
        CONSTRAINT fk_pro_rev FOREIGN KEY(Product_ID) REFERENCES PRODUCT(Product_ID)
);

CREATE TABLE CUSTOMER_ADDRESS (
    Email           VARCHAR(50) NOT NULL,
    CAddress        VARCHAR(50) NOT NULL,
        PRIMARY KEY(Email),
        CONSTRAINT fk_em_ca FOREIGN KEY(Email) REFERENCES CUSTOMER(Email)
);

/* Begin creation of needed foreign keys */
ALTER TABLE EMPLOYEE    ADD CONSTRAINT fk_dep_emp FOREIGN KEY(Department_ID)    REFERENCES DEPARTMENT(Dep_ID);
ALTER TABLE EMPLOYEE    ADD CONSTRAINT fk_fac_emp FOREIGN KEY(Fac_ID)           REFERENCES FACILITY(Facility_ID);
ALTER TABLE STORES      ADD CONSTRAINT fk_pro_sto FOREIGN KEY(Product_ID)       REFERENCES PRODUCT(Product_ID);
ALTER TABLE PRODUCT     ADD CONSTRAINT fk_man_pro FOREIGN KEY(Manufacturer_ID)  REFERENCES MANUFACTURER(Manufacturer_ID);
ALTER TABLE WEB_ORDER   ADD CONSTRAINT fk_dis_ord FOREIGN KEY(Disp_ID)          REFERENCES DISPATCHER(Dispatcher_ID);


/* Populate Tables */

INSERT INTO EMPLOYEE values
(987, "Crain", "Chris", 123, 5, 1),
(876, "Nelson", "Sean", 123, 5, 2),
(123, "Niu", "Charles", 234, 5, 2),
(234, "Krishnasamy", "Perumal", null, 6, 3);

INSERT INTO DEPARTMENT values
(5, "Technology",  123),
(6, "Business", 234);

INSERT INTO FACILITY values
(1, 987, "3103 Columbus Drive, Columbus, OH"),
(2, 876, "1926 Woodruff Ave, Cleveland, OH"),
(3, 234, "222 Lane Ave, Cincinnati, OH");

INSERT INTO  STORES values
(1, 2221, 512),
(1, 2421, 773), 
(2, 2321, 880), 
(3, 3421, 97);

INSERT INTO WHOLESALE_ORDER values
(3333, 2, 20012),
(4444, 1, 4423),
(5555, 3, 200);

INSERT INTO PRODUCT values
(32123437, "Dell", 200, 97),
(55445676, "Intel", 225, 96),
(55599778, "Corsair", 70, 95),
(66758678, "Razer", 120, 94),
(96707578, "Sony", 540, 93),
(85768374, "Toshiba", 770, 92);

INSERT INTO W_CONTAINS values
(3333, 32123437, 100),
(3333, 66758678, 50),
(4444, 55445676, 200),
(5555, 55599778, 300);

INSERT INTO COMPUTER values
(32123437, 12131415, "AMD", 8, 1000),
(55445676, 23242526, "INTEL", 16, 512),

INSERT INTO COMPUTER_MOUSE values
(55599778, 34353637, 1200, "Braided", "Optical"),
(66758678, 45464748, 1800, "Wireless", "Laser");

INSERT INTO TELEVISION values
(96707578, 56575859, "Sony", "LCD", 46),
(85768374, 67686960, "Toshiba", "OLED", 52);

INSERT INTO AD values 
(234, "www.budgetgadgets.com", "Beats", 2717, 112, 55599778),
(345, "www.sony.com", "Sony", 3646, 651, 96707578),
(456, "www.razer.com", "Razer", 1122, 181, 66758678);

INSERT INTO WEBSITE values
("www.budgetgadgets.com", "Finland", 3111),
("www.sony.com", "Japan", 688868),
("www.razer.com", "US", 21022);

INSERT INTO MANUFACTURER values
(97, "Dell"),
(96, "Intel"),
(95, "Corsair"),
(94, "Razer"),
(93, "Sony"),
(92, "Toshiba");

INSERT INTO CUSTOMER values
("bobgribben@gmail.com", "Gribben", "Bob", "resetMypassw0rd", 6145239272),
("bobross@aim.com", "Ross", "Bob", "alittl3mor3blu3", 3392287409),
("presidentdrake@osu.edu", "Drake", "President", "123buckeyes", 6145259384);

INSERT INTO CREDIT_CARD values
(8112671562529948, 2017-11-11, "bobgribben@gmail.com"),
(3883777738387070, 2021-06-06, "bobross@aim.com"),
(1111222233334444, 2019-01-01, "presidentdrake@osu.edu");

INSERT INTO WEB_ORDER values
(234234, 52, "bobgribben@gmail.com", 614614),
(345345, 15, "bobross@aim.com", 416553);

INSERT INTO U_CONTAINS values
(234234, 32123437, 1),
(345345, 96707578, 2);

INSERT INTO U_PLACES values
("bobgribben@gmail.com", 234234),
("bobross@aim.com", 345345);

INSERT INTO DISPATCHER values
(416553, "UPS"),
(614614, "FedEx");

INSERT INTO REVIEWS values
("bobgribben@gmail.com", 96707578, "It asked me to create a new password. Would recommend.", 5),
("bobross@aim.com", 32123437, "Not impressed. I thought a Dell would sing.", 2);

INSERT INTO USER_ADDRESS values
("bobgribben@gmail.com", "1337 OSU Lane"),
("bobross@aim.com", "411 Painters Way"),
("presidentdrake@osu.edu", "614 Stadium Ave");
