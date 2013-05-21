using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Drawing;

namespace GESAC.Empleado
{
    public partial class TiposRevisionSummary : System.Web.UI.Page
    {
        readonly TiposRevisionRepository tipo = new TiposRevisionRepository();
        IEnumerable<TiposRevision> lista_tipos;

        private void refreshData()
        {
            lista_tipos = tipo.consulta();
            this.GridView.DataSource = lista_tipos;
            this.GridView.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Mode"] = null;
            refreshData();
        }

        protected void GridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            bool operacion = false;
            try
            {
                int id = Convert.ToInt16(e.Values["Id"].ToString());
                operacion = tipo.estatus(id);
            }
            catch (Exception ex)
            {
            }

            if (operacion)
            {
                this.Label1.Text = "Operación exitosa!";
                this.Label1.CssClass = "successNotification";
            }
            else
            {
                this.Label1.Text = "Operación fallida!";
                this.Label1.CssClass = "failureNotification";
            }
            refreshData();
        }

        protected void GridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["Id"] = ((GridView)sender).SelectedRow.Cells[1].Text;
            Response.Redirect("~/Empleado/TiposRevisionDetail.aspx");
        }

        protected void GridView_DataBound(object sender, EventArgs e)
        {
            for (int i = 0; i < lista_tipos.Count(); i++)
            {
                LinkButton lb = GridView.Rows[i].Controls[0].Controls[0] as LinkButton;
                lb.Text = lista_tipos.ElementAt(i).Estatus == true ? "Desactivar" : String.Format("{0}{1}", "Activar", "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session["Mode"] = 1;
            Response.Redirect("~/Empleado/TiposRevisionDetail.aspx");
        }
    }
}