SELECT  
             [v].[Pais]
            ,[p].[Producto]
            ,[p].[Marca]
            ,[p].[SiglaLab]
            ,[v].[Laboratorio]
            ,[p].[FormaFarmaceutica]
            ,[p].[ClaseTerapeutica]
            ,ISNULL([p].[Molecula],'NO TIENE MOLECULA' )   AS Molecula
            ,[v].[Apertura] AS [Especialidad]
            ,[v].[Año]
            ,[v].[Mes]
            ,SUM([v].[Val]) AS Val
            
            
FROM [dbo].[Mercado.Producto] [p]
JOIN [Unifica].[dbo].[Mercado.Em] AS [v]
ON   [p].[Producto]=[v].[Producto]

WHERE [v].[Division]='ESP' 
AND ([v].[Año] IN ('21','22')) 
OR  ([v].[Año]='20' AND [v].[Mes]=' 11')
GROUP BY 
             [v].[Pais]
            ,[p].[Producto]
            ,[p].[Marca]
            ,[p].[SiglaLab]
            ,[v].[Laboratorio]
            ,[p].[FormaFarmaceutica]
            ,[p].[ClaseTerapeutica]
            ,[p].[Molecula]
            ,[v].[Apertura]
            ,[v].[Año]
            ,[v].[Mes]

ORDER  BY [v].[Mes],[v].[Año]






