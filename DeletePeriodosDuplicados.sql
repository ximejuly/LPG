SELECT 
      [Periodo]         
  FROM [BDMedicosLuminovaPg].[dbo].[Medicos]

WHERE [Mes]=12 AND [Pais]='EC' AND [Periodo] LIKE'MES MOV%'
  --WHERE [Mes]=11 AND [Pais]='EC' 
  GROUP BY [Periodo]
  ORDER BY [Periodo]

DELETE FROM [BDMedicosLuminovaPg].[dbo].[Medicos]

WHERE [Mes]=12 AND [Pais]='EC' AND [Periodo]='MES MOV 12/21'

--WHERE [Periodo]='MES MOV 12/22' AND [Mes]=12