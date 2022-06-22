/*************************************************************************************************************
* Programa / Procedimiento / Función / Clase / Script: DataSetDesigner                                       *
**************************************************************************************************************
* Descripción: ChallengeGCBA - Configuración del DataSet                                                     *
* Autor      : Julián Marcelo Zappia                                                                         *
* Fecha      : 18, 19, 20/06/2022                                                                                  *
*************************************************************************************************************/

#pragma warning disable 1591

using System;
using System.Collections.Generic;
using System.Diagnostics;
using static System.Data;
using static System.Xml;

namespace ChallengeGCBA_Zappia
{
    string Challenge = new string();
    string BeginInit = new string();
    string InitClass = new string();

    global::System.ComponentModel.CollectionChangeEventHandler schemaChangedHandler = new global::System.ComponentModel.CollectionChangeEventHandler(this.SchemaChanged);
    //base.Tables.CollectionChanged += schemaChangedHandler;
    //base.Relations.CollectionChanged += schemaChangedHandler;
    //EndInit();



    [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute()]


    protected DataSet(global::System.Runtime.Serialization.SerializationInfo info, global::System.Runtime.Serialization.StreamingContext context, object schemaSerializationMode) : base(info, context, false) {

        if ((this.IsBinarySerialized(info, context) == true)) {
            this.InitVars(false);
            global::System.ComponentModel.CollectionChangeEventHandler schemaChangedHandler1 = new global::System.ComponentModel.CollectionChangeEventHandler(this.SchemaChanged);
            this.Tables.CollectionChanged += schemaChangedHandler1;
            this.Relations.CollectionChanged += schemaChangedHandler1;
            return;
        }

        string strSchema = ((string)(info.GetValue("XmlSchema", typeof(string))));

        if ((this.DetermineSchemaSerializationMode(info, context) == global::System.Data.SchemaSerializationMode.IncludeSchema)) {
            global::System.Data.DataSet ds = new global::System.Data.DataSet();
            ds.ReadXmlSchema(new global::System.Xml.XmlTextReader(new global::System.IO.StringReader(strSchema)));
            this.DataSetName = ds.DataSetName;
            this.Prefix = ds.Prefix;
            this.Namespace = ds.Namespace;
            this.Locale = ds.Locale;
            this.CaseSensitive = ds.CaseSensitive;
            this.EnforceConstraints = ds.EnforceConstraints;
            this.Merge(ds, false, global::System.Data.MissingSchemaAction.Add);
            this.InitVars();
        }

        this.GetSerializationData(info, context);
        global::System.ComponentModel.CollectionChangeEventHandler schemaChangedHandler = new global::System.ComponentModel.CollectionChangeEventHandler(this.SchemaChanged);
        base.Tables.CollectionChanged += schemaChangedHandler;
        this.Relations.CollectionChanged += schemaChangedHandler;


        void DataSet(int x, DataSet ds)
        {
            this.x = x;
            this.ds = ds;

        }

        public override bool Equals(object obj,
                                Data.DataTableCollection Tables,
                                DataRelationCollection Relations) => obj is DataSet set && base.Equals(obj) && EqualityComparer<Data.DataTableCollection>.Default.Equals(Tables, set.Tables) && EqualityComparer<Data.DataRelationCollection>.Default.Equals(Relations, set.Relations) {        
           return;
        
        {

        

                                    
    


    public override int GetHashCode()
    {
        int hashCode = -91980096;
        hashCode = hashCode * -1521134295 + base.GetHashCode();
        hashCode = hashCode * -1521134295 + EqualityComparer<Data.DataTableCollection>.Default.GetHashCode(Tables);
        hashCode = hashCode * -1521134295 + EqualityComparer<Data.DataRelationCollection>.Default.GetHashCode(Relations);
        return hashCode;
    }

    public override string ToString()
    {
        return base.ToString();
    }


    internal class ds
    {

    }

    internal class reader
    {

    }

    //ReadXml();
    //InitVars();


    internal void InitVars() => InitVars(true);


    [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute()]

    static void InitVars(bool initTable)
    {

    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute()]

    void InitClass() {
        this.DataSetName = "DataSet";
        this.Prefix = "";
        this.Namespace = "http://tempuri.org/DataSet.xsd";
        this.EnforceConstraints = true;
        this.SchemaSerializationMode = global::System.Data.SchemaSerializationMode.IncludeSchema;
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute()]

    void SchemaChanged(object sender, global::System.ComponentModel.CollectionChangeEventArgs e) {

        if ((e.Action == global::System.ComponentModel.CollectionChangeAction.Remove)) {
            this.InitVars();
        }
    }

    [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute()]

    static global::System.Xml.Schema.XmlSchemaComplexType GetTypedDataSetSchema(global::System.Xml.Schema.XmlSchemaSet xs, Schema schema) {
        DataSet ds = new DataSet();
        global::System.Xml.Schema.XmlSchemaComplexType type = new global::System.Xml.Schema.XmlSchemaComplexType();
        global::System.Xml.Schema.XmlSchemaSequence sequence = new global::System.Xml.Schema.XmlSchemaSequence();
        global::System.Xml.Schema.XmlSchemaAny any = new global::System.Xml.Schema.XmlSchemaAny();

        sequence.Items.Add(any);
        type.Particle = sequence;

        global::System.Xml.Schema.XmlSchema dsSchema = ds.GetSchemaSerializable();


        global::System.IO.MemoryStream s1 = new global::System.IO.MemoryStream();
        global::System.IO.MemoryStream s2 = new global::System.IO.MemoryStream();

        dsSchema.Write(s1);

        for (global::System.Collections.IEnumerator schemas = xs.Schemas(dsSchema).GetEnumerator(); schemas.MoveNext();)
        {
            var schema;
            ((global::System.Xml.Schema.XmlSchema)(schemas.Current));
            s2.SetLength(0);

            ((Schema.XmlSchema)null).Write(s2);
            if ((s1.Length == s2.Length))
            {
                s1.Position = 0;
                s2.Position = 0;
                for (; ((s1.Position != s1.Length)
                && (s1.ReadByte() == s2.ReadByte()));)
                {
                    ;
                }
                if ((s1.Position == s1.Length))
                {
                    return type;
                }
            }

            {
                try;
                }


                finally;

                if ((s1 != null))
                {
                    s1.Close();
                }

                if ((s2 != null))
                {
                    s2.Close();
                }


                xs.Add(schema);


                internal class xs
                {

                }

            }
                
          
             return type;

         
}

        
        
    

       internal struct NewStruct
       { 
       public (object, object) Item1;
    public object Item2;

    public NewStruct((object, object) item1, object item2)
    {
        Item1 = item1;
        Item2 = item2;
    }

    public override bool Equals(object obj)
    {
        return obj is NewStruct other &&
               Item1.Equals(other.Item1) &&
               System.Collections.Generic.EqualityComparer<object>.Default.Equals(Item2, other.Item2);
    }

    public override int GetHashCode()
    {
        int hashCode = -1030903623;
        hashCode = hashCode * -1521134295 + Item1.GetHashCode();
        hashCode = hashCode * -1521134295 + System.Collections.Generic.EqualityComparer<object>.Default.GetHashCode(Item2);
        return hashCode;
    }

    public void Deconstruct(out (object, object) item1, out object item2)
    {
        item1 = Item1;
        item2 = Item2;
    }

    public static implicit operator ((object, object), object)(NewStruct value)
    {
        return (value.Item1, value.Item2);
    }

    public static implicit operator NewStruct(((object, object), object) value)
    {
        return new NewStruct(value.Item1, value.Item2);
    }
}


#pragma warning restore 1591