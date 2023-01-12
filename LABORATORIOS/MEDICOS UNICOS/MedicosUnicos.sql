SELECT 
         RIGHT([p].[CodPais],2) AS PAIS
        ,[m].[Cdg_medico] AS CDG_MEDICO
        ,[m].[Nombre] AS NOMBRE_DOCTOR
        ,[m].[Domicilio] AS DOMICILIO
        ,[m].[Localidad] AS LOCALIDAD
        ,[m].[Region] AS REGION 
        ,[m].[Esp] AS CDG_ESP1
        ,[m].[Matricula] AS MATRICULA

FROM [BDMedicosLuminovaPg].[dbo].[Medicos] AS m 

LEFT JOIN [BDMedicosLuminovaPg].[dbo].[Pais] AS [p] ON [p].[Region]=m.[Region]

WHERE [Mes]=12

GROUP BY
         [p].[CodPais]
        ,[m].[Cdg_medico]
        ,[m].[Nombre]
        ,[m].[Domicilio]
        ,[m].[Localidad]
        ,[m].[Region]
        ,[m].[Esp]
        ,[m].[Matricula]

ORDER BY [Nombre]
