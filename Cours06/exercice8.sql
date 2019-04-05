use marketing;
show tables;
show describe;
select count(table_name)
	from INFORMATION_SCHEMA.TABLES
    WHERE table_schema = "marketing";
show databases;

show create table tbl_client;
show full columns from tbl_client;
show index from tbl_client;

show open tables from marketing;

show char set;

show privileges;

