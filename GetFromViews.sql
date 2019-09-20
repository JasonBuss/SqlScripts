--delete from dbo.AllIndex where tablename = 'dtproperties'  --This is a system table that I'm not sure is relevent.  All versions had a PK for this table except 8.4

select * from v753Indexes 
where isprimary <> 1
order by TableName, IndexID, columnID; --533

select * from v754Indexes 
where isprimary <> 1
order by TableName, IndexID, columnID;

select * from v80Indexes 
where isprimary <> 1
order by TableName, IndexID, columnID;

select * from v81Indexes 
where isprimary <> 1
order by TableName, IndexID, columnID;

select * from v82Indexes 
where isprimary <> 1
order by TableName, IndexID, columnID;

select * from v83Indexes 
where isprimary <> 1
order by TableName, IndexID, columnID;

select * from v84Indexes 
where isprimary <> 1
order by TableName, IndexID, columnID;

