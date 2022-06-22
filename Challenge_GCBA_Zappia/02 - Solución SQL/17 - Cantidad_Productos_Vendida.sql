/*************************************************************************************************************
* Programa / Procedimiento / Función / Clase / Script: Cantidad_Productos_Vendida.sql                        *
**************************************************************************************************************
* Descripción: ChallengeGCBA - Calcula la cantidad de ventas en la fecha actual.                             *
* Autor      : Julián Marcelo Zappia                                                                         *
* Fecha      : 21/06/2022                                                                                    *
*************************************************************************************************************/


/* Nota técnica: se modificaron a Español los nombres sugeridos en idioma Inglés en el documento indicativo del
Challenge, debido a que varios en varios lenguajes de desarrollo, tres de ellos se consideran palabras reservadas*/


SELECT * FROM Ordenes AS RegistroCompleto
WHERE (Ordenes.FECHA_ORDEN = (GETDATE()) AND (COUNT(Ordenes.CANTIDAD) > 0));

GO