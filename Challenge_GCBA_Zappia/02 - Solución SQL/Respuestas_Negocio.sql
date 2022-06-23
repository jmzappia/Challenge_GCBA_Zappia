
/*************************************************************************************************************
* Programa / Procedimiento / Función / Clase / Script: Iniciar.sql                                           *
**************************************************************************************************************
* Descripción: ChallengeGCBA - Generación de Base de Datos y Tablas                                         *
* Autor      : Julián Marcelo Zappia                                                                        *
* Fecha      : 18/06/2022                                                                                    *
*************************************************************************************************************/

BEGIN 



/*************************************************************************************************************
* Programa / Procedimiento / Función / Clase / Script: Consulta_Prueba.sql                                   *
**************************************************************************************************************
* Descripción: ChallengeGCBA - Prueba de consulta (Fallida. No se pueden importar los datos).                *
* Autor      : Julián Marcelo Zappia                                                                         *
* Fecha      : 21/06/2022                                                                                    *
*************************************************************************************************************/


/* Nota técnica: se modificaron a Español los nombres sugeridos en idioma Inglés en el documento indicativo del
Challenge, debido a que varios en varios lenguajes de desarrollo, tres de ellos se consideran palabras reservadas
CORRUPCION DE ARCHIVOS DE ORIGEN Y DESTINO*/

BULK 

INSERT dbo.Clientes

FROM
'C:\Users\Usuario\Source\Repos\Challenge_GCBA_Zappia\SQL\ClientesOk.csv';

/*WITH (
    FIELDTERMINATOR= ',',
    ROWTERMINATOR = '\n' 

);*/

GO;
SELECT * FROM dbo.Clientes;
GO;





/*************************************************************************************************************
* Programa / Procedimiento / Función / Clase / Script: SQLQuery1.sql                                         *
**************************************************************************************************************
* Descripción: ChallengeGCBA - Prueba de importación de datos.                                               *
* Autor      : Julián Marcelo Zappia                                                                         *
* Fecha      : 21/06/2022                                                                                    *
*************************************************************************************************************/


/* Nota técnica: se modificaron a Español los nombres sugeridos en idioma Inglés en el documento indicativo del
Challenge, debido a que varios en varios lenguajes de desarrollo, tres de ellos se consideran palabras reservadas*/


USE [master]
GO

BULK INSERT Clientes
FROM 'C:\Users\Usuario\Source\Repos\Challenge_GCBA_Zappia\02 - Solución SQL\clientes.xls'
WITH
(
    FIRSTROW = 2, 
    FIELDTERMINATOR = '',  
    ROWTERMINATOR = '',   
    TABLOCK
)

GO




/*************************************************************************************************************
* Programa / Procedimiento / Función / Clase / Script: Genera SQLQuery2.sql                                  *
**************************************************************************************************************
* Descripción: ChallengeGCBA - Prueba de importación de datos desde Access (fallido).                        *
* Autor      : Julián Marcelo Zappia                                                                         *
* Fecha      : 21/06/2022                                                                                    *
*************************************************************************************************************/


/* Nota técnica: se modificaron a Español los nombres sugeridos en idioma Inglés en el documento indicativo del
Challenge, debido a que varios en varios lenguajes de desarrollo, tres de ellos se consideran palabras reservadas*/


USE [master]
GO

BULK INSERT Clientes
FROM 'C:\Users\Usuario\Source\Repos\Challenge_GCBA_Zappia\02 - Solución SQL\clientes.aaccdb
'
WITH
(
    FIRSTROW = 2, 
    FIELDTERMINATOR = '',  
    ROWTERMINATOR = '',   
    TABLOCK
)

GO




/*************************************************************************************************************
* Programa / Procedimiento / Función / Clase / Script: SQLQuery4.sql                                         *
**************************************************************************************************************
* Descripción: ChallengeGCBA - Inserción de registros de archivo CSV.                                        *
* Autor      : Julián Marcelo Zappia                                                                         *
* Fecha      : 21/06/2022                                                                                    *
*************************************************************************************************************/


