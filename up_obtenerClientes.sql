CREATE PROCEDURE up_obtenerClientes
AS
SELECT CID, CNOMBRE FROM CLIENTE;
GO
EXEC up_obtenerClientes;