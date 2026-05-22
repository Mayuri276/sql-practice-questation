/* Q21. Create database sql_bootcamp if it doesn’t exist. */
create database sql_bootcamp;

/* Q22. Connect to sql_bootcamp and verify connection. */

select current_database();

/* Q23. Create schema daily if not exists. */
create  schema if not exists daily ;

/* Q24. Create table daily_products(product_id SERIAL PRIMARY KEY, name TEXT, category TEXT, price NUMERIC(10,2), stock INT). */

create table daily_product
(produvt_id SERIAL,
supplier_name TEXT,
city TEXT
);

select * from daily_product;

/* Q25. Insert 10 sample rows into daily_products using a single INSERT statement. */

insert into daily_product (supplier_name,city)
values ('mayu','sindhked raja ');


insert into daily_product (supplier_name,city)
values ('yu','raja '),
('jaya','buldhana'),
('kshitij','beed'),
('priyanka','gangapur'),
('priyanka','parbhani'),
('ram','nagar'),
('pallvi','buldhana'),
('sneha','paithan'),
('rani','pathadi'),
('ashwini','parbhani')
; 


select * from daily_product;

/* Q26. Create table daily_suppliers(supplier_id SERIAL, supplier_name TEXT, city TEXT). */

create table daily_supplier
(daily_supplier_id serial ,
supplier_name text,
city TEXT 
);

select * from daily_product

/* Q27. Insert 5 suppliers into daily_suppliers. */

insert into daily_supplier(supplier_name,city)
values('mj','pune'),
('tj','mumbai'),
('kishor','nagpur'),
('moni','fara'),
('yash','nashik');

select * from daily_supplier;


/* Q28. Add a column email TEXT to daily_suppliers. */

alter table daily_supplier
add column email text;

/* Q29. Update supplier emails using UPDATE command with multiple SET statements. */
update daily_supplier 
set email ='jamdarmayuri@gmail.com';

select * from daily_supplier


Drop table daily_supplier ;


/* Q30. Drop and recreate daily_suppliers table with all required columns in one statement. */

CREATE TABLE daily_supplier (
supplierid serial primary key,
name text ,
city text ,
email text 
);


select * from daily_supplier ;

insert into daily_supplier (name , city ,email)
values('mayuri','sindhked raja ','jamdarmayuri@gmail.com'),
('jaya','pune','jayapatil@gmail.com'),
('punam','pathadi','punam@gmail.com');

select * from daily_supplier ;

/* Q31. Create table daily_customers(customer_id SERIAL, name TEXT, city TEXT, created_on TIMESTAMP DEFAULT NOW()). */

create table daily_customer(
custome_id serial primary key,
name text ,
city text,
created_on TIMESTAMP DEFAULT NOW ()
);


select * from daily_customer ;

/* Q32. Insert 8 customers with varying cities. */

insert into daily_customer(name,city)
VALUES('MAYURI','mumbai');

select * from daily_customer;

insert into daily_customer(name,city)
VALUES('Mukunda','mumbai'),
('sandhya','jalna'),
('pallavi','parbhami'
);

select * from daily_customer ;

/* Q33. Create table daily_orders(order_id SERIAL, customer_id INT, product_id INT, order_date DATE DEFAULT CURRENT_DATE). */

create table daily_orders (order_id serial,
customer_id int,
product_id int,
order_date date Default current_date
);

/* Q34. Insert 10 orders covering multiple customers and products. */

INSERT INTO daily_orders (customer_id,product_id,order_date)
values('101','12345','2023/2/13'),
('102','15432','2025/02/14'),
('103','13467','2025/2/15');


INSERT INTO daily_transactions (customer_id,product_id,order_date)
values('101','12345','2023/2/13'),
('102','15432','2025/02/14'),
('103','13467','2025/2/15');


