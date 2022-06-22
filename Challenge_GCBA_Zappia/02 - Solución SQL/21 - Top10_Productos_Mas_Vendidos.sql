/*************************************************************************************************************
* Programa / Procedimiento / Función / Clase / Script: Top10_Productos_Mas_Vendidos.sql                      *
**************************************************************************************************************
* Descripción: ChallengeGCBA - Genera consulta TOP 10 de Artículos más vendidos      .                       *
* Autor      : Julián Marcelo Zappia                                                                         *
* Fecha      : 21/06/2022                                                                                    *
*************************************************************************************************************/



SELECT TOP 10 *, MAX(Ordenes.CANTIDAD), 
                Ordenes.CLIENTE_ID_VENTA AS Cliente, Clientes.RAZON_SOCIAL AS Razón_Social, 
                Clientes.NOMBRE_CONTACTO AS Persona_Responsable, 
				Ordenes.FECHA_ORDEN AS Fecha, Ordenes.CANTIDAD AS Cantidad_Vendida,
				Ordenes.IMPORTE_TOTAL

WHERE ((MONTH(Ordenes.FECHA_ORDEN) = 4) AND (MONTH(Ordenes.FECHA_ORDEN) AND (YEAR(Ordenes.FECHA_ORDEN) = 2022) AND MAX(Ordenes.CANTIDAD) < MIN(Ordenes.CANTIDAD)) 
FROM Ordenes
GO