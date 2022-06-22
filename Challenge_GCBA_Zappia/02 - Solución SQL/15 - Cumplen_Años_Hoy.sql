/*************************************************************************************************************
* Programa / Procedimiento / Funci�n / Clase / Script: Cumplen_A�os_Hoy.sql                                  *    
**************************************************************************************************************
* Descripci�n: ChallengeGCBA - Consulta de clientes que cumplen a�os en la fecha actual.                     *         
* Autor      : Juli�n Marcelo Zappia                                                                         *
* Fecha      : 21/06/2022                                                                                    *
*************************************************************************************************************/


/* Nota t�cnica: se modificaron a Espa�ol los nombres sugeridos en idioma Ingl�s en el documento indicativo del
Challenge, debido a que varios en varios lenguajes de desarrollo, tres de ellos se consideran palabras reservadas*/

Select NOMBRE_CONTACTO, RAZON_SOCIAL, TELEFONO_1, CORREO_ELECTRONICO, DOMICILIO_CALLE, DOMICILIO_NUMERO, DOMICILIO_LOCALIDAD
from Clientes 
where  DATEPART( wk, GETDATE() ) like DATEPART( wk, FECHA_NAC_CONTACTO)