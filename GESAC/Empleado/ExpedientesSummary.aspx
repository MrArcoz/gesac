<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ExpedientesSummary.aspx.cs" Inherits="GESAC.Empleado.ExpedientesSummary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style3
        {
            width: 95px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
<p></p>
<p>
<table style="width: 560px">
<tr><td class="style3">EXPEDIENTE</td><td>
    <asp:TextBox ID="txtExpediente" runat="server" Height="18px" Width="455px" 
        BackColor="#FFFFCC"></asp:TextBox>
    </td></tr>
<tr><td class="style3">CLIENTE</td><td>
    <asp:TextBox ID="txtCliente" runat="server" Height="18px" Width="455px" 
        BackColor="#FFFFCC"></asp:TextBox>
    </td></tr>
    <tr><td></td><td>
        <asp:Button ID="btnBuscar" runat="server" onclick="btnBuscar_Click" 
            Text="Buscar" />
        </td></tr>
</table>
</p>   
<p>
    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Nuevo</asp:LinkButton>
    <br />
    <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
    </p>
    <asp:GridView ID="GridView" runat="server" 
        CellPadding="4" ForeColor="#333333" GridLines="None" 
        onselectedindexchanged="GridView_SelectedIndexChanged" 
        ShowFooter="True" ShowHeaderWhenEmpty="True" AllowPaging="True" 
        AllowSorting="True" onpageindexchanging="GridView_PageIndexChanging" 
        onrowcreated="GridView_RowCreated" onsorting="GridView_Sorting" 
        onrowcommand="GridView_RowCommand">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField DeleteText="Habilitar" HeaderText="Acción" 
                ShowSelectButton="True" NewText="No Info" ShowHeader="True" 
                ShowInsertButton="False" />
            <asp:TemplateField HeaderText="Notificación">
                <ItemTemplate>
                    <asp:LinkButton ID="det" CommandName="Notificacion" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" runat="server" CausesValidation="false">No Hay</asp:LinkButton>
                </ItemTemplate>
                <ControlStyle ForeColor="#333333" />
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
