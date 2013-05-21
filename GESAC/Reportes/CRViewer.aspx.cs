using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using System.Data;
using System.Data.SqlClient;

namespace GESAC.Reportes
{
    public partial class CRViewer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int TipoReporte = Convert.ToInt16(Request.QueryString["rpt"]);
            string cadena_cn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ToString();
            SqlConnection cn = new SqlConnection(cadena_cn);

            try
            {
                var ds = new DataSet();
                ReportDocument reporte = new ReportDocument();

                if (TipoReporte >= 1 && TipoReporte <= 6)
                {
                    using (var cmd = new SqlCommand("SELECT * FROM VActividades", cn))
                    {
                        using (var da = new SqlDataAdapter(cmd))
                        {
                            da.Fill(ds, "VActividades");
                        }
                    }
                }

                switch (TipoReporte)
                {
                    case 1:
                        reporte = new Reportes.ActividadesDelDiarpt();
                        break;
                    case 2:
                         reporte = new Reportes.ActividadesPorAbogadorpt();
                        break;
                    case 3:
                         reporte = new Reportes.ActividadesPorTitular();
                        break;
                    case 4:
                         reporte = new Reportes.AudienciasYTerminosrpt();
                        break;
                    case 5:
                        using (var com = new SqlCommand("SELECT * FROM VExpedientes", cn))
                        {
                            using (var ad = new SqlDataAdapter(com))
                            {
                                ad.Fill(ds, "VExpedientes");
                            }
                        }
                        reporte = new Reportes.HistorialExpedienteRpt();
                        break;
                    case 6:
                         reporte = new Reportes.NotificacionesRpt();
                        break;
                    case 7:
                        using (var com = new SqlCommand("SELECT * FROM VRevisiones", cn))
                        {
                            using (var ad = new SqlDataAdapter(com))
                            {
                                ad.Fill(ds, "VRevisiones");
                            }
                        }
                        reporte = new Reportes.RevisionExpedientes();
                        break;
                }
                reporte.SetDataSource(ds);
                CrystalReportViewer.ReportSource = reporte;
            }
            catch (Exception ex)
            {
            }
            finally
            {
                if (cn.State != ConnectionState.Closed)
                    cn.Close();
                cn.Dispose();
            }
        }
    }
}