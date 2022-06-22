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