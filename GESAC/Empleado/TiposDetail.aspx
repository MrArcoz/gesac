<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TiposDetail.aspx.cs" Inherits="GESAC.Empleado.TiposDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
<p></p>
    <asp:FormView ID="FormView1" runat="server" CellPadding="4" 
        DataKeyNames="IDTipo" DataSourceID="SqlDSTipos" ForeColor="#333333" 
        Width="231px" Height="210px">
        <EditItemTemplate>
            <table>
                <tr><td>ID Tipo</td><td><asp:Label ID="IDTipoLabel1" runat="server" Text='<%# Eval("IDTipo") %>' /></td></tr>
                <tr><td>Juicio</td><td><asp:TextBox ID="JuicioTextBox" runat="server" Text='<%# Bind("Juicio") %>' /></td></tr>
                <tr><td>Materia</td><td><asp:DropDownList ID="IdMateriaDropDownList" runat="server"
             DataValueField="IdMateria" DataSourceID="MateriasDataSource"
             DataTextField="Materia" SelectedValue='<%# Bind("IdMateria") %>' />

            <asp:SqlDataSource ID="MateriasDataSource" runat="server" 
             ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
             SelectCommand="SELECT IdMateria, Materia FROM TMateria WHERE (Estatus = 1) ORDER BY Materia"/></td></tr>
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
                <tr><td>Juicio</td><td><asp:TextBox ID="JuicioTextBox" runat="server" Text='<%# Bind("Juicio") %>' /></td></tr>
                <tr><td>Materia</td><td><asp:DropDownList ID="IdMateriaDropDownList" runat="server"
             DataValueField="IdMateria" DataSourceID="MateriasDataSource"
             DataTextField="Materia" SelectedValue='<%# Bind("IdMateria") %>' />

            <asp:SqlDataSource ID="MateriasDataSource" runat="server" 
             ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
             SelectCommand="SELECT IdMateria, Materia FROM TMateria WHERE (Estatus = 1) ORDER BY Materia"/></td></tr>
                <tr><td>Estatus</td><td><asp:CheckBox ID="EstatusCheckBox" runat="server" Checked='<%# Bind("Estatus") %>' /></td></tr>
                <tr><td colspan="2"><asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insertar" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancelar" /></td></tr>
            </table>
        </InsertItemTemplate>
        <ItemTemplate>
            <table>
                <tr><td>ID Tipo</td><td><asp:Label ID="IDTipoLabel" runat="server" Text='<%# Eval("IDTipo") %>' /></td></tr>
                <tr><td>Juicio</td><td><asp:Label ID="JuicioLabel" runat="server" Text='<%# Bind("Juicio") %>' /></td></tr>
                <tr><td>Materia</td><td><asp:DropDownList ID="IdMateriaDropDownList" runat="server"
             DataValueField="IdMateria" DataSourceID="MateriasDataSource"
             DataTextField="Materia" SelectedValue='<%# Bind("IdMateria") %>' Enabled="false" />

            <asp:SqlDataSource ID="MateriasDataSource" runat="server" 
             ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
             SelectCommand="SELECT IdMateria, Materia FROM TMateria WHERE (Estatus = 1) ORDER BY Materia"/></td></tr>
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
    <asp:SqlDataSource ID="SqlDSTipos" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        DeleteCommand="UPDATE [TTipo] SET [Estatus] = 0 WHERE [IDTipo] = @original_IDTipo" 
        InsertCommand="INSERT INTO [TTipo] ([Juicio], [IdMateria], [Estatus]) VALUES (@Juicio, @IdMateria, @Estatus)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [TTipo] WHERE ([IDTipo] = @IDTipo)" 
        
        UpdateCommand="UPDATE [TTipo] SET [Juicio] = @Juicio, [IdMateria] = @IdMateria, [Estatus] = @Estatus WHERE [IDTipo] = @original_IDTipo AND (([Juicio] = @original_Juicio) OR ([Juicio] IS NULL AND @original_Juicio IS NULL)) AND (([IdMateria] = @original_IdMateria) OR ([IdMateria] IS NULL AND @original_IdMateria IS NULL)) AND (([Estatus] = @original_Estatus) OR ([Estatus] IS NULL AND @original_Estatus IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_IDTipo" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Juicio" Type="String" />
            <asp:Parameter Name="IdMateria" Type="Int32" />
            <asp:Parameter Name="Estatus" Type="Boolean" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="IDTipo" SessionField="Id" 
                Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Juicio" Type="String" />
            <asp:Parameter Name="IdMateria" Type="Int32" />
            <asp:Parameter Name="Estatus" Type="Boolean" />
            <asp:Parameter Name="original_IDTipo" Type="Int32" />
            <asp:Parameter Name="original_Juicio" Type="String" />
            <asp:Parameter Name="original_IdMateria" Type="Int32" />
            <asp:Parameter Name="original_Estatus" Type="Boolean" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