/* Nota técnica: se modificaron a Español los nombres sugeridos en idioma Inglés en el documento indicativo del
Challenge, debido a que varios en varios lenguajes de desarrollo, tres de ellos se consideran palabras reservadas*/


USE master;
GO

--region PROCEDURE dbo.usp_Clientes_Insert
IF OBJECT_ID('dbo.usp_Clientes_Insert') IS NOT NULL
BEGIN 
    DROP PROC dbo.usp_Clientes_Insert
END 
GO
CREATE PROC dbo.usp_Clientes_Insert
    @CODIGO_ID numeric(5),
    @RAZON_SOCIAL char(50),
    @NOMBRE_FANTASIA char(50),
    @CUIT char(15),
    @FECHA_ALTA datetime,
    @FECHA_BAJA datetime,
    @NOMBRE_CONTACTO char(50),
    @SEXO_CONTACTO char(1),
    @FECHA_NAC_CONTACTO datetime,
    @DNI char(10),
    @TELEFONO_1 char(15),
    @TELEFONO_2 char(15),
    @CORREO_ELECTRONICO char(50),
    @DOMICILIO_CALLE char(50),
    @DOMICILIO_NUMERO char(50),
    @DOMICILIO_LOCALIDAD char(50),
    @DOMICILIO_CODPOSTAL char(10),
    @DOMICILIO_PROVINCIA char(50),
    @DOMICILIO_PAIS char(50),
    @COMPRADOR bit,
    @VENDEDOR bit,
    @ESTADO bit
AS 
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

    INSERT INTO dbo.Clientes (CODIGO_ID, RAZON_SOCIAL, NOMBRE_FANTASIA, CUIT, FECHA_ALTA, FECHA_BAJA, 
                              NOMBRE_CONTACTO, SEXO_CONTACTO, FECHA_NAC_CONTACTO, DNI, TELEFONO_1, TELEFONO_2, 
                              CORREO_ELECTRONICO, DOMICILIO_CALLE, DOMICILIO_NUMERO, DOMICILIO_LOCALIDAD, 
                              DOMICILIO_CODPOSTAL, DOMICILIO_PROVINCIA, DOMICILIO_PAIS, COMPRADOR, VENDEDOR, 
                              ESTADO)
    SELECT @CODIGO_ID, @RAZON_SOCIAL, @NOMBRE_FANTASIA, @CUIT, @FECHA_ALTA, @FECHA_BAJA, @NOMBRE_CONTACTO, 
           @SEXO_CONTACTO, @FECHA_NAC_CONTACTO, @DNI, @TELEFONO_1, @TELEFONO_2, @CORREO_ELECTRONICO, 
           @DOMICILIO_CALLE, @DOMICILIO_NUMERO, @DOMICILIO_LOCALIDAD, @DOMICILIO_CODPOSTAL, @DOMICILIO_PROVINCIA, 
           @DOMICILIO_PAIS, @COMPRADOR, @VENDEDOR, @ESTADO

    /*
   
    SELECT CODIGO_ID, RAZON_SOCIAL, NOMBRE_FANTASIA, CUIT, FECHA_ALTA, FECHA_BAJA, NOMBRE_CONTACTO, 
           SEXO_CONTACTO, FECHA_NAC_CONTACTO, DNI, TELEFONO_1, TELEFONO_2, CORREO_ELECTRONICO, DOMICILIO_CALLE, 
           DOMICILIO_NUMERO, DOMICILIO_LOCALIDAD, DOMICILIO_CODPOSTAL, DOMICILIO_PROVINCIA, DOMICILIO_PAIS, 
           COMPRADOR, VENDEDOR, ESTADO
    FROM   dbo.Clientes
    WHERE  CODIGO_ID = @CODIGO_ID AND RAZON_SOCIAL = @RAZON_SOCIAL AND NOMBRE_FANTASIA = @NOMBRE_FANTASIA AND 
           CUIT = @CUIT AND FECHA_ALTA = @FECHA_ALTA AND FECHA_BAJA = @FECHA_BAJA AND NOMBRE_CONTACTO = @NOMBRE_CONTACTO AND 
           SEXO_CONTACTO = @SEXO_CONTACTO AND FECHA_NAC_CONTACTO = @FECHA_NAC_CONTACTO AND DNI = @DNI AND 
           TELEFONO_1 = @TELEFONO_1 AND TELEFONO_2 = @TELEFONO_2 AND CORREO_ELECTRONICO = @CORREO_ELECTRONICO AND 
           DOMICILIO_CALLE = @DOMICILIO_CALLE AND DOMICILIO_NUMERO = @DOMICILIO_NUMERO AND DOMICILIO_LOCALIDAD = @DOMICILIO_LOCALIDAD AND 
           DOMICILIO_CODPOSTAL = @DOMICILIO_CODPOSTAL AND DOMICILIO_PROVINCIA = @DOMICILIO_PROVINCIA AND 
           DOMICILIO_PAIS = @DOMICILIO_PAIS AND COMPRADOR = @COMPRADOR AND VENDEDOR = @VENDEDOR AND 
           ESTADO = @ESTADO

    
    */
    COMMIT
