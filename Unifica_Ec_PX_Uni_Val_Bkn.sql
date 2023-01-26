------------------------
--------------Px
SELECT 
       
       [m].[Division]
      ,[m].[Linea] 
      ,IIF(([l].[SiglaLab]='BKN'OR[l].[SiglaLab]='ELE')OR([l].[SiglaLab]='HYG') ,'BKN','RESTO') as LABORA  
      ,[m].[MercadoRelevante]
      ,[re].[Region]
      ,[e].[Apertura] as Provincia
      ,[l].[Nombre] as lab 
       ,[p].[Marca] 
      ,[e].[Producto]    
      ,[p].[ClaseTerapeutica]  
      ,[p].[Molecula]      
      ,[p].[FormaFarmaceutica]             
      ,[e].[Auditoria]                      
      ,[pr].[Periodo]    
      ,SUM([e].[Val]) AS Suma
  FROM [Unifica].[dbo].[Mercado.Em] e

  JOIN [Unifica].[dbo].[MercadoRegion] AS [re]
  ON [re].[Provincia]=[e].[Apertura]

  LEFT JOIN [dbo].[Mercado.Producto] AS p
  ON [E].[Producto]=[P].[Producto] AND [e].[Laboratorio]=[p].[Laboratorio]

  JOIN [Unifica].[dbo].[MercadoLaboratorioRx] AS [l]
  ON [p].[SiglaLab]=[l].[SiglaLab] AND [p].[Origen]=[l].[Origen]

  RIGHT JOIN [dbo].[Mercado.Relavante] AS [m]
  ON ([m].[ClaseTerapeutica]=[p].[ClaseTerapeutica]) AND ([m].[Molecula]=[p].[Molecula] AND [m].[FormaFarmaceutica]=[p].[FormaFarmaceutica])

  RIGHT JOIN [dbo].[Mercado.Periodo] AS [pr]
  ON [pr].[Mes]=[e].[Mes] AND [pr].[Año]=CONCAT('20',[e].[Año])
 
  WHERE e.[Pais]='BKN' AND [e].[Auditoria]='CUP_RX' AND [e].[Val] !=0


GROUP BY 
             [m].[Division]
            ,[m].[Linea] 
            ,[m].[MercadoRelevante]
            ,[re].[Region]
            ,[e].[Apertura] 
            ,[l].[Nombre] 
            ,[p].[Marca] 
            ,[e].[Producto]    
            ,[p].[ClaseTerapeutica]  
            ,[p].[Molecula]      
            ,[p].[FormaFarmaceutica]             
            ,[e].[Auditoria]                      
            ,[pr].[Periodo]  
            ,[L].[SiglaLab]  
UNION
------------------------------------------ç
--------unidades y valores
SELECT 
       
       [m].[Division]
      ,[m].[Linea] 
      ,IIF(([e].[Laboratorio]='BERKANAFARMA'OR[e].[Laboratorio]='ELEA')OR([e].[Laboratorio]='HYGGE PHARMA') ,'BKN','RESTO') as LABORA  
      ,[m].[MercadoRelevante]
      ,[E].[Region]
      ,[e].[Region] as Provincia
      ,[e].[Laboratorio]  AS lab 
      ,[e].[Producto]     as Marca
      ,[e].[Presentacion]   as Producto    
      ,[e].[ClaseTerapeutica]  
      ,[e].[Molecula]  
      ,[e].[FormaFarmaceutica]   
      ,[e].[Auditoria]              
      ,[pr].[Periodo]   
      ,SUM([e].[Val]) AS Suma
  FROM [Unifica].[dbo].[Mercado.UnidadesValores] e

  RIGHT JOIN [dbo].[Mercado.Relavante] AS [m]
  ON ([m].[ClaseTerapeutica]=[e].[ClaseTerapeutica]) AND ([m].[Molecula]=[e].[Molecula] AND [m].[FormaFarmaceutica]=[e].[FormaFarmaceutica])

  RIGHT JOIN [dbo].[Mercado.Periodo] AS [pr]
  ON [pr].[Mes]=[e].[Mes] AND [pr].[Año]=[e].[Año]

  WHERE E.Lab='BKN_CORP'  AND E.[Auditoria] IN ('UNIDADES','VALORES') AND [e].[Val] !=0

  GROUP BY 
  
       [m].[Division]
      ,[m].[Linea] 
      ,[m].[MercadoRelevante]
      ,[E].[Region]
      ,[e].[Region] 
      ,[e].[Laboratorio]  
      ,[e].[Producto]     
      ,[e].[Presentacion]      
      ,[e].[ClaseTerapeutica]  
      ,[e].[Molecula]  
      ,[e].[FormaFarmaceutica]   
      ,[e].[Auditoria]              
      ,[pr].[Periodo]





