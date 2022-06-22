/*************************************************************************************************************
* Programa / Procedimiento / Función / Clase / Script: Total_Registro_Ventas_Mensuales.sql                   *
**************************************************************************************************************
* Descripción: ChallengeGCBA - Consulta de Ordenes que coinciden con la fecha actual.                        *
* Autor      : Julián Marcelo Zappia                                                                         *
* Fecha      : 21/06/2022                                                                                    *
*************************************************************************************************************/


/* Nota técnica: se modificaron a Español los nombres sugeridos en idioma Inglés en el documento indicativo del
Challenge, debido a que varios en varios lenguajes de desarrollo, tres de ellos se consideran palabras reservadas*/


SELECT Ordenes.ORDEN_ID AS Id, Ordenes.NUMERO_ORDEN AS Número, 
       Ordenes.DESCRIPCION_ORDEN AS Descripción,
       Ordenes.FECHA_ORDEN AS Fecha, Ordenes.CLIENTE_ID_VENTA AS IdCliente, 
	   Ordenes.IMPORTE_TOTAL AS ImporteTotal
FROM Ordenes  
WHERE Ordenes.FECHA_ORDEN = GETDATE()  

GO