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

