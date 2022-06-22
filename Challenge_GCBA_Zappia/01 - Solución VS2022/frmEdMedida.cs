/*************************************************************************************************************
* Programa / Procedimiento / Función / Clase / Script: FrmEdArtículo                                         *
**************************************************************************************************************
* Descripción: ChallengeGCBA - Formulario de Artículos (Clase Medidas)                                       *
* Autor      : Julián Marcelo Zappia                                                                         *
* Fecha      : 18, 19, 20/06/2022                                                                            *
*************************************************************************************************************/

using ChallengeGCBA;
using System;

namespace ChallengeGCBA_Zappia
{
    public partial class frmEdMedida : Form
    {
        public int estadoValue = 0;
        public SqlConnection con { get; set; }
        public int IdUndMedida { get; set; }
        public string Descripcion { get; set; }
        public bool Estado { get; set; }
        public string Modo { get; set; }
        public string Text { get; private set; }

        public frmEdMedida()
        {
            InitializeComponent();
        }

        private void frmEdMedida_Load(object sender, EventArgs e)
        {
            if (!Modo.Equals("C"))
            {
                txtIdMedida.Text = IdUndMedida.ToString();
                txtNombreMedida.Text = Descripcion;
                cbEstado.Checked = Estado;

                //if (cbEstado.Checked == true)
                //{
                //    Estado = true;
                //    estadoValue = 1;
                //}
                //else
                //{
                //    Estado = false;
                //}

                this.Text += " : Editando";
            }
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            string sql = "";
            if (Modo.Equals("C"))
            {
                sql = "insert into UndMedida values ('";
                sql += txtNombreMedida.Text + "', '" + cbEstado.Checked + "')";
            }
            else
            {
                sql += "update UndMedida set ";

                sql += "Descripcion = '" + txtNombreMedida.Text + "',";
                sql += "Estado = '" + cbEstado.Checked + "' ";
                sql += "where IdUndMedida = '" + txtIdMedida.Text + "'";

            }

            SqlCommand cmd = new SqlCommand();
            cmd.ExecuteNonQuery();

            //MessageBox.Show("Registro ha sido guardado con exito.");
            this.Close();
        }

        private void Close()
        {
            throw new NotImplementedException();
        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                string sql = "Delete from UndMedida where IdUndMedida = '" + txtIdMedida.Text + "'";
                SqlCommand cmd = new SqlCommand();
                cmd.ExecuteNonQuery();

                //MessageBox.Show("Registro ha sido eliminado con exito.");
                this.Close();
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Hubo un error a eliminar, asegure que la unidad de medida no este en uso.");
            }

        }

        internal void ShowDialog()
        {
            throw new NotImplementedException();
        }
    }
}
