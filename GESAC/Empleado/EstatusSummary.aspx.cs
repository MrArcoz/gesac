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
    public partial class EstatusSummary : System.Web.UI.Page
    {
        readonly EstatusRepository estados = new EstatusRepository();
        IEnumerable<Estatus> lista_edos;

        private void refreshData()
        {
            lista_edos = estados.consulta();
            this.GridView.DataSource = lista_edos;
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
                String id = e.Values["IdStatus"].ToString();
                operacion = estados.estatus(id);
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
            Response.Redirect("~/Empleado/EstatusDetail.aspx");
        }

        protected void GridView_DataBound(object sender, EventArgs e)
        {
            for (int i = 0; i < lista_edos.Count(); i++)
            {
                LinkButton lb = GridView.Rows[i].Controls[0].Controls[0] as LinkButton;
                lb.Text = lista_edos.ElementAt(i).bEstatus == true ? "Desactivar" : String.Format("{0}{1}", "Activar", "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session["Mode"] = 1;
            Response.Redirect("~/Empleado/EstatusDetail.aspx");
        }
    }
}