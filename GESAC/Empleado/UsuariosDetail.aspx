<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UsuariosDetail.aspx.cs" Inherits="GESAC.Empleado.UsuariosDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
<p></p>
    <asp:FormView ID="FormView1" runat="server" CellPadding="4" 
        DataKeyNames="IdUser" DataSourceID="SqlDSUsuarios" ForeColor="#333333" 
        Width="231px" Height="210px">
        <EditItemTemplate>
            <table>
                <tr><td>ID Usuario</td><td><asp:Label ID="IdUserLabel1" runat="server" Text='<%# Eval("IdUser") %>' /></td></tr>
                <tr><td>Nombre</td><td><asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>' /></td></tr>
                <tr><td>Tipo</td><td><asp:DropDownList ID="IdTipoPersonaDropDownList" runat="server"
                 DataValueField="IdTipoPersona" DataSourceID="TiposPersonaDataSource"
                 DataTextField="TipoPersona" SelectedValue='<%# Bind("Tipo") %>' />

                <asp:SqlDataSource ID="TiposPersonaDataSource" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                 SelectCommand="SELECT IdTipoPersona, TipoPersona FROM TtipoPersona WHERE (Estatus = 1) ORDER BY TipoPersona"/></td></tr>
                <tr><td>Contraseña</td><td><asp:TextBox ID="PasswordTextBox" runat="server" Text='<%# Bind("Password") %>' /></td></tr>
                <tr><td>Estatus</td><td><asp:CheckBox ID="StatusCheckBox" runat="server" Checked='<%# Bind("Status") %>' /></td></tr>
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
                <tr><td>ID Usuario</td><td><asp:TextBox ID="IdUserTextBox" runat="server" Text='<%# Bind("IdUser") %>' /></td></tr>
                <tr><td>Nombre</td><td><asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>' /></td></tr>
                <tr><td>Tipo</td><td><asp:DropDownList ID="IdTipoPersonaDropDownList" runat="server"
                 DataValueField="IdTipoPersona" DataSourceID="TiposPersonaDataSource"
                 DataTextField="TipoPersona" SelectedValue='<%# Bind("Tipo") %>' />

                <asp:SqlDataSource ID="TiposPersonaDataSource" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                 SelectCommand="SELECT IdTipoPersona, TipoPersona FROM TtipoPersona WHERE (Estatus = 1) ORDER BY TipoPersona"/></td></tr>
                <tr><td>Contraseña</td><td><asp:TextBox ID="PasswordTextBox" runat="server" Text='<%# Bind("Password") %>' /></td></tr>
                <tr><td>Estatus</td><td><asp:CheckBox ID="StatusCheckBox" runat="server" Checked='<%# Bind("Status") %>' /></td></tr>
                <tr><td colspan="2"><asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insertar" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancelar" /></td></tr>
            </table>
        </InsertItemTemplate>
        <ItemTemplate>
            <table>
                <tr><td>ID Usuario</td><td><asp:Label ID="IdUserLabel" runat="server" Text='<%# Eval("IdUser") %>' /></td></tr>
                <tr><td>Nombre</td><td><asp:Label ID="NombreLabel" runat="server" Text='<%# Bind("Nombre") %>' /></td></tr>
                <tr><td>Tipo</td><td><asp:DropDownList ID="IdTipoPersonaDropDownList" runat="server"
                 DataValueField="IdTipoPersona" DataSourceID="TiposPersonaDataSource"
                 DataTextField="TipoPersona" SelectedValue='<%# Bind("Tipo") %>' Enabled ="false" />

                <asp:SqlDataSource ID="TiposPersonaDataSource" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                 SelectCommand="SELECT IdTipoPersona, TipoPersona FROM TtipoPersona WHERE (Estatus = 1) ORDER BY TipoPersona"/></td></tr>
                <tr><td>Contraseña</td><td><asp:Label ID="PasswordLabel" runat="server" Text='<%# Bind("Password") %>' /></td></tr>
                <tr><td>Estatus</td><td><asp:CheckBox ID="StatusCheckBox" runat="server" Checked='<%# Bind("Status") %>' Enabled="false" /></td></tr>
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
    <asp:SqlDataSource ID="SqlDSUsuarios" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        DeleteCommand="UPDATE [TUsuarios] SET [Status] = 0 WHERE [IdUser] = @original_IdUser" 
        InsertCommand="INSERT INTO [TUsuarios] ([IdUser], [Nombre], [Tipo], [Password], [Status]) VALUES (@IdUser, @Nombre, @Tipo, @Password, @Status)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [TUsuarios] WHERE ([IdUser] = @IdUser)" 
        UpdateCommand="UPDATE [TUsuarios] SET [Nombre] = @Nombre, [Tipo] = @Tipo, [Password] = @Password, [Status] = @Status WHERE [IdUser] = @original_IdUser AND (([Nombre] = @original_Nombre) OR ([Nombre] IS NULL AND @original_Nombre IS NULL)) AND (([Tipo] = @original_Tipo) OR ([Tipo] IS NULL AND @original_Tipo IS NULL)) AND (([Password] = @original_Password) OR ([Password] IS NULL AND @original_Password IS NULL)) AND (([Status] = @original_Status) OR ([Status] IS NULL AND @original_Status IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_IdUser" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="IdUser" Type="String" />
            <asp:Parameter Name="Nombre" Type="String" />
            <asp:Parameter Name="Tipo" Type="Int32" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="Status" Type="Boolean" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="IdUser" SessionField="Id" 
                Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Nombre" Type="String" />
            <asp:Parameter Name="Tipo" Type="Int32" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="Status" Type="Boolean" />
            <asp:Parameter Name="original_IdUser" Type="String" />
            <asp:Parameter Name="original_Nombre" Type="String" />
            <asp:Parameter Name="original_Tipo" Type="Int32" />
            <asp:Parameter Name="original_Password" Type="String" />
            <asp:Parameter Name="original_Status" Type="Boolean" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
