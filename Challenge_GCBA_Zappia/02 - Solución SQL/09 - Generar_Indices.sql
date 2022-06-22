/*************************************************************************************************************
* Programa / Procedimiento / Función / Clase / Script: Generar_Indices.sql                                   *
**************************************************************************************************************
* Descripción: ChallengeGCBA - Indexación de archivos.                                                       *
* Autor      : Julián Marcelo Zappia                                                                         *
* Fecha      : 21/06/2022                                                                                    *
*************************************************************************************************************/


/* Nota técnica: se modificaron a Español los nombres sugeridos en idioma Inglés en el documento indicativo del
Challenge, debido a que varios en varios lenguajes de desarrollo, tres de ellos se consideran palabras reservadas*/

CREATE INDEX dboClientes1 ON dbo.Clientes (CODIGO_ID);
GO;


CREATE INDEX dboItems1 ON dbo.Items (ITEM_ID);
GO;

CREATE INDEX dboItems2 ON dbo.Items (ID_CATEGORIA);
GO;

CREATE INDEX dboItems3 ON dbo.Items (ID_SUBCATEGORIA);
GO;



CREATE INDEX dboCategoria1 ON dbo.Categorias (CATEGORIA_ID);
GO;

CREATE INDEX dboCategoria2 ON dbo.Categorias (SUBCATEGORIA_ID);
GO;



CREATE INDEX dboOrdenes1 ON dbo.Ordenes (ORDEN_ID);
GO;

CREATE INDEX dboOrdenes2 ON dbo.Ordenes (CLIENTE_ID_COMPRA);
GO;

CREATE INDEX dboOrdenes3 ON dbo.Ordenes (CLIENTE_ID_VENTA);
GO;

CREATE INDEX dboOrdenes4 ON dbo.Ordenes (CATEGORIA_ID);
GO;

CREATE INDEX dboOrdenes5 ON dbo.Ordenes (SUBCATEGORIA_ID);
GO;


