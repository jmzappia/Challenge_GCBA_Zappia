/*************************************************************************************************************
* Programa / Procedimiento / Función / Clase / Script: FrmEdArtículo                                         *
**************************************************************************************************************
* Descripción: ChallengeGCBA - Formulario de Ordenes (Clase)                                                 *
* Autor      : Julián Marcelo Zappia                                                                         *
* Fecha      : 18, 19, 20/06/2022                                                                            *
*************************************************************************************************************/

using ChallengeGCBA;
using System;

namespace ChallengeGCBA_Zappia
{

    public partial class frmEdSolicitud : Form
    {
        public int EstadoValue;
        public SqlConnection con { get; set; }
        public int IdSolicitud { get; set; }
        public int Empleado { get; set; }
        public string Fecha { get; set; }
        public int Articulo { get; set; }
        public int Cantidad { get; set; }
        public int Medida { get; set; }
        public int Estado { get; set; }
        public string Modo { get; set; }
        public string Text { get; private set; }

        public frmEdSolicitud()
        {
            InitializeComponent();
        }

        private void frmEdSolicitud_Load(object sender, EventArgs e)
        {
            // TODO: esta línea de código carga datos en la tabla 'sistemaComprasDataSet.UndMedida' Puede moverla o quitarla según sea necesario.
            this.undMedidaTableAdapter.Fill(this.sistemaComprasDataSet.UndMedida);
            // TODO: esta línea de código carga datos en la tabla 'sistemaComprasDataSet.Articulo' Puede moverla o quitarla según sea necesario.
            this.articuloTableAdapter.Fill(this.sistemaComprasDataSet.Articulo);
            // TODO: esta línea de código carga datos en la tabla 'sistemaComprasDataSet.Empleado' Puede moverla o quitarla según sea necesario.
            this.empleadoTableAdapter.Fill(this.sistemaComprasDataSet.Empleado);
            // TODO: esta línea de código carga datos en la tabla 'sistemaComprasDataSet.Solicitud' Puede moverla o quitarla según sea necesario.
            this.solicitudTableAdapter.Fill(this.sistemaComprasDataSet.Solicitud);

            if (!Modo.Equals("C"))
            {

                txtIdSolicitud.Text = IdSolicitud.ToString();
                cbxEmpleado.SelectedIndex = Empleado;
                dtpSolicitud.Text = Fecha;
                cbxArticulo.SelectedIndex = Articulo;
                nudCantidad.Value = Cantidad;
                cbxMedida.SelectedIndex = Medida;

                if (cbEstado.Checked)
                {

                    EstadoValue = 1;
                }
                else
                {
                    EstadoValue = 2;
                }

                EstadoValue = Estado;



                this.Text += " : Editando";
            }

        }

        //private void realizarOrden()
        //{
        //    string sql = "";



        //    SqlCommand cmd = new SqlCommand(sql, con);
        //    cmd.ExecuteNonQuery();
        //}

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            string sql = "";

            if (Modo.Equals("C"))
            {
                if (cbEstado.Checked)
                {
                    EstadoValue = 1;
                }
                else
                {
                    EstadoValue = 2;
                }
                sql = "insert into Solicitud values ('";
                sql += cbxEmpleado.SelectedValue + "', '" + this.dtpSolicitud.Text + "','";
                sql += cbxArticulo.SelectedValue + "', '" + Convert.ToInt32(nudCantidad.Value) + "', '"
                    + cbxMedida.SelectedValue + "', '" + EstadoValue + "');";
                sql += "insert into Orden (Solicitud, Fecha, Estado, Articulo, Cantidad, Medida, Marca, Costo)  ";
                sql += "SELECT s.IdSolicitud, s.Fecha, CAST(CASE s.Estado WHEN 1 THEN 1 ELSE 0 END AS BIT) as Estado, s.Articulo, s.Cantidad, s.Medida, a.Marca, a.Costo ";
                sql += "FROM Solicitud s INNER JOIN Articulo a on a.IdArticulo = s.Articulo WHERE s.Estado = 1 and s.IdSolicitud = (select max(d.IdSolicitud) from Solicitud d); ";


                //if (cbEstado.Checked)
                //{
                //    realizarOrden();
                //}
            }
            else
            {
                if (cbEstado.Checked)
                {
                    EstadoValue = 1;
                }
                else
                {
                    EstadoValue = 2;
                }

                sql += "update Solicitud set ";

                sql += "Empleado = '" + cbxEmpleado.SelectedValue + "',";
                sql += "Fecha = '" + this.dtpSolicitud.Text + "',";
                sql += "Articulo = '" + cbxArticulo.SelectedValue + "',";
                sql += "Cantidad = '" + Convert.ToInt32(nudCantidad.Value) + "',";
                sql += "Medida = '" + cbxMedida.SelectedValue + "',";
                sql += "Estado = '" + EstadoValue + "'";
                sql += " where IdSolicitud = " + txtIdSolicitud.Text + ";";
                sql += "insert into Orden (Solicitud, Fecha, Estado, Articulo, Cantidad, Medida, Marca, Costo)  ";
                sql += "SELECT s.IdSolicitud, s.Fecha, CAST(CASE s.Estado WHEN 1 THEN 1 ELSE 0 END AS BIT) as Estado, s.Articulo, s.Cantidad, s.Medida, a.Marca, a.Costo ";
                sql += "FROM Solicitud s INNER JOIN Articulo a on a.IdArticulo = s.Articulo WHERE s.Estado = 1 and s.IdSolicitud = (select max(d.IdSolicitud) from Solicitud d); ";
                //if (cbEstado.Checked)
                //{
                //    realizarOrden();
                //}

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
                string sql = "Delete from Solicitud where IdSolicitud = " + txtIdSolicitud.Text;
                SqlCommand cmd = new SqlCommand();
                cmd.ExecuteNonQuery();

                //MessageBox.Show("Registro ha sido eliminado con exito.");
                this.Close();
            }
            catch (Exception ex)

            {
                //MessageBox.Show("Hubo un error a eliminar, asegure que el empleado no sea parte de una orden.");
            }

        }

        internal void ShowDialog()
        {
            throw new NotImplementedException();
        }
    }
}
