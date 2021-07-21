using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DemoAuthorization.Models;

namespace DemoAuthorization
{
    public partial class Dashboard : System.Web.UI.Page
    {
        public List<PostModel> listOfPosts = new List<PostModel>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null || !this.Page.User.Identity.IsAuthenticated)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                ltlWelcomeMsg.Text = HttpContext.Current.User.Identity.Name;
                GetListOfPosts();
            }
        }

        private void GetListOfPosts()
        {
            PostModel postModel = new PostModel();
            listOfPosts = postModel.GetAll();
        }
    }
}