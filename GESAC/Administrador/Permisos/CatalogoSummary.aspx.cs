using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GESAC.Account
{
    public partial class CatalogoSummary : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsAuthenticated)
            {
                FormsAuthentication.SignOut();
                Session.Abandon();
                Response.Redirect(@"~\Login.aspx");
            }
        }

        protected void RegisterUser_CreatedUser(object sender, EventArgs e)
        {
        }

    }
}
