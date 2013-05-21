using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GESAC.Account
{
    public partial class Register : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!Request.IsAuthenticated)
            //{
            //    FormsAuthentication.SignOut();
            //    Session.Abandon();
            //    Response.Redirect(@"~\Login.aspx");
            //}
        }

        protected void RegisterUser_CreatedUser(object sender, EventArgs e)
        {
            FormsAuthentication.SetAuthCookie(RegisterUser.UserName, false /* createPersistentCookie */);

            string continueUrl = RegisterUser.ContinueDestinationPageUrl;
            if (String.IsNullOrEmpty(continueUrl))
            {
                continueUrl = "~/";
            }

            try
            {
                Membership.CreateUser(this.RegisterUser.UserName, this.RegisterUser.Password, this.RegisterUser.Email);
            }
            catch (Exception ex)
            {
                CustomValidator err = new CustomValidator() { ValidationGroup = "RegisterUserValidationGroup", IsValid = false, ErrorMessage = ex.Message };
                Page.Validators.Add(err);
            }

            Response.Redirect(continueUrl);
        }

    }
}
