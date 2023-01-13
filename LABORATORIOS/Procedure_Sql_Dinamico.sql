--sql dinamico
--procedimientos almacendos
DECLARE @var1 AS VARCHAR(100)
--ASIGNACION DE SELECT
SET @var1='SELECT [Producto],[Descripcion] FROM [BDMedicosLuminovaPg].[dbo].[Medicos]  WHERE [Mes]=11 '

EXECUTE(@var1);


SELECT [Producto],[Descripcion] FROM [BDMedicosLuminovaPg].[dbo].[Medicos]  WHERE [Mes]=11 GROUP BY [Producto],[Descripcion]