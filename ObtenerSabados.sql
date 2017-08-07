use BANCO
go
drop function Sabados;
go

CREATE FUNCTION Sabados(@FechaI smalldatetime)
RETURNS @Tabla TABLE (Fecha smalldatetime)
BEGIN
     declare @i int
     declare @dia varchar(20)
     declare @fecha datetime
     select @i = 0
     while @i > - DateDiff(Day, '01/1/2003', @FechaI)
     begin
          select @dia = DateName(dw, dateadd(d, @i, @FechaI))
          select @fecha = DateAdd(d, @i, @FechaI)
          if @dia in ('Sábado')
          begin
               INSERT INTO @Tabla Select convert(nvarchar, @fecha, 103)
          end
          select @i = @i - 1
     end
 RETURN
END
select - DATEDIFF(DAY,'24/06/2017',GETDATE())
go
select * from dbo.Sabados(GETDATE());