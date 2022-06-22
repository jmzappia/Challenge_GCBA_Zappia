/*************************************************************************************************************
* Programa / Procedimiento / Funci�n / Clase / Script: Genera SQLQuery2.sql                                  *
**************************************************************************************************************
* Descripci�n: ChallengeGCBA - Prueba de importaci�n de datos desde Access (fallido).                        *
* Autor      : Juli�n Marcelo Zappia                                                                         *
* Fecha      : 21/06/2022                                                                                    *
*************************************************************************************************************/


/* Nota t�cnica: se modificaron a Espa�ol los nombres sugeridos en idioma Ingl�s en el documento indicativo del
Challenge, debido a que varios en varios lenguajes de desarrollo, tres de ellos se consideran palabras reservadas*/


USE [master]
GO

BULK INSERT Clientes
FROM 'C:\Users\Usuario\Source\Repos\Challenge_GCBA_Zappia\02 - Soluci�n SQL\clientes.aaccdb
'
WITH
(
    FIRSTROW = 2, 
    FIELDTERMINATOR = '',  
    ROWTERMINATOR = '',   
    TABLOCK
)

GO


