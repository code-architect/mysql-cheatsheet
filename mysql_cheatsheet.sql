/* All this query based on mysql 'classicmodels' database. */

/* power function 
in here first parameter is the base, and second is the exponent to be applied
*/
SELECT power(5,2);

/* the pi function doesn't need a parameter */
SELECT pi();

/* column aliases */
SELECT pi() 'ook lets do it';
SELECT pi() ook_lets_do_it;
SELECT pi() as ok;
SELECT pi() ok;

/* concatenating a string */
select concat('hey, jim', ' how are you');
/* concatenating a string and a numeric value */
select concat('hey, jim ', 12);
/* multiple concatenating */
select concat('hey, jim ', 12) as you, concat('hello world', ' I am fine') as we;

/* to check if a column is null or not or a value is null or not
it's a binary operator 
 */
select isnull(null);
select isnull(4);
/* if null will return the 1st parameter if the value is not null
and the2nd if the value is null
 */
select ifnull(null, 'yes null value');
select ifnull(8, 'yes null value');

/* to define a variable in mysql */
select @variablename;

/* to assign a value to a variable */
select @a := 12;
/* process number 2 */
SET @a := 20;
select @a;

/* comparing */
select @a = @b;

/* system and status variable */
	/* to find base directory */
	select @@basedir; 
	/* status variable to show how many time you have entered select command */
	show status like 'com_select';
	/* */
	select @@global.time_zone, @@session.time_zone, @@local.time_zone, @@time_zone;
	
	/* to find how may 3's are there in 10 */
	select 10 div 3;
	/* operand */ 
	select 10 % 3;
	select 10 mod 3;

/* string compression  */
	/* using "BETWEEN", "AND" operator in another way */
	select 4 between 5 and 10;
	/*the answer is 0, it is returning a binary answer*/
	select 6 between 5 and 10;
	/*the answer is 1, it is returning a binary answer*/
	
/* logical operator  */
select customerNumber, amount from payments where amount and amount < 2000;

set @test = 5;
/* benchmark is a function, first parameter takes the number of iteration we want to perform
and the second is the expression we want to evaluate  */
select  benchmark(100000, @test > 0 and @test < 1000);

/* order of precedence */
	/* Building mathematical order in calculations */
	select ((2+2)*(4/2));
	
/* Function and parameters */
	/* few numeric functions */
	select pi();
	/* This function by default shows 6 decimal places of value, mysql actually uses a full precetion of 16 
	significant digits, to expand that we need to do this */
	select pi() + 0.000000000000000;
	
	/* The power function has two form a long form and a short form */
	select power(5, 2);
	/* and */
	select pow(5, 2);
	/* We can do many things with this power function, for say we can find square root of 5 */
	select power(5, .5); /*or*/ select power(5, 0.5);
	/* We do have a separate square root function which will give the same answer */
	select sqrt(5);
	/* Rounding a number */
	/* Without a second parameter it rounds up a number */
	select round(387.965);
	/* But if we provide a second parameter, like how many decimal places we want the number to round */
	select round(387.965, 2);
	/* If we put a negative second  parameter, it then decides the power of 10 we want our number to round up to */
	select round(387.965, -2);
	/* The truncate is the exact opposite of round, it takes two parameters */
	select truncate(387.965, -2);
	/* There are few more functions */
	select floor(387.965);
	select ceil(387.965); /* or */ select ceiling(387.965);
	
/* Character string function */
	/* Concat function to concat a string */
	select concat('Hello', ' World', ' I am a function');
	/* The concat_ws uses the first value to glue the rest of the string in concat_ws 
	The ws stands for separator */
	select concat_ws(' ', 'A', 'B', 'C');
	/* Extracting characters from a string */
	/* This will extract 'my' from 'mysql' */
	select left('mysql', 2);
	/* This will extract 'sql' from 'mysql' */
	select right('mysql', 3);
	/* The mid() function has two form first one:
	the second argument denote the number of the char where we begin extraction 
	the answer of this will be 'ysql' */
	select mid('mysql', 2);
	/* The third argument denotes upto where we want to get the string 
	the answer of this will be 'ysq' */
	select mid('mysql', 2, 3);
	/* there is another function substring() and substr() both are synonyms with mid() fuunction  */
	
	/* The substring_index() function is extremely useful, we can understand up-to second parameter, 
	the third parameter indicate to get the first '@' we found, if we put 2 it will search for a second '@' */
	/* the answer of this is 'batman' */
	select substring_index('batman@gmail.com', '@', 1);
	/* if we put a negative 1 i.e. (-1) the answer will be 'gmail.com' */
	select substring_index('batman@gmail.com', '@', -1);
	select substring_index('domain.subdomain.com', '.', -2); /* answer is  'subdomain.com' */
	
