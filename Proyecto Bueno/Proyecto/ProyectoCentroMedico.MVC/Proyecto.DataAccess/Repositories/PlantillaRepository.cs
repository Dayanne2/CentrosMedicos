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
    public class PlantillaRepository : IRepository<tbPlantilla>
    {
        public int Editar(tbPlantilla item)
        {
            throw new NotImplementedException();
        }

        public int Eliminar(tbPlantilla tb)
        {
            throw new NotImplementedException();
        }

        public tbPlantilla Find(int id)
        {
            throw new NotImplementedException();
        }

        public tbPlantilla Find(Expression<Func<tbPlantilla, bool>> expression = null)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<tbPlantilla> GetTsTurno(string turno)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@turno", turno, DbType.String, ParameterDirection.Input);
            using var db = new SqlConnection(CentrosMedicosContext.ConnectionString);
            return db.Query<tbPlantilla>(ScriptsBaseDatos.UDP_tbPlantilla_Turno, parameters, commandType: CommandType.StoredProcedure);
        }

        public int Insert(tbPlantilla item)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<tbPlantilla> List()
        {
            using var db = new SqlConnection(CentrosMedicosContext.ConnectionString);
            return db.Query<tbPlantilla>(ScriptsBaseDatos.UDP_tbPlantilla_Select, commandType: CommandType.StoredProcedure);
        }
    }
}
