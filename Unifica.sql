SELECT  
             [v].[Pais]          
            ,[p].[Marca] 
			 ,[p].[Producto]
            ,[l].[Nombre]
            ,[l].[SiglaLab]
            ,[p].[FormaFarmaceutica]
            ,[p].[ClaseTerapeutica]
            ,ISNULL([p].[Molecula],'NO TIENE MOLECULA' )   AS Molecula          
            ,[v].[Año]
            ,[v].[Mes]
            ,[p].[Laboratorio]
            ,[p].[Origen]
            ,SUM([v].[Val]) AS Val
            
            
FROM [Unifica].[dbo].[Mercado.Em] AS [v]

LEFT JOIN [dbo].[Mercado.Producto] [p]
ON   [p].[Producto]=[v].[Producto]

LEFT JOIN [Unifica].[dbo].[MercadoLaboratorioRx] AS [l]
ON   [p].[SiglaLab]=[l].[SiglaLab]

WHERE ((([v].[Division]='ESP' AND [p].[Laboratorio]='LPG CA') AND [v].[Origen]='CA') AND ([v].[Año] IN ('21','22')  OR ([v].[Año]='20' AND [v].[Mes]=' 11'))) AND ( [v].[Val]<>0 )

GROUP BY 
             [v].[Pais]           
            ,[p].[Marca]
			 ,[p].[Producto]
            ,[l].[Nombre]
            ,[l].[SiglaLab]
            ,[p].[FormaFarmaceutica]
            ,[p].[ClaseTerapeutica]
            ,[p].[Molecula]        
            ,[v].[Año]
            ,[v].[Mes]          
            ,[p].[Laboratorio]
            ,[p].[Origen]


ORDER  BY [v].[Mes],[v].[Año]
 




