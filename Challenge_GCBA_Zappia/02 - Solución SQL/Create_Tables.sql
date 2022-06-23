/*************************************************************************************************************
* Programa / Procedimiento / Función / Clase / Script: Iniciar.sql                                           *
**************************************************************************************************************
* Descripción: ChallengeGCBA - Generación de Base de Datos y Tablas                                          *
* Autor      : Julián Marcelo Zappia                                                                         *
* Fecha      : 18/06/2022                                                                                    *
*************************************************************************************************************/
/* Fecha      : 18/06/2022                                                                                    */
/**************************************************************************************************************/

CREATE TABLE Customer
(
	[Codigo_ID] [int] IDENTITY(1,1) NOT NULL,
	[Razon_Social] VARCHAR(50) NOT NULL,
	[Nombre_Fantasia] VARCHAR(50) NOT NULL,
	[Cuit] VARCHAR(12) NOT NULL,
	[Fecha_Alta] DATETIME NOT NULL,
	[Fecha_Baja] DATETIME NOT NULL,
	[Nombre_Contacto] VARCHAR(50) NOT NULL,
	[Sexo_Contacto] VARCHAR NOT NULL,
	[Fecha_Nac_Contacto] DATETIME NOT NULL,
	[Telefono_1] VARCHAR NOT NULL,
	[Telefono_2] VARCHAR NOT NULL,
	[Correo_Electronico] VARCHAR NOT NULL,
    [Domicilio_Calle] VARCHAR NOT NULL,
	[Domicilio_Numero] VARCHAR NOT NULL,
	[Domicilio_Localidad] VARCHAR NOT NULL,
	[Domicilio_CodPostal] VARCHAR NOT NULL,
	[Domicilio_Provincia] VARCHAR(50) NOT NULL,
	[Domicilio_Pais] VARCHAR(50) NOT NULL,
	[Comprador] BIT NOT NULL,
	[Vendedor] BIT NOT NULL,
	[Estado] [bit] NOT NULL,
)

END 



/*************************************************************************************************************
* Programa / Procedimiento / Función / Clase / Script: Item.sql                                           *
**************************************************************************************************************
* Descripción: ChallengeGCBA - Generación de Base de Datos y Tablas                                          *
* Autor      : Julián Marcelo Zappia                                                                         *
* Fecha      : 18/06/2022                                                                                    *
*************************************************************************************************************/

BEGIN

CREATE TABLE [dbo].[Items](
	[Item_ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Producto] VARCHAR(50) NOT NULL,
	[Descripcion_Producto] VARCHAR(50) NOT NULL,
	[Fecha_Alta] DATE NOT NULL,
	[Fecha_Baja] DATE NOT NULL,
	[Cantidad] NUMERIC(10) NOT NULL,
	[Categoria] VARCHAR(50) NOT NULL,
	[SubCategoria] VARCHAR(50) NOT NULL,
	[SubCategoriaID] [INT] NOT NULL,
	[Cantidad_Stock] NUMERIC(10) NOT NULL,
	[Precio_Final] NUMERIC(14,2) NOT NULL,
	[Estado] [bit] NOT NULL,
)
    
END;



/*************************************************************************************************************
* Programa / Procedimiento / Función / Clase / Script: Category.sql                                          *
**************************************************************************************************************
* Descripción: ChallengeGCBA - Generación de Base de Datos y Tablas                                          *
* Autor      : Julián Marcelo Zappia                                                                         *
* Fecha      : 18/06/2022                                                                                    *
*************************************************************************************************************/

BEGIN

CREATE TABLE [ChallengeGCBA_Zappia] [Categorias] (

    ID_Categoria NUMERIC NOT NULL,
	ItemID INT PRIMARY KEY NOT NULL,
	SubCategoria NUMERIC NOT NULL,
	Descricpion_Categoria VARCHAR NOT NULL,
	SubCategoriaID NUMERIC NOT NULL,
	[Descripcion_Sub_Categoria] VARCHAR NOT NULL,
	[Fecha_Alta] DATE NOT NULL,
	[Fecha_Baja] DATE NOT NULL,
	[Estado] [bit] NOT NULL,
)

