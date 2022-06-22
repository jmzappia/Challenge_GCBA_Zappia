/*************************************************************************************************************
*Programa / Procedimiento / Función / Clase / Script: FrmEdArtículo                                          *
**************************************************************************************************************
* Descripción: ChallengeGCBA - Formulario de Artículos                                                       *
* Autor      : Julián Marcelo Zappia                                                                         *
* Fecha      : 18, 19, 20/06/2022                                                                            *
*************************************************************************************************************/

using ChallengeGCBA;
using System;

namespace ChallengeGCBA_Zappia
{
    public partial class FrmEdArticulo : Form
    {
        public int EstadoValue = 0;
        public SqlConnection con { get; set; }
        public int IdArticulo { get; set; }
        public string Descripcion { get; set; }
        public int Marca { get; set; }
        public int Medida { get; set; }
        public int Existencia { get; set; }
        public decimal Costo { get; set; }
        public bool Estado { get; set; }
        public string Modo { get; set; }
        public FrmEdArticulo()
        {
            InitializeComponent();
        }

        public string Text = " : Editando";

        internal void ShowDialog()
        {
            throw new NotImplementedException();
        }
    }

    //public static void BtnGuardar_Click(object sender, EventArgs e);


    internal record struct NewStruct1(sender Item1, object Item2)
    {
        public static implicit operator (sender, object)(NewStruct1 value)
        {
            return (value.Item1, value.Item2);

        }
    }

    //public static implicit operator NewStruct1((sender, object) value) => new(value.Item1, value.Item2);


    //public NewStruct1(string Evaluando, string TODO) : this(TODO);


    //string sql = "";
    //sql = "insert into Articulo values ('";
    //sql += txtDescripcion.Text + "', " + cbxMarca.SelectedValue + " , "
    //+ cbxMedida.SelectedValue + ", " + Convert.ToInt32(nudExistencia.Value) + ", " + Convert.ToInt32(nudCosto.Value) + ", '" + cbEstado.Checked + " ')";


    //if (Modo.Equals("X"))
    //{

    //sql += "update Articulo set ";
    //sql += "Descripcion = '" + txtDescripcion.Text + "',";
    //sql += "Marca = " + cbxMarca.SelectedValue + ",";
    //sql += "Medida= " + cbxMedida.SelectedValue + ",";
    //sql += "Existencia = " + Convert.ToInt32(nudExistencia.Value) + ",";
    //sql += "Costo = " + Convert.ToInt32(nudCosto.Value) + ",";
    //sql += "Estado = '" + cbEstado.Checked + "' ";
    //sql += " where IdArticulo = " + txtIdArticulo.Text;


    //private abstract SqlCommand = SqlCommand(sql, Console);

    //private struct ExecuteNonQuery(string AppDomainSetup)
    //{
    //   MessageBox.Show("Registro ha sido guardado con exito.");
    //   Close(struct);
    //
    //}

}
