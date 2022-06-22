/*************************************************************************************************************
*Programa / Procedimiento / Función / Clase / Script: DataSetBase                                            *
**************************************************************************************************************
* Descripción: ChallengeGCBA - Anexo al DataSet (DER)                                                        *
* Autor      : Julián Marcelo Zappia                                                                         *
* Fecha      : 18, 19, 20/06/2022                                                                            *
*************************************************************************************************************/

using System;

namespace ChallengeGCBA_Zappia
{
    [ComponentModel.DesignerCategory, Serializable, ComponentModel.ToolboxItem, Xml.Serialization.XmlSchemaProvider]
    public class DataSetBase
    {

        private global::System.Data.SchemaSerializationMode _schemaSerializationMode = global::System.Data.SchemaSerializationMode.IncludeSchema;
        int x = this.Reset();
        global::System.Data.DataSet ds = new global::System.Data.DataSet();

        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.CodeDom.Compiler.GeneratedCodeAttribute()]
        [global::System.ComponentModel.DesignerSerializationVisibilityAttribute()]
        public new global::System.Data.DataTableCollection Tables
        {
            get
            {
                return base.Tables;
            }
        }

        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.CodeDom.Compiler.GeneratedCodeAttribute()]
        [global::System.ComponentModel.DesignerSerializationVisibilityAttribute()]
        public new global::System.Data.DataRelationCollection Relations
        {
            get
            {
                return base.Relations;
            }
        }

        public override bool Equals(object obj)
        {
            return obj is DataSet set &&
                   x == set.x &&
                   EqualityComparer<Data.DataSet>.Default.Equals(ds, set.ds);
        }

        public override int GetHashCode()
        {
            int hashCode = -1549441889;
            hashCode = hashCode * -1521134295 + x.GetHashCode();
            hashCode = hashCode * -1521134295 + EqualityComparer<Data.DataSet>.Default.GetHashCode(ds);
            return hashCode;
        }
    }
}