-- what states are our customers located in

select
count(*) as numCustomers,
[State], Country
from Customer
group by 
[State], Country
order by numCustomers desc
;

select 
isnull([State], Country) as [Customer Location],
count(*) [Number of Customers], 
CusomerNames = string_agg(FirstName, ',') 
from Customer
group by isnull([State], Country)
;

select * 
from Customer 
where [State] = null;
-- above confuses SSMS. Can't tell if non-nulls are identical

select *
from Customer 
where [State] is not null;
-- the correct way to do it


-- how much music was purchased by each customer location?
select * from Invoice -- customerId, billingCountry
select * from InvoiceLine;

select BillingCountry, count(*) [tracksSold]
from Invoice i
	inner join InvoiceLine il 
		on i.InvoiceId = il.InvoiceId
group by BillingCountry
order by 2 desc;


