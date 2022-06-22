/*************************************************************************************************************
* Programa / Procedimiento / Función / Clase / Script: ComponentModel.cs                                     *
**************************************************************************************************************
* Descripción: ChallengeGCBA - Componentes del modelo                                                        *
* Autor      : Julián Marcelo Zappia                                                                         *
* Fecha      : 18/06/2022 y 19/06/2022                                                                       *
*************************************************************************************************************/

namespace System
{
    internal class ComponentModel
    {
        private const object designerSerializationVisibility = Object;

        public static object DesignerSerializationVisibility1 => designerSerializationVisibility;

        public static object DesignerSerializationVisibility11 => designerSerializationVisibility1;

        internal static object DesignerSerializationVisibility => designerSerializationVisibility1;

        internal interface IContainer
        {
            void Dispose();
        }

        internal class DesignerSerializationVisibilityAttribute : Attribute
        {

        }

        internal class DesignerCategoryAttribute : Attribute
        {
        }

        internal class ToolboxItemAttribute : Attribute
        {
        }

        internal class BrowsableAttribute : Attribute
        {
        }

        internal class CollectionChangeEventHandler
        {
            private object schemaChanged;

            public CollectionChangeEventHandler(object schemaChanged)
            {
                this.schemaChanged = schemaChanged;
            }
        }
    }
}