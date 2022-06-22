/*************************************************************************************************************
* Programa / Procedimiento / Función / Clase / Script: Consulta_Prueba.sql                                   *
**************************************************************************************************************
* Descripción: ChallengeGCBA - Prueba de consulta (Fallida. No se pueden importar los datos).                *
* Autor      : Julián Marcelo Zappia                                                                         *
* Fecha      : 21/06/2022                                                                                    *
*************************************************************************************************************/


/* Nota técnica: se modificaron a Español los nombres sugeridos en idioma Inglés en el documento indicativo del
Challenge, debido a que varios en varios lenguajes de desarrollo, tres de ellos se consideran palabras reservadas
CORRUPCION DE ARCHIVOS DE ORIGEN Y DESTINO*/

BULK 

INSERT dbo.Clientes

FROM
'C:\Users\Usuario\Source\Repos\Challenge_GCBA_Zappia\SQL\ClientesOk.csv';

/*WITH (
    FIELDTERMINATOR= ',',
    ROWTERMINATOR = '\n' 

);*/

GO;
SELECT * FROM dbo.Clientes;
GO;
