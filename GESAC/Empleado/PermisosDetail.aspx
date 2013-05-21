<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PermisosDetail.aspx.cs" Inherits="GESAC.Empleado.PermisosDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
<p></p>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="IdPermiso" 
        DataSourceID="SqlDSPermisos" CellPadding="4" ForeColor="#333333" 
        Height="210px" Width="231px">
        <EditItemTemplate>
            <table>
                <tr><td>ID Permiso</td><td><asp:Label ID="IdPermisoLabel1" runat="server" Text='<%# Eval("IdPermiso") %>' /></td></tr>
                <tr><td>Permiso</td><td><asp:TextBox ID="PermisoTextBox" runat="server" Text='<%# Bind("Permiso") %>' /></td></tr>
                <tr><td>Estatus</td><td><asp:CheckBox ID="EstatusCheckBox" runat="server" Checked='<%# Bind("Estatus") %>' /></td></tr>
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
                <tr><td>Permiso</td><td><asp:TextBox ID="PermisoTextBox" runat="server" Text='<%# Bind("Permiso") %>' /></td></tr>
                <tr><td>Estatus</td><td><asp:CheckBox ID="EstatusCheckBox" runat="server" Checked='<%# Bind("Estatus") %>' /></td></tr>
                <tr><td colspan="2"><asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insertar" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancelar" /></td></tr>
            </table>
        </InsertItemTemplate>
        <ItemTemplate>
            <table>
                <tr><td>ID Permiso</td><td><asp:Label ID="IdPermisoLabel" runat="server" Text='<%# Eval("IdPermiso") %>' /></td></tr>
                <tr><td>Permiso</td><td><asp:Label ID="PermisoLabel" runat="server" Text='<%# Bind("Permiso") %>' /></td></tr>
                <tr><td>Estatus</td><td><asp:CheckBox ID="EstatusCheckBox" runat="server" Checked='<%# Bind("Estatus") %>' Enabled="false" /></td></tr>
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
    <asp:SqlDataSource ID="SqlDSPermisos" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        DeleteCommand="UPDATE [TPermisos] SET [Estatus] = 0 WHERE [IdPermiso] = @original_IdPermiso" 
        InsertCommand="INSERT INTO [TPermisos] ([Permiso], [Estatus]) VALUES (@Permiso, @Estatus)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [TPermisos] WHERE ([IdPermiso] = @IdPermiso)" 
        UpdateCommand="UPDATE [TPermisos] SET [Permiso] = @Permiso, [Estatus] = @Estatus WHERE [IdPermiso] = @original_IdPermiso AND (([Permiso] = @original_Permiso) OR ([Permiso] IS NULL AND @original_Permiso IS NULL)) AND (([Estatus] = @original_Estatus) OR ([Estatus] IS NULL AND @original_Estatus IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_IdPermiso" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Permiso" Type="String" />
            <asp:Parameter Name="Estatus" Type="Boolean" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="IdPermiso" SessionField="Id" 
                Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Permiso" Type="String" />
            <asp:Parameter Name="Estatus" Type="Boolean" />
            <asp:Parameter Name="original_IdPermiso" Type="Int32" />
            <asp:Parameter Name="original_Permiso" Type="String" />
            <asp:Parameter Name="original_Estatus" Type="Boolean" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
