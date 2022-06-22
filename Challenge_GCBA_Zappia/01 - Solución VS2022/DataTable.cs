/*************************************************************************************************************
* Programa / Procedimiento / Función / Clase / Script: FrmEdArtículo                                         *
**************************************************************************************************************
* Descripción: ChallengeGCBA - MAIN                                                                          *
* Autor      : Julián Marcelo Zappia                                                                         *
* Fecha      : 18, 19, 20/06/2022                                                                            *
*************************************************************************************************************/


using System.Collections.Generic;

namespace ChallengeGCBA_Zappia
{
    internal class DataTable
    {
        public IEnumerable<DataRow> Rows { get; internal set; }
        public IEnumerable<DataColumn> Columns { get; internal set; }
    }
}