END




/*************************************************************************************************************
* Programa / Procedimiento / Función / Clase / Script: Ordenes.sql                                           *
**************************************************************************************************************
* Descripción: ChallengeGCBA - Generación de Base de Datos y Tablas                                          *
* Autor      : Julián Marcelo Zappia                                                                         *
* Fecha      : 18/06/2022                                                                                    *
*************************************************************************************************************/
/* Nombre sugerido "Order" no utilizado. Palabra reservada */

BEGIN

CREATE TABLE [dbo].[Ordenes](
	[OrdenID] [int] IDENTITY(1,1) NOT NULL,
	[Numero_de_Orden] VARCHAR(50) NOT NULL,
	[Fecha_Orden] DATE NOT NULL,
	[Descripcion_Orden] VARCHAR(50) NOT NULL,
	[CompradorID] INT NOT NULL,
	[ItemID] INT NOT NULL,
	[SubItemID] VARCHAR NOT NULL,
	[Importe_Pagado] NVARCHAR NOT NULL,
	[Estado] [bit] NOT NULL,
)
END 




/*************************************************************************************************************/
/* Programa / Procedimiento / Función / Clase / Script: 02 - SQLSchemaInicial.sql                            */
/**************************************************************************************************************
/* Descripción: ChallengeGCBA - Generación de Esquema y Tablas                                               */
/* Autor      : Julián Marcelo Zappia                                                                        */
* Fecha      : 18/06/2022                                                                                    */
/*************************************************************************************************************/  

BEGIN 

