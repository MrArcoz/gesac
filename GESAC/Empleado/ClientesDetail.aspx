<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClientesDetail.aspx.cs" Inherits="GESAC.Empleado.ClientesDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
<p></p>
    <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataKeyNames="ID" 
        DataSourceID="SqlDataSource" ForeColor="#333333" 
        Width="231px" Height="210px">
        <EditItemTemplate>
            <table>
            <tr><td>ID</td><td><asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' /></td></tr>
            <tr><td>Nombre</td><td><asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>' /></td></tr>
            <tr><td>Apellido Paterno</td><td><asp:TextBox ID="APaternoTextBox" runat="server" Text='<%# Bind("APaterno") %>' /></td></tr>
            <tr><td>Apellido Materno</td><td><asp:TextBox ID="AMaternoTextBox" runat="server" Text='<%# Bind("AMaterno") %>' /></td></tr>
            <tr><td>Tipo</td><td>
            <asp:DropDownList ID="IdTipoDropDownList" runat="server"
             DataValueField="IdTipoPersona" DataSourceID="TiposPersonaDataSource"
             DataTextField="TipoPersona" SelectedValue='<%# Bind("IdTipo") %>' />

            <asp:SqlDataSource ID="TiposPersonaDataSource" runat="server" 
             ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
             SelectCommand="SELECT IdTipoPersona, TipoPersona FROM TtipoPersona WHERE (Estatus = 1) ORDER BY TipoPersona"/>
            </td></tr>
            <tr><td>Usuario</td><td><asp:TextBox ID="UsuarioTextBox" runat="server" Text='<%# Bind("Usuario") %>' /></td></tr>
            <tr><td>Contraseña</td><td><asp:TextBox ID="PasswordTextBox" runat="server" Text='<%# Bind("Password") %>' /></td></tr>
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
                <tr><td>Nombre</td><td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="NombreTextBox" CssClass="failureNotification" 
                        ErrorMessage="Campo requerido"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>' /></td></tr>
                <tr><td>Apellido Paterno</td><td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="APaternoTextBox" CssClass="failureNotification" 
                        ErrorMessage="Campo requerido"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="APaternoTextBox" runat="server" Text='<%# Bind("APaterno") %>' /></td></tr>
                <tr><td>Apellido Materno</td><td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="AMaternoTextBox" CssClass="failureNotification" 
                        ErrorMessage="Campo requerido"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="AMaternoTextBox" runat="server" Text='<%# Bind("AMaterno") %>' /></td></tr>
                <tr><td>Tipo</td><td><asp:DropDownList ID="IdTipoDropDownList" runat="server"
             DataValueField="IdTipoPersona" DataSourceID="TiposPersonaDataSource"
             DataTextField="TipoPersona" SelectedValue='<%# Bind("IdTipo") %>' />

            <asp:SqlDataSource ID="TiposPersonaDataSource" runat="server" 
             ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
             SelectCommand="SELECT IdTipoPersona, TipoPersona FROM TtipoPersona WHERE (Estatus = 1) ORDER BY TipoPersona"/></td></tr>
                <tr><td>Usuario</td><td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="UsuarioTextBox" CssClass="failureNotification" 
                        ErrorMessage="Campo requerido"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="UsuarioTextBox" runat="server" Text='<%# Bind("Usuario") %>' /></td></tr>
                <tr><td>Contraseña</td><td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="PasswordTextBox" CssClass="failureNotification" 
                        ErrorMessage="Campo requerido"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="PasswordTextBox" runat="server" Text='<%# Bind("Password") %>' /></td></tr>
                <tr><td>Estatus</td><td><asp:CheckBox ID="EstatusCheckBox" runat="server" Checked='<%# Bind("Estatus") %>' /></td></tr>
                <tr><td colspan="2"><asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insertar" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancelar" /></td></tr>
            </table>
        </InsertItemTemplate>
        <ItemTemplate>
            <table>
                <tr><td>ID</td><td><asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' /></td></tr>
                <tr><td>Nombre</td><td><asp:Label ID="NombreLabel" runat="server" Text='<%# Bind("Nombre") %>' /></td></tr>
                <tr><td>Apellido Paterno</td><td><asp:Label ID="APaternoLabel" runat="server" Text='<%# Bind("APaterno") %>' /></td></tr>
                <tr><td>Apellido Materno</td><td><asp:Label ID="AMaternoLabel" runat="server" Text='<%# Bind("AMaterno") %>' /></td></tr>
                <tr><td>Tipo</td><td><asp:DropDownList ID="IdTipoDropDownList" runat="server"
             DataValueField="IdTipoPersona" DataSourceID="TiposPersonaDataSource"
             DataTextField="TipoPersona" SelectedValue='<%# Bind("IdTipo") %>' Enabled="false" />

            <asp:SqlDataSource ID="TiposPersonaDataSource" runat="server" 
             ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
             SelectCommand="SELECT IdTipoPersona, TipoPersona FROM TtipoPersona WHERE (Estatus = 1) ORDER BY TipoPersona"/></td></tr>
                <tr><td>Usuario</td><td><asp:Label ID="UsuarioLabel" runat="server" Text='<%# Bind("Usuario") %>' /></td></tr>
                <tr><td>Contraseña</td><td><asp:Label ID="PasswordLabel" runat="server" Text='<%# Bind("Password") %>' /></td></tr>
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
    <asp:SqlDataSource ID="SqlDataSource" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        DeleteCommand="UPDATE TClientes SET Estatus = 0 WHERE (ID = @original_ID)" 
        InsertCommand="INSERT INTO [TClientes] ([Nombre], [APaterno], [AMaterno], [IdTipo], [Usuario], [Password], [Estatus]) VALUES (@Nombre, @APaterno, @AMaterno, @IdTipo, @Usuario, @Password, @Estatus)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [TClientes] WHERE ([ID] = @ID)" 
        UpdateCommand="UPDATE TClientes SET Nombre = @Nombre, APaterno = @APaterno, AMaterno = @AMaterno, IdTipo = @IdTipo, Usuario = @Usuario, Password = @Password, Estatus = @Estatus WHERE (ID = @original_ID)">
        <DeleteParameters>
            <asp:Parameter Name="original_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Nombre" Type="String" />
            <asp:Parameter Name="APaterno" Type="String" />
            <asp:Parameter Name="AMaterno" Type="String" />
            <asp:Parameter Name="IdTipo" Type="Int32" />
            <asp:Parameter Name="Usuario" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="Estatus" Type="Boolean" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="ID" SessionField="Id" 
                Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Nombre" Type="String" />
            <asp:Parameter Name="APaterno" Type="String" />
            <asp:Parameter Name="AMaterno" Type="String" />
            <asp:Parameter Name="IdTipo" Type="Int32" />
            <asp:Parameter Name="Usuario" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="Estatus" Type="Boolean" />
            <asp:Parameter Name="original_ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
