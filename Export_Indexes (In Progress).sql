/******************************************************/
/* Script to set up system stored procedure to output */
/* indexes for a named database                       */
/* Uses dynamic SQL - DO NOT INSTALL ON PRODUCTION DB */
/******************************************************/
/* Author - Jason Buss                                */
/* written on - 2019-09-107                           */ 
/******************************************************/


use [master];
GO

CREATE PROCEDURE dbo.FXExportIndexes (
	@dbname nvarchar(max),
	@Return table output
	)
AS
BEGIN
--Declare @dbName nvarchar(max) = 'saleslogix84_eval';
Declare @sql nvarchar(max);

set @sql= 'use [' + @dbName + ']

Declare @Indexes Table (
	id int identity primary key,
	index_name nvarchar(max),
	index_columns nvarchar(max),
	index_type nvarchar(max),
	uniqueness nvarchar(max),
	table_view nvarchar(max),
	object_type nvarchar(max)
);


insert into @Indexes (index_name, index_columns, index_type, uniqueness, table_view, object_type)
select i.[name] as index_name,
    substring(column_names, 1, len(column_names)-1) as [columns],
    case when i.[type] = 1 then ''Clustered index''
        when i.[type] = 2 then ''Nonclustered unique index''
        when i.[type] = 3 then ''XML index''
        when i.[type] = 4 then ''Spatial index''
        when i.[type] = 5 then ''Clustered columnstore index''
        when i.[type] = 6 then ''Nonclustered columnstore index''
        when i.[type] = 7 then ''Nonclustered hash index''
        end as index_type,
    case when i.is_unique = 1 then ''Unique''
        else ''Not unique'' end as [unique],
    schema_name(t.schema_id) + ''.'' + t.[name] as table_view, 
    case when t.[type] = ''U'' then ''Table''
        when t.[type] = ''V'' then ''View''
        end as [object_type]
from sys.objects t
    inner join sys.indexes i
        on t.object_id = i.object_id
    cross apply (select col.[name] + '', ''
                    from sys.index_columns ic
                        inner join sys.columns col
                            on ic.object_id = col.object_id
                            and ic.column_id = col.column_id
                    where ic.object_id = t.object_id
                        and ic.index_id = i.index_id
                            order by col.column_id
                            for xml path ('') ) D (column_names)
where t.is_ms_shipped <> 1
and index_id > 0;

select * from @Indexes;'
END
GO

Exec sp_MS_marksystemobject 'FXExportIndexes'
GO

SELECT NAME, IS_MS_SHIPPED 
FROM SYS.OBJECTS 
WHERE NAME = 'FXExportIndexes' 
GO 



exec FXExportIndexes 'saleslogix84_eval'