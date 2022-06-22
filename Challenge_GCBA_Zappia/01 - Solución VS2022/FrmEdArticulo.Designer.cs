/*************************************************************************************************************
*Programa / Procedimiento / Función / Clase / Script: FrmEdArtículo                                          *
**************************************************************************************************************
* Descripción: ChallengeGCBA - Formulario de Artículos Clase                                                 *
* Autor      : Julián Marcelo Zappia                                                                         *
* Fecha      : 18, 19, 20/06/2022                                                                            *
*************************************************************************************************************/

using System;

namespace ChallengeGCBA_Zappia
{
    partial class FrmEdArticulo
    {
        
        private System.ComponentModel.IContainer components = null;

        private System.Windows.Forms.Button btnEliminar;
        private System.Windows.Forms.Button btnGuardar;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.CheckBox cbEstado;
        private System.Windows.Forms.TextBox txtDescripcion;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.NumericUpDown nudExistencia;
        private System.Windows.Forms.TextBox txtIdArticulo;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.ComboBox cbxMarca;
        private System.Windows.Forms.ComboBox cbxMedida;
        private System.Windows.Forms.BindingSource sistemaComprasDataSetBindingSource;
        private ChallengeGCBADataSet sistemaComprasDataSet;
        private System.Windows.Forms.BindingSource undMedidaBindingSource;
        private SistemaComprasDataSetTableAdapters.UndMedidaTableAdapter undMedidaTableAdapter;
        private System.Windows.Forms.BindingSource undMedidaBindingSource1;
        private System.Windows.Forms.BindingSource sistemaComprasDataSetBindingSource1;
        private System.Windows.Forms.BindingSource marcaBindingSource;
        private SistemaComprasDataSetTableAdapters.MarcaTableAdapter marcaTableAdapter;
        private System.Windows.Forms.NumericUpDown nudCosto;
        private System.Windows.Forms.Label label8;

        public System.Windows.Forms.Button BtnEliminar { get => btnEliminar; set => btnEliminar = value; }
    }
}