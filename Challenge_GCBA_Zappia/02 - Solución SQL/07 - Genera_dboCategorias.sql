/*************************************************************************************************************
* Programa / Procedimiento / Función / Clase / Script: Genera dboCategorias.sql                              *
**************************************************************************************************************
* Descripción: ChallengeGCBA - Generación de tabla de Categorias.                                            *
* Autor      : Julián Marcelo Zappia                                                                         *
* Fecha      : 21/06/2022                                                                                    *
*************************************************************************************************************/


/* Nota técnica: se modificaron a Español los nombres sugeridos en idioma Inglés en el documento indicativo del
Challenge, debido a que varios en varios lenguajes de desarrollo, tres de ellos se consideran palabras reservadas*/


CREATE TABLE [Categorias] (
	[CATEGORIA_ID]	        Numeric(5) not null, 
	[NOMBRE_CATEGORIA]      Character(50) not null,
	[FECHA_ALTA]	        DateTime not null,
	[FECHA_BAJA]	        DateTime not null,
	[ESTADO_CATEGORIA]      Bit not null,
	[SUBCATEGORIA_ID]	    Numeric(5) not null,	
	[NOMBRE_SUBCATEGORIA]   Character(50) not null,
	[FECHA_ALTA_SUB]        DateTime not null,
	[FECHA_BAJA_SUB]	    DateTime not null,
	[ESTADO_SUBCATEGORIA]   Bit not null,
	);



