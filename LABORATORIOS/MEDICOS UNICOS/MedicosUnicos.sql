SELECT 
         [m].[Cdg_medico]
        ,[m].[Nombre]
        ,[m].[Domicilio]
        ,[m].[Localidad]
        ,[m].[Region]
        ,[m].[Esp]
        ,[m].[Matricula]

FROM [dbo].[Medicos] AS m

WHERE [Mes]=12

GROUP BY
          [m].[Cdg_medico]
        ,[m].[Nombre]
        ,[m].[Domicilio]
        ,[m].[Localidad]
        ,[m].[Region]
        ,[m].[Esp]
        ,[m].[Matricula]

ORDER BY [Nombre]