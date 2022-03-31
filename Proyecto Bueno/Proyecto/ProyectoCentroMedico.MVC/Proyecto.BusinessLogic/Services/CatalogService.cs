using Proyecto.DataAccess.Repositories;
using Proyecto.Entities.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Proyecto.BusinessLogic.Services
{
    public class CatalogService
    {
        private readonly PlantillaRepository _plantillaRepository;
        private readonly RolesRepositories _rolesRepository;
        private readonly SalasRepository _salasRepository;
        private readonly HospitalRepositories _hospitalRepositories;

        public CatalogService(PlantillaRepository plantillaRepository,
             RolesRepositories rolesRepository,
              SalasRepository salasRepository,
             HospitalRepositories hospitalRepositories)
        {
            _plantillaRepository = plantillaRepository;
            _rolesRepository = rolesRepository;
            _salasRepository = salasRepository;
            _hospitalRepositories = hospitalRepositories;

        }

        #region Roles
        //listado 
        public IEnumerable<tbRoles> ListadoRoles(out string errorMessage)
        {
            errorMessage = string.Empty;
            try
            {
                return _rolesRepository.List();
            }
            catch (Exception ex)
            {
                errorMessage = ex.Message;
                return Enumerable.Empty<tbRoles>();
            }
        }
        //insertar 
        public string InsertarRol(tbRoles item)
        {

            try
            {
                int resultado = _rolesRepository.Insert(item);
                string mensaje = string.Empty;
                if (resultado <= 0)
                    mensaje = "Se produjo un error al agregar el registro";

                return mensaje;
            }
            catch (Exception ex)
            {

                return ex.Message;
            }
        }
        //busquedad por id
        public tbRoles FindRol(int id, out string errorMessage)
        {
            var response = new tbRoles();
            errorMessage = string.Empty;
            try
            {
                response = _rolesRepository.Find(id);

            }
            catch (Exception ex)
            {

                errorMessage = ex.Message;
            }
            return response;

        }
        //busqueda generalizada
        public tbRoles FindRol(out string errorMessage, Expression<Func<tbRoles, bool>> expression = null)
        {
            var response = new tbRoles();
            errorMessage = string.Empty;
            try
            {
                response = _rolesRepository.Find(expression);

            }
            catch (Exception ex)
            {

                errorMessage = ex.Message;
            }
            return response;
        }
        //editar 
        public string EditarRol(tbRoles item)
        {
            string errorMessage = string.Empty;
            try
            {
                int response = _rolesRepository.Editar(item);
                if (response < 0)
                    errorMessage = "No se pudo actualizar el registro";

            }
            catch (Exception ex)
            {

                errorMessage = ex.Message;
            }

            return errorMessage;
        }
        //eliminar 
        public string EliminarRol(tbRoles tbRoles)
        {
            string mensaje = string.Empty;

            try
            {
                var response = 0;
                response = _rolesRepository.Eliminar(tbRoles);
                if (response != 0)
                    mensaje = "";
                else
                    mensaje = "Ha ocurrido un error";


                return mensaje;
            }
            catch (Exception ex)
            {

                return ex.Message;
            }
        }

        #endregion


        #region tbPais
        public IEnumerable<tbPlantilla> PlantillaFiltrar(string turno)
        {
            try
            {
                return _plantillaRepository.GetReportString(turno);
            }
            catch (Exception ex)
            {
                return Enumerable.Empty<tbPlantilla>();
            }
        }
        #endregion

        #region Sala

        public IEnumerable<tbSala> ListadoSala(out string errorMessage)
        {
            errorMessage = string.Empty;
            try
            {
                return _salasRepository.List();
            }
            catch (Exception ex)
            {
                errorMessage = ex.Message;
                return Enumerable.Empty<tbSala>();
            }
        }

        public string InsertarSala(tbSala item)
        {
            try
            {
                int resultado = _salasRepository.Insert(item);
                string mensaje = string.Empty;
                if (resultado > 0)
                    mensaje = "Se produjo un error al agregar el registro";

                return mensaje;
            }
            catch (Exception ex)
            {

                return ex.Message;
            }
        }

        public tbSala FindSala(int id, out string errorMessage)
        {
            var response = new tbSala();
            errorMessage = string.Empty;
            try
            {
                response = _salasRepository.Find(id);

            }
            catch (Exception ex)
            {

                errorMessage = ex.Message;
            }
            return response;
        }

        public tbSala FindSala(out string errorMessage, Expression<Func<tbSala, bool>> expression = null)
        {
            var response = new tbSala();
            errorMessage = string.Empty;
            try
            {
                response = _salasRepository.Find(expression);

            }
            catch (Exception ex)
            {

                errorMessage = ex.Message;
            }
            return response;
        }

        public IEnumerable<tbSala> SalaReporte()
        {
            try
            {
                return _salasRepository.GetReport();
            }
            catch (Exception)
            {
                return Enumerable.Empty<tbSala>();
            }
        }

        public IEnumerable<tbSala> SalaUltimoId()
        {     
            try
            {
                return _salasRepository.GetReportUlt();
            }
            catch (Exception)
            {
                return Enumerable.Empty<tbSala>();
            }
        }

        #endregion

        #region Hospitales
        //listado 
        public IEnumerable<tbHospiltales> ListadoHospital(out string errorMessage)
        {
            errorMessage = string.Empty;
            try
            {
                return _hospitalRepositories.List();
            }
            catch (Exception ex)
            {
                errorMessage = ex.Message;
                return Enumerable.Empty<tbHospiltales>();
            }
        }
        //insertar 
        public string InsertarHospita(tbHospiltales item)
        {

            try
            {
                int resultado = _hospitalRepositories.Insert(item);
                string mensaje = string.Empty;
                if (resultado <= 0)
                    mensaje = "Se produjo un error al agregar el registro";

                return mensaje;
            }
            catch (Exception ex)
            {

                return ex.Message;
            }
        }
        //busquedad por id
        public tbHospiltales FindHospital(int id, out string errorMessage)
        {
            var response = new tbHospiltales();
            errorMessage = string.Empty;
            try
            {
                response = _hospitalRepositories.Find(id);

            }
            catch (Exception ex)
            {

                errorMessage = ex.Message;
            }
            return response;

        }
        //busqueda generalizada
        public tbHospiltales FindHospital(out string errorMessage, Expression<Func<tbHospiltales, bool>> expression = null)
        {
            var response = new tbHospiltales();
            errorMessage = string.Empty;
            try
            {
                response = _hospitalRepositories.Find(expression);

            }
            catch (Exception ex)
            {

                errorMessage = ex.Message;
            }
            return response;
        }


        #endregion

    }
}
