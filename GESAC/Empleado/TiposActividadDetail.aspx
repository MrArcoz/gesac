<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TiposActividadDetail.aspx.cs" Inherits="GESAC.Empleado.TiposActividadDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
<p></p>
    <asp:FormView ID="FormView1" runat="server" CellPadding="4" 
        DataKeyNames="IdTipoActividad" DataSourceID="SqlDSTiposActividad" 
        ForeColor="#333333" Width="231px" Height="210px">
        <EditItemTemplate>
            <table>
                <tr><td>ID Tipo Actividad</td><td><asp:Label ID="IdTipoActividadLabel1" runat="server" Text='<%# Eval("IdTipoActividad") %>' /></td></tr>
                <tr><td>Tipo Actividad</td><td><asp:TextBox ID="TipoActividadTextBox" runat="server" Text='<%# Bind("TipoActividad") %>' /></td></tr>
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
                <tr><td>ID Tipo Actividad</td><td><asp:TextBox ID="IdTipoActividadTextBox" runat="server" Text='<%# Bind("IdTipoActividad") %>' /></td></tr>
                <tr><td>Tipo Actividad</td><td><asp:TextBox ID="TipoActividadTextBox" runat="server" Text='<%# Bind("TipoActividad") %>' /></td></tr>
                <tr><td>Estatus</td><td><asp:CheckBox ID="EstatusCheckBox" runat="server" Checked='<%# Bind("Estatus") %>' /></td></tr>
                <tr><td colspan="2"><asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insertar" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancelar" /></td></tr>
            </table>
        </InsertItemTemplate>
        <ItemTemplate>
            <table>
                <tr><td>ID Tipo Actividad</td><td><asp:Label ID="IdTipoActividadLabel" runat="server" Text='<%# Eval("IdTipoActividad") %>' /></td></tr>
                <tr><td>Tipo Actividad</td><td><asp:Label ID="TipoActividadLabel" runat="server" Text='<%# Bind("TipoActividad") %>' /></td></tr>
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
    <asp:SqlDataSource ID="SqlDSTiposActividad" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        DeleteCommand="UPDATE [TTipoActividad] SET [Estatus] = 0 WHERE [IdTipoActividad] = @original_IdTipoActividad" 
        InsertCommand="INSERT INTO [TTipoActividad] ([IdTipoActividad], [TipoActividad], [Estatus]) VALUES (@IdTipoActividad, @TipoActividad, @Estatus)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [TTipoActividad] WHERE ([IdTipoActividad] = @IdTipoActividad)" 
        UpdateCommand="UPDATE [TTipoActividad] SET [TipoActividad] = @TipoActividad, [Estatus] = @Estatus WHERE [IdTipoActividad] = @original_IdTipoActividad AND (([TipoActividad] = @original_TipoActividad) OR ([TipoActividad] IS NULL AND @original_TipoActividad IS NULL)) AND (([Estatus] = @original_Estatus) OR ([Estatus] IS NULL AND @original_Estatus IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_IdTipoActividad" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="IdTipoActividad" Type="String" />
            <asp:Parameter Name="TipoActividad" Type="String" />
            <asp:Parameter Name="Estatus" Type="Boolean" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="IdTipoActividad" SessionField="Id" 
                Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="TipoActividad" Type="String" />
            <asp:Parameter Name="Estatus" Type="Boolean" />
            <asp:Parameter Name="original_IdTipoActividad" Type="String" />
            <asp:Parameter Name="original_TipoActividad" Type="String" />
            <asp:Parameter Name="original_Estatus" Type="Boolean" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
