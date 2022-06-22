/*************************************************************************************************************
*Programa / Procedimiento / Función / Clase / Script: FrmEdArtículo                                          *
**************************************************************************************************************
* Descripción: ChallengeGCBA - Conexión SQL                                                                  *
* Autor      : Julián Marcelo Zappia                                                                         *
* Fecha      : 18, 19, 20/06/2022                                                                            *
*************************************************************************************************************/

using System;

namespace ChallengeGCBA_Zappia
{
    public class SqlConnection
    {
        private string v;

        public SqlConnection(string v)
        {
            this.v = v;
        }

        internal void Open()
        {
            throw new NotImplementedException();
        }
    }
}