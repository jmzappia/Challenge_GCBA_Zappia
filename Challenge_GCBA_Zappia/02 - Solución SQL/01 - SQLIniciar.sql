
/*************************************************************************************************************
* Programa / Procedimiento / Función / Clase / Script: Iniciar.sql                                           *
**************************************************************************************************************
* Descripción: ChallengeGCBA - Generación de Base de Datos y Tablas                                         *
* Autor      : Julián Marcelo Zappia                                                                        *
* Fecha      : 18/06/2022                                                                                    *
*************************************************************************************************************/

BEGIN 

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