GO
--endregion





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





/*************************************************************************************************************
* Programa / Procedimiento / Función / Clase / Script: Total_Registro_Ventas_Mensuales.sql                   *
**************************************************************************************************************
* Descripción: ChallengeGCBA - Consulta de Ordenes que coinciden con la fecha actual.                        *
* Autor      : Julián Marcelo Zappia                                                                         *
* Fecha      : 21/06/2022                                                                                    *
*************************************************************************************************************/


/* Nota técnica: se modificaron a Español los nombres sugeridos en idioma Inglés en el documento indicativo del
Challenge, debido a que varios en varios lenguajes de desarrollo, tres de ellos se consideran palabras reservadas*/


SELECT Ordenes.ORDEN_ID AS Id, Ordenes.NUMERO_ORDEN AS Número, 
       Ordenes.DESCRIPCION_ORDEN AS Descripción,
       Ordenes.FECHA_ORDEN AS Fecha, Ordenes.CLIENTE_ID_VENTA AS IdCliente, 
	   Ordenes.IMPORTE_TOTAL AS ImporteTotal
FROM Ordenes  
WHERE Ordenes.FECHA_ORDEN = GETDATE()  

GO





/*************************************************************************************************************
* Programa / Procedimiento / Función / Clase / Script: Cantidad_Productos_Vendida.sql                        *
**************************************************************************************************************
* Descripción: ChallengeGCBA - Calcula la cantidad de ventas en la fecha actual.                             *
* Autor      : Julián Marcelo Zappia                                                                         *
* Fecha      : 21/06/2022                                                                                    *
*************************************************************************************************************/


/* Nota técnica: se modificaron a Español los nombres sugeridos en idioma Inglés en el documento indicativo del
Challenge, debido a que varios en varios lenguajes de desarrollo, tres de ellos se consideran palabras reservadas*/


SELECT * FROM Ordenes AS RegistroCompleto
WHERE (Ordenes.FECHA_ORDEN = (GETDATE()) AND (COUNT(Ordenes.CANTIDAD) > 0));

GO





/*************************************************************************************************************
* Programa / Procedimiento / Función / Clase / Script: Suma_Importe_Total_Enero_2022.sql                     *
**************************************************************************************************************
* Descripción: ChallengeGCBA - Genera consulta de suma de importes de ventas Enero 2022.                     *
* Autor      : Julián Marcelo Zappia                                                                         *
* Fecha      : 21/06/2022                                                                                    *
*************************************************************************************************************/


select sum(Ordenes.IMPORTE_TOTAL)
  from Ordenes
  WHERE (MONTH(Ordenes.FECHA_ORDEN) = 2) AND (YEAR(Ordenes.FECHA_ORDEN) = 2022)
GO







/*************************************************************************************************************
* Programa / Procedimiento / Función / Clase / Script: Enero_2022_Todo_JUnto.sql                             *
**************************************************************************************************************
* Descripción: ChallengeGCBA - Agrupación de consultas anteriores con condicional de Mes Enero Año 2022.     *
* Autor      : Julián Marcelo Zappia                                                                         *
* Fecha      : 21/06/2022                                                                                    *
*************************************************************************************************************/


