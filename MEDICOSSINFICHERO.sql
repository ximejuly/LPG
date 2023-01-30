SELECT 
         --[i].[MedicosIniciativas] AS Iniciativas  
        --,[m].[Nombre] as Closeup
        [b].[Nom_bi]  as bi          
        ,[i].[CodBi]
        
        ,[i].[Representante] AS Inicia
        ,[m].[Año]
        ,[m].[Mes]
        ,[m].[Periodo]
        ,[b].[Pais]      
       ,SUM([m].[Val]) AS Suma
   --INTO TEMPORALI#   
  FROM [BDMedicosLuminovaPg].[dbo].[Medicos] AS m

  JOIN [BDMedicosLuminovaPg].[dbo].[MedicosBi] AS b
  ON [b].[Cdg_medico]=[m].[Cdg_medico]

  RIGHT JOIN [BDMedicosLuminovaPg].[dbo].[MedicosIniciativas] AS i
  ON [i].[CodBi]=[b].[Cod_bi] AND [i].[Pais]=[b].[Pais]

 

  WHERE Año=2022 
  AND (([Mes]IN (10,11,12) AND [Periodo] IN('MES MOV 09/22','MES MOV 10/22','MES MOV 11/22','MES MOV 12/22','TAM 12/21','TAM 12/22'))
  
  OR ([Mes]IN (12) AND [Periodo] IN('YTD MOV 2022')))
  OR ([Mes]IN (11) AND [Periodo] IN('YTD MOV 2021'))
 
  
  GROUP BY 
         --[i].[MedicosIniciativas]    
        --,[m].[Nombre]
         [b].[Nom_bi]         
        ,[i].[CodBi]
        
        ,[i].[Representante]
        ,[m].[Año]
        ,[m].[Mes]
        ,[m].[Periodo]
        ,[b].[Pais] 

ORDER BY [m].[Periodo],[b].[Nom_bi] ASC

SELECT 
         --[i].[MedicosIniciativas] AS Iniciativas  
        --,[m].[Nombre] as Closeup
        [b].[Nom_bi]  as bi          
        ,[i].[CodBi]
        
        ,[i].[Representante] AS Inicia
        ,[m].[Año]
        ,[m].[Mes]
        ,[m].[Periodo]
        ,[b].[Pais]      
       ,SUM([m].[Val]) AS Suma
   --INTO TEMPORALI#   
  FROM [BDMedicosLuminovaPg].[dbo].[Medicos] AS m

  JOIN [BDMedicosLuminovaPg].[dbo].[MedicosBi] AS b
  ON [b].[Cdg_medico]=[m].[Cdg_medico]

  RIGHT JOIN [BDMedicosLuminovaPg].[dbo].[MedicosIniciativas] AS i
  ON [i].[CodBi]=[b].[Cod_bi] AND [i].[Pais]=[b].[Pais]

 

  WHERE Año=2022 
  AND ([Mes]IN (12) AND [Periodo] IN('YTD MOV 2022'))
  OR ([Mes]IN (11) AND [Periodo] IN('YTD MOV 2021'))
   AND I.[Pais]='EC'
  
  GROUP BY 
         --[i].[MedicosIniciativas]    
        --,[m].[Nombre]
         [b].[Nom_bi]         
        ,[i].[CodBi]
        
        ,[i].[Representante]
        ,[m].[Año]
        ,[m].[Mes]
        ,[m].[Periodo]
        ,[b].[Pais] 

ORDER BY [m].[Periodo],[b].[Nom_bi] ASC