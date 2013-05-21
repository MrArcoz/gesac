<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TiposActividadSummary.aspx.cs" Inherits="GESAC.Empleado.TiposActividadSummary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">


&nbsp;<asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Nuevo</asp:LinkButton>
    <br />
    <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
    <br />
    <asp:GridView ID="GridView" runat="server" 
        CellPadding="4" ForeColor="#333333" GridLines="None" 
        onrowdeleting="GridView_RowDeleting" 
        onselectedindexchanged="GridView_SelectedIndexChanged" 
        ondatabound="GridView_DataBound" 
        ShowFooter="True" ShowHeaderWhenEmpty="True">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField DeleteText="Habilitar" HeaderText="Acción" 
                ShowDeleteButton="True" ShowSelectButton="True" />
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
