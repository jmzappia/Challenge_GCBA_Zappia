/*************************************************************************************************************
* Programa / Procedimiento / Función / Clase / Script: Ingreso.cs                                            *
**************************************************************************************************************
* Descripción: ChallengeGCBA - Código de inicio de la MiniApp                                                *
* Autor      : Julián Marcelo Zappia                                                                         *
* Fecha      : 18, 19, 20/06/2022                                                                            *
*************************************************************************************************************/


using ChallengeGCBA_Zappia;
using System;

namespace ChallengeGCBA
{
    public partial class Ingreso : Form
    {
        IngresoEntities db = new IngresoEntities();
        private object txtClave;
        private object usuarios;

        public Ingreso()
        {
            NewMethod();
        }

        private static void NewMethod()
        {
            InitializeComponent();
        }

        private static void InitializeComponent()
        {
            throw new NotImplementedException();
        }

        private IngresoEntities GetDb()
        {
            return db;
        }

        private void button1_Click(object sender, EventArgs e, IngresoEntities db, object usuarios)
        {
            Button1_Click(sender, e, db, usuarios, usuarios, GetUsuarios(), usuarios
);
        }

        private void Button1_Click(object sender, EventArgs e, IngresoEntities db, object usuarios1, object usuarios2, object v, object usuarios3)
        {
            throw new NotImplementedException();
        }

        private object GetUsuarios()
        {
            return usuarios;
        }
    }
}
