using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DemoAuthorization
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null || !this.Page.User.Identity.IsAuthenticated)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                FormsAuthentication.SignOut();
                Session.Clear();
                Session.Abandon();
                Response.Redirect("Login.aspx");
            }
        }
    }
}