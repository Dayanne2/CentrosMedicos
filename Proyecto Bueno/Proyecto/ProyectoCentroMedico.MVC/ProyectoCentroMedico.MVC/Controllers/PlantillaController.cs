using AspNetCore.Reporting;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Proyecto.BusinessLogic.Services;
using Proyecto.DataAccess.Repositories;
using Proyecto.Entities.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProyectoCentroMedico.MVC.Controllers
{
    public class PlantillaController : Controller
    {
        private readonly IWebHostEnvironment _webHostEnvironment;
        private readonly PlantillaRepository _plantillaRepository;
        private readonly CatalogService _catalogService;

        public PlantillaController(IWebHostEnvironment webHostEnvironment, PlantillaRepository plantillaRepository, CatalogService catalogService)
        {
            this._webHostEnvironment = webHostEnvironment;
            this._plantillaRepository = plantillaRepository;
            _catalogService = catalogService;
            System.Text.Encoding.RegisterProvider(System.Text.CodePagesEncodingProvider.Instance);
        }

        public IActionResult Print()
        {
            var path = $"{this._webHostEnvironment.WebRootPath}\\Reports\\ReportPlantilla.rdlc";
            var tabla = _plantillaRepository.List();
            LocalReport localReport = new LocalReport(path);
            localReport.AddDataSource("DataSet1", tabla);
            var result = localReport.Execute(RenderType.Pdf);
            return File(result.MainStream, "application/pdf");
        }

        [HttpGet]
        public IActionResult PrintBy()
        {
            return View();
        }

        [HttpPost]
        public IActionResult PrintBy(tbPlantilla item)
        {
            string turno = item.planti_Turno;
            var path = $"{this._webHostEnvironment.WebRootPath}\\Reports\\ReportPlantilla.rdlc";
            var tabla = _catalogService.PlantillaFiltrar(turno);
            LocalReport localReport = new LocalReport(path);
            localReport.AddDataSource("DataSet1", tabla);
            var result = localReport.Execute(RenderType.Pdf);
            return File(result.MainStream, "application/pdf");
        }
    }
}
