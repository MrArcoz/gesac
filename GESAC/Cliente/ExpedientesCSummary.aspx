<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ExpedientesCSummary.aspx.cs" Inherits="GESAC.Cliente.ExpedientesCSummary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style3
        {
            width: 95px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <p style="font-weight:bold">Listado de expedientes</p>
    <asp:GridView ID="GridView" runat="server" 
        CellPadding="4" ForeColor="#333333" GridLines="None" 
        onselectedindexchanged="GridView_SelectedIndexChanged" 
        ShowFooter="True" ShowHeaderWhenEmpty="True" AllowPaging="True" 
        AllowSorting="True" onpageindexchanging="GridView_PageIndexChanging" 
        onrowcreated="GridView_RowCreated" onsorting="GridView_Sorting" 
        onrowcommand="GridView_RowCommand" onrowdatabound="GridView_RowDataBound">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField DeleteText="Habilitar" HeaderText="Detalles" 
                ShowSelectButton="True" NewText="No Info" ShowHeader="True" 
                ShowInsertButton="False" SelectText="Ver" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:CommandField>
            <asp:TemplateField HeaderText="Actividades">
                <ItemTemplate>
                    <asp:LinkButton ID="det" CommandName="Actividades" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" runat="server" CausesValidation="false">Ver</asp:LinkButton>
                </ItemTemplate>
                <ControlStyle ForeColor="#333333" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            No hay información
        </EmptyDataTemplate>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerSettings Mode="NumericFirstLast" />
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
