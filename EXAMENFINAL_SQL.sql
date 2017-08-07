-- Obtener el numero de prestamo y la cantidad de pagos que se han efectuado, asi como la suma de los pagos 
select numprestamo,count(numpago) as NumeroPagos, sum(IMPORTEPAGO) as TotalPagos from PAGO group by numprestamo

-- OBTENER LOS NOMBRES DE TODAS LAS SUCURSALES
-- QUE POSEEN UN ACTIVO MAYOR QUE AL MENOS UNA
-- SUCURSAL SITUADA EN Aluche
select * from SUCURSAL order by activos desc
SELECT DISTINCT(T.NOMBRESUCURSAL) FROM SUCURSAL T,
SUCURSAL S WHERE T.ACTIVOS>S.ACTIVOS AND
S.CIUDADSUCURSAL='Aluche' 

--Listar los nombres de todos los clientes que tienen un prestamo
--en la sucursal navacerrada

SELECT DISTINCT(CLIENTE.CNOMBRE) FROM CLIENTE,PRESTATARIO,PRESTAMO
WHERE CLIENTE.CID = PRESTATARIO.CID AND 
PRESTATARIO.NUMPRESTAMO=PRESTAMO.NUMPRESTAMO AND
NOMBRESUCURSAL='Navacerrada' ORDER BY CLIENTE.CNOMBRE

--Obtener el saldo medio de las cuentas de 
--cada sucursal
SELECT * FROM CUENTA
SELECT CUENTA.NOMBRESUCURSAL, AVG(CUENTA.SALDO)
FROM CUENTA GROUP BY NOMBRESUCURSAL

SELECT * FROM CLIENTE
SELECT * FROM CUENTA
SELECT * FROM IMPOSITOR

-- Obtener el nombre del cliente y el saldo medio de cada cliente que vive en La Granja 
-- y tiene como mínimo 2 cuentas
SELECT CL.CNOMBRE, AVG(C.SALDO) FROM IMPOSITOR I, CUENTA C, CLIENTE CL
WHERE I.NUMCUENTA=C.NUMCUENTA AND
I.CID = CL.CID AND
CL.CCIUDAD='La Granja'
GROUP BY CL.CNOMBRE
HAVING COUNT(I.NUMCUENTA)>=2

-- Obtener la clave y el nombre  de los clientes que no tienen prestamos en el banco
select * from CLIENTE order by CID
select * from PRESTATARIO order by CID
--select * from IMPOSITOR order by CID
select CID,CNOMBRE from CLIENTE where cid not in(select cid from PRESTATARIO)
--Obtener la clave y el nombre  de los clientes que no tienen cuenta en el banco
select CID,CNOMBRE from CLIENTE where cid not in(select cid from impositor)