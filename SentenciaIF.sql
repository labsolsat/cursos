DECLARE @coSucursal varchar(30),
	@ciudadSucursal varchar(30)
set @coSucursal = 'SAT'
set @ciudadSucursal = 'San Andrés'
IF EXISTS(SELECT * FROM SUCURSAL 
          WHERE NOMBRESUCURSAL = @coSucursal) 
  BEGIN
	UPDATE PRUEBA
	SET N = @ciudadSucursal
	WHERE ID = @coSucursal
  END

ELSE
  BEGIN
	INSERT INTO PRUEBA
	(ID, N) VALUES
	(@coSucursal, @ciudadSucursal)
  END