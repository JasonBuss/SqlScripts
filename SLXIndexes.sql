Create Table AllIndex (
	id int identity primary key,
	ICRMVersion nvarchar(10),
	IndexID int,
	ColumnId int,
	TableName nvarchar(max),
	IndexName nvarchar(max),
	ColumnName nvarchar(max),
	IndexType nvarchar(max),
	IsPrimary int,
	IsUnique int,
	IsUniqueContraint int,
	AllowRowLocks int,
	AllowPageLocks int,
	IsIncludedColumn int,
	IsNullable int,
	IsANSIPadded int
)
select * from AllIndex

--select distinct IcrmVersion from AllIndex

Create View v753Indexes as
Select
	IndexID, ColumnId, TableName, IndexName, ColumnName, IndexType, IsPrimary, IsUnique, IsUniqueContraint, IsIncludedColumn, IsNullable
From AllIndex
Where ICRMVersion = '7.53'
GO

Create View v754Indexes as
Select
	IndexID, ColumnId, TableName, IndexName, ColumnName, IndexType, IsPrimary, IsUnique, IsUniqueContraint, IsIncludedColumn, IsNullable
From AllIndex
Where ICRMVersion = '7.54'
GO

Create View v80Indexes as
Select
	IndexID, ColumnId, TableName, IndexName, ColumnName, IndexType, IsPrimary, IsUnique, IsUniqueContraint, IsIncludedColumn, IsNullable
From AllIndex
Where ICRMVersion = '8.0'
GO

Create View v81Indexes as
Select
	IndexID, ColumnId, TableName, IndexName, ColumnName, IndexType, IsPrimary, IsUnique, IsUniqueContraint, IsIncludedColumn, IsNullable
From AllIndex
Where ICRMVersion = '8.1'
GO

Create View v82Indexes as
Select
	IndexID, ColumnId, TableName, IndexName, ColumnName, IndexType, IsPrimary, IsUnique, IsUniqueContraint, IsIncludedColumn, IsNullable
From AllIndex
Where ICRMVersion = '8.2'
GO

Create View v83Indexes as
Select
	IndexID, ColumnId, TableName, IndexName, ColumnName, IndexType, IsPrimary, IsUnique, IsUniqueContraint, IsIncludedColumn, IsNullable
From AllIndex
Where ICRMVersion = '8.3'
GO

Create View v84Indexes as
Select
	IndexID, ColumnId, TableName, IndexName, ColumnName, IndexType, IsPrimary, IsUnique, IsUniqueContraint, IsIncludedColumn, IsNullable
From AllIndex
Where ICRMVersion = '8.4'
GO