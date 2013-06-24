using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
//using System.Drawing;
using System.Data;
using System.Web.Security;

namespace GESAC.Empleado
{
    public partial class ActividadesSummary : System.Web.UI.Page
    {
        readonly ActividadesRepository actividad = new ActividadesRepository();
        DataTable lista_actividades;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IdExp"] != null)
            {
                MembershipUser user = Membership.GetUser(Page.User.Identity.Name);
                this.ExpedienteTextBox.Text = Session["IdExp"].ToString();
                this.UsuarioDropDownList.SelectedValue = user.ProviderUserKey.ToString().ToUpper();
                this.FechaFinTextBox.Text = DateTime.Today.ToShortDateString();
                this.FechaInicioTextBox.Text = DateTime.Today.AddYears(-1).ToShortDateString();
            }
            else
            {
                Session["Mode"] = null;
                if (Session["actividades"] != null)
                    lista_actividades = (DataTable)Session["actividades"];
            }
            Session["IdExp"] = null;
        }

        protected void GridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["Id"] = ((GridView)sender).SelectedRow.Cells[1].Text;
            Session["actividades"] = null;
            Response.Redirect("~/Empleado/ActividadesDetail.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session["Mode"] = 1;
            Response.Redirect("~/Empleado/ActividadesDetail.aspx");
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            MembershipUser user = Membership.GetUser(Page.User.Identity.Name);
            Session["actividades"] = actividad.consulta(Page.User.IsInRole("Administrador") ? this.UsuarioDropDownList.SelectedItem.Value.Trim() : user.ProviderUserKey.ToString().ToUpper(), this.EstatusDropDownList.SelectedValue, Convert.ToDateTime(this.FechaInicioTextBox.Text), Convert.ToDateTime(this.FechaFinTextBox.Text), String.IsNullOrEmpty(this.ExpedienteTextBox.Text.Trim()) ? -1 : Convert.ToInt32(this.ExpedienteTextBox.Text.Trim()));
            lista_actividades = (DataTable)Session["actividades"];

            this.GridView.DataSource = lista_actividades;
            this.GridView.DataBind();
        }

        protected void GridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.GridView.PageIndex = e.NewPageIndex;
            lista_actividades = (DataTable)Session["actividades"];
            this.GridView.DataSource = (DataTable)Session["actividades"];
            this.GridView.DataBind();
        }

        protected void GridView_Sorting(object sender, GridViewSortEventArgs e)
        {
            if (lista_actividades != null)
            {
                if (Session["orden"] == null)
                    Session["orden"] = e.SortDirection;
                else
                    Session["orden"] = (SortDirection)Session["orden"] == SortDirection.Ascending ? SortDirection.Descending : SortDirection.Ascending;

                Session["campo"] = e.SortExpression;
                DataView dataView = lista_actividades.DefaultView;
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
                case "FechaVencimiento":
                    index = 3;
                    break;
                case "Usuario":
                    index = 4;
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

        protected void GridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[10].Text = DateTime.Parse(e.Row.Cells[10].Text).ToShortDateString();
                e.Row.Cells[11].Text = DateTime.Parse(e.Row.Cells[11].Text).ToShortDateString();
                e.Row.Cells[12].Text = DateTime.Parse(e.Row.Cells[12].Text).ToShortDateString();
                e.Row.Cells[13].Text = DateTime.Parse(e.Row.Cells[13].Text).ToShortDateString();
            }
        }
    }
}

