/*************************************************************************************************************
* Programa / Procedimiento / Funci�n / Clase / Script: Nombre_Cliente_Empieza_com "M".sql                    *
**************************************************************************************************************
* Descripci�n: ChallengeGCBA - Consulta de datos cuando el nombre de contacto comienza con "M".              *
* Autor      : Juli�n Marcelo Zappia                                                                         *
* Fecha      : 21/06/2022                                                                                    *
*************************************************************************************************************/


/* Nota t�cnica: se modificaron a Espa�ol los nombres sugeridos en idioma Ingl�s en el documento indicativo del
Challenge, debido a que varios en varios lenguajes de desarrollo, tres de ellos se consideran palabras reservadas*/


select *
  from Clientes 
  where NOMBRE_CONTACTO like 'M%' 