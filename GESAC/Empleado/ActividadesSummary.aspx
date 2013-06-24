<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ActividadesSummary.aspx.cs" Inherits="GESAC.Empleado.ActividadesSummary" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
    .style3
    {
            width: 227px;
        }
        .style5
        {
            width: 80px;
        }
        .style6
        {
            width: 170px;
        }
        .style7
        {
            width: 80px;
            height: 15px;
        }
        .style8
        {
            width: 170px;
            height: 15px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <p></p>
<p>
<table>
<tr><td class="style5">ESTATUS</td><td class="style6">
    <asp:DropDownList ID="EstatusDropDownList" runat="server" 
        DataSourceID="SqlDSEstatus" DataTextField="Status" 
        DataValueField="IdStatus" Width="135px" BackColor="#FFFFCC">
    </asp:DropDownList>
    </td>
    <td rowspan="5" class="style3" style="vertical-align:middle">
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
            CssClass="failureNotification" BackColor="#FFFFCC" BorderColor="#FFCC00" 
            BorderStyle="Dashed" BorderWidth="1px" DisplayMode="List" />
    </td>
        </tr>
<tr><td class="style5">FECHA INICIO</td><td class="style6">
    <asp:TextBox ID="FechaInicioTextBox" runat="server" Width="128px" 
        BackColor="#FFFFCC"></asp:TextBox>
    <asp:CalendarExtender ID="FechaInicioTextBox_CalendarExtender" runat="server" 
        TargetControlID="FechaInicioTextBox">
    </asp:CalendarExtender>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="FechaInicioTextBox" CssClass="failureNotification" 
        ErrorMessage="Ingresar la fecha de inicio">*</asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
        runat="server" ControlToValidate="FechaInicioTextBox" 
        CssClass="failureNotification" ErrorMessage="Fecha incorrecta" 
        ValidationExpression="^(?:(?:0?[1-9]|1\d|2[0-8])(\/|-)(?:0?[1-9]|1[0-2]))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^(?:(?:31(\/|-)(?:0?[13578]|1[02]))|(?:(?:29|30)(\/|-)(?:0?[1,3-9]|1[0-2])))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^(29(\/|-)0?2)(\/|-)(?:(?:0[48]00|[13579][26]00|[2468][048]00)|(?:\d\d)?(?:0[48]|[2468][048]|[13579][26]))$">*</asp:RegularExpressionValidator>
    </td></tr>
    <tr><td class="style5">FECHA FIN</td><td class="style6">
        <asp:TextBox ID="FechaFinTextBox" runat="server" Width="128px" 
            BackColor="#FFFFCC"></asp:TextBox>
        <asp:CalendarExtender ID="FechaFinTextBox_CalendarExtender" runat="server" 
            TargetControlID="FechaFinTextBox">
        </asp:CalendarExtender>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="FechaFinTextBox" CssClass="failureNotification" 
            ErrorMessage="Ingresar la fecha fin">*</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
            ControlToValidate="FechaFinTextBox" CssClass="failureNotification" 
            ErrorMessage="Fecha incorrecta" 
            ValidationExpression="^(?:(?:0?[1-9]|1\d|2[0-8])(\/|-)(?:0?[1-9]|1[0-2]))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^(?:(?:31(\/|-)(?:0?[13578]|1[02]))|(?:(?:29|30)(\/|-)(?:0?[1,3-9]|1[0-2])))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^(29(\/|-)0?2)(\/|-)(?:(?:0[48]00|[13579][26]00|[2468][048]00)|(?:\d\d)?(?:0[48]|[2468][048]|[13579][26]))$">*</asp:RegularExpressionValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" 
            ControlToCompare="FechaInicioTextBox" ControlToValidate="FechaFinTextBox" 
            CssClass="failureNotification" 
            ErrorMessage="La fecha fin debe ser mayor a la fecha de inicio" 
            Operator="GreaterThanEqual" Type="Date">*</asp:CompareValidator>
    </td></tr>
    <%if (Page.User.IsInRole("Administrador"))
      {%>
        <tr>
            <td class="style7">
                USUARIO
            </td>
            <td class="style8">
                <asp:DropDownList ID="UsuarioDropDownList" runat="server" 
                    DataSourceID="SqlDSUsuarios" DataTextField="Comment" 
                    DataValueField="UserId" Width="135px" BackColor="#FFFFCC"/>
            </td>
        </tr>
    <%} %>
    <tr><td class="style5">EXPEDIENTE</td><td class="style6">
        <asp:TextBox ID="ExpedienteTextBox" runat="server" Width="128px" 
            BackColor="#FFFFCC"></asp:TextBox></td></tr>
    <tr><td class="style5">
        <asp:ScriptManager ID="ScriptManager" runat="server" 
            EnableScriptGlobalization="True">
        </asp:ScriptManager>
        </td><td class="style6" align="right">
        <asp:Button ID="btnBuscar" runat="server" onclick="btnBuscar_Click" 
            Text="Buscar" />
        </td><td rowspan="1" class="style3">
            <asp:SqlDataSource ID="SqlDSEstatus" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                SelectCommand="SELECT 'TODOS' AS IdStatus, '_Todos' AS Status UNION SELECT IdStatus, Status FROM TStatus WHERE (Estatus = 1) ORDER BY Status" />

            <asp:SqlDataSource ID="SqlDSUsuarios" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                SelectCommand="SELECT 'TODOS' AS UserId, '_Todos' AS Comment UNION SELECT CONVERT(VARCHAR(MAX), UserId), CONVERT(VARCHAR(MAX), Comment) FROM aspnet_Membership ORDER BY Comment" />
        </td></tr>
</table>
</p>   
<p>
    <asp:LinkButton ID="LinkButton1" runat="server" Text="Nuevo" 
        onclick="LinkButton1_Click" CausesValidation="False" /> 
    </p>
    <asp:GridView ID="GridView" runat="server" 
        CellPadding="4" ForeColor="#333333" GridLines="None" 
        onselectedindexchanged="GridView_SelectedIndexChanged" 
        ShowFooter="True" ShowHeaderWhenEmpty="True" AllowPaging="True" 
        AllowSorting="True" 
        onpageindexchanging="GridView_PageIndexChanging" 
        onsorting="GridView_Sorting" onrowcreated="GridView_RowCreated" 
        onrowdatabound="GridView_RowDataBound">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField DeleteText="Habilitar" HeaderText="Acción" 
                ShowSelectButton="True" />
        </Columns>
        <EmptyDataTemplate>
            No hay información
        </EmptyDataTemplate>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>
    <br />
    <br />
</asp:Content>
