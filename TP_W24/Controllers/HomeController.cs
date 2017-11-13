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
        public ActionResult login()
        {
            return View();
        }

        public ActionResult register()
        {
            return View();
        }

    }

    public class PostCommentDisplay
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
        public List<CommentDisplay> comment { get; set; }
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
    }

    public class PostDisplay
    {
        [Key, Column(Order = 0)]
        public int PostID { get; set; }
        public string PostName { get; set; }
        [AllowHtml]
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