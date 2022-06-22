/*************************************************************************************************************
* Programa / Procedimiento / Función / Clase / Script: Genera dboOrdenes.sql                                 *
**************************************************************************************************************
* Descripción: ChallengeGCBA - Generación de tabla de Ordenes de Compra/Venta.                               *
* Autor      : Julián Marcelo Zappia                                                                         *
* Fecha      : 21/06/2022                                                                                    *
*************************************************************************************************************/


/* Nota técnica: se modificaron a Español los nombres sugeridos en idioma Inglés en el documento indicativo del
Challenge, debido a que varios en varios lenguajes de desarrollo, tres de ellos se consideran palabras reservadas*/


CREATE TABLE [Ordenes] (
	[ORDEN_ID]		        Numeric(5) not null, 
	[NUMERO_ORDEN]			Character(15) not null,
	[DESCRIPCION_ORDEN]     Character(50) not null,
	[FECHA_ORDEN]	        DateTime not null,
	[CLIENTE_ID_COMPRA]		Numeric(5) not null,
	[CLIENTE_ID_VENTA]		Numeric(5) not null,
	[ITEM_ID]				Numeric(5) not null,
	[CATEGORIA_ID]			Numeric(5) not null,
	[SUBCATEGORIA_ID]		Numeric(5) not null,
	[CANTIDAD]				NUMERIC(10) NOT NULL,
	[IMPORTE]				Numeric(14,2) not null,
	[IMPORTE_IMPUESTOS]		Numeric(14,2) not null,
	[OTROS_IMPORTES]        Numeric(14,2) not null,
	[IMPORTE_TOTAL]			Numeric(14,2) not null,
	[COMPRA]				Bit not null,
	[VENTA]					Bit not null,
	[ESTADO]			    Bit not null,
	);



