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