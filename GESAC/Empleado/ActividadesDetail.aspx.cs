﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace GESAC.Empleado
{
    public partial class ActividadesDetail : System.Web.UI.Page
    {
        GCalendar gc = new GCalendar();
        ActividadesRepository ar = new ActividadesRepository();

        protected void Page_Load(object sender, EventArgs e)
        {
            MembershipUser user = Membership.GetUser(Page.User.Identity.Name);
            if (Session["Mode"] != null) this.FormView1.ChangeMode(FormViewMode.Insert);
            Session["IdUserCaptura"] = user.ProviderUserKey.ToString().ToUpper();
            if (Session["IdExp"] != null)
            {
                DropDownList ddl = FormView1.FindControl("IdExpedienteDropDownList") as DropDownList;
                ddl.SelectedValue = Session["IdExp"].ToString();
            }
        }

        protected void SqlDSActividades_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            Int32 IdActividad = Int32.Parse(e.Command.Parameters["@NewID"].Value.ToString());
            String TipoActividad = e.Command.Parameters["@IdTipo"].Value.ToString();
            if (TipoActividad.Equals("AU") || TipoActividad.Equals("TE"))
            {
                String TipoActividadDescrip = String.Empty;
                switch (TipoActividad)
                {
                    case "AU":
                        TipoActividadDescrip = "Audiencia";
                        break;
                    case "TE":
                        TipoActividadDescrip = "Término";
                        break;
                }

                String Lugar = String.Empty;
                DateTime Inicio = DateTime.Parse(e.Command.Parameters["@FechaVencimiento"].Value.ToString());
                Double Duracion = 1;
                String Asunto = String.Format("{0} - {1}", IdActividad, TipoActividadDescrip);
                String Contenido = String.Format("{0} OBSERVACIONES: {1}", e.Command.Parameters["@Descripcion"].Value.ToString(), e.Command.Parameters["@Observaciones"].Value.ToString());
                IList<Participantes> Participantes = ar.participantes(IdActividad).ToList();

                gc.addEvent(Lugar, Inicio, Duracion, Asunto, Contenido, Participantes);
            }
        }

        protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            if (e.Values["IdTipo"].Equals("AC"))
            {
                e.Values["FechaAcuerdo"] = "01/01/1900";
                e.Values["FechaPublicacion"] = "01/01/1900";
            }
        }
    }
}