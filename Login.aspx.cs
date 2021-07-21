using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using DemoAuthorization.Models;

namespace DemoAuthorization
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void GetLogin(string username, string password)
        {
            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                Response.Redirect("Login.aspx");
            }

            UserModel userModel = new UserModel();
            userModel = userModel.Login(username, password);
            if (userModel.Username == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                Session["user"] = userModel;
                FormsAuthentication.RedirectFromLoginPage(txbUsername.Text, true);
                Response.Redirect("Dashboard.aspx");
            }
        }

        protected void btnLogin_OnClick(object sender, EventArgs e)
        {
            GetLogin(txbUsername.Text, txbPassword.Text);
        }
    }
}