/*************************************************************************************************************
* Programa / Procedimiento / Funci�n / Clase / Script: Categoria_Celulares.sql                              *
**************************************************************************************************************
* Descripci�n: ChallengeGCBA - Genera consulta de ventas TOP 5 de ventas de Celulares.                       *
* Autor      : Juli�n Marcelo Zappia                                                                         *
* Fecha      : 21/06/2022                                                                                    *
*************************************************************************************************************/


SELECT TOP 5 *, COUNT(Ordenes.CANTIDAD), SUM(Ordenes.IMPORTE_TOTAL),
                Ordenes.CLIENTE_ID_VENTA AS Cliente, Clientes.RAZON_SOCIAL AS Raz�n_Social, 
                Clientes.NOMBRE_CONTACTO AS Persona_Responsable, 
				Ordenes.FECHA_ORDEN AS Fecha, Ordenes.CANTIDAD AS Cantidad_Vendida,
				Ordenes.IMPORTE_TOTAL

WHERE ((YEAR(Ordenes.FECHA_ORDEN) = 2022) AND (Ordenes.CATEGORIA_ID = "Celulares"));
FROM Ordenes
GO

