﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ExpedientesCDetail.aspx.cs" Inherits="GESAC.Cliente.ExpedientesCDetail" %>
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
        Detalle del expediente</p>
    <asp:FormView ID="FormView1" runat="server" CellPadding="4" 
        DataKeyNames="IDExpediente" DataSourceID="SqlDSExpedientes" ForeColor="#333333">
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <ItemTemplate>
            <table style="width: 551px">
	            <tr><td class="style4">ID Expediente</td><td><asp:Label ID="IDExpedienteLabel" runat="server" Text='<%# Eval("IDExpediente") %>' /></td></tr>
	            <tr><td class="style4">Número Expediente</td><td><asp:Label ID="NoExpedienteLabel" runat="server" Text='<%# Bind("NoExpediente") %>' /></td></tr>
	            <tr><td class="style4">Número Juzgado</td><td>
                    <asp:DropDownList ID="NoJuzgadoDropDownList" runat="server"
                 DataValueField="NoJuzgado" DataSourceID="JuzgadosDataSource"
                 DataTextField="Juzgado" SelectedValue='<%# Bind("NoJuzgado") %>' 
                        Enabled="False" />

                <asp:SqlDataSource ID="JuzgadosDataSource" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                 SelectCommand="SELECT TJuzgado.NoJuzgado, ISNULL(TJuzgado.Juzgado, '') + ' ' + ISNULL(TMateria.Materia, '') + ' ' + ISNULL(TEstados.Estado, '') AS Juzgado FROM TJuzgado LEFT OUTER JOIN TMateria ON TJuzgado.IdMateria = TMateria.IdMateria LEFT OUTER JOIN TEstados ON TJuzgado.IdEstado = TEstados.IdEstado WHERE (TJuzgado.Estatus = 1) ORDER BY TEstados.Estado, TMateria.Materia, TJuzgado.NoJuzgado"/></td></tr>
	            <tr><td class="style4">Año</td><td><asp:Label ID="AñoLabel" runat="server" Text='<%# Bind("Año") %>' /></td></tr>
	            <tr><td class="style4">Fecha Captura</td><td><asp:Label ID="FechaCapturaLabel" runat="server" Text='<%# Bind("FechaCaptura") %>' /></td></tr>
	            <tr><td class="style4">Tipo</td><td>
                    <asp:DropDownList ID="IdTipoDropDownList" runat="server"
                 DataValueField="IDTipo" DataSourceID="TiposDataSource"
                 DataTextField="Juicio" SelectedValue='<%# Bind("IdTipo") %>' Enabled="False" />

                <asp:SqlDataSource ID="TiposDataSource" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                 SelectCommand="SELECT NULL IDTipo, '_No Asignado' Juicio
