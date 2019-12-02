-- Base de Dados I  20/11/2019
-- Ricardo Costa (José Costa 1010393)

-- System Privileges --------------------------------------------------------
/*Teacher will only explain and not give the opportunity to try, because it's 
a serious commands that can compromise the integrity of the data base.*/

-- Grant Command
Grant create any table, select any table to Joaquim;
/*Grant create and select privileges to Joaquim.*/

-- Revoke Command 
Revoke create any table from Joaquim;
/*Revoke create privilege, but Joaquim can still 'select' any table.*/

-- Grant/Revoke Public Command

-- Give a privilige to a user where this one can give to another.
/*with admin option*/



-- Object Privileges --------------------------------------------------------
grant select on facturas to joaquim with grant option;
/*One user with execute privileges.*/

show user;
/*It will show the active user/connection logged.*/

/*Example: From de actual DB 'bd.ipg.pt', one student will grant access to 
a table of his to the user Scott*/
/*1 - Scott doesn't have access.*/
select * from bdi_ei_[studentname].[istable];
/*2 - Student will give him access to his table;*/
grant select on cliente to scott;
/*3 - Scott now have access to 'select' the student table.*/
select * from bdi_ei_[studentname].[istable];
/*4 - Student revoke access to scott of his 'cliente' table. */
revoke select on cliente from scott;



select * from user_tab_privs;
/*Show active privileges of actual user logged.*/



-- FOR TEST ONLY (START)

/*After creating the Client table.*/
select * from CLIENT;

/*Insert values into the empty table.*/
insert into CLIENT
values ('123','Jonas',null,'000000000','Rua Joaquim','Guarda','Portugal','351930000000',null,'j@gmail.com','hello');

/*Give select privilege on the user 'bdi_ei_1701719'.*/
grant select on CLIENT to bdi_ei_1701719;

/*Give select privilege on the user 'bdi_ei_1701719' with grant privileges (hability to give grant to others).*/
grant select on CLIENT to bdi_ei_1701719 with grant option;

/*Revoking the given privilege.*/
revoke select on CLIENT from bdi_ei_1701719;

-- FOR TEST ONLY (END)
