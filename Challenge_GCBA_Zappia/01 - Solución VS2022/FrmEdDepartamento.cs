/*************************************************************************************************************
*Programa / Procedimiento / Función / Clase / Script: FrmEdArtículo                                          *
**************************************************************************************************************
* Descripción: ChallengeGCBA - Formulario de Categorías                                                      *
* Autor      : Julián Marcelo Zappia                                                                         *
* Fecha      : 18, 19, 20/06/2022                                                                            *
*************************************************************************************************************/

using ChallengeGCBA;
using System;

namespace ChallengeGCBA_Zappia
{
    public partial class FrmEdDepartamento : Form
    {
        public SqlConnection con { get; set; }
        public int IdDepartamento { get; set; }
        public string Descripcion { get; set; }
        public bool Estado { get; set; }
        public string Modo { get; set; }
        public string Text { get; private set; }

        public FrmEdDepartamento()
        {
            InitializeComponent();
        }

        private void FrmEdDepartamento_Load(object sender, EventArgs e)
        {
            if (!Modo.Equals("C"))
            {
                txtIdDepartamento.Text = IdDepartamento.ToString();
                txtNombreDepartamento.Text = Descripcion;
                cbEstado.Checked = Estado;

                //if (cbEstado.Checked == true)
                //{
                //    Estado = true;
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
                sql = "insert into Departamento values ('";
                sql += txtNombreDepartamento.Text + "', '" + cbEstado.Checked + "')";
            }
            else
            {
                sql += "update Departamento set ";

                sql += "Descripcion = '" + txtNombreDepartamento.Text + "',";
                sql += "Estado = '" + cbEstado.Checked + "'";
                sql += " where IdDepartamento = " + txtIdDepartamento.Text;

            }

            SqlCommand cmd = new SqlCommand();
            cmd.ExecuteNonQuery();

            //object value = MessageBox.Show("Registro ha sido guardado con exito.");
            Close();

        }

        private void Close()
        {
            throw new NotImplementedException();
        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                string sql = "Delete from Departamento where IdDepartamento = '" + txtIdDepartamento.Text + "'";
                SqlCommand cmd = new SqlCommand();
                cmd.ExecuteNonQuery();

                //MessageBox.Show("Registro ha sido eliminado con exito.");
                this.Close();
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Hubo un error a eliminar, asegure que el departamento no tenga ningun empleado dependiente.");
            }

        }

        internal void ShowDialog()
        {
            throw new NotImplementedException();
        }
    }
}
