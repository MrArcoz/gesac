<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ActividadesCDetail.aspx.cs" Inherits="GESAC.Cliente.ActividadesCDetail" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style4
        {
            width: 150px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <p style="font-weight:bold">
        Detalle de la actividad</p>
    <asp:FormView ID="FormView1" runat="server" CellPadding="4" 
        DataKeyNames="IdActividad" DataSourceID="SqlDSActividades" 
        ForeColor="#333333" >
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <ItemTemplate>
            <table style="width:551px">
                <tr>
                    <td class="style4">Id Actividad</td>
                    <td><asp:Label ID="IdActividadLabel" runat="server" Text='<%# Eval("IdActividad") %>' /></td>
                </tr>
                <tr>
                    <td class="style4">Expediente</td>
                    <td><asp:DropDownList ID="IdExpedienteDropDownList1" runat="server" 
                            DataSourceID="SqlDSExpedientes" DataTextField="Expediente" 
                            DataValueField="IDExpediente" SelectedValue='<%# Bind("IdExpediente") %>' 
                            Enabled="False" >
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="style4">Fecha Vencimiento</td>
                    <td><asp:Label ID="FechaVencimientoLabel" runat="server" Text='<%# Bind("FechaVencimiento") %>' /></td>
                </tr>
                <tr>
                    <td class="style4">Usuario Asignado</td>
                    <td><asp:DropDownList ID="IdUsuarioDropDownList" runat="server" 
                            DataSourceID="SqlDSUsuarios" DataTextField="Comment" DataValueField="UserId" 
                            Enabled="False" SelectedValue='<%# Bind("IdUsuario") %>'>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="style4">Estatus</td>
                    <td><asp:DropDownList ID="IdEstatusDropDownList" runat="server" 
                            DataSourceID="SqlDSEstatus" DataTextField="Status" DataValueField="IdStatus" 
                            Enabled="False" SelectedValue='<%# Bind("IdStatus") %>'>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="style4">Descripción</td>
                    <td><asp:Label ID="DescripcionLabel" runat="server" 
                            Text='<%# Bind("Descripcion") %>' CssClass="justify" /></td>
                </tr>
                <tr>
                    <td class="style4">Observaciones</td>
                    <td><asp:Label ID="ObservacionesLabel" runat="server" 
                            Text='<%# Bind("Observaciones") %>' CssClass="justify" /></td>
                </tr>
                <tr>
                    <td class="style4">Fecha Captura</td>
                    <td><asp:Label ID="FechaCapturaLabel" runat="server" Text='<%# Bind("FechaCaptura") %>' /></td>
                </tr>
                <tr>
                    <td class="style4">Fecha Acuerdo</td>
                    <td><asp:Label ID="FechaAcuerdoLabel" runat="server" Text='<%# Bind("FechaAcuerdo") %>' /></td>
                </tr>
                <tr>
                    <td class="style4">Fecha Publicación</td>
                    <td><asp:Label ID="FechaPublicacionLabel" runat="server" Text='<%# Bind("FechaPublicacion") %>' /></td>
                </tr>
                <tr>
                    <td class="style4">Tipo Actividad</td>
                    <td><asp:DropDownList ID="IdTipoDropDownList" runat="server" 
                            DataSourceID="SqlDSTiposActividad" DataTextField="TipoActividad" 
                            DataValueField="IdTipoActividad" Enabled="False" SelectedValue='<%# Bind("IdTipo") %>'>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="style4" height="0">Usuario Captura</td>
                    <td height="0"><asp:DropDownList ID="IdUserCapturaDropDownList" runat="server" 
                            DataSourceID="SqlDSUsuarios" DataTextField="Comment" DataValueField="UserId" 
                            Enabled="False" SelectedValue='<%# Bind("IdUserCaptura") %>'>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="style4">Fecha Inicio</td>
                    <td><asp:Label ID="FechaInicioLabel" runat="server" Text='<%# Bind("FechaInicio") %>' /></td>
                </tr>
                <tr>
                    <td class="style4">Avance</td>
                    <td><asp:Label ID="AvanceLabel" runat="server" Text='<%# Bind("Avance") %>' /></td>
                </tr>
                <tr>
                    <td class="style4">Proyecto</td>
                    <td><asp:DropDownList ID="IdProyectoDropDownList" runat="server" 
                            DataSourceID="SqlDSProyectos" DataTextField="Proyecto" 
                            DataValueField="IdProyecto" Enabled="False" SelectedValue='<%# Bind("IdProyecto") %>'>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td colspan="2"><asp:LinkButton ID="BackButton" runat="server" CausesValidation="False" 
                        PostBackUrl="javascript:history.go(-1)">Regresar</asp:LinkButton></td>
                </tr>
            </table>
        </ItemTemplate>
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDSActividades" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        SelectCommand="SELECT * FROM [TActividades] WHERE ([IdActividad] = @IdActividad)" >
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="IdActividad" SessionField="Id" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDSExpedientes" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        
        SelectCommand="SELECT NULL IDExpediente, '_No Aplica' Expediente
UNION
SELECT IDExpediente, dbo.ufn_getExpedienteName(IDExpediente) AS Expediente FROM TExpediente ORDER BY Expediente">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDSUsuarios" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        SelectCommand="SELECT upper(UserId) UserId, Comment FROM aspnet_Membership ORDER BY CONVERT(varchar(MAX), Comment)">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDSEstatus" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        SelectCommand="SELECT IdStatus, Status FROM TStatus WHERE Estatus = 1 ORDER BY Status">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDSTiposActividad" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        SelectCommand="SELECT IdTipoActividad, TipoActividad FROM TTipoActividad WHERE Estatus = 1 ORDER BY TipoActividad">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDSProyectos" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        SelectCommand="SELECT IdProyecto, Proyecto FROM TProyectos WHERE Estatus = 1 ORDER BY Proyecto">
    </asp:SqlDataSource>
    <asp:ScriptManager ID="ScriptManager" runat="server"  EnableScriptGlobalization="True" />
</asp:Content>
