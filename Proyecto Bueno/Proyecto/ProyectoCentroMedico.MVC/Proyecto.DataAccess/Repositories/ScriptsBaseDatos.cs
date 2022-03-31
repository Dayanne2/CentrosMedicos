using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Proyecto.DataAccess.Repositories
{
    public static class ScriptsBaseDatos
    {

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
        //reporte
        public static string UDP_tbSala_SelectId  = "UDP_tbSala_SelectId";

        #endregion

        #region tbHospiltales
        public static string UDP_Select_tbHospiltales = "UDP_Select_tbHospiltales";
        public static string UDP_insertar_hospitales = "UDP_insertar_hospitales";
        #endregion
       
        #region tbPlantilla
        public static string UDP_tbPlantilla_Select = "UDP_tbPlantilla_Select";
        public static string UDP_tbPlantilla_Turno = "UDP_tbPlantilla_Turno";
        public static string UDP_insertar_Plantilla = "UDP_insertar_Plantilla";

        #endregion

        #region tbEnfermo
        public static string UDP_insertar_enfermo = "UDP_insertar_enfermo";
        public static string UDP_Select_tbEnfermo = "UDP_Select_tbEnfermo";

        #endregion
    }
}
