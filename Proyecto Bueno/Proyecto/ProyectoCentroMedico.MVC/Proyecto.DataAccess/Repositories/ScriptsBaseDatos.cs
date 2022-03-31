using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Proyecto.DataAccess.Repositories
{
    public static class ScriptsBaseDatos
    {
        public static string UDP_tbPlantilla_Select = "UDP_tbPlantilla_Select";
        public static string UDP_tbPlantilla_Turno = "UDP_tbPlantilla_Turno";

        #region tbUsuarios
        //Listado
        public static string UDP_Select_tbUsuarios = "UDP_Select_tbUsuarios";
        //Insert
        public static string UDP_insertar_usuarios = "UDP_insertar_usuarios";
        #endregion

        #region tbRoles
        //listado
        public static string UDP_Select_tbRoles = "UDP_Select_tbRoles";
        #endregion


        #region tbSala
        //listado
        public static string UDP_Select_tbSala = "UDP_Select_tbSala";
        //insertar
        public static string UDP_insertar_Sala = "UDP_insertar_Sala";

        #endregion

        #region tbHospiltales
        //listado
        public static string UDP_Select_tbHospiltales = "UDP_Select_tbHospiltales";
        #endregion
    }
}
