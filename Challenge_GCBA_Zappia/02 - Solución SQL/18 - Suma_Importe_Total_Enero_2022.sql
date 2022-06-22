/*************************************************************************************************************
* Programa / Procedimiento / Función / Clase / Script: Suma_Importe_Total_Enero_2022.sql                     *
**************************************************************************************************************
* Descripción: ChallengeGCBA - Genera consulta de suma de importes de ventas Enero 2022.                     *
* Autor      : Julián Marcelo Zappia                                                                         *
* Fecha      : 21/06/2022                                                                                    *
*************************************************************************************************************/


select sum(Ordenes.IMPORTE_TOTAL)
  from Ordenes
  WHERE (MONTH(Ordenes.FECHA_ORDEN) = 2) AND (YEAR(Ordenes.FECHA_ORDEN) = 2022)
GO