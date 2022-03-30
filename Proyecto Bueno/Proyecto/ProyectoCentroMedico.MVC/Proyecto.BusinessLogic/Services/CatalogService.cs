using Proyecto.DataAccess.Repositories;
using Proyecto.Entities.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Proyecto.BusinessLogic.Services
{
    public class CatalogService
    {
        private readonly PlantillaRepository _plantillaRepository;

        public CatalogService(PlantillaRepository plantillaRepository)
        {
            _plantillaRepository = plantillaRepository;
        }

        #region tbPais
        public IEnumerable<tbPlantilla> PlantillaFiltrar(string turno)
        {
            try
            {
                return _plantillaRepository.GetTsTurno(turno);
            }
            catch (Exception ex)
            {
                return Enumerable.Empty<tbPlantilla>();
            }
        }
        #endregion
    }
}
