using PagedList;
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
    public class CommentsController : Controller
    {
        private CryptoBDEntities2 db = new CryptoBDEntities2();

        // GET: Comments
        public ActionResult Index(int NoCat, int NoPost, int? page)
        {
            var currentPage = (page ?? 1);
            ViewBag.page = currentPage;
            var nbrPerPage = 5;
            ViewBag.UserID = db.AspNetUsers.Where(t => t.UserName == User.Identity.Name).Select(t => t.Id).FirstOrDefault();
            var vue = new Comment();
            var Postcomment = (from p in db.Posts.Where(t => t.Post_ID == NoPost)
                               select new PostCommentDisplay
                               {
                                   PostID = p.Post_ID,
                                   PostName = p.Post_Name,
                                   PostMessage = p.Post_Message,
                                   PostDateHeure = p.Post_Date_Heure,
                                   PostCategorieID = p.FK_Categories_ID,
                                   PostUserID = p.FK_User_ID,
                                   UserPathImg = db.AspNetUsers.Where(t => t.Id == p.FK_User_ID).Select(t => t.UserPath_Img).FirstOrDefault(),
                                   UserName = db.AspNetUsers.Where(t => t.Id == p.FK_User_ID).Select(t => t.UserName).FirstOrDefault(),
                                   NbComment = db.Comments.Where(t => t.FK_Post_ID == p.Post_ID).Count(),
                                   CategorieName = db.Categories.Where(t => t.Categorie_ID == p.FK_Categories_ID).Select(t => t.CategorieName).FirstOrDefault(),
                                   comment = (from c in db.Comments.Where(t => t.FK_Post_ID == p.Post_ID)
                                              select new CommentDisplay
                                              {
                                                  CommentID = c.CommentID,
                                                  Comment_Text = c.Comment_Text,
                                                  Comment_Date_Heure = c.Comment_Date_Heure,
                                                  Post_ID = c.FK_Post_ID,
                                                  Username = db.AspNetUsers.Where(t => t.Id == c.FK_User_ID).Select(t => t.UserName).FirstOrDefault(),
                                                  User_PATH_IMG = db.AspNetUsers.Where(t => t.Id == c.FK_User_ID).Select(t => t.UserPath_Img).FirstOrDefault(),
                                              }).ToList(),
                               }).ToList();
            return View(Postcomment.ToPagedList(currentPage,nbrPerPage));
        }

        // GET: Comments/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Comment comment = db.Comments.Find(id);
            if (comment == null)
            {
                return HttpNotFound();
            }
            return View(comment);
        }

        // GET: Comments/Create
        public ActionResult Create()
        {
            ViewBag.FK_User_ID = new SelectList(db.AspNetUsers, "Id", "Email");
            ViewBag.FK_Post_ID = new SelectList(db.Posts, "Post_ID", "Post_Name");
            return View();
        }

        // POST: Comments/Create
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        public ActionResult Index([Bind(Include = "Comment_Text,FK_Post_ID,FK_User_ID")] Comment comment,int NoPost,int NoCat)
        {
            if (ModelState.IsValid)
            {
                comment.CommentID = 0;
                comment.Comment_Date_Heure = DateTime.Now;
                db.Comments.Add(comment);
                db.SaveChanges();
                return RedirectToAction("Index",new { NoCat = NoCat, NoPost = NoPost });
            }

            ViewBag.FK_User_ID = new SelectList(db.AspNetUsers, "Id", "Email", comment.FK_User_ID);
            ViewBag.FK_Post_ID = new SelectList(db.Posts, "Post_ID", "Post_Name", comment.FK_Post_ID);
            return View(comment);
        }

        // GET: Comments/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Comment comment = db.Comments.Find(id);
            if (comment == null)
            {
                return HttpNotFound();
            }
            ViewBag.FK_User_ID = new SelectList(db.AspNetUsers, "Id", "Email", comment.FK_User_ID);
            ViewBag.FK_Post_ID = new SelectList(db.Posts, "Post_ID", "Post_Name", comment.FK_Post_ID);
            return View(comment);
        }

        // POST: Comments/Edit/5
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CommentID,Comment_Text,Comment_Date_Heure,FK_Post_ID,FK_User_ID")] Comment comment)
        {
            if (ModelState.IsValid)
            {
                db.Entry(comment).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.FK_User_ID = new SelectList(db.AspNetUsers, "Id", "Email", comment.FK_User_ID);
            ViewBag.FK_Post_ID = new SelectList(db.Posts, "Post_ID", "Post_Name", comment.FK_Post_ID);
            return View(comment);
        }

        // GET: Comments/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Comment comment = db.Comments.Find(id);
            if (comment == null)
            {
                return HttpNotFound();
            }
            return View(comment);
        }

        // POST: Comments/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Comment comment = db.Comments.Find(id);
            db.Comments.Remove(comment);
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