using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Text.RegularExpressions;
using System.Drawing;

namespace GESAC
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void HeadLoginStatus_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            FormsAuthentication.SignOut();
            Session.Abandon();
            Response.Redirect(@"~\Login.aspx");
        }

        protected void HeadLoginView_Load(object sender, EventArgs e)
        {
            this.TreeView.Visible = Request.IsAuthenticated;

            if (!Request.IsAuthenticated && !HttpContext.Current.Request.Url.LocalPath.Contains("Login.aspx"))
            {
                FormsAuthentication.SignOut();
                Session.Abandon();
                Response.Redirect(@"~\Login.aspx");
            }
            else if(Request.IsAuthenticated)
            {
                string roles = String.Empty;
                var r = Roles.GetRolesForUser(Page.User.Identity.Name);
                for (int i = 0; i < r.Length; i++)
                    roles += r[i] + ", ";

                ((Label)this.HeadLoginView.FindControl("lblRol")).Text = roles;
            }
        }

        protected void TreeView_SelectedNodeChanged(object sender, EventArgs e)
        {
            ((Label)this.HeadLoginView.FindControl("lblRol")).Text = ((TreeView)sender).SelectedNode.NavigateUrl;
        }
    }
}
