CREATE TABLE EMPLOYEE
(Emp_ID int unique not null,
LastName varchar(15) not null,
FirstName varchar(15) not null,
EmpManager_ID int,
Department_ID int not null,
Fac_ID int not null,
Primary key(Emp_ID));

CREATE TABLE DEPARTMENT
(Dep_ID int unique not null,
DName varchar(15) not null,
DManager_ID int not null,
Primary key(Dep_ID),
constraint fk_dm_dep Foreign key(DManager_ID) references EMPLOYEE(Emp_ID));

CREATE TABLE FACILITY
(Facility_ID int not null,
FManager_ID int not null,
Address varchar(30) not null,
Primary key(Facility_ID),
constraint fk_fm_fac Foreign key(FManager_ID) REFERENCES EMPLOYEE(Emp_ID));

CREATE TABLE STORES
(Facility_ID int not null,
Product_ID int not null,
Stock int,
Primary key(Facility_ID, Product_ID),
constraint fk_fac_sto Foreign key(Facility_ID) REFERENCES FACILITY(Facility_ID));

CREATE TABLE WHOLESALE_ORDER
(WOrder_ID int not null,
F_ID int not null,
WOrder_Cost int not null,
Primary key(WOrder_ID),
Constraint fk_fac_wo Foreign Key(F_ID) REFERENCES FACILITY(Facility_ID));

CREATE TABLE PRODUCT
(Product_ID int unique not null,
Product_Name varchar(30) null,
Price int,
PManufacturer_ID int not null,
Primary key(Product_ID));

CREATE TABLE W_CONTAINS
(WOrder_ID int not null,
Product_ID int,
Quantity int not null,
Primary key(WOrder_ID, Product_ID),
Constraint fk_wo_wc Foreign key(WOrder_ID) REFERENCES WHOLESALE_ORDER(WOrder_ID),
Constraint fk_pro_wc Foreign key(Product_ID) REFERENCES PRODUCT(Product_ID));

CREATE TABLE COMPUTER
(CP_ID int not null,
CModel_No int not null,
Processor varchar(30),
Memory int,
Storage_Size int,
Primary key(CModel_No),
Constraint fk_pro_com Foreign Key (CP_ID) REFERENCES PRODUCT(Product_ID));

CREATE TABLE COMPUTER_MOUSE
(CMP_ID int not null,
CMModel_No int not null,
DPI int,
Wire_Type varchar(30),
Sensor_Type varchar(30),
Primary key(CMModel_No),
Constraint fk_pro_cm Foreign Key (CMP_ID) REFERENCES PRODUCT(Product_ID));

CREATE TABLE TELEVISION
(TP_ID int not null,
TModel_No int not null,
Brand varchar(30),
Display_Type varchar(30),
Display_Size int,
Primary key(TModel_No),
Constraint fk_pro_te Foreign Key (TP_ID) REFERENCES PRODUCT(Product_ID));

CREATE TABLE AD
(Ad_ID int not null,
AdDomain varchar(30) not null,
Company varchar(30),
Display_Count int,
Click_Count int, 
Product_ID int not null,
Primary Key(Ad_ID, Product_ID),
Constraint fk_pro_ad Foreign Key(Product_ID) REFERENCES Product(Product_ID));



ALTER TABLE EMPLOYEE add constraint fk_dep_emp FOREIGN KEY(Department_ID) REFERENCES DEPARTMENT(Dep_ID);
ALTER TABLE EMPLOYEE add constraint fk_fac_emp FOREIGN KEY(Fac_ID) REFERENCES FACILITY(Facility_ID);


