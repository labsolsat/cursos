--Ejercicio de Variables
--Comparar los tipos de datos char(n) y varchar(n)
--Observe la diferencia en la cantidad de espacio de almacenamiento consumido.

DECLARE @fixedlength char(10),
@variablelength varchar(10)

SET @fixedlength = 'Test' 
SET @variablelength = 'Test'
SELECT DATALENGTH(@fixedlength) SELECT DATALENGTH(@variablelength)
