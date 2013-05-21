<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="JuzgadosDetail.aspx.cs" Inherits="GESAC.Empleado.JuzgadosDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
<p></p>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="NoJuzgado" 
        DataSourceID="SqlDSJuzgados" CellPadding="4" ForeColor="#333333" 
        Width="231px" Height="210px">
        <EditItemTemplate>
            <table>
                <tr><td>No. Juzgado</td><td><asp:Label ID="NoJuzgadoLabel1" runat="server" Text='<%# Eval("NoJuzgado") %>' /></td></tr>
                <tr><td>Juzgado</td><td><asp:TextBox ID="JuzgadoTextBox" runat="server" Text='<%# Bind("Juzgado") %>' /></td></tr>
                <tr><td>Materia</td><td><asp:DropDownList ID="IdMateriaDropDownList" runat="server"
             DataValueField="IdMateria" DataSourceID="MateriasDataSource"
             DataTextField="Materia" SelectedValue='<%# Bind("IdMateria") %>' />

            <asp:SqlDataSource ID="MateriasDataSource" runat="server" 
             ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
             SelectCommand="SELECT IdMateria, Materia FROM TMateria WHERE (Estatus = 1)">
            </asp:SqlDataSource></td></tr>
                <tr><td>Estado</td><td><asp:DropDownList ID="IdEstadoDropDownList" runat="server"
             DataValueField="IdEstado" DataSourceID="EstadosDataSource"
             DataTextField="Estado" SelectedValue='<%# Bind("IdEstado") %>' />

            <asp:SqlDataSource ID="EstadosDataSource" runat="server" 
             ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
             SelectCommand="SELECT IdEstado, Estado FROM TEstados WHERE (Estatus = 1) ORDER BY Estado">
            </asp:SqlDataSource></td></tr>
                <tr><td>Habilitado</td><td><asp:CheckBox ID="EstatusCheckBox" runat="server" Checked='<%# Bind("Estatus") %>' /></td></tr>
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
                <tr><td>Juzgado</td><td><asp:TextBox ID="JuzgadoTextBox" runat="server" Text='<%# Bind("Juzgado") %>' /></td></tr>
                <tr><td>Materia</td><td><asp:DropDownList ID="IdMateriaDropDownList" runat="server"
             DataValueField="IdMateria" DataSourceID="MateriasDataSource"
             DataTextField="Materia" SelectedValue='<%# Bind("IdMateria") %>' />

            <asp:SqlDataSource ID="MateriasDataSource" runat="server" 
             ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
             SelectCommand="SELECT IdMateria, Materia FROM TMateria WHERE (Estatus = 1)"/></td></tr>
                <tr><td>Estado</td><td><asp:DropDownList ID="IdEstadoDropDownList" runat="server"
             DataValueField="IdEstado" DataSourceID="EstadosDataSource"
             DataTextField="Estado" SelectedValue='<%# Bind("IdEstado") %>' />

            <asp:SqlDataSource ID="EstadosDataSource" runat="server" 
             ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
             SelectCommand="SELECT IdEstado, Estado FROM TEstados WHERE (Estatus = 1) ORDER BY Estado"/></td></tr>
                <tr><td>Habilitado</td><td><asp:CheckBox ID="EstatusCheckBox" runat="server" Checked='<%# Bind("Estatus") %>' /></td></tr>
                <tr><td colspan="2"><asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insertar" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancelar" /></td></tr>
            </table>
        </InsertItemTemplate>
        <ItemTemplate>
            <table>
                <tr><td>No. Juzgado</td><td><asp:Label ID="NoJuzgadoLabel" runat="server" Text='<%# Eval("NoJuzgado") %>' /></td></tr>
                <tr><td>Juzgado</td><td><asp:Label ID="JuzgadoLabel" runat="server" Text='<%# Bind("Juzgado") %>' /></td></tr>
                <tr><td>Materia</td><td><asp:DropDownList ID="IdMateriaDropDownList" runat="server"
             DataValueField="IdMateria" DataSourceID="MateriasDataSource"
             DataTextField="Materia" SelectedValue='<%# Bind("IdMateria") %>' Enabled="false" />

            <asp:SqlDataSource ID="MateriasDataSource" runat="server" 
             ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
             SelectCommand="SELECT IdMateria, Materia FROM TMateria WHERE (Estatus = 1)"/></td></tr>
                <tr><td>Estado</td><td><asp:DropDownList ID="IdEstadoDropDownList" runat="server"
             DataValueField="IdEstado" DataSourceID="EstadosDataSource"
             DataTextField="Estado" SelectedValue='<%# Bind("IdEstado") %>' Enabled="false" />

            <asp:SqlDataSource ID="EstadosDataSource" runat="server" 
             ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
             SelectCommand="SELECT IdEstado, Estado FROM TEstados WHERE (Estatus = 1) ORDER BY Estado"/></td></tr>
                <tr><td>Habilitado</td><td><asp:CheckBox ID="EstatusCheckBox" runat="server" Checked='<%# Bind("Estatus") %>' Enabled="false" /></td></tr>
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
    <asp:SqlDataSource ID="SqlDSJuzgados" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        DeleteCommand="UPDATE [TJuzgado] SET [Estatus] = 0 WHERE [NoJuzgado] = @original_NoJuzgado" 
        InsertCommand="INSERT INTO [TJuzgado] ([Juzgado], [IdMateria], [IdEstado], [Estatus]) VALUES (@Juzgado, @IdMateria, @IdEstado, @Estatus)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [TJuzgado] WHERE ([NoJuzgado] = @NoJuzgado)" 
        UpdateCommand="UPDATE [TJuzgado] SET [Juzgado] = @Juzgado, [IdMateria] = @IdMateria, [IdEstado] = @IdEstado, [Estatus] = @Estatus WHERE [NoJuzgado] = @original_NoJuzgado AND (([Juzgado] = @original_Juzgado) OR ([Juzgado] IS NULL AND @original_Juzgado IS NULL)) AND (([IdMateria] = @original_IdMateria) OR ([IdMateria] IS NULL AND @original_IdMateria IS NULL)) AND (([IdEstado] = @original_IdEstado) OR ([IdEstado] IS NULL AND @original_IdEstado IS NULL)) AND (([Estatus] = @original_Estatus) OR ([Estatus] IS NULL AND @original_Estatus IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_NoJuzgado" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Juzgado" Type="String" />
            <asp:Parameter Name="IdMateria" Type="Int32" />
            <asp:Parameter Name="IdEstado" Type="Int32" />
            <asp:Parameter Name="Estatus" Type="Boolean" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="NoJuzgado" SessionField="Id" 
                Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Juzgado" Type="String" />
            <asp:Parameter Name="IdMateria" Type="Int32" />
            <asp:Parameter Name="IdEstado" Type="Int32" />
            <asp:Parameter Name="Estatus" Type="Boolean" />
            <asp:Parameter Name="original_NoJuzgado" Type="Int32" />
            <asp:Parameter Name="original_Juzgado" Type="String" />
            <asp:Parameter Name="original_IdMateria" Type="Int32" />
            <asp:Parameter Name="original_IdEstado" Type="Int32" />
            <asp:Parameter Name="original_Estatus" Type="Boolean" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
