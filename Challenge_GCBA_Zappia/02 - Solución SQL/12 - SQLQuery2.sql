/*************************************************************************************************************
* Programa / Procedimiento / Función / Clase / Script: Genera SQLQuery2.sql                                  *
**************************************************************************************************************
* Descripción: ChallengeGCBA - Prueba de importación de datos desde Access (fallido).                        *
* Autor      : Julián Marcelo Zappia                                                                         *
* Fecha      : 21/06/2022                                                                                    *
*************************************************************************************************************/


/* Nota técnica: se modificaron a Español los nombres sugeridos en idioma Inglés en el documento indicativo del
Challenge, debido a que varios en varios lenguajes de desarrollo, tres de ellos se consideran palabras reservadas*/


USE [master]
GO

BULK INSERT Clientes
FROM 'C:\Users\Usuario\Source\Repos\Challenge_GCBA_Zappia\02 - Solución SQL\clientes.aaccdb
'
WITH
(
    FIRSTROW = 2, 
    FIELDTERMINATOR = '',  
    ROWTERMINATOR = '',   
    TABLOCK
)

GO


