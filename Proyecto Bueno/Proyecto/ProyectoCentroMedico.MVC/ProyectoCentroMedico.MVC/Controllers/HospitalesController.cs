using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProyectoCentroMedico.MVC.Controllers
{
    public class HospitalesController : Controller
    {
        // GET: HospitalesController
        public ActionResult Index()
        {
            return View();
        }

        // GET: HospitalesController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: HospitalesController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: HospitalesController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: HospitalesController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: HospitalesController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: HospitalesController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: HospitalesController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}
