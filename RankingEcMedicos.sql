--PROCESO RANKING
CREATE VIEW MedicosProducto
AS (
                    SELECT   
                            		
                             [b].[Cod_bi]
                            ,[b].[Nom_bi]
                            ,[m].[Producto]				             
                            ,SUM([m].[Val]) AS Suma
                    FROM [dbo].[Medicos] AS m

                        LEFT JOIN PAIS AS P
                        ON P.Region=M.Region
                        
                        INNER JOIN  [dbo].[MedicosBi]AS b
                        ON b.Cdg_medico=M.Cdg_medico
                        
                        WHERE M.MES=12 

                        GROUP BY 
                                		
                                [b].[Cod_bi]
                            ,[b].[Nom_bi]
                            ,[m].[Producto]                   
                                    )

--PROCESO RANKING
CREATE VIEW MedicosMercado
AS (
                    SELECT   
                            		
                             [b].[Cod_bi]
                            ,[b].[Nom_bi]
                            ,[m].[Producto]
                            ,[m].[Descripcion]				             
                            ,SUM([m].[Val]) AS Suma
                    FROM [dbo].[Medicos] AS m

                        LEFT JOIN PAIS AS P
                        ON P.Region=M.Region
                        
                        INNER JOIN  [dbo].[MedicosBi]AS b
                        ON b.Cdg_medico=M.Cdg_medico
                        
                        WHERE M.MES=12 

                        GROUP BY 
                                		
                                [b].[Cod_bi]
                            ,[b].[Nom_bi]
                            ,[m].[Producto]
                            ,[m].[Descripcion]                   
                                    )


SELECT
       [Cod_bi]
      ,[Nom_bi]
      ,[Producto]
      ,[Suma]
      ,DENSE_RANK() OVER(PARTITION BY [Cod_bi] ORDER BY [Suma] DESC) AS Rkn
FROM [BDMedicosLuminovaPg].[dbo].[MedicosProducto]

SELECT
       [Cod_bi]
      ,[Nom_bi]
      ,[Descripcion]
      ,[Suma]
      ,DENSE_RANK() OVER(PARTITION BY [Nom_bi] ORDER BY [Suma] ASC) AS Rkn
FROM [BDMedicosLuminovaPg].[dbo].[MedicosMercado]





