using Dapper;
using Microsoft.Data.SqlClient;
using Proyecto.Entities.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Proyecto.DataAccess.Repositories
{
    public class SalasRepository : IRepository<tbSala>
    {
        public int Editar(tbSala item)
        {
            throw new NotImplementedException();
        }

        public int Eliminar(tbSala tb)
        {
            throw new NotImplementedException();
        }

        public tbSala Find(int id)
        {
            using var db = new CentrosMedicosContext();
            var response = db.tbSala.Find(id);
            return response;
        }

        public tbSala Find(Expression<Func<tbSala, bool>> expression = null)
        {
            using var db = new CentrosMedicosContext();
            var response = db.tbSala.Where(expression).FirstOrDefault();
            return response;
        }

        public IEnumerable<tbSala> GetTsTurno(string turno)
        {
            throw new NotImplementedException();
        }

        public int Insert(tbSala item)
        {
            var parametres = new DynamicParameters();
            parametres.Add("@hospi_Id", item.hospi_Id, DbType.String, ParameterDirection.Input);
            parametres.Add("@sala_Nombre", item.sala_Nombre, DbType.String, ParameterDirection.Input);
            parametres.Add("@sala_NumCamas", item.sala_NumCamas, DbType.String, ParameterDirection.Input);
            using var db = new SqlConnection(CentrosMedicosContext.ConnectionString);
            return db.ExecuteScalar<int>(ScriptsBaseDatos.UDP_insertar_Sala, parametres, commandType: CommandType.StoredProcedure);
        }

        public IEnumerable<tbSala> List()
        {
            using var db = new SqlConnection(CentrosMedicosContext.ConnectionString);
            var result = db.Query<tbSala>(ScriptsBaseDatos.UDP_Select_tbSala, null, commandType: CommandType.StoredProcedure);
            return result;
        }
    }
}
