/*The SELECT statement allows you to select data from one or more tables. 
To write a SELECT statement in MySQL, you use this syntax:*/
select * from customers;

/*Using the MySQL SELECT statement to retrieve data from a single column example
The following example uses the SELECT statement to select the last names of all employees:*/
select lastName from employees ;

/*Using the MySQL SELECT statement to query data from multiple columns example
The following example uses the SELECT statement to get the first name, last name, 
and job title of employees:*/
select lastName,firstName,jobTitle from employees;

/*If you want to select data from all the columns of the employees table,
 you can specify all the column names in the SELECT clause like this:*/
select employeeNumber, lastName, firstName,extension,email,
 officeCode,reportsTo,jobTitle from employees ;

/*Use the SELECT statement to select data from a table.
Use the SELECT * to select data from all columns of a table.*/
select * from employees;

/*Add 1+1*/
select 1+1 ;

/*concat strings*/
select concat('Pragati',' ','Bangar');

/* as use to name the field*/
select concat('Pragati',' ','Bangar')AS Name;

select concat('Pragati',' ','Bangar')AS fullName;

/*you will learn how to sort the rows in a result set using the MySQL ORDER BY clause.
When you use the SELECT statement to query data from a table, the order of rows in the result set is unspecified. To sort the rows in the result set, you add the ORDER BY clause to the SELECT statement.*/
select * from customers; 

/*customer name in ASC order*/
select * from customers
order by CustomerName , CustomerNumber;

select * from employees ;

/*The ASC stands for ascending and the DESC stands for descending. You use ASC to sort the result set in ascending order and DESC to sort the result set in descending order respectively
lastname in dESC order*/
select * from employees
order by lastName DESC ;

/*employee number in ASC order*/
select * from employees
order by employeeNumber ASC ;

/*customernumber in ASC order*/
select * from customers
order by
customerNumber ASC,
customerName DESC;

/*contactlastname in ASC order*/
select contactLastname, contactFirstname from customers
order by contactLastname ASC;

/*contactlastname in DESC order*/
select contactLastname, contactFirstname from customers
order by contactLastname DESC;

/*contactlastname in DESC ORDER*/
select contactLastname, contactFirstname from customers
order by contactLastname DESC,contactFirstname ASC;

/* quantity order*priceEach results stored in DESC order*/
select * from orderdetails;
select orderNumber, orderlinenumber, quantityOrdered * priceEach from orderdetails
order by quantityOrdered * priceEach DESC ;

/* quantityordered*priceEach replaced by the subtotal name in DESC order*/
select orderNumber,orderLineNumber,quantityOrdered * priceEach as subtotal from orderdetails
order by subtotal DESC;

/*The FIELD() function returns the position of the str in the str1, str2, … list. If the str is not in the list, the FIELD() function returns 0. For example, the following query returns 1 because the position of the string ‘A’ is the first position on the list 'A', 'B', and 'C'*/
select field('a','b','x','c');
select field('o','r','a');
select field(35, 3, 2, 6);

/*Suppose that you want to sort the sales orders based on their statuses in the following order:
In Process,On Hold,Canceled,Resolved,Disputed,Shipped
To do this, you can use the FIELD() function to map each order status to a number and sort the result by the result of the FIELD() function*/
select orderNumber, status from orders
order by field(status,'In process','on hold','cancelled','resolved','disputed','shipped');

/*ASC order first come NULL value*/
select firstName,lastName,reportsTo from employees
order by reportsTo;

/*DESC order directly starts large value & last value is NULL*/
select firstName,lastName,reportsTo from employees
order by reportsTo DESC;

/* Where*/
/*The following query uses the WHERE clause to find all employees
 whose job titles are Sales Rep:*/
select lastname, firstName, jobtitle from employees
where jobtitle = 'sales Rep';

/*The following example uses the WHERE clause to find employees
 whose job titles are Sales Rep and office codes are 1:*/
select lastname, firstName, jobtitle, officecode from employees
where jobtitle = 'sales Rep'AND officecode = 1;

/*This query finds employees whose job title is Sales Rep or employees 
who locate the office with office code 1:*/
select lastname, firstName, jobtitle, officecode from employees
where jobtitle = 'sales Rep'OR officecode = 1
order by officecode, jobtitle;

/* to find the lastName is bondur*/
select lastName,firstName,email from employees
where lastName = 'Bondur';

/*The following query finds employees whose employeeNumber is greater than 1323:*/
select firstName, employeeNumber from employees
where employeeNumber > 1323 ;

/*To find the employeeName using this data*/
select firstName, employeeNumber from employees
where employeeNumber = 1143
AND email = 'abow@classicmodelcars.com';