INSERT INTO daily_orders (customer_id,product_id)
values('105'2456');

select * from daily_orders;

/* Q35. Rename daily_orders table to daily_transactions. */

ALTER TABLE daily_orders 
rename to daily_transactions;

select * from  daily_transactions;

/* Q35. Rename daily_orders table to daily_transactions. */

alter table daily_orders 
rename to daily_transaction ;


/* Q36. Drop column order_date from daily_transactions and re-add it as TIMESTAMP. */



ALTER TABLE   daily_transactions
drop column order_date;

Alter table order_date
rename to daily_transaction;

alter table daily_transactions
add column order_date TIMESTAMP ;


/* Q37. Truncate daily_transactions but keep structure intact. */

truncate daily_transactions ;


/* Q38. Create temporary table temp_backup as SELECT * FROM daily_products. */

create temp table temp_backup as
select *
from daily_product;

/* Q39. Drop temp_backup. */

drop table temp_backup;

/* Q40. Create table daily_warehouse(wh_id SERIAL, wh_name TEXT, city TEXT, capacity INT). */

create table daily_warehouse
(wh_id serial,
wh_name text,
city text, 
capacity int);


select * from daily_warehouse ;

/* Q41. Insert 4 warehouse records. */

insert into daily_warehouse (wh_name, city,capacity)
values ('kabadkhana','pune','10'),
('kiv','mumbai',20),
('rama','nagpur',30),
('kshitij','beed',40);


select * from daily_warehouse 

/* Q42. Update capacity values by adding 1000 to each existing one. */

UPDATE daily_warehouse
set capacity = capacity + 1000;


/* Q43. Drop daily_warehouse table. */

drop table  daily_warehouse ;

/* Q44. Create a role crazy_user with CREATEDB and LOGIN privileges. */

create role crazy_user 
with login createdb;


drop table crazy_user;


 Q45. Grant CREATE ON DATABASE sql_bootcamp to crazy_user. */

 grant create
 on database sql_bootcamp
 to crazy_user;

* Q46. Create table daily_audit(id SERIAL, table_name TEXT, action TEXT, log_time TIMESTAMP DEFAULT NOW()). */

create table daily_audit(
id serial,
table_name text ,
action text,
log_time timestamp DEFAULT NOW());


/* Q47. Insert 5 log records into daily_audit for CREATE, UPDATE, DELETE actions. */

 INSERT INTO daily_audit(table_name,action)
 values('create ','create table'),
 ('update','update data '),
 ('delete','delect fallse data'),
 ('reate','table'),
 ('update','add data');

select * from daily_audit;

/* Q48. Retrieve all logs ordered by log_time DESC. */


SELECT *
FROM daily_Audit
ORDER BY log_time DESC;

/* Q49. Drop daily_audit table. */  

DROP table daily_audit ;

/* Q50. Retrieve list of all tables across all schemas using information_schema.tables. */

select table_schema, table_name from information_schema.tables;


SELECT table_schema,
       table_name
FROM information_schema.tables;

 /* Q51. Retrieve all schemas excluding system schemas using pg_namespace. */

 select nspname
 from pg_namespace
 where nspname 	NOT LIKE 'pg_%'
 AND nspname != 'information_schema';

 /* Q52. Retrieve all active sessions with database name and query text from pg_stat_activity. */

 select datname,
    query
 from pg_stat_activity
 where state = 'active';

 /* Q53. Show all databases with their size in MB using pg_database_size. */
 
select datname,
pg_database_size(datname) /1014/1024 AS size_mb
from pg_database;
 
 /* Q54. Create table daily_branches(branch_id SERIAL, branch_name TEXT, region TEXT). */

 create table daily_branches(
 branch_id serial,
 branch_name text,
 region text );

 select * from daily_branches

 /* Q55. Insert 6 branches from different regions. */

 insert into daily_branches(branch_name, region)
 values ('ai','india'),
 ('ece','bhopal'),
 ('electronic','maharashtra');

select * from daily_branches; 

/* Q56. Rename region column to zone in daily_branches. */

alter table daily_branches 
rename column region to zone ;


select * from daily_branches;

/* Q57. Drop and recreate the daily_branches table. */

drop table daily_branches;

create table daily_branches (
branch_id serial primary key,
branch_name varchar(100),
zone varchar(50)
);

/* Q58. Show all users and their roles using pg_roles. */

select rolname
FROM pg_roles;

* Q59. Create table daily_logs(id SERIAL, activity TEXT, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP). */

create table daily_logs(
id serial,
activity text, 
create_at timestamp default current_timestamp);

select * from daily_logs ;


/* Q60. Insert 5 logs using a single multi-row INSERT command. */

insert into daily_logs (activity)
values ('working'),
('not working'),
('fresher');


select * from daily_logs ;




/* ============================================================
   🧩 SECTION C: PRACTICAL CHALLENGES (40)
   ------------------------------------------------------------ */ 

/* Q61. In sql_bootcamp database, create schema daily if not exists. */
 
create schema if not exists daily;

/* Q62. Create 3 tables: daily_customers, daily_products, and daily_orders with all relevant columns. */

create table daily_customers(
customer_id serial,
customer_name varchar(100),
email varchar (100),
city varchar(50)
);

create table daily_products (
product_id serial primary key,
product_name varchar(100),
category varchar(50),
price numeric(10,2)
);

create table daily_orders (
order_id serial primary key,
customer_id int,
product_id int,
quantity int,
order_date DATE
);
   

drop table daily_orders;

/* Q63. Insert 10 sample rows into daily_products. */

insert into daily_products(product_name,category,price)
values('laptop','electronic','1234444'),
('mouse','electronic','799.0050'),
('keyboard','electron',' 5678'),
('office', 'furniture','123'),
('mobile stand','assessories','299');


select * from daily_products

/* Q64. Add a new column brand TEXT to daily_products. */

ALTER TABLE daily_product
add column brand text ;


/* Q65. Update brand for all rows to 'Generic'. */

update daily_products
SET brand ='Generic';

update daily_products
set category = 'generic';

update daily_products
set category price ="87";

/* Q66. Delete 2 random records from daily_products. */ 

delete from daily_products
where product_id int(1,2);

delete from daily_products
where product_id in (1,2);

/* Q67. Create table daily_customers(customer_id SERIAL, name TEXT, city TEXT, joined_on DATE DEFAULT CURRENT_DATE). */

create table daily_customers(
customer_id serial, 
name text,
city text , 
joined_on DATE DEFAULT CURRENT_DATE);

delete from  daily_customers ;

drop table daily_customers;

Q68. Insert 5 customers into daily_customers. */

insert into daily_customers (name, city)
values
('mayuri' , 'ahmadabad'),
('arjit','mumbai'),
('rahul','nagpur');


select * from daily_customers ;

delete from daily_products;


/* Q69. Create table daily_orders(order_id SERIAL, customer_id INT, product_id INT, order_date DATE DEFAULT CURRENT_DATE). */

create table daily_orders(
order_id serial,
ustomer_id INT,
product_id INT,
order_date DATE DEFAULT CURRENT_DATE);


/* Q71. Retrieve all orders from daily_orders. */

select * 
from daily_orders;

/* Q72. Rename column city to location in daily_customers. */

alter table daily_customers
rename column city to locatiom;

/* Q73. Drop column brand from daily_products. */

alter table daily_products
drop column brand;

alter table daily_products
drop column brand;

drop table daily_orders ;


Q74. Truncate daily_orders table but retain structure. */

truncate table daily_orders;

/* Q75. Drop daily_orders table. */
drop table daily_orders;


* Q76. Backup daily_customers into daily_customers_backup. */

CREATE TABLE daily_customers_backup AS SELECT *
FROM daily_customers;

drop table daily_customers_bsckup ;

/* Q79. Retrieve all unique categories from retailmart.products. */


select distinct category
from retailmart.products;

/* Q80. Retrieve total number of rows in retailmart.products. */

select count(*) as total_rows
from retaqilmart.products;


UPDATE users
SET city='Chennai'
where agw>=30;

/* Q81. Retrieve all customers from retailmart.customers. */

select * from retailmart.customers;


select distinct category
from retailmart.product


select current_database();


/* Q90. Retrieve all schemas in sql_bootcamp using information_schema.schemata. */


select schema_name
from information_schema.schemata
where catalog_name = 'sql_bootcamp';


select schema_name
from information_schema.schemata
where catalog_name ='sql_bootcamp';


* Q92. Create table daily_feedback(id SERIAL, feedback TEXT, added_on TIMESTAMP DEFAULT NOW()). */

create table daily_feedback
(id serial,
feedback TEXT,
added_on TIMESTAMP DEFAULT NOW()
);


/* Q93. Insert 3 feedback records. */

INSERT INTO daily_feedback(feedback)
values
    ('good'),
    ('pover'),
    ('very'),
	('bad'),
	('varybad');


/* Q94. Select all feedback records ordered by id DESC. */


select * from daily_feedback

select *
FROM daily_feedback
ORDER BY ID DESC;

/* Q95. Truncate daily_feedback table. *

truncate daily_feedback 


Q96. Drop daily_feedback table. */

/* Q98. Show current PostgreSQL user. */
/* Q99. List all databases with their owners. */
/* Q100. List all tables available under retailmart.products schema. */


/* Q98. Show current PostgreSQL user. */

select current_user;


select datname as database_name,
    pg_catalog.pg_getuserbyid(datdba) AS owner
FROM pg_database;




drop table daily_feedback

/* ============================================================
   ✅ END OF DAY 1 — HARD LEVEL PRACTICE FILE (100 QUESTIONS)
   ------------------------------------------------------------
   Instructions:
   - Stay within Day 1 concepts (setup, DDL, DML, schema, metadata).
   - No constraints, joins, or filters beyond basics.
============================================================ */


todays targate complated
