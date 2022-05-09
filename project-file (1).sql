/*
Project Database
CS4347
Sulayman Hafizullah
*/

SET global log_output = 'FILE';
SET global general_log_file = '/Users/shariffhabboush/Documents/UTD/Classes/Spring2021/CS4347/Project/project-query.log';
SET global general_log = 1;

-- statement below activates logging 
SET global general_log = 0; 

DROP DATABASE IF EXISTS our_restaurant;
CREATE DATABASE our_restaurant;
USE our_restaurant;

CREATE TABLE employee (
eid			INT		PRIMARY KEY		AUTO_INCREMENT,
last_name	VARCHAR(20)	NOT NULL,
first_name	VARCHAR(20)	NOT NULL,
e_address		VARCHAR(20)	NOT NULL,
phone_number	BIGINT		NOT NULL	UNIQUE,
shift_day		VARCHAR(10)			DEFAULT  NULL,
salary		DECIMAL(10,2)	NOT NULL
);
CREATE TABLE cook_staff (
    eid         INT     NOT NULL PRIMARY KEY,
    specialty   VARCHAR(255),     
    rank        INT,
	CONSTRAINT cook_eid_fk
        FOREIGN KEY (eid)
        REFERENCES  employee (eid)
);
CREATE TABLE wait_staff (
    eid INT NOT NULL PRIMARY KEY,
    serving_section VARCHAR(255),
    tips FLOAT,
    delivery_driver BIT,
    CONSTRAINT wait_eid_fk FOREIGN KEY (eid)
        REFERENCES employee (eid)
);
CREATE TABLE managerial_staff (
    eid INT NOT NULL PRIMARY KEY,
    payroll_capabilites BIT NOT NULL,
    scope INT NOT NULL,
    CONSTRAINT manager_eid_fk FOREIGN KEY (eid)
        REFERENCES employee (eid)
);
CREATE TABLE dining_table (
    table_num       INT     NOT NULL    PRIMARY KEY,
    table_type      VARCHAR(255)    NOT NULL,
    max_diners      INT     NOT NULL
);
CREATE TABLE food_item (
    item_number INT NOT NULL    PRIMARY KEY,
    item_name VARCHAR(255),
    price     INT
);
CREATE TABLE ticket(
ticket_number      INT    NOT NULL     PRIMARY KEY,
item_number          INT    NOT NULL,
total_price        DECIMAL(10,2)  NOT NULL,
order_time         TIMESTAMP,
CONSTRAINT food_item_number
    FOREIGN KEY (item_number)
    REFERENCES food_item(item_number)

);
CREATE TABLE party (
    ticket_number INT NOT NULL PRIMARY KEY,
    order_type VARCHAR(255) NOT NULL,
    payment_method VARCHAR(10) NOT NULL,
    name_on_order VARCHAR(255) NOT NULL,
    size INT NOT NULL,
    CONSTRAINT ticket_no_fk 
		FOREIGN KEY (ticket_number)
        REFERENCES ticket (ticket_number)
);

/*15 employees
  2 manager
  4 cooks
  9 wait staff
  */
-- Insert data
INSERT INTO employee (eid,last_name,first_name,e_address,phone_number,shift_day,salary) VALUES
(1,'Chuang', 'Hristian', '123 Dorcester Way', 8328888899, 'MWF', 42000.00 ),
(2,'Tim', 'Huddleston', '202 Lorcester Rd', 8321234321, 'WTR', 40000.00 ),
(3,'Richard', 'Lemmings', '404 Morcester Way', 81756899, 'TR', 40000.00 ),
(4,'Lorraine', 'Butane', '590 Poorcester Way', 8328887899, 'MTWRFS', 42000.00 ),
(5,'Rumplestiltskin', 'Jones', '1433 Norcester Way', 2813388899, 'MWF', 4200.00 ),
(6,'Mother', 'Mom', '73 Doorcester Way', 8321011010, 'MWF', 4200.00 ),
(7,'Gooby', 'Ballboi', '1233 Orcester Way', 2814997777, 'MWF', 4200.00 ),
(8,'Jimi', 'Hendrix', '12313 Forcester Way', 2812626600, 'MWF', 4200.00 ),
(9,'Kendrick', 'Lamar', '1232 Worcester Way', 8175405004, 'MWF', 4200.00 ),
(10,'Kane', 'East', '12 Porcester Way', 2012242299, 'S', 4200.00 ),
(11,'James', 'Harden', '18 Corcester Way', 4694042001, 'TRF', 4200.00 ),
(12,'Kevin', 'Durant', '1003 Borcester Way', 4691121144, 'TRF', 4200.00 ),
(13,'Rambo', 'James', '100 Baorcester Way', 8172072020, 'FS', 4200.00 ),
(14,'Lambo', 'Jim', '2004 Floorcester Way', 1234567899, 'MTWRFS', 50000.00 ),
(15,'Todamoon', 'Gamestop', '3004 Oarcester Way',  5092234444, 'MTWRFS', 50000.00 );