/*The following query finds employees who locate in offices whose office code is from 1002 to 1143:*/
select firstName, employeeNumber from employees
where employeeNumber between 1002 AND 1143
order by employeeNumber;

select * from customers;

/*The following example uses the WHERE clause with the IN operator to f
ind customerName*/
select customerName ,customerNumber from customers
where customerNumber IN(103,260)
order by customerName;

/*The following query finds the customers whose last names end with the string 'Atelier graphique':*/
select customerName ,customerNumber from customers
where customerName LIKE 'Atelier graphique%'
order by customerNumber;

/*The following example uses the WHERE clause with the IN operator
 to find employees who locate in the office with office code 1.*/
select firstName, lastName, officecode from employees
where officecode IN (1,2,3)
order by officecode;

/*The following statement uses the WHERE clause with the IS NULL operator to get the rows 
with the values in the reportsTo column are NULL:*/
select firstName ,lastName,reportsTo from employees
where reportsTo IS NULL;

/*The following table shows the comparison operators that you can use to form the expression in the WHERE clause.
Operator	Description
=	Equal to. You can use it with almost any data type.
<> or !=	Not equal to
<	Less than. You typically use it with numeric and date/time data types.
>	Greater than.
<=	Less than or equal to
>=	Greater than or equal to
The following query uses the not equal to (<>) operator to 
find all employees who are not the Sales Rep:*/
select lastName, firstName,jobtitle from employees
where jobtitle <> 'Sales Repo';
 
 /*The following query returns employees with office code less than or equal to 4 (<=4):*/
 select lastName, firstName, officecode from employees
 where officecode <= 4;
 
 /*Select Distinct*/
 
 /*When querying data from a table, you may get duplicate rows. To remove these duplicate rows, you use the DISTINCT clause in the SELECT statement.
Here’s the syntax of the DISTINCT clause:
SELECT DISTINCT
    select_list
FROM
    table_name
WHERE 
    search_condition
ORDER BY 
    sort_expression;*/
 select distinct firstName from employees
 where firstName is not null
 order by firstName;
 
 /*First, select the last names from the employees table using the following SELECT statement:*/
 select lastname from employees
 order by lastName;
 
 /*As shown clearly in the output, some employees have the same last names e.g.,Bondur,Firrelli .
Second, select unique last names by adding the DISTINCT clause like this:*/
 select Distinct lastName from employees
 order by lastName;
 
 /*When you specify a column that has NULL values in the DISTINCT clause,the DISTINCT clause
 will keep only one NULL value because it considers all NULL values are the same.
For example, the state column in the customers table has NULL values.*/
 select distinct state from customers;
 
 
 /*When you specify multiple columns in the DISTINCT clause, the DISTINCT clause will use the combination of values in these columns to determine the uniqueness of the row in the result set.
For example, to get a unique combination of city and state from the customers table, you use the following query:*/
 select distinct state, city from customers
 where state is not null
 order by state ,city;
 
 /*AND logical operator*/
 /*The AND operator is a logical operator that combines two or more Boolean expressions and returns 1, 0, or NULL:
A AND B
In this expression, A and B are called operands. They can be literal values or expressions.
The logical AND operator returns 1 if both A and B are non-zero and NOT NULL. For example:*/
select 1 AND 1 ;

/*The logical AND operator returns 0 if A or B is zero or both A and B are zero:*/
select 1 AND 0, 0 AND 1, 0 AND 0,0 AND NULL;

/*The logical AND operator returns NULL if either operand is non-zero or both operands are NULL.*/
select 1 AND NULL, NULL AND NULL;

/*When evaluating an expression that contains the AND operator, MySQL stops evaluating the remaining parts of the expression as soon as it can determine the result.
This is called short-circuit evaluation. In other words, the AND operator is short-circuited. For example:*/
select 1=0 AND 1/0;

/*The following statement uses the AND operator to find customers who locate in California (CA), USA:*/
select customername, country ,state from customers
where country ='USA' AND state = 'CA';

/*By using the AND operator, you can combine more than two Boolean expressions.
 For example, the following query returns the customers who locate in California, USA, and have a credit limit greater than 100K.*/
select customername, country, state, creditlimit from customers
where country = 'USA' AND state = 'CA' AND creditlimit > 100000;

/*OR logical operator*/
/*The MySQL OR operator is a logical operator that combines two Boolean expressions.
A OR B
Code language: SQL (Structured Query Language) (sql)
If both A and B are not NULL, the OR operator returns 1 (true) if either A or B is non-zero. For example:*/
  select 1 OR 1, 1 OR 0 , 0 OR 1;
  
