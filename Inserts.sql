/* Populate Tables */
INSERT INTO EMPLOYEE values
(234,   'Krishnasamy',  'Perumal',  null,   null,   null),
(123,   'Niu',          'Charles',  234,    null,   null),
(987,   'Crain',        'Chris',    123,    null,   null),
(876,   'Nelson',       'Sean',     123,    null,   null);

INSERT INTO DEPARTMENT values
(5, 'Technology',   123),
(6, 'Business',     234);

/* add department foreign keys to EMPLOYEE rows */
UPDATE EMPLOYEE
SET Department_ID = 5
WHERE Emp_ID = 123 OR Emp_ID = 876 OR Emp_ID = 987;

UPDATE EMPLOYEE
SET Department_ID = 6
WHERE Emp_ID = 234;

INSERT INTO FACILITY values
(1, 987, '3103 Columbus Drive, Columbus, OH'),
(2, 876, '1926 Woodruff Ave, Cleveland, OH'),
(3, 234, '222 Lane Ave, Cincinnati, OH');

/* Add FACILITY foreign keys to EMPLOYEE */
UPDATE EMPLOYEE
SET Fac_ID = 1
WHERE Emp_ID = 987;

UPDATE EMPLOYEE
SET Fac_ID = 2
WHERE Emp_ID = 123 OR Emp_ID = 876

UPDATE EMPLOYEE
SET Fac_ID = 3
WHERE Emp_ID = 234;

INSERT INTO MANUFACTURER values
(97, 'Dell'),
(96, 'Intel'),
(95, 'Corsair'),
(94, 'Razer'),
(93, 'Sony'),
(92, 'Toshiba');

INSERT INTO PRODUCT values
(32123437,  'Dell',     200,    97),
(55445676,  'Intel',    225,    96),
(55599778,  'Corsair',  70,     95),
(66758678,  'Razer',    120,    94),
(96707578,  'Sony',     540,    93),
(85768374,  'Toshiba',  770,    92);

INSERT INTO  STORES values
(1, 32123437, 512),
(1, 55445676, 773),
(2, 32123437, 173), 
(2, 85768374, 880), 
(3, 32123437, 173), 
(3, 66758678, 97);
 

INSERT INTO WHOLESALE_ORDER values
(3333, 2, 20012),
(4444, 1, 4423),
(5555, 3, 200);

INSERT INTO W_CONTAINS values
(3333, 32123437, 100),
(3333, 66758678, 50),
(4444, 55445676, 200),
(5555, 55599778, 300);

INSERT INTO COMPUTER values
(32123437, 12131415, 'AMD',     8,  1000),
(55445676, 23242526, 'INTEL',   16, 512);

INSERT INTO COMPUTER_MOUSE values
(55599778, 34353637, 1200, 'Braided',   'Optical'),
(66758678, 45464748, 1800, 'Wireless',  'Laser');

INSERT INTO TELEVISION values
(96707578, 56575859, 'Sony',    'LCD',  46),
(85768374, 67686960, 'Toshiba', 'OLED', 52);

INSERT INTO WEBSITE values
('www.budgetgadgets.com',   'Finland',  3111),
('www.sony.com',            'Japan',    688868),
('www.razer.com',           'US',        21022);

INSERT INTO AD values 
(234, 'www.budgetgadgets.com',  'Beats',    2717, 112, 55599778),
(345, 'www.sony.com',           'Sony',     3646, 651, 96707578),
(456, 'www.razer.com',          'Razer',    1122, 181, 66758678);


INSERT INTO CUSTOMER values
('chriscrain@gmail.com',    'Crain',	'Chris',          'resetMypassw0rd',  '6145239272'),
('bobross@aim.com',         'Ross',     'Bob',          'alittl3mor3blu3',  '3392287409'),
('presidentdrake@osu.edu',  'Drake',    'President',    '123buckeyes',      '6145259384'),
('albertsims@hotmail.com',	'Simmons',	'Albert',		'hunter2',			'9675347045');

INSERT INTO CREDIT_CARD values
('8112671562529948', '2017-11-11', 'chriscrain@gmail.com');
INSERT INTO CREDIT_CARD values
('3883777738387070', '2021-06-06', 'bobross@aim.com');
INSERT INTO CREDIT_CARD values
('1111222233334444', '2019-01-01', 'presidentdrake@osu.edu');
INSERT INTO CREDIT_CARD values
('5146754890902045', '2018-08-20', 'albertsims@hotmail.com');

INSERT INTO DISPATCHER values
(416553, 'UPS'),
(614614, 'FedEx');

INSERT INTO WEB_ORDER values
(234234, 200, 'chriscrain@gmail.com',    614614);
INSERT INTO WEB_ORDER values
(345345, 540, 'bobross@aim.com',         416553);
INSERT INTO WEB_ORDER values
(123123, 1135, 'albertsims@hotmail.com', 416553);
INSERT INTO WEB_ORDER values
(112233, 200, 'bobross@aim.com',		614614);

INSERT INTO C_CONTAINS values
(234234, 32123437, 1),
(345345, 96707578, 2),
(123123, 55445676, 1),
(123123, 85768374, 1),
(123123, 55599778, 2),
(112233, 32123437, 1);



INSERT INTO REVIEWS values
('chriscrain@gmail.com',    96707578, 'It asked me to create a new password. Would recommend.', 5),
('bobross@aim.com',         32123437, 'Not impressed. I thought a Dell would sing.',            2);

INSERT INTO CUSTOMER_ADDRESS values
('chriscrain@gmail.com',    '1337 OSU Lane'),
('bobross@aim.com',         '411 Painters Way'),
('presidentdrake@osu.edu',  '614 Stadium Ave'),
('albertsims@hotmail.com', '222 Way Way');
