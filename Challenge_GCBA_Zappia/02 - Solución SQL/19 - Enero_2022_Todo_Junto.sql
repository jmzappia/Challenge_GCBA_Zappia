/*************************************************************************************************************
* Programa / Procedimiento / Funci�n / Clase / Script: Enero_2022_Todo_JUnto.sql                             *
**************************************************************************************************************
* Descripci�n: ChallengeGCBA - Agrupaci�n de consultas anteriores con condicional de Mes Enero A�o 2022.     *
* Autor      : Juli�n Marcelo Zappia                                                                         *
* Fecha      : 21/06/2022                                                                                    *
*************************************************************************************************************/


SELECT Ordenes.*, COUNT(*), sum(Ordenes.IMPORTE_TOTAL) 
FROM Ordenes  
WHERE (MONTH(Ordenes.FECHA_ORDEN) = 1) AND (YEAR(Ordenes.FECHA_ORDEN) = 2022)
GROUP BY Ordenes.ORDEN_ID, Ordenes.NUMERO_ORDEN, Ordenes.DESCRIPCION_ORDEN;
GO