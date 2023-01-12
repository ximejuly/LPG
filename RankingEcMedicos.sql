--PROCESO RANKING
CREATE VIEW MedicosVal
AS (
                    SELECT   
                            		
                            [b].[Cod_bi]
                            ,[b].[Nom_bi]				             
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
                                    )










SELECT [CodPais]
      ,[Cod_bi]
      ,[Nom_bi]
      ,[Suma]
      ,RANK() OVER(PARTITION BY [CodPais] ORDER BY [Suma] DESC)
FROM [BDMedicosLuminovaPg].[dbo].[MedicosVal]




