using ChallengeGCBA_Zappia;
using System;
/*************************************************************************************************************
* Proyecto: ChallengeGCBA_Zappia                                                                             *
**************************************************************************************************************
* Descripción: ChallengeGCBA - Clase de Forms                                                                *
* Autor      : Julián Marcelo Zappia                                                                         *
* Fecha      : 18/06/2022 y 19/06/2022                                                                       *
*************************************************************************************************************/


namespace ChallengeGCBA
{
    public class Form
    {

        
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        private void Button1_Click(object sender, EventArgs e, IngresoEntities db, object usuarios, object usuarios, object usuarios, object usuarios)
        {
            if (sender is null)
            {
                throw new ArgumentNullException(nameof(sender));
            }

            if (e is null)
            {
                throw new ArgumentNullException(nameof(e));
            }

            if (db is null)
            {
                throw new ArgumentNullException(nameof(db));
            }

            if (usuarios is null)
            {
                throw new ArgumentNullException(nameof(usuarios));
            }

            if (usuarios is null)
            {
                throw new ArgumentNullException(nameof(usuarios));
            }

            if (usuarios is null)
            {
                throw new ArgumentNullException(nameof(usuarios));
            }

            if (usuarios is null)
            {
                throw new ArgumentNullException(nameof(usuarios));
            }

            if (usuarios is null)
            {
                throw new ArgumentNullException(nameof(usuarios));
            }

            object usuarios = db.Usuarios;
            Usuarios usuario = (from u in usuarios
                                where u.Usuario.Equals(txtUsuario.Text) &&
                                      u.Clave.Equals(txtClave.Text)
                                select u).FirstOrDefault();

            if (usuario == null)
            {
                //MessageBox.Show("Credenciales incorrectas");
                object value = txtClave.ResetText();
            }
            else if (!usuario.Estado.Equals(1))
            {
                //MessageBox.Show("Credenciales incorrectas");
                object value = txtClave.ResetText();
            }
            else
            {
                //MessageBox.Show("Bienvenido " + txtUsuario.Text);
                MainView frm = new MainView();
                this.Hide();
                frm.ShowDialog();
                this.Close();
            }
           ;
        }


        private void FrmEdArticulo_Load(object sender, EventArgs e)
        {
            // TODO: esta línea de código carga datos en la tabla 'sistemaComprasDataSet.Marca' Puede moverla o quitarla según sea necesario.
            this.marcaTableAdapter.Fill(this.sistemaComprasDataSet.Marca);
            // TODO: esta línea de código carga datos en la tabla 'sistemaComprasDataSet.UndMedida' Puede moverla o quitarla según sea necesario.
            this.undMedidaTableAdapter.Fill(this.sistemaComprasDataSet.UndMedida);


            if (!Modo.Equals("C"))
            {

                txtIdArticulo.Enabled = Modo.Equals("C");
                txtIdArticulo.Text = IdArticulo.ToString();
                txtDescripcion.Text = Descripcion;
                cbxMarca.SelectedIndex = Marca;
                cbxMedida.SelectedIndex = Medida;
                nudExistencia.Value = Existencia;
                nudCosto.Value = Costo;
                cbEstado.Checked = Estado;
            }
    }
}