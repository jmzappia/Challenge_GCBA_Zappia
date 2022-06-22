/*************************************************************************************************************
* Programa / Procedimiento / Función / Clase / Script: Genera dboItems.sql                                   *
**************************************************************************************************************
* Descripción: ChallengeGCBA - Generación de tabla de Items.                                                 *
* Autor      : Julián Marcelo Zappia                                                                         *
* Fecha      : 21/06/2022                                                                                    *
*************************************************************************************************************/


/* Nota técnica: se modificaron a Español los nombres sugeridos en idioma Inglés en el documento indicativo del
Challenge, debido a que varios en varios lenguajes de desarrollo, tres de ellos se consideran palabras reservadas*/


CREATE TABLE [Items] (
	[ITEM_ID]	            Numeric(5) not null, 
	[NOMBRE_PRODUCTO]       Character(50) not null,
	[FECHA_ALTA]	        DateTime not null,
	[FECHA_BAJA]	        DateTime not null,
	[CANTIDAD_STOCK]		Numeric(10) not null,	
	[ID_CATEGORIA]  	    Numeric(5) not null,
	[CATEGORIA]				Character(50) not null,
	[ID_SUBCATEGORIA]		Numeric(5) not null,
	[SUBCATEGORIA]			Character(50) not null,
	[PRECIO_FINAL]			Numeric(14,2) not null,
	[ESTADO]				Bit	not null,
	);



