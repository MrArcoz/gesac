<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EstatusDetail.aspx.cs" Inherits="GESAC.Empleado.EstatusDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:FormView ID="FormView1" runat="server" CellPadding="4" 
        DataKeyNames="IdStatus" DataSourceID="SqlDSEstatus" ForeColor="#333333" 
        Height="210px" Width="231px">
        <EditItemTemplate>
            <table>
                <tr><td>Id Estatus</td><td><asp:Label ID="IdStatusLabel1" runat="server" Text='<%# Eval("IdStatus") %>' /></td></tr>
                <tr><td>Estatus</td><td><asp:TextBox ID="StatusTextBox" runat="server" Text='<%# Bind("Status") %>' /></td></tr>
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
                <tr><td>Id Estatus</td><asp:TextBox ID="IdStatusTextBox" runat="server" Text='<%# Bind("IdStatus") %>' /><td></td></tr>
                <tr><td>Estatus</td><td><asp:TextBox ID="StatusTextBox" runat="server" Text='<%# Bind("Status") %>' /></td></tr>
                <tr><td>Habilitado</td><td><asp:CheckBox ID="EstatusCheckBox" runat="server" Checked='<%# Bind("Estatus") %>' /></td></tr>
                <tr><td colspan="2"><asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insertar" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancelar" /></td></tr>
            </table>
        </InsertItemTemplate>
        <ItemTemplate>
            <table>
                <tr><td>Id Estatus</td><td><asp:Label ID="IdStatusLabel" runat="server" Text='<%# Eval("IdStatus") %>' /></td></tr>
                <tr><td>Estatus</td><td><asp:Label ID="StatusLabel" runat="server" Text='<%# Bind("Status") %>' /></td></tr>
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
    <asp:SqlDataSource ID="SqlDSEstatus" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        DeleteCommand="UPDATE [TStatus] SET [Estatus] = 0 WHERE [IdStatus] = @original_IdStatus" 
        InsertCommand="INSERT INTO [TStatus] ([IdStatus], [Status], [Estatus]) VALUES (@IdStatus, @Status, @Estatus)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [TStatus] WHERE ([IdStatus] = @IdStatus)" 
        UpdateCommand="UPDATE [TStatus] SET [Status] = @Status, [Estatus] = @Estatus WHERE [IdStatus] = @original_IdStatus AND (([Status] = @original_Status) OR ([Status] IS NULL AND @original_Status IS NULL)) AND (([Estatus] = @original_Estatus) OR ([Estatus] IS NULL AND @original_Estatus IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_IdStatus" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="IdStatus" Type="String" />
            <asp:Parameter Name="Status" Type="String" />
            <asp:Parameter Name="Estatus" Type="Boolean" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="IdStatus" SessionField="Id" 
                Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Status" Type="String" />
            <asp:Parameter Name="Estatus" Type="Boolean" />
            <asp:Parameter Name="original_IdStatus" Type="String" />
            <asp:Parameter Name="original_Status" Type="String" />
            <asp:Parameter Name="original_Estatus" Type="Boolean" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
