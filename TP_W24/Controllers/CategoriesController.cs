using PagedList;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TP_W24.Models;

namespace TP_W24.Controllers
{
    public class CategoriesController : Controller
    {
        private CryptoBDEntities2 db = new CryptoBDEntities2();

        // GET: Categories
        public ActionResult Index(int? page)
        {
            var currentPage = (page ?? 1);
            ViewBag.page = currentPage;
            var nbrPerPage = 8;
            var categorie = (from c in db.Categories
                             select new CategorieDisplay
                             {
                                 Categorie_ID = c.Categorie_ID,
                                 CategorieName = c.CategorieName,
                                 CategorieDescription = c.CategorieDescription,
                                 Categorie_Path_Img = c.Categorie_Path_Img
                             }).ToList();


            return View(categorie.ToPagedList(currentPage, nbrPerPage));
        }

        // GET: Categories/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Categorie categorie = db.Categories.Find(id);
            if (categorie == null)
            {
                return HttpNotFound();
            }
            return View(categorie);
        }

        // GET: Categories/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Categories/Create
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Categorie_ID,CategorieName,CategorieDescription,Categorie_Path_Img")] Categorie categorie, HttpPostedFileBase fileIMG)
        {
            if (fileIMG != null && fileIMG.ContentLength > 0)
                try
                {
                    string path = Path.Combine(Server.MapPath("/img/blog"),
                                               Path.GetFileName(fileIMG.FileName));
                    fileIMG.SaveAs(path);
                    categorie.Categorie_Path_Img = "/img/blog/" + fileIMG.FileName;
                }
                catch (Exception ex)
                {
                    ViewBag.Message = "ERROR:" + ex.Message.ToString();
                }
            if (ModelState.IsValid)
            {
                db.Categories.Add(categorie);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(categorie);
        }

        // GET: Categories/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Categorie categorie = db.Categories.Find(id);
            if (categorie == null)
            {
                return HttpNotFound();
            }
            ViewBag.ImgPath = db.Categories.Where(t => t.Categorie_ID == id).Select(t => t.Categorie_Path_Img).FirstOrDefault();
            ViewBag.ImgID = id;
            return View(categorie);
        }

        // POST: Categories/Edit/5
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Categorie_ID,CategorieName,CategorieDescription,Categorie_Path_Img")] Categorie categorie, HttpPostedFileBase fileIMG,string ImgPath, int ImgID)
        {
            if (fileIMG != null && fileIMG.ContentLength > 0)
            {
                string path = Path.Combine(Server.MapPath("/img/blog"),
                                           Path.GetFileName(fileIMG.FileName));
                fileIMG.SaveAs(path);
                categorie.Categorie_Path_Img = "/img/blog/" + fileIMG.FileName;
            }
            else
            {
                categorie.Categorie_Path_Img = ImgPath;
            }
            categorie.Categorie_ID = ImgID;
            if (ModelState.IsValid)
            {
                db.Entry(categorie).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(categorie);
        }

        // GET: Categories/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            else
            {
                Categorie categorie = db.Categories.Find(id);
                db.Categories.Remove(categorie);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

    }

    public class CategorieDisplay
    {
        [Key, Column(Order = 0)]
        public int Categorie_ID { get; set; }
        public string CategorieName { get; set; }
        [AllowHtml]
        public string CategorieDescription { get; set; }
        public string Categorie_Path_Img { get; set; }
    }

}