SELECT Ordenes.*, COUNT(*), sum(Ordenes.IMPORTE_TOTAL) 
FROM Ordenes  
WHERE (MONTH(Ordenes.FECHA_ORDEN) = 1) AND (YEAR(Ordenes.FECHA_ORDEN) = 2022)
GROUP BY Ordenes.ORDEN_ID, Ordenes.NUMERO_ORDEN, Ordenes.DESCRIPCION_ORDEN;
GO






/*************************************************************************************************************
* Programa / Procedimiento / Función / Clase / Script: Categoria_Celulares.sql                              *
**************************************************************************************************************
* Descripción: ChallengeGCBA - Genera consulta de ventas TOP 5 de ventas de Celulares.                       *
* Autor      : Julián Marcelo Zappia                                                                         *
* Fecha      : 21/06/2022                                                                                    *
*************************************************************************************************************/


SELECT TOP 5 *, COUNT(Ordenes.CANTIDAD), SUM(Ordenes.IMPORTE_TOTAL),
                Ordenes.CLIENTE_ID_VENTA AS Cliente, Clientes.RAZON_SOCIAL AS Razón_Social, 
                Clientes.NOMBRE_CONTACTO AS Persona_Responsable, 
				Ordenes.FECHA_ORDEN AS Fecha, Ordenes.CANTIDAD AS Cantidad_Vendida,
				Ordenes.IMPORTE_TOTAL

WHERE ((YEAR(Ordenes.FECHA_ORDEN) = 2022) AND (Ordenes.CATEGORIA_ID = "Celulares"));
FROM Ordenes
GO






/*************************************************************************************************************
* Programa / Procedimiento / Función / Clase / Script: Top10_Productos_Mas_Vendidos.sql                      *
**************************************************************************************************************
* Descripción: ChallengeGCBA - Genera consulta TOP 10 de Artículos más vendidos      .                       *
* Autor      : Julián Marcelo Zappia                                                                         *
* Fecha      : 21/06/2022                                                                                    *
*************************************************************************************************************/



SELECT TOP 10 *, MAX(Ordenes.CANTIDAD), 
                Ordenes.CLIENTE_ID_VENTA AS Cliente, Clientes.RAZON_SOCIAL AS Razón_Social, 
                Clientes.NOMBRE_CONTACTO AS Persona_Responsable, 
				Ordenes.FECHA_ORDEN AS Fecha, Ordenes.CANTIDAD AS Cantidad_Vendida,
				Ordenes.IMPORTE_TOTAL

WHERE ((MONTH(Ordenes.FECHA_ORDEN) = 4) AND (MONTH(Ordenes.FECHA_ORDEN) AND (YEAR(Ordenes.FECHA_ORDEN) = 2022) AND MAX(Ordenes.CANTIDAD) < MIN(Ordenes.CANTIDAD)) 
FROM Ordenes
GO





/*************************************************************************************************************
* Programa / Procedimiento / Función / Clase / Script: StoredProcedure_Importe_Categoría.sql                 *
**************************************************************************************************************
* Descripción: ChallengeGCBA - Stores Procedure de Actualización de Precio de Items.                         *
* Autor      : Julián Marcelo Zappia                                                                         *
* Fecha      : 21/06/2022                                                                                    *
*************************************************************************************************************/

/* Nota técnica: se intentó crear el archivo en carpeta de Stores Procedures con las acciones de trabajo
pero no se logró. El software no creo en la carpeta correspondiente, sino en la solución*/


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION Precios.Actualizados(Items.ITEM_ID, Items.PRECIO_FINAL) 
    
	DECLARE @Param1
	DECLARE @Param2

	@Param1 = Items.ITEM_ID;
	@Param2 = Items.PRECIO_FINAL;

AS
BEGIN

	SET NOCOUNT ON;
	SELECT * FROM Items
	WHERE Item.ITEM_ID = @Param1
	
	IF Items.ESTADO = TRUE
	    UPDATE Items
	    SET Items.PRECIO_FINAL = @Param2
	END
END
GO

/* No sé si funciona. Me faltan datos en tablas para testearlo.*/
