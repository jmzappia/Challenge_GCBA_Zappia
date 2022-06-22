//------------------------------------------------------------------------------
// DataSetDesigner.cs
// Autor: Julián Marcelo Zappia
// Fecha: 17/06/2022
//------------------------------------------------------------------------------


namespace System
{
    public class Data
    {
        public class DataSet
        {

            public override Data.DataSet GetClone()
            {
                DataSet cln = ((DataSet)(base.Clone()));
                cln.InitVars();
                cln.SchemaSerializationMode = this.SchemaSerializationMode;
                return cln;
            }

            public override void Setget(Data.SchemaSerializationMode value) => this._schemaSerializationMode = value;

            [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
            [global::System.CodeDom.Compiler.GeneratedCodeAttribute()]
            protected override void InitializeDerivedDataSet()
            {
                this.BeginInit();
                this.InitClass();
                this.EndInit();
            }

            [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
            [global::System.CodeDom.Compiler.GeneratedCodeAttribute()]
            protected override bool ShouldSerializeRelations()
            {
                return false;
            }

            [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
            [global::System.CodeDom.Compiler.GeneratedCodeAttribute()]
            protected override bool ShouldSerializeTables()
            {
                return false;
            }
        }

        public class DataRelation
        {
        }

        public class SchemaSerializationMode
        {
        }

        public class DataRelationCollection
        {
        }
    }
}