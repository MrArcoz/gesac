﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProyectosDetail.aspx.cs" Inherits="GESAC.Empleado.ProyectosDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
<p></p>
    <asp:FormView ID="FormView1" runat="server" CellPadding="4" 
        DataKeyNames="IdProyecto" DataSourceID="SqlDSProyectos" ForeColor="#333333" 
        Width="231px" Height="210px">
        <EditItemTemplate>
            <table>
                <tr><td>ID Proyecto</td><td><asp:Label ID="IdProyectoLabel1" runat="server" Text='<%# Eval("IdProyecto") %>' /></td></tr>
                <tr><td>Proyecto</td><td><asp:TextBox ID="ProyectoTextBox" runat="server" Text='<%# Bind("Proyecto") %>' /></td></tr>
                <tr><td>Descripción</td><td><asp:TextBox ID="DescripcionTextBox" runat="server" Text='<%# Bind("Descripcion") %>' /></td></tr>
                <tr><td>Avance</td><td><asp:TextBox ID="AvanceTextBox" runat="server" Text='<%# Bind("Avance") %>' /></td></tr>
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
                <tr><td>Proyecto</td><td><asp:TextBox ID="ProyectoTextBox" runat="server" Text='<%# Bind("Proyecto") %>' /></td></tr>
                <tr><td>Descripción</td><td><asp:TextBox ID="DescripcionTextBox" runat="server" Text='<%# Bind("Descripcion") %>' /></td></tr>
                <tr><td>Avance</td><td><asp:TextBox ID="AvanceTextBox" runat="server" Text='<%# Bind("Avance") %>' /></td></tr>
                <tr><td>Estatus</td><td><asp:CheckBox ID="EstatusCheckBox" runat="server" Checked='<%# Bind("Estatus") %>' /></td></tr>
                <tr><td colspan="2"><asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insertar" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancelar" /></td></tr>
            </table>
        </InsertItemTemplate>
        <ItemTemplate>
            <table>
                <tr><td>ID Proyecto</td><td><asp:Label ID="IdProyectoLabel" runat="server" Text='<%# Eval("IdProyecto") %>' /></td></tr>
                <tr><td>Proyecto</td><td><asp:Label ID="ProyectoLabel" runat="server" Text='<%# Bind("Proyecto") %>' /></td></tr>
                <tr><td>Descripción</td><td><asp:Label ID="DescripcionLabel" runat="server" Text='<%# Bind("Descripcion") %>' /></td></tr>
                <tr><td>Avance</td><td><asp:Label ID="AvanceLabel" runat="server" Text='<%# Bind("Avance") %>' /></td></tr>
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
    <asp:SqlDataSource ID="SqlDSProyectos" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        DeleteCommand="UPDATE [TProyectos] SET [Estatus] = 0 WHERE [IdProyecto] = @original_IdProyecto" 
        InsertCommand="INSERT INTO [TProyectos] ([Proyecto], [Descripcion], [Avance], [Estatus]) VALUES (@Proyecto, @Descripcion, @Avance, @Estatus)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [TProyectos] WHERE ([IdProyecto] = @IdProyecto)" 
        UpdateCommand="UPDATE [TProyectos] SET [Proyecto] = @Proyecto, [Descripcion] = @Descripcion, [Avance] = @Avance, [Estatus] = @Estatus WHERE [IdProyecto] = @original_IdProyecto AND (([Proyecto] = @original_Proyecto) OR ([Proyecto] IS NULL AND @original_Proyecto IS NULL)) AND (([Descripcion] = @original_Descripcion) OR ([Descripcion] IS NULL AND @original_Descripcion IS NULL)) AND (([Avance] = @original_Avance) OR ([Avance] IS NULL AND @original_Avance IS NULL)) AND (([Estatus] = @original_Estatus) OR ([Estatus] IS NULL AND @original_Estatus IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_IdProyecto" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Proyecto" Type="String" />
            <asp:Parameter Name="Descripcion" Type="String" />
            <asp:Parameter Name="Avance" Type="String" />
            <asp:Parameter Name="Estatus" Type="Boolean" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="IdProyecto" SessionField="Id" 
                Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Proyecto" Type="String" />
            <asp:Parameter Name="Descripcion" Type="String" />
            <asp:Parameter Name="Avance" Type="String" />
            <asp:Parameter Name="Estatus" Type="Boolean" />
            <asp:Parameter Name="original_IdProyecto" Type="Int32" />
            <asp:Parameter Name="original_Proyecto" Type="String" />
            <asp:Parameter Name="original_Descripcion" Type="String" />
            <asp:Parameter Name="original_Avance" Type="String" />
            <asp:Parameter Name="original_Estatus" Type="Boolean" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>