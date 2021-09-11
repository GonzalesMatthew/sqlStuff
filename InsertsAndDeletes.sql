-- right click table > Script Table As

USE [LinenAndBird] -- tells which database to use
GO

begin transaction -- lets you test changes before committing them

INSERT INTO [dbo].[Orders] -- refers to table you want to insert data into
           ([BirdId]
           ,[HatId]
           ,[Price]) -- says which fields you will insert data into, order is important - it must match order of values below
OUTPUT inserted.* -- output is all the data you insert into the database. helps you see the data you just created
     VALUES
           ('DFA72E2A-A142-4D19-BEBA-189D8BDA6872'
           ,'36CC3D32-BA8E-456C-ABC6-207A07F6E134' -- referential integrity checks pk and fk, so if invalid match to referential table you will receive an error
           ,200.72), -- to insert multiple rows just use a comma and another set of parenthesis with new values
		   ('DFA72E2A-A142-4D19-BEBA-189D8BDA6872'
           ,'36CC3D32-BA8E-456C-ABC6-207A07F6E134'
           ,200.72), 
		   ('DFA72E2A-A142-4D19-BEBA-189D8BDA6872'
           ,'36CC3D32-BA8E-456C-ABC6-207A07F6E134' 
		   ,200.72)
GO

-- rollback -- if transaction doesn't look good you can use rollback to undo the change
commit -- if you accept the changes you can use the commit command instead

-- to delete data
DELETE
FROM Orders
OUTPUT deleted.* -- here we are using the 'deleted' meta table to view output of all deletions
--WHERE Price = 500.72 -- if you don't use a WHERE clause you delete the whole table so watch out
WHERE Id = '3FED8FD2-1809-45E1-9AC7-2FA37CF1C6A4' -- realistically you would target a GUID

