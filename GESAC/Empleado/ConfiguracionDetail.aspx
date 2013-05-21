<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ConfiguracionDetail.aspx.cs" Inherits="GESAC.Empleado.ConfiguracionDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
<p></p>
    <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataKeyNames="ID" 
        DataSourceID="SqlDSConfiguracion" ForeColor="#333333" Height="210px" 
        Width="231px">
        <EditItemTemplate>
            <table>
                <tr><td>ID</td><td><asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' /></td></tr>
                <tr><td>Descripción</td><td><asp:TextBox ID="DescripcionTextBox" runat="server" Text='<%# Bind("Descripcion") %>' /></td></tr>
                <tr><td>Valor</td><td><asp:CheckBox ID="ValorCheckBox" runat="server" Checked='<%# Bind("Valor") %>' /></td></tr>
                <tr><td colspan="2"><asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Actualizar" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancelar" /></td></tr>
            </table>
        </EditItemTemplate>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <InsertItemTemplate>
            <table>
                <tr><td>Descripción</td><td><asp:TextBox ID="DescripcionTextBox" runat="server" Text='<%# Bind("Descripcion") %>' /></td></tr>
                <tr><td>Valor</td><td><asp:CheckBox ID="ValorCheckBox" runat="server" Checked='<%# Bind("Valor") %>' /></td></tr>
                <tr><td colspan="2"><asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insertar" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancelar" /></td></tr>
            </table>
        </InsertItemTemplate>
        <ItemTemplate>
            <table>
                <tr><td>ID</td><td><asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' /></td></tr>
                <tr><td>Descripción</td><td><asp:Label ID="DescripcionLabel" runat="server" Text='<%# Bind("Descripcion") %>' /></td></tr>
                <tr><td>Valor</td><td><asp:CheckBox ID="ValorCheckBox" runat="server" Checked='<%# Bind("Valor") %>' Enabled="false" /></td></tr>
                <tr><td colspan="2"><asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Editar" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Eliminar" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="Nuevo" />&nbsp;
                    <asp:LinkButton ID="BackButton" runat="server" CausesValidation="False" 
                        PostBackUrl="javascript:history.go(-1)">Regresar</asp:LinkButton></td></tr>
            </table>
        </ItemTemplate>
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDSConfiguracion" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        DeleteCommand="UPDATE TConfiguracion SET Valor = 0 WHERE (ID = @ID)" 
        InsertCommand="INSERT INTO TConfiguracion(Descripcion, Valor) VALUES (@Descripcion, @Valor)" 
        SelectCommand="SELECT ID, Descripcion, Valor FROM TConfiguracion WHERE (ID = @ID)" 
        UpdateCommand="UPDATE TConfiguracion SET Descripcion = @Descripcion, Valor = @Valor WHERE (ID = @ID)">
        <DeleteParameters>
            <asp:Parameter Name="ID" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Descripcion" />
            <asp:Parameter Name="Valor" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="ID" SessionField="Id" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Descripcion" />
            <asp:Parameter Name="Valor" />
            <asp:Parameter Name="ID" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </p>
    </asp:Content>