/*If both A and B are zero (false), the OR operator returns zero. For example:*/
select 0 OR 0;

/*When A and / or B is NULL, the OR operator returns 1 (true) if either A or B is non-zero. Otherwise,
 it returns NULL. For example:*/
 select 1 OR NULL, 0 OR NULL, NULL OR NULL;
 
 /*Like the AND operator, the OR operator is also short-circuited. In other words, MySQL stops evaluating the remaining parts of the
 expression as soon as it can determine the result. For example:*/
 select 1=1 OR 1/0;

/* the AND operator has higher precedence than the OR operator, MySQL evaluates the AND operator before the OR operator. For example:*/
select 1 OR 0 AND 0;

/*How it works.
(1 OR 0) AND 0 = 1 AND 0 = 0*/
select (1 OR 0) AND 0;

/*The following query uses the OR operator in the WHERE clause to select all the customers 
located in the USA or France*/
select customername, country from customers
where country = 'USA' OR COUNTRY = 'France'

/*The following example uses the OR operator to select the customers who locate in the USA or France and have a credit limit greater than 100,000.*/
select customerName, country, creditlimit from customers
where(country ='USA' OR country = 'France') AND creditlimit > 100000;

/*Notice that if you do not use the parentheses, the query will return the customers who locate in the USA or the customers located in France with a credit limit greater than 100,000.*/
select customerName, country,creditlimit from customers
where country ='USA' OR country ='France' AND creditlimit>100000;

/*IN operator*/
/*The following example returns 1 because 1 is in the list:*/
select 1 IN (1,2,3);

/*The following example returns 0 because 4 is not in the list:*/
select 4 IN (1,2,3);

/*Generally, the IN operator returns NULL in two cases:
The value on the left side of the operator is NULL.
The value doesn’t equal any value in the list and one of values in the list is NULL.
The following example returns NULL because the value of the left side of the IN operator is NULL:*/
select NULL IN (1,2,3);

/*The following example also returns NULL because the 0 is not equal to any value in the list and the list has one NULL:*/
SELECT 0 IN (1,2,3,NULL);

/*The following example also returns NULL because NULL is not equal to any value in the list and the list has one NULL. Note that NULL is not equal to NULL.*/
select NULL IN (1,2,3,NULL);

/*The following example uses the IN operator to find the offices located in the USA and France:*/
select officecode, city, phone,country from offices
where country IN('USA' , 'France');

/*You can also get the same result with the OR operator like this:*/
select officecode, city,phone, country from offices
where country = 'USA' OR country = 'France';

/*Between*/
/*For example, the following statement returns 1 because 15 is between 10 and 20:*/
select 15 between 10 AND 20;

/*The following example returns 0 because 15 is not between 20 and 30:*/
select 15 between 20 AND 30;

/*Not between*/
/*For example, the following statement returns 0 because 15 is not between 10 and 20 is not true:*/
select 15 NOT between 10 AND 20;

/*The following example uses the BETWEEN operator to find products whose buy prices between 90 and 100:*/
select productcode, productname,buyPrice from products 
where buyPrice between 90 AND 100;

/*This query uses the greater than or equal (>=) and less than or equal ( <= ) operators instead of the BETWEEN operator to get the same result:*/
select productcode, productname,buyPrice from products
where buyPrice >=90 AND buyPrice <=100;

/*To find the products whose buy prices are not between $20 and $100, you use the NOT BETWEEN operator as follows:*/
select productcode, productname,buyPrice from products
where buyPrice NOT between 20 AND 100;

/*You can rewrite the query above using the less than (<), greater than (>), and the logical operator (OR) like this:*/
select productcode, productname,buyPrice from products
where buyPrice < 20 OR buyPrice > 100;

/*To check if a value is between a date range, you should explicitly cast the value to the DATE type.
For example, the following statement returns the orders with the required dates between 01/01/2003 to 01/31/2003:*/
select orderNumber,requiredDate, status from orders
where requireddate between
    CAST('2003-01-01' AS DATE) AND
    CAST('2003-01-31' AS DATE);
   
/*This example uses the LIKE operator to find employees whose first names start with the letter a:*/
select employeeNumber,lastName, firstName from employees
where firstName LIKE 'a%' ;

/*This example uses the LIKE operator to find employees whose last names end with the literal string on e.g., Patterson, Thompson:*/
select employeeNumber,lastName, firstName from employees
where lastName LIKE '%on' ;

/*For example, the following query uses the LIKE operator to find all employees whose last names contain the substring on:*/
select employeeNumber,lastName, firstName from employees
where lastName LIKE '%on%' ;