UNION
SELECT t.IDTipo, t.Juicio FROM TTipo AS t WHERE t.Estatus = 1 ORDER BY Juicio"/></td></tr>
	            <tr><td class="style4">Estatus</td><td>
                    <asp:DropDownList ID="IdStatusDropDownList" runat="server"
                 DataValueField="IdStatus" DataSourceID="StatusDataSource"
                 DataTextField="Status" SelectedValue='<%# Bind("IdStatus") %>' Enabled="False" />

                <asp:SqlDataSource ID="StatusDataSource" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                 SelectCommand="SELECT t.IdStatus, t.Status FROM TStatus AS t WHERE t.Estatus = 1 ORDER BY t.Status"/></td></tr>
	            <tr><td class="style4">Autorizados</td><td><asp:Label ID="AutorizadosLabel" runat="server" Text='<%# Bind("Autorizados") %>' /></td></tr>
	            <tr><td class="style4">Actores</td><td><asp:Label ID="ActoresLabel" runat="server" Text='<%# Bind("Actores") %>' /></td></tr>
	            <tr><td class="style4">Demandados</td><td><asp:Label ID="DemandadosLabel" runat="server" Text='<%# Bind("Demandados") %>' /></td></tr>
	            <tr><td class="style4">Estado</td><td>
                    <asp:DropDownList ID="IdEstadoDropDownList" runat="server"
                 DataValueField="IdEstado" DataSourceID="EstadosDataSource"
                 DataTextField="Estado" SelectedValue='<%# Bind("IdEstado") %>' Enabled="False" />

                <asp:SqlDataSource ID="EstadosDataSource" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                 SelectCommand="SELECT t.IdEstado, t.Estado FROM TEstados AS t WHERE t.Estatus = 1 ORDER BY t.Estado"/></td></tr>
	            <tr><td class="style4">Asunto</td><td><asp:Label ID="AsuntoLabel" runat="server" Text='<%# Bind("Asunto") %>' /></td></tr>
	            <tr><td class="style4">Materia</td><td><asp:DropDownList ID="IdMateriaDropDownList" runat="server"
                 DataValueField="IdMateria" DataSourceID="MateriasDataSource"
                 DataTextField="Materia" SelectedValue='<%# Bind("IdMateria") %>' 
                        Enabled="False" />

                <asp:SqlDataSource ID="MateriasDataSource" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                 SelectCommand="SELECT t.IdMateria, t.Materia FROM TMateria AS t WHERE t.Estatus = 1 ORDER BY t.Materia"/></td></tr>
	            <tr><td class="style4">Domicilio</td><td><asp:Label ID="DomicilioLabel" runat="server" Text='<%# Bind("Domicilio") %>' /></td></tr>
	            <tr><td class="style4">Titular</td><td><asp:DropDownList ID="TitularesDropDownList" runat="server"
                 DataValueField="UserId" DataSourceID="TitularesDataSource"
                 DataTextField="Comment" SelectedValue='<%# Bind("IdTitular") %>' Enabled="false" />

                <asp:SqlDataSource ID="TitularesDataSource" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                 SelectCommand="SELECT UPPER(am.UserId) UserId, am.Comment FROM aspnet_Roles AS ar INNER JOIN aspnet_UsersInRoles AS aur ON ar.RoleId = aur.RoleId INNER JOIN aspnet_Users AS au ON aur.UserId = au.UserId INNER JOIN aspnet_Membership AS am ON au.UserId = am.UserId WHERE (ar.LoweredRoleName = N'empleado')"/></td></tr>
	            <tr>
                    <td class="style4">
                        Cliente</td>
                    <td>
                        <asp:DropDownList ID="ClienteDropDownList" runat="server" 
                            DataSourceID="ClientesDataSource" DataTextField="Comment" 
                            DataValueField="UserId" SelectedValue='<%# Bind("IdCliente") %>' Enabled="False">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="ClientesDataSource" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                            SelectCommand="SELECT UPPER(am.UserId) UserId, am.Comment FROM aspnet_Roles AS ar INNER JOIN aspnet_UsersInRoles AS aur ON ar.RoleId = aur.RoleId INNER JOIN aspnet_Users AS au ON aur.UserId = au.UserId INNER JOIN aspnet_Membership AS am ON au.UserId = am.UserId WHERE (ar.LoweredRoleName = N'cliente')"></asp:SqlDataSource>
                    </td>
                </tr>
	            <tr><td colspan="2"><asp:LinkButton ID="BackButton" runat="server" CausesValidation="False" 
                        PostBackUrl="javascript:history.go(-1)">Regresar</asp:LinkButton>
                    </td></tr>
            </table>
        </ItemTemplate>
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDSExpedientes" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        SelectCommand="SELECT IDExpediente, NoExpediente, NoJuzgado, Año, FechaCaptura, IdTipo, IdStatus, Autorizados, Actores, Demandados, IdEstado, Asunto, IdMateria, Domicilio, IdTitular, IdCliente FROM TExpediente WHERE (IDExpediente = @IDExpediente)" >
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="IDExpediente" SessionField="Id" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
