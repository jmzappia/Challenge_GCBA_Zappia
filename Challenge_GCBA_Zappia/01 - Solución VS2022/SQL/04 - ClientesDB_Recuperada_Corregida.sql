/*************************************************************************************************************
* Programa / Procedimiento / Función / Clase / Script: ClientesDB_Recuperada_Corregida.sql                   *
**************************************************************************************************************
* Descripción: ChallengeGCBA - Recuperación de tabla de Clientes (se explica debajo).                        *
* Autor      : Julián Marcelo Zappia                                                                         *
* Fecha      : 20/06/2022                                                                                    *
*************************************************************************************************************/


/* Nota técnica: se modificaron a Español los nombres sugeridos en idioma Inglés en el documento indicativo del
Challenge, debido a que varios en varios lenguajes de desarrollo, tres de ellos se consideran palabras reservadas*/

/* Tabla recuperada después de la corrupción de datos de la original por fallo de VS2022. Es temporal.
A modo de ejemplo. No funcional. */


CREATE TABLE [clientesdb] (
	[CODIGO_ID]	            Numeric(5) not null, 
	[RAZON_SOCIAL]	        Character(50) not null,
	[NOMBRE_FANTASIA]	    Character(50) not null,
	[CUIT]	                Character(15) not null,
	[FECHA_ALTA]	        DateTime not null,
	[FECHA_BAJA]	        DateTime not null,
	[NOMBRE_CONTACTO]	    Character(50) not null,
	[SEXO_CONTACTO]  	    Character(1) not null,
	[FECHA_NAC_CONTACTO]	DateTime,
	[DNI]	                Character(10) not null,
	[TELEFONO_1]	        Character(15) not null,
	[TELEFONO_2]	        Character(15) not null,
	[CORREO_ELECTRONICO]	Character(50) not null,
	[DOMICILIO_CALLE]	    Character(50) not null,
	[DOMICILIO_NUMERO]	    Character(50) not null,
	[DOMICILIO_LOCALIDAD]	Character(50) not null,
	[DOMICILIO_CODPOSTAL]	Character(10) not null,
	[DOMICILIO_PROVINCIA]	Character(50) not null,
	[DOMICILIO_PAIS]	    Character(50) not null,
	[COMPRADOR]	            Bit not null,
	[VENDEDOR]	            Bit not null,
	[ESTADO]	            Bit not null,
	);



