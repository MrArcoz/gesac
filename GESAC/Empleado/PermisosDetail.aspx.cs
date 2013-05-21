using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GESAC.Empleado
{
    public partial class PermisosDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Mode"] != null) this.FormView1.ChangeMode(FormViewMode.Insert);
        }
    }
}