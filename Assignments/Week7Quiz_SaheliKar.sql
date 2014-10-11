-- Week 7 Quiz Answers by Saheli Kar --

--1--
-- I installed the PostgreSQL in the first week's task.

--2--
select count(*) from film where lower(title) like '%bride%';
--Result: 2--

--3--
-- One example of functionality that exists in PostgreSQL that is a superset of ANSI SQL’s functionality is DISTINCT ON. 
-- DISTINCT ON helps in reducing more joins when we try to get a aggregated result on a join clause.
-- Let us have two tables users and logins and we want most recent calls for each user. This can be done easily by distinct on. An explanation of how to
-- do this is explained in http://www.noelherrick.com/blog/postgres-distinct-on. Another good example can be found at 
-- http://www.postgresqlforbeginners.com/2010/11/sql-distinct-distinct-on-and-all.html


--4--
-- The business logic should not allow the customers who owes an payment. 
-- In this case my startegy will be select all the customers who owes a payment and create a separate table for receivables so that the settlement can be done just by querying the table.
-- But if still anyone wants to delet those customers directly from the customer table the database should stop due to the referntial integrity so the  datas in the child table is not left orphaned.
-- Here is how I will delete them. 

delete from payment where customer_id in(select customer_id from payment p where amount<0);
delete from customer c where c.customer_id not in (select customer_id from payment p);