INSERT INTO cook_staff (eid, specialty, rank) VALUES
(1, 'seafood', 1),
(2, 'sushi', 2),
(3, 'shellfish', 2),
(4, 'seafood', 3);


INSERT INTO wait_staff (eid, serving_section, tips, delivery_driver) VALUES
(5, 1, 20.70, 1),
(6, 1, 97.66, 1),
(7, 2, 39.77, 1),
(8, 2, 11.20, 1),
(9, 3, 35.10, 1),
(10, 3, 72.90, 1),
(11, 4, 71.18, 1),
(12, 4, 29.40, 1),
(13, 5, 172.70, 1);


INSERT INTO managerial_staff (eid, payroll_capabilites, scope) VALUES
(14, 1, 1),
(15, 0, 2);


INSERT INTO dining_table (table_num, table_type, max_diners) VALUES
(1, 'booth', 6),
(2, 'bench', 4),
(3, 'booth', 8),
(4, 'bench', 6),
(5, 'booth', 10),
(6, 'booth', 8),
(7, 'bench', 4),
(8, 'bench', 6),
(9, 'bench', 8),
(10, 'booth', 6);


INSERT INTO food_item (item_number, item_name, price) VALUES
(1, 'Caviar', 130.00),
(2, 'Lobster', 55.00),
(3, 'Crab Rangoons', 20.00),
(4, 'Fish', 15.00),
(5, 'Calamari', 38.00),
(6, 'Salmon Sashimi', 10.00),
(7, 'Tuna Sashimi', 10.00),
(8, 'Water', 6.00),
(9, 'Juice', 8.00),
(10, 'Soda', 8.00),
(11, 'Sea Bass', 40.00);


INSERT INTO ticket (ticket_number, item_number, total_price, order_time) VALUES
(1, 1, 62.50, '2021-01-01 12:00:00'),
(2, 2, 75.20, '2021-01-01 13:00:00'),
(3, 3, 30.40, '2021-01-01 14:00:00'),

(4, 4, 46.50, '2021-01-02 15:00:00'),
(5, 5, 75.20, '2021-01-02 16:00:00'),
(6, 6, 40.40, '2021-01-02 17:00:00'),

(7, 7, 50.30, '2021-01-03 15:00:00'),
(8, 8, 65.20, '2021-01-03 16:00:00'),
(9, 9, 70.40, '2021-01-03 17:00:00'),

(10, 2, 80.50, '2021-01-04 12:00:00'),
(11, 4, 30.20, '2021-01-04 13:00:00'),
(12, 5, 50.20, '2021-01-04 14:00:00'),

(13, 1, 20.50, '2021-01-05 15:00:00'),
(14, 2, 75.20, '2021-01-05 16:00:00'),
(15, 3, 30.40, '2021-01-05 17:00:00'),

(16, 4, 32.70, '2021-01-06 12:00:00'),
(17, 5, 42.20, '2021-01-06 13:00:00'),
(18, 6, 40.80, '2021-01-06 14:00:00');


INSERT INTO party (ticket_number, order_type, payment_method, name_on_order, size) VALUES
(1, 'delivery', 'card', 'Sequoia', 2 ),
(2, 'delivery', 'card', 'Maddie', 4 ),
(3, 'delivery', 'card', 'Kevyn', 3 ),
(4, 'dine-in', 'cash', 'Garth', 5 ),
(5, 'dine-in', 'cash', 'Barker', 3 ),
(6, 'dine-in', 'card', 'Melvin', 8 ),
(7, 'dine-in', 'card', 'George', 2 );


-- queries

-- count how many wait staff there are
SELECT COUNT(*) FROM wait_staff;

-- show listing of managers
SELECT employee.eid AS 'Employee ID', last_name AS 'Last Name', first_name AS 'First Name'
FROM employee JOIN managerial_staff
WHERE  employee.eid=managerial_staff.eid;

-- show all cooks and wait staff
SELECT  DISTINCT employee.eid AS 'Employee  ID', last_name AS 'Last Name', first_name AS 'First Name'
FROM employee INNER JOIN cook_staff INNER JOIN wait_staff 
ON employee.eid = cook_staff.eid OR employee.eid=wait_staff.eid
WHERE employee.eid=cook_staff.eid OR employee.eid=wait_staff.eid
ORDER BY employee.eid;

-- calculate today's revenue
SELECT SUM(total_price) AS 'Revenue'
FROM ticket 
WHERE order_time BETWEEN '2021-01-01 00:00:01' AND '2021-01-01 23:59:59';

-- count total revenue
SELECT SUM(total_price) AS revenue
FROM ticket;

-- show shift schedules
SELECT shift_day AS 'Shift Schedule', last_name AS 'Last Name', first_name AS 'First Name'
FROM employee;



