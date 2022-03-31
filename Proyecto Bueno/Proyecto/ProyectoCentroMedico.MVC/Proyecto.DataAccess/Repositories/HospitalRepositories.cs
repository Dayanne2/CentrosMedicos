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
    public class HospitalRepositories : IRepository<tbHospiltales>
    {
        public int Editar(tbHospiltales item)
        {
            throw new NotImplementedException();
        }

        public int Eliminar(tbHospiltales tb)
        {
            throw new NotImplementedException();
        }

        public tbHospiltales Find(int id)
        {
            throw new NotImplementedException();
        }

        public tbHospiltales Find(Expression<Func<tbHospiltales, bool>> expression = null)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<tbHospiltales> GetReport()
        {
            throw new NotImplementedException();
        }

        public IEnumerable<tbHospiltales> GetReportInt(int var)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<tbHospiltales> GetReportString(string var)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<tbHospiltales> GetReportUlt()
        {
            throw new NotImplementedException();
        }

        public int Insert(tbHospiltales item)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<tbHospiltales> List()
        {
            using var db = new SqlConnection(CentrosMedicosContext.ConnectionString);
            var result = db.Query<tbHospiltales>(ScriptsBaseDatos.UDP_Select_tbHospiltales, null, commandType: CommandType.StoredProcedure);
            return result;
        }
    }
}
