SELECT        
       [fi].[Cod_bi]
      ,[b].[Nom_bi]
      ,[b].[Dom_bi]
      ,[b].[Loc_bi]
      ,[b].[Reg_bi]          
	  ,[b].[Esp_bi]  
      ,[m].[Periodo]
      ,[m].[Producto]  
	  ,[ma].[Marca]    	  
	  ,[pa].[Descripcion]
	  ,[fi].[Linea]
	  ,[fi].[Rep]
	  ,[fi].[Distrito]
	  ,[fi].[Frecuencia]
	  ,[fi].[Categoria]
	  ,[pa].[Estado]
	  ,[pa].[Mes]
	  ,[pa].[Pais]
      ,[pa].[Clasificacion]
	  ,[pe].[Periodo]
	  ,SUM([m].[Val]) AS Val
      ,IIF(RIGHT([ma].[Marca],3)='LPG','LPG','RESTO') as LAB

  FROM [BDMedicosLuminovaPg].[dbo].[Medicos] AS [m]

  JOIN [BDMedicosLuminovaPg].[dbo].[MedicosBi]  AS [b]
  ON [m].[Cdg_medico]=[b].[Cdg_medico]

  JOIN [BDMedicosLuminovaPg].[dbo].[ParrillaPromocional]  AS [pa]
  ON [m].[Descripcion]=[pa].[Descripcion] AND [b].[Pais]=RIGHT([pa].[Pais],2)

  RIGHT JOIN [BDMedicosLuminovaPg].[dbo].[FicheroMedico]  AS [fi]
  ON [fi].[Cod_bi]=[b].[Cod_bi] AND [fi].[Linea]=[pa].[Linea]

  JOIN [Unifica].[dbo].[Mercado.Producto]  AS [ma]
  ON [ma].[Producto]=[m].[Producto] 

  JOIN [BDMedicosLuminovaPg].[dbo].[Periodo]  AS [pe]
  ON [pe].[MesCupExp]=[m].[Periodo]

  
  WHERE (( [pa].[Mes]='IIICTR2022' AND ( [pa].[Estado]='ACTIVO'))
    AND ( [b].[Pais]='EC' AND [Desc_Ciclo_Promocional]='12')
	AND ([ma].[Laboratorio]='LPG EC'))
	AND ([m].[Mes]=12 OR [m].[Periodo] LIKE 'MES MOV%')
	
  GROUP BY 
           [fi].[Cod_bi]
		  ,[b].[Nom_bi]
		  ,[b].[Dom_bi]
		  ,[b].[Loc_bi]
		  ,[b].[Reg_bi]          
		  ,[b].[Esp_bi]  
		  ,[m].[Periodo]
		  ,[m].[Producto]  
		  ,[ma].[Marca]   		  
		  ,[pa].[Descripcion]
		  ,[fi].[Linea]
		  ,[fi].[Rep]
		  ,[fi].[Distrito]
		  ,[fi].[Frecuencia]
		  ,[fi].[Categoria]
		  ,[pa].[Estado]
	      ,[pa].[Mes]
		  ,[pa].[Pais]
         ,[pa].[Clasificacion]
		 ,[pe].[Periodo]
    

ORDER BY [b].[Nom_bi]