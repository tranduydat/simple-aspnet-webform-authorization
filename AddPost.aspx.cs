using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DemoAuthorization.Models;

namespace DemoAuthorization
{
    public partial class AddPost : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_OnClick(object sender, EventArgs e)
        {
            string postName = txbPostTitle.Text;
            string content = txbContent.Text;
            if (string.IsNullOrEmpty(postName) || string.IsNullOrEmpty(content))
            {
                // TODO: Do sth
            }
            else
            {
                UserModel loggedUser = (UserModel) Session["user"];
                int createdBy = loggedUser.ID;
                PostModel postModel = new PostModel(postName, content, createdBy);
                postModel.Add();
                Response.Redirect("Dashboard.aspx");
            }
        }
    }
}