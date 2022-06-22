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