/* Temporal Function */	
	/* Adding 5days to a given date */
	SELECT  '2014-08-25' + INTERVAL 5 DAY;
	/* To add 5 years and 3 months */
	SELECT  '2014-08-25' + INTERVAL 5 YEAR + INTERVAL 3 MONTH;
	/* or, In both cases the answer will be same */
	SELECT  '2014-08-25' + INTERVAL '5-3' YEAR_MONTH;
	/* Showing the date format */
	SELECT date_format('2014-08-28', '%W, %M %D, %Y');
	/* or */
	select date_format(curdate(), '%W, %M %D, %Y');
	/* select specific part from a date */
	/* Select day from a date */
	select day('2014-08-29');
	/* Select month from a date */
	select month('2014-08-29');
	/* or */
	select extract(month from '2014-08-29');
	/* Select year from a date */
	select year('2014-08-29');
	/* Select day name from a date */
	select dayname('2014-08-29');	
	/* converting a string to date */
	select STR_TO_DATE('December 25th, 2014', '%M %D, %Y');
	/* To find amount of time there is between two dates */
	select DATEDIFF('2014-08-29','1988-06-03');
	
/* Control flow functions */
	/* IF in mysql */
	select if(15>12, 'larger', 'smaller');
	/* ELT function */
	select elt(2, 25, 13*85, '2020-12-20' + INTERVAL 5 DAY);
	/* CASE Function */
	/* CASE with a reference value */
	select CASE 'A' 
		WHEN 'A' THEN 'first' 
		WHEN 'B' THEN 'SECOND' 
	ELSE 'Nothing'
	END;
	
/* Null related functions */
	/* ISNULL Function will return boolean value 1 or 0  */
	select isnull(null); /* or */ select isnull(41);
	/* IS Function check and return boolean value 1 or 0  */
	select 5 is null; /* or */ select NULL is NULL;
	/* IFNULL redirect being null from being something else */
	select ifnull(null, 'Ok Its null'); /* this will return 'Ok Its null' */
	select ifnull(5, 'Ok Its null'); /* this will return the value it self i.e. 5 */
	
/* Information Functions */
	/* to check the version */
	select version();
	/* to know the database we are working on */
	select database();
	/* to know the connection id */
	select connection_id();
	/* to know the current user */
	select current_user();
	/* to see if a database is selected or not */
	select database();	
	/* to see how many rows we have avoided getting */
	select sql_calc_found_rows * from customers limit 5;
	select found_rows();
	
/* Selecting */
	select orderNumber, quantityOrdered, orderLineNumber, priceEach from orderdetails where priceEach IN (136, 167.06);
	/* and */
	select orderNumber, quantityOrdered, orderLineNumber, priceEach from orderdetails where priceEach = 136 or priceEach = 167.06;
	/* are the same :) */
	/* Using where clause more affectively */
	select * from orderdetails where (quantityOrdered, priceEach) = (27, 121.64);
	select * from orderdetails where (quantityOrdered, priceEach) IN ((27, 121.64), (22, 58.34));
	