CREATE TABLE [ChallengeGCBA_ZAPPIA].[Customer](

	[Codigo_ID] [int] IDENTITY(1,1) NOT NULL,
	[Razon_Social] VARCHAR(50) NOT NULL,
	[Nombre_Fantasia] VARCHAR(50) NOT NULL,
	[Cuit] VARCHAR(12) NOT NULL,
	[Fecha_Alta] DATETIME NOT NULL,
	[Fecha_Baja] DATETIME NOT NULL,
	[Nombre_Contacto] VARCHAR(50) NOT NULL,


	[Sexo_Contacto] VARCHAR(1) NOT NULL,
	[Fecha_Nac_Contacto] DATETIME NOT NULL,
	[Telefono_1] VARCHAR(15) NOT NULL,
	[Telefono_2] VARCHAR(15) NOT NULL,
	[Correo_Electronico] VARCHAR(50) NOT NULL,
    [Domicilio_Calle] VARCHAR(50) NOT NULL,
	[Domicilio_Numero] VARCHAR NOT NULL,
	[Domicilio_Localidad] VARCHAR NOT NULL,
	[Domicilio_CodPostal] VARCHAR NOT NULL,
	[Domicilio_Provincia] VARCHAR NOT NULL,
	[Domicilio_Pais] VARCHAR NOT NULL,
	[Comprador] BIT NOT NULL,
	[Vendedor] BIT NOT NULL,
	[Estado] [bit] NOT NULL,

    PRIMARY KEY CLUSTERED 
    (
	[Codigo_ID] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]

END CONVERSATION


BEGIN 

	CREATE TABLE [ChallengeGCBA_Zappia].[Items](
	[Item_ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Producto] VARCHAR(50) NOT NULL,
	[Descripcion_Producto] VARCHAR(50) NOT NULL,
	[Fecha_Alta] DATE NOT NULL,
	[Fecha_Baja] DATE NOT NULL,
	[Cantidad] NUMERIC(10) NOT NULL,
	[Categoria] VARCHAR(50) NOT NULL,
	[SubCategoria] VARCHAR(50) NOT NULL,
	[SubCategoriaID] NUMERIC(3) NOT NULL,
	[Cantidad_Stock] NUMERIC(10) NOT NULL,
	[Precio_Final] NUMERIC(14,2) NOT NULL,
	[Estado] [bit] NOT NULL,

    PRIMARY KEY CLUSTERED 
    (
	[Item_ID] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]

	

	CREATE TABLE [ChallengeGCBA_Zappia].[Category](
	[CategoriaID] [int] IDENTITY(1,1) NOT NULL,
	[ItemID] [int] IDENTITY(2,1) NOT NULL,
	[SubCategoria] NUMERIC(3) NOT NULL,
	[Descricpion_Categoria] VARCHAR(50) NOT NULL,
	[SubCategoriaID] [int] IDENTITY(3,1),
	[Descripcion_Sub_Categoria] VARCHAR(50) NOT NULL,
	[Fecha_Alta] DATE NOT NULL,
	[Fecha_Baja] DATE NOT NULL,
	[Estado] [bit] NOT NULL,

PRIMARY KEY CLUSTERED 
(
	[CategoriaID] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]


END CONVERSATION


    /*[SubcategoriaID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [SECONDARY]*/

BEGIN 

	CREATE TABLE [ChallengeGCBA_Zappia] [Orden](
	[OrdenID] [int] IDENTITY NOT NULL,
	[Numero_de_Orden] VARCHAR NOT NULL,
	[Fecha_Orden] DATE NOT NULL,
	[Descripcion_Orden] VARCHAR NOT NULL,
	[CompradorID] CHAR NOT NULL,
	[ItemID] VARCHAR NOT NULL,
	[SubItemID] VARCHAR NOT NULL,
	[Importe_Pagado] NUMERIC NOT NULL,
	[Estado] [bit] NOT NULL,

	)

	    
END CONVERSATION





/*************************************************************************************************************
* Programa / Procedimiento / Función / Clase / Script: ClientesDB_Recuperada.sql                             *
**************************************************************************************************************
* Descripción: ChallengeGCBA - Generación de tabla de Categorias.                                            *
* Autor      : Julián Marcelo Zappia                                                                         *
* Fecha      : 21/06/2022                                                                                    *
*************************************************************************************************************/


/* Nota técnica: se modificaron a Español los nombres sugeridos en idioma Inglés en el documento indicativo del
Challenge, debido a que varios en varios lenguajes de desarrollo, tres de ellos se consideran palabras reservadas*/


CREATE TABLE IF NOT EXISTS [clientesdb] (
	[ID]	Numeric(5),
	[RAZON_SOCI]	Character(50),
	[NOMBRE_DE]	Character(50),
	[CUIT]	Character(15),
	[FECHA_DE_A]	DateTime,
	[FECHA_DE_B]	DateTime,
	[NOMBRE_DEL]	Character(50),
	[SEXO_CONTA]	Character(1),
	[FECHA_DE_N]	DateTime,
	[DNI]	Character(10),
	[TELEFONO_1]	Character(15),
	[TELEFONO_2]	Character(15),
	[CORREO]	Character(50),
	[DOMICILIO]	Character(50),
	[DOMICILIO1]	Character(50),
	[LOCALIDAD]	Character(50),
	[C_DIGO_POS]	Character(10),
	[PROVINCIA]	Character(50),
	[PAIS]	Character(50),
	[COMPRADOR]	Boolean,
	[VENDEDOR]	Boolean,
	[ESTADO]	Boolean
	);




/*************************************************************************************************************
* Programa / Procedimiento / Función / Clase / Script: Genera dboClientes.sql                                *
**************************************************************************************************************
* Descripción: ChallengeGCBA - Generación de tabla de clientes.                                              *
* Autor      : Julián Marcelo Zappia                                                                         *
* Fecha      : 21/06/2022                                                                                    *
*************************************************************************************************************/


/* Nota técnica: se modificaron a Español los nombres sugeridos en idioma Inglés en el documento indicativo del
Challenge, debido a que varios en varios lenguajes de desarrollo, tres de ellos se consideran palabras reservadas*/


CREATE TABLE [Clientes] (
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