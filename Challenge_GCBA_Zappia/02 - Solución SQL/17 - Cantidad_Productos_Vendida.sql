/*************************************************************************************************************
* Programa / Procedimiento / Funci�n / Clase / Script: Cantidad_Productos_Vendida.sql                        *
**************************************************************************************************************
* Descripci�n: ChallengeGCBA - Calcula la cantidad de ventas en la fecha actual.                             *
* Autor      : Juli�n Marcelo Zappia                                                                         *
* Fecha      : 21/06/2022                                                                                    *
*************************************************************************************************************/


/* Nota t�cnica: se modificaron a Espa�ol los nombres sugeridos en idioma Ingl�s en el documento indicativo del
Challenge, debido a que varios en varios lenguajes de desarrollo, tres de ellos se consideran palabras reservadas*/


SELECT * FROM Ordenes AS RegistroCompleto
WHERE (Ordenes.FECHA_ORDEN = (GETDATE()) AND (COUNT(Ordenes.CANTIDAD) > 0));

GO