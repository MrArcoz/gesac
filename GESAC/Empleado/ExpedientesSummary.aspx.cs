using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
//using System.Drawing;
using System.Reflection;
using System.Web.Security;

namespace GESAC.Empleado
{
    public partial class ExpedientesSummary : System.Web.UI.Page
    {
        readonly ExpedientesRepository expediente = new ExpedientesRepository();
        readonly ActividadesRepository actividad = new ActividadesRepository();
        DataTable lista_expedientes;

        protected void GridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["Id"] = GridView.Rows[GridView.SelectedIndex].Cells[4].Text;
            Session["expedientes"] = null;
            Response.Redirect("~/Empleado/ExpedientesDetail.aspx");
        }

        protected void GridView_Sorting(object sender, GridViewSortEventArgs e)
        {
            if (lista_expedientes != null)
            {
                if (Session["orden"] == null)
                    Session["orden"] = e.SortDirection;
                else
                    Session["orden"] = (SortDirection)Session["orden"] == SortDirection.Ascending ? SortDirection.Descending : SortDirection.Ascending;

                Session["campo"] = e.SortExpression;
                DataView dataView = lista_expedientes.DefaultView;
                dataView.Sort = e.SortExpression + " " + direccion((SortDirection)Session["orden"]);

                this.GridView.DataSource = null;
                this.GridView.DataBind();

                this.GridView.DataSource = dataView;
                this.GridView.DataBind();
            }
        }

        private string direccion(SortDirection dir)
        {
            string d = string.Empty;

            switch (dir)
            {
                case SortDirection.Ascending:
                    d = "ASC";
                    break;
                case SortDirection.Descending:
                    d = "DESC";
                    break;
            }
            return d;
        }

        protected void GridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.GridView.PageIndex = e.NewPageIndex;
            lista_expedientes = (DataTable)Session["expedientes"];
            this.GridView.DataSource = (DataTable)Session["expedientes"];
            this.GridView.DataBind();
        }

        protected void GridView_RowCreated(object sender, GridViewRowEventArgs e)
        {
            int sortColumnIndex = 0;

            if (e.Row.RowType == DataControlRowType.Header)
            {
                sortColumnIndex = GetSortColumnIndex();

                if (sortColumnIndex > 0)
                {
                    AddSortImage(sortColumnIndex, e.Row);
                }
            }
        }

        protected int GetSortColumnIndex()
        {
            int index = -1;
            Session["campo"] = Session["campo"] == null ? "" : Session["campo"];

            switch (Session["campo"].ToString())
            {
                case "Acción":
                    index = 0;
                    break;
                case "ID":
                    index = 1;
                    break;
                case "Expediente":
                    index = 2;
                    break;
                case "Juzgado":
                    index = 3;
                    break;
                case "Materia":
                    index = 4;
                    break;
                case "Estado":
                    index = 5;
                    break;
                case "Asunto":
                    index = 6;
                    break;
                case "Estatus":
                    index = 7;
                    break;
            }

            return index;
        }

        protected void AddSortImage(int columnIndex, GridViewRow HeaderRow)
        {
            Image sortImage = new Image();

            if (Session["orden"].ToString() == "Ascending")
            {
                sortImage.ImageUrl = "~/App_Themes/2uparrow.png";
                sortImage.AlternateText = " Orden ascendente";
            }
            else
            {
                sortImage.ImageUrl = "~/App_Themes/2downarrow.png";
                sortImage.AlternateText = " Orden descendente";
            }

            sortImage.Width = Unit.Pixel(15);
            sortImage.Height = Unit.Pixel(25);
            sortImage.ImageAlign = ImageAlign.AbsMiddle;

            HeaderRow.Cells[columnIndex].Controls.Add(sortImage);
        }

        protected void GridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Notificacion")
            {
                LinkButton lb = (LinkButton)e.CommandSource;
                int index = Convert.ToInt32(lb.CommandArgument);
                GridViewRow row = GridView.Rows[index];
                int expediente = Convert.ToInt32(row.Cells[4].Text);

                MembershipUser user = Membership.GetUser(Page.User.Identity.Name);
                actividad.noNotificacion(expediente, user.ProviderUserKey.ToString());
            }

            if (e.CommandName == "Historial")
            {
                LinkButton lb = (LinkButton)e.CommandSource;
                int index = Convert.ToInt32(lb.CommandArgument);
                GridViewRow row = GridView.Rows[index];
                int expediente = Convert.ToInt32(row.Cells[4].Text);

                Session["IdExp"] = expediente;
                Session["actividades"] = null;
                Response.Redirect("~/Empleado/ActividadesSummary.aspx");
            }

            if (e.CommandName == "Actividad")
            {
                LinkButton lb = (LinkButton)e.CommandSource;
                int index = Convert.ToInt32(lb.CommandArgument);
                GridViewRow row = GridView.Rows[index];
                int expediente = Convert.ToInt32(row.Cells[4].Text);

                Session["IdExp"] = expediente;
                Session["actividades"] = null;
                Session["Mode"] = 1;
                Response.Redirect("~/Empleado/ActividadesDetail.aspx");
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            Session["Mode"] = null;
            Session["expedientes"] = expediente.consulta(txtExpediente.Text, txtCliente.Text);

            lista_expedientes = (DataTable)Session["expedientes"];

            this.GridView.DataSource = lista_expedientes;
            this.GridView.DataBind();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session["Mode"] = 1;
            Response.Redirect("~/Empleado/ExpedientesDetail.aspx");
        }
    }
}