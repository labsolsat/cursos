select * from cuenta
go
IF OBJECT_ID (N'dbo.MOVIMIENTOS', N'U') IS NOT NULL
DROP TABLE dbo.MOVIMIENTOS
CREATE TABLE MOVIMIENTOS(
IDCUENTA VARCHAR(5),
SALDO_ANTERIOR DECIMAL(10,2),
SALDO_POSTERIOR DECIMAL(10,2),
IMPORTE DECIMAL(10,2),
FXMOVIMIENTO DATE
)
GO
DECLARE @importe DECIMAL(18,2),
	@CuentaOrigen VARCHAR(12),
	@CuentaDestino VARCHAR(12)
 
/* Asignamos el importe de la transferencia
* y las cuentas de origen y destino
*/
SET @importe = 50 
SET @CuentaOrigen = 'C-101'
SET @CuentaDestino = 'C-102'
 
BEGIN TRANSACTION -- O solo BEGIN TRAN
BEGIN TRY
/* Descontamos el importe de la cuenta origen */
UPDATE CUENTA 
SET SALDO = SALDO - @importe
WHERE NUMCUENTA = @CuentaOrigen
 
/* Registramos el movimiento */
INSERT INTO MOVIMIENTOS 
(IDCUENTA, SALDO_ANTERIOR, SALDO_POSTERIOR, 
 IMPORTE, FXMOVIMIENTO)
SELECT 
NUMCUENTA, SALDO + @importe, SALDO, @importe, getdate()
FROM CUENTA
WHERE NUMCUENTA = @CuentaOrigen
 
/* Incrementamos el importe de la cuenta destino */
UPDATE CUENTA 
SET SALDO = SALDO + @importe
WHERE NUMCUENTA = @CuentaDestino
 
/* Registramos el movimiento */
INSERT INTO MOVIMIENTOS 
(IDCUENTA, SALDO_ANTERIOR, SALDO_POSTERIOR,
 IMPORTE, FXMOVIMIENTO)
SELECT 
NUMCUENTA, SALDO - @importe, SALDO, @importe, getdate()
FROM CUENTA
WHERE NUMCUENTA = @CuentaDestino
 
/* Confirmamos la transaccion*/ 
COMMIT TRANSACTION -- O solo COMMIT
 
END TRY
BEGIN CATCH
/* Hay un error, deshacemos los cambios*/ 
ROLLBACK TRANSACTION -- O solo ROLLBACK
PRINT 'Se ha producido un error!'
END CATCH
go
select * from cuenta
go