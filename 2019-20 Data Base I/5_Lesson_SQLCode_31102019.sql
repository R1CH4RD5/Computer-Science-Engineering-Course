-- DATA BASE I - 31/10/2019,
-- Ricardo Costa (José Costa 1010393)

/*Function 
A function is a database object in SQL Server. Basically, it is a set of SQL 
statements that accept only input parameters, perform actions and return the 
result. A function can return an only a single value or a table. - Google*/

-- LOWER(string)
select ename, lower(ename)
from emp;
/*Gives the results in lower caps.*/

-- UPPER(string)
select ename, upper(ename)
from emp;
/*Gives the results in upper caps.*/

-- INITCAP(string)
select dname, loc, initcap(loc)
from dept;
/*(Search)*/

-- String Manipulation

-- LENGHT(string)
select loc, lengh(loc)
from dept;

-- TRIM(string)
select trim('        It is a nice day,     hello?         ')
from dual;
/*It has 3 options, The teacher only showed one. In this case it removes the 
space from before or after the string, it doesn't remove in the middle.*/

-- INSTR
/*(initial string, search string [, initial search position] [, occurrence])
It gives the position of one character inside of a string.*/

select loc, instr(loc,'A')
from dept;
/*It gives the first 'A' number position.*/

select loc, instr(loc,'A',3)
from dept;
/*The '3' it means that start counting from the 3rd letter of the content, in 
this case.*/

select loc, instr(loc,'A',-3)
from dept;
/*The '-3' means that start counting from the 3rd letter from the end of the 
content.*/

select loc, instr(loc,'A',3,2)
from dept;
/*The '2' it means that start counting from the 2nd occurrence, in other words 
gives the second occurrence of the 'A'.*/

-- SUBSTR
/*It gives a string from inside of another string
(initial string, position [, number of characters])*/

select loc, substr(loc,4)
from dept;
/*It gives the string after the 4th position (including the 4th 'element'.)*/

select loc, trim(substr(loc,4))
from dept;
/*It gives the result without spaces.*/

select loc, substr(loc,4,3)
from dept;
/*It gives the string after/including the 4th 'character' and the next 3 'characters.*/

/*Ex: Use the 'Hello to all students!' and use the SUBSTR and LENGHT to divide it in half.*/
/*My answer:*/
select substr('Hello to all students!',(length('Hello to all students!')/2))
from dual;

/*Teacher answer:*/
select substr('Hello to all students!', 11+1)
from dual;
/*11 is the half of the STRING. So:*/
select substr('Hello to all students!', length('Hello to all students!')/2+1)
from dual;

select substr(sentence, length(sentence)/2+1)
from (select 'Hello to all students!' sentence from dual);

/*But we can use this:*/
define sentence = "Hello to all students!"
select substr('&sentence', length('&sentence')/2+1)
from dual;
/*(It doesn't work, only a reference... - Teacher)*/

-- Numeric Manipulation

-- TO_NUMBER(string [,format])
select to_number('1234,23')
from dual;
/*Converts a string with a number into a numeric value.*/

--ROUND(number [, decimal places])
select round(14.597,2)
from dual;

-- TRUNC(number,decimal places )
select trunc(14.597,2)
from dual;

-- MOD(dividend, divisor)
/*This is useful when to find if is even or odd.*/
select mod(312448,2)
from dual;
/*= 0, even.*/
select mod(312441,2)
from dual;
/*= 1, odd.*/
/*It can be used to execute a operation in the cycles, x in x 'time', execute...*/


-- Date Functions
select sysdate from dual;
/*The DATE it depends from the computer, but in Oracle store the date in a 
specific format. So usually we format the date on our preferences...*/

-- DATE to_char(date [, format])
select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss AM')
from dual;
/*We can choose any format we want.*/

select to_char(sysdate+0.5,'dd/mm/yyyy hh24:mi:ss AM')
from dual;
/*0.5 = half a day.*/

select to_char(sysdate,'ddd')
from dual;
/*Day of the year.*/

select to_char(sysdate,'day')
from dual;
/*Name of the Day.*/

select to_char(sysdate,'d')
from dual;
/*Day number of the week.*/

/*The teacher show: m, mon, Mon, d, dy, etc... we can see the list on the 
document the the teacher share on the cloud(Moodle).*/

/*Ex: Using EMP count the number of the days since hireday of the employees.*/
select ename, sysdate-hiredate
from emp;
/*Number of the days in the job until now.*/

select ename, trunc(sysdate-hiredate)
from emp;

/*Ex: Number of months between two dates.*/
select months_between(sysdate, hiredate)
from emp;

/*Ex: Number of years between two dates.*/
select trunc(months_between(sysdate, hiredate)/12)
from emp;

/*Ex: Show Years, Months, Days, etc...*/

select last_day(sysdate)
from dual;
/*Last day entry. (in the system/computer registed?!)*/

select to_number(to_char(last_day(sysdate), 'dd'))
from dual;
/*Gets only the Day, using the to_char and then convert to numeric.*/

/*Ex: Day of the week of a Birthday.*/
select to_date('24/12/1994','dd/mm/yyyy')
from dual;
/*Configurations of computer maybe doesn't give on the same format as the 'sql' 
so we need to input in a manner of that the database can understand that the 
input it's a date to prevente future errors.*/

select to_char(to_date('24/12/1994','dd/mm/yyyy'),'day')
from dual;
/*It gives the day name of the birth.*/


--


-- DECODE
/*It permits the decoding of a text*/
select dname, loc,
decode(loc,
'NEW YORK','NOVA IORQUE',
'DALLAS', 'SEIA',
'GUARDA')
from dept;
/*We can use the decode to translate the results to other value. Like 'Dallas' 
is translated to 'Seia'. In this example, 'Guarda' is for the rest (elsewhere).*/

