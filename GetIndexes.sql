Declare @Indexes Table (
	id int identity primary key,
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

Insert Into @Indexes (
	IndexID,
	ColumnId,
	TableName,
	IndexName,
	ColumnName,
	IndexType,
	IsPrimary,
	IsUnique,
	IsUniqueContraint,
	AllowRowLocks,
	AllowPageLocks,
	IsIncludedColumn,
	IsNullable,
	IsANSIPadded
)
SELECT 
	IndexId = ind.index_id,
	ColumnId = ic.index_column_id,
    TableName = t.name,
    IndexName = ind.name,
    ColumnName = col.name,
	IndexType = ind.type_desc,
	IsPrimary = ind.is_primary_key,
	IsUnique = ind.is_unique,
	IsUniqueConstrant = ind.is_unique_constraint,
	AllowRowLocks = ind.allow_row_locks,
	AllowPageLocks = ind.allow_page_locks,
	IsIncludedColumn = ic.is_included_column,
	IsNullable = col.is_nullable,
	IsANSIPadded = col.is_ansi_padded
FROM 
     sys.indexes ind 
INNER JOIN 
     sys.index_columns ic ON  ind.object_id = ic.object_id and ind.index_id = ic.index_id 
INNER JOIN
     sys.columns col ON ic.object_id = col.object_id and ic.column_id = col.column_id 
INNER JOIN 
     sys.tables t ON ind.object_id = t.object_id 
WHERE 
     1=1 --ind.is_primary_key <> 0 
     --AND ind.is_unique = 0 
     --AND ind.is_unique_constraint = 0 
     --AND t.is_ms_shipped = 0 
ORDER BY 
     t.name, ind.index_id, ic.index_column_id;



Select * from @Indexes;

/* List All Tables with Indexes */
Select distinct TableName from @Indexes;

Select distinct IndexName from @Indexes;