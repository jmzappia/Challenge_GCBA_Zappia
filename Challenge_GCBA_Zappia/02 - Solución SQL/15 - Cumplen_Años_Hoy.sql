/*************************************************************************************************************
* Programa / Procedimiento / Función / Clase / Script: Cumplen_Años_Hoy.sql                                  *    
**************************************************************************************************************
* Descripción: ChallengeGCBA - Consulta de clientes que cumplen años en la fecha actual.                     *         
* Autor      : Julián Marcelo Zappia                                                                         *
* Fecha      : 21/06/2022                                                                                    *
*************************************************************************************************************/


/* Nota técnica: se modificaron a Español los nombres sugeridos en idioma Inglés en el documento indicativo del
Challenge, debido a que varios en varios lenguajes de desarrollo, tres de ellos se consideran palabras reservadas*/

Select NOMBRE_CONTACTO, RAZON_SOCIAL, TELEFONO_1, CORREO_ELECTRONICO, DOMICILIO_CALLE, DOMICILIO_NUMERO, DOMICILIO_LOCALIDAD
from Clientes 
where  DATEPART( wk, GETDATE() ) like DATEPART( wk, FECHA_NAC_CONTACTO)