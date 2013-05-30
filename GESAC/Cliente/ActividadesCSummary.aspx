<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ActividadesCSummary.aspx.cs" Inherits="GESAC.Cliente.ActividadesCSummary" %>
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
        </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <p style="font-weight:bold">Listado de actividades<br />
    <asp:LinkButton ID="BackButton" runat="server" CausesValidation="False" 
                        PostBackUrl="~\Cliente\ExpedientesCSummary.aspx">Regresar</asp:LinkButton></p>
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
