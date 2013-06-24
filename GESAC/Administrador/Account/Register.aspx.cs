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
        UsuariosRepository user = new UsuariosRepository();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void RegisterUser_CreatedUser(object sender, EventArgs e)
        {
            try
            {
                TextBox txtNombre = (TextBox)RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("Nombre");
                DropDownList ddlRol = (DropDownList)RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("Rol");

                if (!user.CreateUser(this.RegisterUser.UserName, txtNombre.Text, ddlRol.SelectedItem.Value))
                {
                    throw new Exception("No se pudo registrar el nombre y el rol.");
                }
            }
            catch (Exception ex)
            {
                Membership.DeleteUser(RegisterUser.UserName, true);

                Context.Items.Add("ErrorMessage", ex.Message);
                Server.Transfer(Request.Url.PathAndQuery, true);
            }
        }

        protected void RegisterUser_CreatingUser(object sender, LoginCancelEventArgs e)
        {
            if (Context.Items["ErrorMessage"] != null)
            {
                CustomValidator custValidator = (CustomValidator)RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("CustomValidator");
                custValidator.ErrorMessage = Context.Items["ErrorMessage"].ToString();
                custValidator.IsValid = false;
                custValidator.Visible = false;
                e.Cancel = true;
            }
        }

        protected void ContinueButton_Click(object sender, EventArgs e)
        {

        }

    }
}