using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TP_W24.Models;

namespace TP_W24.Controllers
{
    public class HomeController : Controller
    {
        private CryptoBDEntities2 db = new CryptoBDEntities2();
        public ActionResult Index()
        {
            return View(db.Categories.ToList());
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult categorie(int NoCat)
        {
            var post = (from p in db.Posts.Where(t=> t.FK_Categories_ID == NoCat)
                        select new PostDisplay
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
                            CategorieName = db.Categories.Where(t=> t.Categorie_ID == p.FK_Categories_ID).Select(t=> t.CategorieName).FirstOrDefault()
                        });
            ViewBag.CategorieName = db.Categories.Where(t => t.Categorie_ID == NoCat).Select(t => t.CategorieName).FirstOrDefault().ToString();

            return View(post.ToList());
        }

        public ActionResult post(int NoCat)
        {
            var NoPost = db.Posts.Where(t => t.FK_Categories_ID == NoCat).Select(t => t.Post_ID).FirstOrDefault();
            var comment = (from c in db.Comments.Where(t=> t.FK_Post_ID == NoPost)
                           select new CommentDisplay
                           {
                               CommentID = c.CommentID,
                               Comment_Text = c.Comment_Text,
                               Comment_Date_Heure = c.Comment_Date_Heure,
                               Post_ID = c.FK_Post_ID,
                               Username = db.AspNetUsers.Where(t => t.Id == c.FK_User_ID).Select(t => t.UserName).FirstOrDefault(),
                               User_PATH_IMG = db.AspNetUsers.Where(t => t.Id == c.FK_User_ID).Select(t => t.UserPath_Img).FirstOrDefault(),
                               post = (from p in db.Posts.Where(t => t.FK_Categories_ID == NoCat)
                                           select new PostDisplay
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
                                               CategorieName = db.Categories.Where(t => t.Categorie_ID == p.FK_Categories_ID).Select(t => t.CategorieName).FirstOrDefault()
                                           }).ToList()
                            }).ToList();

            return View(comment.ToList());
        }

        public ActionResult login()
        {
            return View();
        }

        public ActionResult register()
        {
            return View();
        }

    }

    public class CommentDisplay
    {
        [Key, Column(Order = 0)]
        public int CommentID { get; set; }
        public string Comment_Text { get; set; }
        public DateTime Comment_Date_Heure { get; set; }
        public int Post_ID { get; set; }
        public string Username { get; set; }
        public string User_PATH_IMG { get; set; }
        public List<PostDisplay> post { get; set; }
    }

    public class PostDisplay
    {
        [Key, Column(Order = 0)]
        public int PostID { get; set; }
        public string PostName { get; set; }
        public string PostMessage { get; set; }
        public DateTime PostDateHeure { get; set; }
        public int PostCategorieID { get; set; }
        public string PostUserID { get; set; }
        public string UserPathImg { get; set; }
        public string UserName { get; set; }
        public int NbComment { get; set; }
        public string CategorieName { get; set; }
    }
}