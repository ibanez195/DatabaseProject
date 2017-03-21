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


ALTER TABLE EMPLOYEE add constraint fk_dep_emp FOREIGN KEY(Department_ID) REFERENCES DEPARTMENT(Dep_ID);
ALTER TABLE EMPLOYEE add constraint fk_fac_emp FOREIGN KEY(Fac_ID) REFERENCES FACILITY(Facility_ID);


