using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TP_W24.Models;

namespace TP_W24.Controllers
{
    public class PostsController : Controller
    {
        private CryptoBDEntities2 db = new CryptoBDEntities2();

        // GET: Posts
        public ActionResult Index()
        {
            var posts = db.Posts.Include(p => p.AspNetUser).Include(p => p.Categorie);
            return View(posts.ToList());
        }

        // GET: Posts/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Post post = db.Posts.Find(id);
            if (post == null)
            {
                return HttpNotFound();
            }
            return View(post);
        }

        // GET: Posts/Create
        public ActionResult Create(int NoCat)
        {
            ViewBag.CategorieName = db.Categories.Where(t => t.Categorie_ID == NoCat).Select(t => t.CategorieName).FirstOrDefault().ToString();
            ViewBag.FK_User_ID = new SelectList(db.AspNetUsers, "Id", "Email");
            Session["CategorieID"] = NoCat;
            ViewBag.ImgPATH = db.Categories.Where(t => t.Categorie_ID == NoCat).Select(t => t.Categorie_Path_Img).FirstOrDefault();
            return View();
        }

        // POST: Posts/Create
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Post_ID,Post_Name,Post_Message,Post_Date_Heure,FK_Categories_ID,FK_User_ID")] Post post)
        {
            if (ModelState.IsValid)
            {
                post.Post_ID = 0;
                post.Post_Date_Heure = DateTime.Now;
                post.FK_User_ID = "80117640-40bc-472d-acd7-bdd75075962a";
                post.FK_Categories_ID = (int)Session["CategorieID"];
                db.Posts.Add(post);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.FK_User_ID = new SelectList(db.AspNetUsers, "Id", "Email", post.FK_User_ID);
            ViewBag.FK_Categories_ID = new SelectList(db.Categories, "Categorie_ID", "CategorieName", post.FK_Categories_ID);
            return View(post);
        }

        // GET: Posts/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Post post = db.Posts.Find(id);
            if (post == null)
            {
                return HttpNotFound();
            }
            ViewBag.FK_User_ID = new SelectList(db.AspNetUsers, "Id", "Email", post.FK_User_ID);
            ViewBag.FK_Categories_ID = new SelectList(db.Categories, "Categorie_ID", "CategorieName", post.FK_Categories_ID);
            return View(post);
        }

        // POST: Posts/Edit/5
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Post_ID,Post_Name,Post_Message,Post_Date_Heure,FK_Categories_ID,FK_User_ID")] Post post)
        {
            if (ModelState.IsValid)
            {
                db.Entry(post).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.FK_User_ID = new SelectList(db.AspNetUsers, "Id", "Email", post.FK_User_ID);
            ViewBag.FK_Categories_ID = new SelectList(db.Categories, "Categorie_ID", "CategorieName", post.FK_Categories_ID);
            return View(post);
        }

        // GET: Posts/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Post post = db.Posts.Find(id);
            if (post == null)
            {
                return HttpNotFound();
            }
            return View(post);
        }

        // POST: Posts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Post post = db.Posts.Find(id);
            db.Posts.Remove(post);
            db.SaveChanges();
            return RedirectToAction("Index");
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
}


