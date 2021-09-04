-------------------------------------------------------------------------- 
------------------ UNION, EXCEPT, UNION ALL--------------------------------
-------------------------------------------------------------------------------- 
--combining/comparing two or more resultsets that may or may not have anything in common

--1,2,3,4,5,6,7,8,9
--union 
--8,9,10,11,12,13,14,15

-- UNION (uniqueness)
--1,2,3,4,5,6,7,8,9,10,11,12,13,14,15
-- UNION ALL (includes duplication)
--1,2,3,4,5,6,7,8,9,8,9,10,11,12,13,14,15
--EXCEPT (returns only values from the first set which do not exist in the second
--1,2,3,4,5,6,7

-- must have same number of columns, and columns be of same data type
select left(Name,1)
from Artist
union all
select left(FirstName,1)
from Customer;

-- aliases only matter on the first set
select Email, 'Employee' as [type]
from Employee
union
select Email, 'Customer'
from Customer;

--except operator, returns all on the left except the matches
select ArtistId
from Artist a
except 
select ArtistId
from Album;

--intersect, same as inner join essentially, but great when you have two completely unrelated sets of information, things you wouldn't be able to join together with fk and pk
select ArtistId
from Artist a
intersect 
select ArtistId
from Album;