/*To find employees whose first names start with the letter T , end with the letter m, and contain any single character between e.g., Tom , Tim, you use the underscore (_) wildcard to
 construct the pattern as follows:*/
select employeeNumber,lastName, firstName from employees
where firstName LIKE 'T_m' ;

/*The MySQL allows you to combine the NOT operator with the LIKE operator to find a string that does not match a specific pattern.
Suppose you want to search for employees whose last names don’t start with the letter B, you can use the NOT LIKE operator as follows:*/
select employeeNumber, firstName, lastName from employees
where lastName NOT LIKE 'B%';

/*For example, if you want to find products whose product codes contain the string _20 , you can use the pattern %\_20% with the default escape character:*/
select productcode, productName from products
where productcode LIKE'%\_20%';

/*Alternatively, you can specify a different escape character e.g., $ using the ESCAPE clause:*/
select productcode, productName from products
where productcode LIKE'%$_20%' ESCAPE '$';

/*Use the LIKE operator to test if a value matches a pattern.
The % wildcard matches zero or more characters.
The _ wildcard matches a single character.
Use ESCAPE clause specifies an escape character other than the default escape character (\).
Use the NOT operator to negate the LIKE operator.*/

/*Limit*/
/*The LIMIT clause is used in the SELECT statement to constrain the number of rows to return. The LIMIT clause accepts one or two arguments. The values of both arguments must be zero or positive integers.
The following illustrates the LIMIT clause syntax with two arguments:*/
select productcode from products
Limit 3,4;

/*By default, the SELECT statement returns rows in an unspecified order. When you add the LIMIT clause to the SELECT statement, the returned rows are unpredictable.
Therefore, to ensure the LIMIT clause returns an expected output, you should always use it with an ORDER BY clause like this:*/
select productName from products
order by productName
Limit 5, 5;

/*This statement uses the LIMIT clause to get the top five customers who have the highest credit*/
select customerNumber, customerName, creditLimit from customers
order by creditLimit DESC
limit 5;

/*Similarly, this example uses the LIMIT clause to find five customers who have the lowest credits:*/
select customerNumber, customerName, creditLimit from customers
order by creditLimit 
limit 5;

/*Because there are more than 5 customers that have credits zero, the result of the query above may lead to an inconsistent result.
To fix this issue, you need to add more columns to the ORDER BY clause to constrain the row in unique order:*/
select customerNumber, customerName, creditLimit from customers
order by creditLimit ,customerNumber
limit 5;

/*Suppose that each page has 10 rows; to display 122 customers, you have 13 pages. The last 13th page contains two rows only.
This query uses the LIMIT clause to get rows of page 1 which contains the first 10 customers sorted by the customer name:*/
select customerNumber, customerName from customers
order by customerName
Limit 10;

/*This query uses the LIMIT clause to get the rows of the second page that include rows 11 – 20:*/
select customerNumber, customerName from customers
order by customerName
Limit 10 , 10 ;

/*For example, the following finds the customer who has the second-highest credit:*/
select customerName ,creditLimit from customers
order by creditLimit DESC
Limit 1,1 ;

select customerName ,creditLimit from customers
order by creditLimit DESC;

/*If you use the LIMIT clause with the DISTINCT clause, MySQL immediately stops searching when it finds the number of unique rows specified in the LIMIT clause.
The example uses the LIMIT clause with the DISTINCT clause to return the first five unique states in the customers table:*/
select distinct state from customers
where state IS NOT NULL
Limit 5;

/* IS NULL*/ 
/*The following query uses the IS NULL operator to find customers who do not have a sales representative:*/
select customerName,country,salesrepemployeenumber from customers
where salesrepemployeenumber IS NULL
order by customerName;

/*This example uses the IS NOT NULL operator to get the customers who have a sales representative*/
select customerName,country,salesrepemployeenumber from customers
where salesrepemployeenumber IS NOT NULL
order by customerName;

use classicmodels ;

CREATE TABLE IF NOT EXISTS projects (
id INT AUTO_INCREMENT,
title VARCHAR(255),
begin_date DATE NOT NULL,
complete_date DATE NOT NULL,
PRIMARY KEY(id)
);

INSERT INTO projects (title , begin_date, complete_date)
VALUES('New CRM','2020-01-01', '0000-00-00'),
	  ('ERP Future','2020-01-01','0000-00-00'),
      ('VR' ,'2020-01-01', '2030-01-01');
show tables;

select * from projects
where complete_date IS NULL;

SET @@sql_auto_is_null = 1;

INSERT INTO projects (title, begin_date,complete_date)
VALUES('MRP III','2010-01-01','2020-12-31');

select * from projects;

select id from projects
where id IS NULL;




