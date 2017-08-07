CREATE TYPE iva FROM decimal(10,2) NOT NULL
go


CREATE RULE vporcentaje AS @p>=0 AND @p<=100
go
CREATE DEFAULT d_iva AS 16
go
EXEC sp_addtype iva2, 'decimal(10,2)','not null'
go
EXEC sp_bindrule 'vporcentaje','iva2'
go
EXEC sp_bindefault 'd_iva','iva2'
go


go
sp_help iva2

create table datos(
impuesto iva2,
id int
);
go

sp_helpconstraint datos;
go
insert into datos default values;
select * from datos;



exec sp_addtype curp, 'char(18)','null';
go
sp_help curp

