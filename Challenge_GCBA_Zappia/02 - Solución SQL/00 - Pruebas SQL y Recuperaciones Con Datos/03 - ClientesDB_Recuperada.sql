-- source file --
-- C:\Users\Usuario\Source\Repos\Challenge_GCBA_Zappia\00 - SQL Con Datos\clientesdb.DBF

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



