/****** LUMINOVA  ******/
--TARGETING ECUADOR MEDICOS VISITADOS
SELECT 
           [b].[Cod_bi] AS COD_BI
          ,[b].[Nom_bi] AS NOM_BI        
		  ,[b].[Dom_bi] AS DOM_BI
		  ,[b].[Loc_bi] AS LOC_BI
		  ,[b].[Reg_bi] AS REG_BI
		  ,[b].[Esp_bi] AS ESP_BI
		  ,[fi].[Rep]   AS REPRESENTANTE    
          ,IIF( [fi].[Rep]  IS NULL, 'NO VISITADO', 'VISITADO' ) AS VISITA		  
          ,[fi].[Distrito] AS DISTRITO
          ,[fi].[Linea]  AS lINEA
          ,[fi].[Frecuencia] AS FRECUENCIA
          ,[fi].[Categoria]  AS CATEGORIA	 
		  ,[m].[Periodo]	 AS PERIODO		  		  	
		  ,[m].[Descripcion]		  
		  ,SUM([m].[Val]) AS SUMA

  FROM [BDMedicosLuminovaPg].[dbo].[Medicos] AS m

            JOIN [BDMedicosLuminovaPg].[dbo].[Pais] AS p
			ON [p].[Region]=[m].[Region]

			JOIN [Unifica].[dbo].[Mercado.Producto] AS ma
			ON [ma].[Producto]=[m].[Producto]
	
			JOIN [BDMedicosLuminovaPg].[dbo].[MedicosBi] AS b
			ON [b].[Cdg_medico]=[m].[Cdg_medico]
			
			LEFT JOIN [BDMedicosLuminovaPg].[dbo].[FicheroMedico] AS fi
			ON [fi].[Nom_bi]=[b].[Nom_bi]


WHERE [m].[Pais]='EC' 
AND [m].[Periodo]='TAM 10/22' 

GROUP BY   
           [b].[Cod_bi]
          ,[b].[Nom_bi]          
		  ,[b].[Dom_bi]
		  ,[b].[Loc_bi]
		  ,[b].[Reg_bi]
		  ,[b].[Esp_bi]
		  ,[fi].[Rep] 
		  ,[fi].[Distrito]
          ,[fi].[Linea] 
          ,[fi].[Frecuencia] 
          ,[fi].[Categoria] 	 
		  ,[m].[Periodo]			  		  		  
		  ,[m].[Descripcion]
		  