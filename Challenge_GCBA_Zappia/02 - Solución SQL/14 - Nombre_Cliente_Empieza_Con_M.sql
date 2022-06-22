/*************************************************************************************************************
* Programa / Procedimiento / Función / Clase / Script: Nombre_Cliente_Empieza_com "M".sql                    *
**************************************************************************************************************
* Descripción: ChallengeGCBA - Consulta de datos cuando el nombre de contacto comienza con "M".              *
* Autor      : Julián Marcelo Zappia                                                                         *
* Fecha      : 21/06/2022                                                                                    *
*************************************************************************************************************/


/* Nota técnica: se modificaron a Español los nombres sugeridos en idioma Inglés en el documento indicativo del
Challenge, debido a que varios en varios lenguajes de desarrollo, tres de ellos se consideran palabras reservadas*/


select *
  from Clientes 
  where NOMBRE_CONTACTO like 'M%' 