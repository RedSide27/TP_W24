//------------------------------------------------------------------------------
// <auto-generated>
//     Ce code a été généré à partir d'un modèle.
//
//     Des modifications manuelles apportées à ce fichier peuvent conduire à un comportement inattendu de votre application.
//     Les modifications manuelles apportées à ce fichier sont remplacées si le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TP_W24.Models
{
    using System;
    using System.Collections.Generic;
    using System.Web.Mvc;

    public partial class Comment
    {
        public int CommentID { get; set; }
        [AllowHtml]
        public string Comment_Text { get; set; }
        public System.DateTime Comment_Date_Heure { get; set; }
        public int FK_Post_ID { get; set; }
        public string FK_User_ID { get; set; }
    
        public virtual AspNetUser AspNetUser { get; set; }
        public virtual Post Post { get; set; }
    }
}
