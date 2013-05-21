<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TiposPersonaDetail.aspx.cs" Inherits="GESAC.Empleado.TiposPersonaDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
<p></p>
    <asp:FormView ID="FormView1" runat="server" CellPadding="4" 
        DataKeyNames="IdTipoPersona" DataSourceID="SqlDSTiposPersona" 
        ForeColor="#333333" Width="231px" Height="210px">
        <EditItemTemplate>
            <table>
                <tr><td>ID Tipo Persona</td><td><asp:Label ID="IdTipoPersonaLabel1" runat="server" Text='<%# Eval("IdTipoPersona") %>' /></td></tr>
                <tr><td>Tipo Persona</td><td><asp:TextBox ID="TipoPersonaTextBox" runat="server" Text='<%# Bind("TipoPersona") %>' /></td></tr>
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
                <tr><td>Tipo Persona</td><td><asp:TextBox ID="TipoPersonaTextBox" runat="server" Text='<%# Bind("TipoPersona") %>' /></td></tr>
                <tr><td>Estatus</td><td><asp:CheckBox ID="EstatusCheckBox" runat="server" Checked='<%# Bind("Estatus") %>' /></td></tr>
                <tr><td colspan="2"><asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insertar" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancelar" /></td></tr>
            </table>
        </InsertItemTemplate>
        <ItemTemplate>
            <table>
                <tr><td>ID Tipo Persona</td><td><asp:Label ID="IdTipoPersonaLabel" runat="server" Text='<%# Eval("IdTipoPersona") %>' /></td></tr>
                <tr><td>Tipo Persona</td><td><asp:Label ID="TipoPersonaLabel" runat="server" Text='<%# Bind("TipoPersona") %>' /></td></tr>
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
    <asp:SqlDataSource ID="SqlDSTiposPersona" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        DeleteCommand="UPDATE [TtipoPersona] SET [Estatus] = 0 WHERE [IdTipoPersona] = @original_IdTipoPersona" 
        InsertCommand="INSERT INTO [TtipoPersona] ([TipoPersona], [Estatus]) VALUES (@TipoPersona, @Estatus)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [TtipoPersona] WHERE ([IdTipoPersona] = @IdTipoPersona)" 
        UpdateCommand="UPDATE [TtipoPersona] SET [TipoPersona] = @TipoPersona, [Estatus] = @Estatus WHERE [IdTipoPersona] = @original_IdTipoPersona AND (([TipoPersona] = @original_TipoPersona) OR ([TipoPersona] IS NULL AND @original_TipoPersona IS NULL)) AND (([Estatus] = @original_Estatus) OR ([Estatus] IS NULL AND @original_Estatus IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_IdTipoPersona" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="TipoPersona" Type="String" />
            <asp:Parameter Name="Estatus" Type="Boolean" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="IdTipoPersona" SessionField="Id" 
                Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="TipoPersona" Type="String" />
            <asp:Parameter Name="Estatus" Type="Boolean" />
            <asp:Parameter Name="original_IdTipoPersona" Type="Int32" />
            <asp:Parameter Name="original_TipoPersona" Type="String" />
            <asp:Parameter Name="original_Estatus" Type="Boolean" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
