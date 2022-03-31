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
            using var db = new CentrosMedicosContext();
            var response = db.tbPlantilla.Find(id);
            return response;
        }

        public tbPlantilla Find(Expression<Func<tbPlantilla, bool>> expression = null)
        {
            using var db = new CentrosMedicosContext();
            var response = db.tbPlantilla.Where(expression).FirstOrDefault();
            return response;
        }

        public IEnumerable<tbPlantilla> GetReport()
        {
            throw new NotImplementedException();
        }

        public IEnumerable<tbPlantilla> GetReportInt(int var)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<tbPlantilla> GetReportString(string var)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@turno", var, DbType.String, ParameterDirection.Input);
            using var db = new SqlConnection(CentrosMedicosContext.ConnectionString);
            return db.Query<tbPlantilla>(ScriptsBaseDatos.UDP_tbPlantilla_Turno, parameters, commandType: CommandType.StoredProcedure);
        }

        public IEnumerable<tbPlantilla> GetReportUlt()
        {
            throw new NotImplementedException();
        }

        public int Insert(tbPlantilla item)
        {
            var parametres = new DynamicParameters();
            parametres.Add("@hospi_Id", item.hospi_Id, DbType.String, ParameterDirection.Input);
            parametres.Add("@sala_Id", item.sala_Id, DbType.String, ParameterDirection.Input);
            parametres.Add("@planti_Apellido", item.planti_Apellido, DbType.String, ParameterDirection.Input);
            parametres.Add("@planti_Funcion", item.planti_Funcion, DbType.String, ParameterDirection.Input);
            parametres.Add("@planti_Turno", item.planti_Turno, DbType.String, ParameterDirection.Input);
            parametres.Add("@planti_Salario", item.planti_Salario, DbType.String, ParameterDirection.Input);
            using var db = new SqlConnection(CentrosMedicosContext.ConnectionString);
            return db.ExecuteScalar<int>(ScriptsBaseDatos.UDP_insertar_Plantilla, parametres, commandType: CommandType.StoredProcedure);


        }

        public IEnumerable<tbPlantilla> List()
        {
            using var db = new SqlConnection(CentrosMedicosContext.ConnectionString);
            return db.Query<tbPlantilla>(ScriptsBaseDatos.UDP_tbPlantilla_Select, commandType: CommandType.StoredProcedure);
        }
    }
}