/* **** Order By ****** */
	select * from employees where firstName like '_a%' order by jobTitle;
	/* using multiple columns in order by clause 
	   but that will give the result on the hierarchy basis*/
	select * from employees where firstName like '_a%' order by jobTitle, lastName;
	/* using a sort method in order by */
	select * from employees where firstName like '_a%' order by lastName desc;
	/* selecting one specific data first and then showing rest of it after that information 
	   using if statement in order by clause */
	select firstName, lastName from employees order by if(jobTitle = 'President',1,2), jobTitle;
	/* selecting which information to put first using order by clause using when ,then  */
	select 
		firstname, lastname
	from
		employees
	order by CASE jobTitle
		when 'President' then 1
		when 'VP Sales' then 2
		when 'VP Marketing' then 3
		else 4
	end , firstName;
	
	/* LIMIT */
	/* in this limit clause the first value is the number of rows we want to skip
	   the second value to show the number of rows we want to show 
	*/
	select * from employees order by firstName limit 3,10;
	/* avoiding duplicate using DISTINCT */
	/* without distinct there were 38 results, with distinct 13 only */
	select distinct productVendor, productLine from products where productLine = 'Classic Cars';
	/* Aggregation Queries */
	/* count */
	select count(*) from products where productLine = 'Classic Cars';
	/* min(), max(), avg(), sum() all these are aggregation clause */
	/* GROUP BY */
	select firstName, lastName, officeCode, jobTitle from employees group by firstName, lastName;
	/* using cast() */
	select firstName, lastName, officeCode, jobTitle from employees group by CAST(firstName as  CHAR), lastName;
	/* using order by and group by together */
	select firstName, lastName, officeCode, jobTitle from employees group by firstName, lastName order by officeCode;
	
	/* ****** HAVING ******* */	
	select customerNumber, count(*) as numberCount from payments group by customerNumber having customerNumber = 141;
	/* We can add order by clause also */
	select customerNumber, amount, count(*) as numberCount from payments group by amount having amount > 70000 order by customerNumber; 
	
	/* WITH ROLLUP */
	/* Performing a WITH ROLLUP when grouping by multiple fields, MySQL returns a rollup row for each group. */
	select 
		ifnull(customerNumber, 'Grand Total') as CustNum,
		sum(amount) as TotalPurchase
	from
		payments
	group by customerNumber with rollup; 
	/* Just like to introduce a string function REPEAT('-', 25)
	the first one is the string that we want to repeat, and the second one
	is the number of times we want to repeat it */
	
	/* -------------------------------------------------------------------------------------------------------------------------------------- */
	/* -------------------------------------------------------------------------------------------------------------------------------------- */
	/* -------------------------------------------------------------------------------------------------------------------------------------- */

	/* It is better to change sql warnings into sql errors
	Warning tells us something bad happened, but the system allowed it anyway.
	Error tells us something bad would have happened, but the system prevented it.
	
	Warning is the mysql default, sql_mode variable lets  us override default.
	
	/* Setting SQL_MODE */
	/* This will blank all sql mode by default the mode is "TRADITIONAL" */
	SET sql_mode = '';
	SET sql_mode = PIPES_AS_CONCAT
	SET sql_mode = TRADITIONAL
	/* Don't select this one , it's sucks, not a good idea */
	SET sql_mode = ANSI_QUOTES;
	
	mysql> SELECT @@sql_mode;
	+------------+
	| @@sql_mode |
	+------------+
	|            |
	+------------+
	1 row in set (0.00 sec)

	mysql> set sql_mode=ORACLE;
	Query OK, 0 rows affected (0.00 sec)

	mysql> SELECT @@sql_mode;
	+----------------------------------------------------------------------------------------------------------------------+
	| @@sql_mode                                                                                                           |
	+----------------------------------------------------------------------------------------------------------------------+
	| PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,ORACLE,NO_KEY_OPTIONS,NO_TABLE_OPTIONS,NO_FIELD_OPTIONS,NO_AUTO_CREATE_USER |
	+----------------------------------------------------------------------------------------------------------------------+
	1 row in set (0.00 sec);
	
	/* Show warnings */
	SHOW WARNINGS\G;
	
	/* MySQL Error Code
		Server errors have values less then 2000 
		Server error- < 2000
		Example:-
		Error 1048 : cannot be null.
		Error 1264 : out of range value.
		Error 1406 : data too long
		Error 1292 : incorrect date value
				
		
		Client side errors have values greater then 2000 
		Client Error- >=2000 to 2999
		
		SQL state code (string - general, but ANSI)
		
		Error message text(have two parts, one is fixed another is variable)
		
		Eliminating Note warnings
		SET @@sql_notes = 0;
		
		******System error*****
		The first two characters of an SQLSTATE value indicate the error class:

		Class = '00' indicates success.
		Class = '01' indicates a warning.
		Class = '02' indicates “not found.” 
		
		to see any system error from mysql command line, type"system" at the beginning.	*/
		
		mysql> system prerror (error number);
		/* short-cut for this command */
		mysql> \! prerror (error number);		
		
	/* AUTO_INCREMENT issues */
		/* We can change the next auto_increment number like this */
		alter table test_1 auto_increment = 6;
		/* But if we enter the the row, after that we cannot change the auto_increment back to same position 
		   we have to delete the row or rows which are blocking our desired number to make the alter table command work,
		   or completely delete the row structure and re build it */
		   
		/* To get the last inserted id , if we enter multiple rows at a same time, it provides us 
		   The first batch id of those inserts */   
		select last_insert_id();
		/* we can store this bit of information in to a variable */
		SET @lastId = last_insert_id();
	
	/* DELETE */
		/* To delete all data from a table */
		DELETE FROM tableName; /* And this will delete all the data from your defined table */
		
		/* We can target specific row in a table by using where clause */
		DELETE FROM tableName WHERE id = 1011;
		
		/* We can also target multiple number of rows */
		DELETE FROM tableName WHERE countryCode = "IR";
		
		/* Delete rows using limit clause */
		DELETE * FROM tableName LIMIT 10;
		DELETE * FROM tableName WHERE id <= 1000 LIMIT 100;
		
		/* Delete rows using order by clause */
		DELETE from tableName WHERE countryCode = 'NDL' ORDER BY population LIMIT 10;
		
	/* UPDATE */
		/* If we update without specification or restriction all rows will be updated by default */
		UPDATE tableName SET bdate = bdate + INTERVAL 256 DAY;
		
		UPDATE tableName SET bdate = bdate + INTERVAL 1 YEAR WHERE name LIKE 'R%'; /* Restricting update by where clause */
		
		UPDATE tableName SET bdate = bdate + INTERVAL 1 YEAR LIMIT 10; /* Restricting update by where clause */
		
		UPDATE tableName SET age = IF(age > 36, age - 1, age) LIMIT 5; /* logical operation during update  */
		
	/* OTHER DML Commands */
		/* 
		When a replace command actually replace something there two things happen, the first action
		is to delete the existing row, and the second action is to insert the new row
		*/
		REPLACE INTO tableName (code, name, population) VALUES ('AUS', 'Land of fine cuisine', 20000000);
		
		/* Extended INSERT syntax */
		insert into test_2 (id, name, age) 
		values (6, 'rajoooi', 45) 
		on duplicate key update 
		id = values(id), name = values(name), age = values(age);
		
		/* TRUNCATE */
		show create table test_2; /* Just showing table */
		truncate table test_2; /* The table data has been deleted but the STRUCTURE of the table remains */
		
		/* To create a table from another table */
		create table test_2 AS (select * from test_1);
		
		/* to insert data from another table */
		insert into test_2 select * from test_1;
		
		/* Safe update mode for mysql */
		--safe-updates 
		/* or */
		--i-am-a-dummy
		/* or we can switch this mode on or off by using a system variable 
		by default it is switched off, and the default value of @@sql_safe_updates is 0
		but we can switch it on by simply changing the value to */
		select @@sql_safe_updates = 1;
		 /* this mode prevents an update or delete without a where clause, 
		 and the where clause has to reference an indexed column
		 */
	/* Importing Data */
		/* Load data from anywhere, tab formatted */
		load data infile '<path>' into table tablename;
		
		/* Import Non-Tab Format data(comma separated) */
		load data infile '<path>' into table test 
		fields terminated by ',' 
		enclosed by'"' 
		lines terminated by '\r';
		
		/* We can change the escape character, rather than using the backslash character */
		load data infile '<path>' into table test 
		fields terminated by ',' 
		optionally enclosed by'"' 
		escaped by '@'
		lines terminated by '\r';
		
		/* Skipping header lines on import */
		load data infile '<path>' into table test ignore 1 lines;
		
		/* Changing Import column order i.e. if the data order is not right*/
		load data infile '<path>' into table test (name, district, id, etc.);
		
		/* If we want to skip some data while inserting 
		   If we do not use this @SKIP variable it's just going to be their
		   we don't even need to use it
		*/
		load data infile '<path>' into table test (@SKIP, CODE, NAME, etc..);
		
		/* Converting data while importing */
		/* In this case date and name */	
		LOAD DATA INFILE '<path>' INTO TABLE test
		FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
		LINES TERMINATED BY '\r'
		IGNORE 2 LINES
		(@SKIP, @FNM, @LNM, @JDT, email, adde, etc)
		SET name = CONCAT(@LNM, ', ', @FNM),
		JoinDate = STR_TO_DATE(@JDT, '%b %e %y');
		
	/* Deriving New Tables */
		/* New table from existing table */
		create table <tablename> like <tablename>;
		
		/* Including features 
		 * We can set engine name(by default InnoDB), primary key and everything we want this way
		*/
		create table BoltContries (PRIMARY KEY (code))  ENGINE=MyISAM 
		select code, name, population, gnp from	country
		where region = 'boltContries';
		
		/* Adding a new column while creating a new table from another table */
		create table Continents (
			id TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT
		) select CAST(Continent AS CHAR) AS Name,
			SUM(Population) AS Population,
			SUM(SurfaceArea) AS SurfaceArea,
			SUM(GNP) AS GNP from
			Country
		GROUP BY Continent;
		
		/* Copying from another table */
		INSERT INTO test_2 select * from test_1;
		
		/* Temporary Table */
		/* Warnings:
			1) Table belongs to current connection
			2) Automatically dropped when logged off
			3) Only for private use
			4) Avoid using memory engine for routine temporary tables (server could run out of ram)
			5) They have separate name space
			6) While dropping a temporary table mention DROP TEMPORARY TABLE
		*/
		CREATE TEMPORARY TABLE test_temp
		
		/* Altering Derived Tables */
		/* Made a mistake, now altering it it */ 
		create table test_2 (
			primary key (code)
		) select code, name, population * 1.1 from
			test_1
		where region = 'ASK';
		
		/* alter */
		alter table test_2 
		change `population * 1.1` poputaion int unsigned not null,
		add index (population);