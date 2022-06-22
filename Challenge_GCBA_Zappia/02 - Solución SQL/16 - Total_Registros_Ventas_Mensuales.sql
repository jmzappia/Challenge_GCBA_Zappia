/*************************************************************************************************************
* Programa / Procedimiento / Funci�n / Clase / Script: Total_Registro_Ventas_Mensuales.sql                   *
**************************************************************************************************************
* Descripci�n: ChallengeGCBA - Consulta de Ordenes que coinciden con la fecha actual.                        *
* Autor      : Juli�n Marcelo Zappia                                                                         *
* Fecha      : 21/06/2022                                                                                    *
*************************************************************************************************************/


/* Nota t�cnica: se modificaron a Espa�ol los nombres sugeridos en idioma Ingl�s en el documento indicativo del
Challenge, debido a que varios en varios lenguajes de desarrollo, tres de ellos se consideran palabras reservadas*/


SELECT Ordenes.ORDEN_ID AS Id, Ordenes.NUMERO_ORDEN AS N�mero, 
       Ordenes.DESCRIPCION_ORDEN AS Descripci�n,
       Ordenes.FECHA_ORDEN AS Fecha, Ordenes.CLIENTE_ID_VENTA AS IdCliente, 
	   Ordenes.IMPORTE_TOTAL AS ImporteTotal
FROM Ordenes  
WHERE Ordenes.FECHA_ORDEN = GETDATE()  

GO