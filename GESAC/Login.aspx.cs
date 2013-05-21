using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace GESAC.Account
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //RegisterHyperLink.NavigateUrl = "Register.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
        }

        protected void LoginUser_Authenticate(object sender, AuthenticateEventArgs e)
        {
            if (Membership.ValidateUser(LoginUser.UserName, LoginUser.Password))
            {
                e.Authenticated = true;
                FormsAuthentication.SetAuthCookie(LoginUser.UserName, false);
            }
            else
            {
                e.Authenticated = false;
                LoginUser.FailureText = "Usuario y/o contraseña incorrectos.<br>Favor de intentarlo nuevamente.";
            }
        }

        protected void LoginUser_LoggedIn(object sender, EventArgs e)
        {
            Response.Redirect("~/About.aspx"); 
        }
    }
}
