<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ActividadesDetail.aspx.cs" Inherits="GESAC.Empleado.ActividadesDetail" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style4
        {
            width: 150px;
        }
    .style5
    {
        width: 150px;
        height: 26px;
    }
    .style6
    {
        height: 26px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </p>
    <asp:FormView ID="FormView1" runat="server" CellPadding="4" 
        DataKeyNames="IdActividad" DataSourceID="SqlDSActividades" 
        ForeColor="#333333" onload="FormView1_Load" 
        oniteminserted="FormView1_ItemInserted">
        <EditItemTemplate>
            <table style="width:551px">
                <tr>
                    <td class="style4">Id Actividad</td>
                    <td><asp:Label ID="IdActividadLabel" runat="server" Text='<%# Eval("IdActividad") %>' /></td>
                </tr>
                <tr>
                    <td class="style4">Expediente</td>
                    <td><asp:DropDownList ID="IdExpedienteDropDownList" runat="server" 
                            DataSourceID="SqlDSExpedientes" DataTextField="Expediente" 
                            DataValueField="IDExpediente" SelectedValue='<%# Bind("IdExpediente") %>'>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="style4">Fecha Vencimiento</td>
                    <td><asp:TextBox ID="FechaVencimientoTextBox" runat="server"
                            Text='<%# Bind("FechaVencimiento") %>' />
                        <asp:MaskedEditExtender ID="FechaVencimientoTextBox_MaskedEditExtender" 
                            runat="server" Mask="99/99/9999" MaskType="Date" 
                            TargetControlID="FechaVencimientoTextBox">
                        </asp:MaskedEditExtender>
                        <asp:CalendarExtender ID="FechaVencimientoTextBox_CalendarExtender" 
                            runat="server" TargetControlID="FechaVencimientoTextBox">
                        </asp:CalendarExtender>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                            ControlToValidate="FechaVencimientoTextBox" CssClass="failureNotification" 
                            ErrorMessage="Fecha incorrecta" 
                            ValidationExpression="^(?:(?:0?[1-9]|1\d|2[0-8])(\/|-)(?:0?[1-9]|1[0-2]))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^(?:(?:31(\/|-)(?:0?[13578]|1[02]))|(?:(?:29|30)(\/|-)(?:0?[1,3-9]|1[0-2])))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^(29(\/|-)0?2)(\/|-)(?:(?:0[48]00|[13579][26]00|[2468][048]00)|(?:\d\d)?(?:0[48]|[2468][048]|[13579][26]))$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style5">Usuario Asignado</td>
                    <td class="style6"><asp:DropDownList ID="IdUsuarioDropDownList" runat="server" 
                            DataSourceID="SqlDSUsuarios" DataTextField="Comment" DataValueField="UserId" SelectedValue='<%# Bind("IdUsuario") %>'>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="style4">Estatus</td>
                    <td><asp:DropDownList ID="IdEstatusDropDownList" runat="server" 
                            SelectedValue='<%# Bind("IdStatus") %>' DataSourceID="SqlDSEstatus" 
                            DataTextField="Status" DataValueField="IdStatus">
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="style4">Descripción</td>
                    <td><asp:TextBox ID="DescripcionTextBox" runat="server" 
                            Text='<%# Bind("Descripcion") %>' Height="225px" Width="385px" 
                            TextMode="MultiLine" /></td>
                </tr>
                <tr>
                    <td class="style4">Observaciones</td>
                    <td><asp:TextBox ID="ObservacionesTextBox" runat="server" 
                            Text='<%# Bind("Observaciones") %>' Height="225px" Width="385px" 
                            TextMode="MultiLine" /></td>
                </tr>
                <tr>
                    <td class="style4">Fecha Acuerdo</td>
                    <td><asp:TextBox ID="FechaAcuerdoTextBox" runat="server" 
                            Text='<%# Bind("FechaAcuerdo") %>' />
                        <asp:MaskedEditExtender ID="FechaAcuerdoTextBox_MaskedEditExtender" 
                            runat="server" Mask="99/99/9999" MaskType="Date" 
                            TargetControlID="FechaAcuerdoTextBox">
                        </asp:MaskedEditExtender>
                        <asp:CalendarExtender ID="FechaAcuerdoTextBox_CalendarExtender" runat="server" 
                            DefaultView="Days" Enabled="True" PopupPosition="BottomLeft" 
                            TargetControlID="FechaAcuerdoTextBox">
                        </asp:CalendarExtender>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" 
                            ControlToValidate="FechaAcuerdoTextBox" CssClass="failureNotification" 
                            ErrorMessage="Fecha incorrecta" 
                            ValidationExpression="^(?:(?:0?[1-9]|1\d|2[0-8])(\/|-)(?:0?[1-9]|1[0-2]))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^(?:(?:31(\/|-)(?:0?[13578]|1[02]))|(?:(?:29|30)(\/|-)(?:0?[1,3-9]|1[0-2])))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^(29(\/|-)0?2)(\/|-)(?:(?:0[48]00|[13579][26]00|[2468][048]00)|(?:\d\d)?(?:0[48]|[2468][048]|[13579][26]))$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style4">Fecha Publicación</td>
                    <td><asp:TextBox ID="FechaPublicacionTextBox" runat="server" 
                            Text='<%# Bind("FechaPublicacion") %>' />
                        <asp:MaskedEditExtender ID="FechaPublicacionTextBox_MaskedEditExtender" 
                            runat="server" Mask="99/99/9999" MaskType="Date" 
                            TargetControlID="FechaPublicacionTextBox">
                        </asp:MaskedEditExtender>
                        <asp:CalendarExtender ID="FechaPublicacionTextBox_CalendarExtender" 
                            runat="server" DefaultView="Days" Enabled="True" PopupPosition="BottomLeft" 
                            TargetControlID="FechaPublicacionTextBox">
                        </asp:CalendarExtender>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" 
                            ControlToValidate="FechaPublicacionTextBox" CssClass="failureNotification" 
                            ErrorMessage="Fecha incorrecta" 
                            ValidationExpression="^(?:(?:0?[1-9]|1\d|2[0-8])(\/|-)(?:0?[1-9]|1[0-2]))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^(?:(?:31(\/|-)(?:0?[13578]|1[02]))|(?:(?:29|30)(\/|-)(?:0?[1,3-9]|1[0-2])))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^(29(\/|-)0?2)(\/|-)(?:(?:0[48]00|[13579][26]00|[2468][048]00)|(?:\d\d)?(?:0[48]|[2468][048]|[13579][26]))$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style4">Tipo Actividad</td>
                    <td><asp:DropDownList ID="IdTipoDropDownList" runat="server" 
                            SelectedValue='<%# Bind("IdTipo") %>' DataSourceID="SqlDSTiposActividad" 
                            DataTextField="TipoActividad" DataValueField="IdTipoActividad">
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="style4">Fecha Inicio</td>
                    <td><asp:TextBox ID="FechaInicioTextBox" runat="server" 
                            Text='<%# Bind("FechaInicio") %>' />
                        <asp:MaskedEditExtender ID="FechaInicioTextBox_MaskedEditExtender" 
                            runat="server" Mask="99/99/9999" MaskType="Date" 
                            TargetControlID="FechaInicioTextBox">
                        </asp:MaskedEditExtender>
                        <asp:CalendarExtender ID="FechaInicioTextBox_CalendarExtender" runat="server" 
                            DefaultView="Days" Enabled="True" PopupPosition="BottomLeft" 
                            TargetControlID="FechaInicioTextBox">
                        </asp:CalendarExtender>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator10" 
                            runat="server" ControlToValidate="FechaInicioTextBox" 
                            CssClass="failureNotification" ErrorMessage="Fecha incorrecta" 
                            ValidationExpression="^(?:(?:0?[1-9]|1\d|2[0-8])(\/|-)(?:0?[1-9]|1[0-2]))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^(?:(?:31(\/|-)(?:0?[13578]|1[02]))|(?:(?:29|30)(\/|-)(?:0?[1,3-9]|1[0-2])))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^(29(\/|-)0?2)(\/|-)(?:(?:0[48]00|[13579][26]00|[2468][048]00)|(?:\d\d)?(?:0[48]|[2468][048]|[13579][26]))$"></asp:RegularExpressionValidator>
                    </td>
                </tr>

                <tr>
                    <td class="style4">Avance</td>
                    <td style="height:50px; vertical-align:top"><asp:TextBox ID="AvanceTextBox" runat="server" Text='<%# Bind("Avance") %>' />
                        <asp:NumericUpDownExtender ID="FechaInicioTextBox_NumericUpDownExtender" 
                            runat="server" Enabled="True" Maximum="100" 
                            Minimum="0" RefValues="" ServiceDownMethod="" 
                            ServiceDownPath="" ServiceUpMethod="" Tag="" TargetButtonDownID="" 
                            TargetButtonUpID="" TargetControlID="AvanceTextBox" Width="50">
                        </asp:NumericUpDownExtender>
                        <asp:RangeValidator ID="RangeValidator2" runat="server" 
                            ControlToValidate="AvanceTextBox" CssClass="failureNotification" 
                            ErrorMessage="Favor de ingresar un valor entre 0 y 100" MaximumValue="100" 
                            MinimumValue="0" Type="Integer"></asp:RangeValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style4">Proyecto</td>
                    <td><asp:DropDownList ID="IdProyectoDropDownList" runat="server" 
                            SelectedValue='<%# Bind("IdProyecto") %>' DataSourceID="SqlDSProyectos" 
                            DataTextField="Proyecto" DataValueField="IdProyecto" >
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td colspan="2"><asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />&nbsp;
                                    <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" /></td>
                </tr>
            </table>
        </EditItemTemplate>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <InsertItemTemplate>
            <table style="width:551px">
                <tr>
                    <td class="style4">Expediente</td>
                    <td><asp:DropDownList ID="IdExpedienteDropDownList" runat="server" 
                            SelectedValue='<%# Bind("IdExpediente") %>' DataSourceID="SqlDSExpedientes" 
                            DataTextField="Expediente" DataValueField="IDExpediente">
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="style4">Fecha Vencimiento</td>
                    <td><asp:TextBox ID="FechaVencimientoTextBox" runat="server" 
                            Text='<%# Bind("FechaVencimiento") %>' />
                        <asp:MaskedEditExtender ID="FechaVencimientoTextBox_MaskedEditExtender" 
                            runat="server" Mask="99/99/9999" MaskType="Date" 
                            TargetControlID="FechaVencimientoTextBox">
                        </asp:MaskedEditExtender>
                        <asp:CalendarExtender ID="FechaVencimientoTextBox_CalendarExtender" 
                            runat="server" DefaultView="Days" Enabled="True" PopupPosition="BottomLeft" 
                            TargetControlID="FechaVencimientoTextBox">
                        </asp:CalendarExtender>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ControlToValidate="FechaVencimientoTextBox" CssClass="failureNotification" 
                            ErrorMessage="Fecha incorrecta" 
                            ValidationExpression="^(?:(?:0?[1-9]|1\d|2[0-8])(\/|-)(?:0?[1-9]|1[0-2]))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^(?:(?:31(\/|-)(?:0?[13578]|1[02]))|(?:(?:29|30)(\/|-)(?:0?[1,3-9]|1[0-2])))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^(29(\/|-)0?2)(\/|-)(?:(?:0[48]00|[13579][26]00|[2468][048]00)|(?:\d\d)?(?:0[48]|[2468][048]|[13579][26]))$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style4">Usuario Asignado</td>
                    <td><asp:DropDownList ID="IdUsuarioDropDownList" runat="server" 
                            SelectedValue='<%# Bind("IdUsuario") %>' DataSourceID="SqlDSUsuarios" 
                            DataTextField="Comment" DataValueField="UserId">
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="style4">Estatus</td>
                    <td><asp:DropDownList ID="IdEstatusDropDownList" runat="server" 
                            SelectedValue='<%# Bind("IdStatus") %>' DataSourceID="SqlDSEstatus" 
                            DataTextField="Status" DataValueField="IdStatus">
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="style4">Descripción</td>
                    <td><asp:TextBox ID="DescripcionTextBox" runat="server" 
                            Text='<%# Bind("Descripcion") %>' Height="225px" Width="385px" 
                            TextMode="MultiLine" /></td>
                </tr>
                <tr>
                    <td class="style4">Observaciones</td>
                    <td><asp:TextBox ID="ObservacionesTextBox" runat="server" 
                            Text='<%# Bind("Observaciones") %>' Height="225px" Width="385px" 
                            TextMode="MultiLine" /></td>
                </tr>
                
                <tr>
                    <td class="style4">Fecha Acuerdo</td>
                    <td><asp:TextBox ID="FechaAcuerdoTextBox1" runat="server" 
                            Text='<%# Bind("FechaAcuerdo") %>' />
                        <asp:MaskedEditExtender ID="FechaAcuerdoTextBox1_MaskedEditExtender" 
                            runat="server" Mask="99/99/9999" MaskType="Date" 
                            TargetControlID="FechaAcuerdoTextBox1">
                        </asp:MaskedEditExtender>
                        <asp:CalendarExtender ID="FechaAcuerdoTextBox1_CalendarExtender" runat="server" 
                            DefaultView="Days" Enabled="True" PopupPosition="BottomLeft" 
                            TargetControlID="FechaAcuerdoTextBox1">
                        </asp:CalendarExtender>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                            CssClass="failureNotification" ErrorMessage="Fecha incorrecta" 
                            ControlToValidate="FechaAcuerdoTextBox1" 
                            ValidationExpression="^(?:(?:0?[1-9]|1\d|2[0-8])(\/|-)(?:0?[1-9]|1[0-2]))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^(?:(?:31(\/|-)(?:0?[13578]|1[02]))|(?:(?:29|30)(\/|-)(?:0?[1,3-9]|1[0-2])))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^(29(\/|-)0?2)(\/|-)(?:(?:0[48]00|[13579][26]00|[2468][048]00)|(?:\d\d)?(?:0[48]|[2468][048]|[13579][26]))$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style4">Fecha Publicación</td>
                    <td><asp:TextBox ID="FechaPublicacionTextBox" runat="server" 
                            Text='<%# Bind("FechaPublicacion") %>' />
                        <asp:MaskedEditExtender ID="FechaPublicacionTextBox_MaskedEditExtender" 
                            runat="server" Mask="99/99/9999" MaskType="Date" 
                            TargetControlID="FechaPublicacionTextBox">
                        </asp:MaskedEditExtender>
                        <asp:CalendarExtender ID="FechaPublicacionTextBox_CalendarExtender" 
                            runat="server" DefaultView="Days" Enabled="True" PopupPosition="BottomLeft" 
                            TargetControlID="FechaPublicacionTextBox">
                        </asp:CalendarExtender>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                            ControlToValidate="FechaPublicacionTextBox" CssClass="failureNotification" 
                            ErrorMessage="Fecha incorrecta" 
                            ValidationExpression="^(?:(?:0?[1-9]|1\d|2[0-8])(\/|-)(?:0?[1-9]|1[0-2]))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^(?:(?:31(\/|-)(?:0?[13578]|1[02]))|(?:(?:29|30)(\/|-)(?:0?[1,3-9]|1[0-2])))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^(29(\/|-)0?2)(\/|-)(?:(?:0[48]00|[13579][26]00|[2468][048]00)|(?:\d\d)?(?:0[48]|[2468][048]|[13579][26]))$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style4">Tipo Actividad</td>
                    <td><asp:DropDownList ID="IdTipoDropDownList" runat="server" 
                            SelectedValue='<%# Bind("IdTipo") %>' DataSourceID="SqlDSTiposActividad" 
                            DataTextField="TipoActividad" DataValueField="IdTipoActividad">
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="style4">Fecha Inicio</td>
                    <td><asp:TextBox ID="FechaInicioTextBox" runat="server" 
                            Text='<%# Bind("FechaInicio") %>' />
                        <asp:MaskedEditExtender ID="FechaInicioTextBox_MaskedEditExtender" 
                            runat="server" Mask="99/99/9999" MaskType="Date" 
                            TargetControlID="FechaInicioTextBox">
                        </asp:MaskedEditExtender>
                        <asp:CalendarExtender ID="FechaInicioTextBox_CalendarExtender" runat="server" 
                            DefaultView="Days" Enabled="True" PopupPosition="BottomLeft" 
                            TargetControlID="FechaInicioTextBox">
                        </asp:CalendarExtender>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                            ControlToValidate="FechaInicioTextBox" CssClass="failureNotification" 
                            ErrorMessage="Fecha incorrecta" 
                            ValidationExpression="^(?:(?:0?[1-9]|1\d|2[0-8])(\/|-)(?:0?[1-9]|1[0-2]))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^(?:(?:31(\/|-)(?:0?[13578]|1[02]))|(?:(?:29|30)(\/|-)(?:0?[1,3-9]|1[0-2])))(\/|-)(?:[1-9]\d\d\d|\d[1-9]\d\d|\d\d[1-9]\d|\d\d\d[1-9])$|^(29(\/|-)0?2)(\/|-)(?:(?:0[48]00|[13579][26]00|[2468][048]00)|(?:\d\d)?(?:0[48]|[2468][048]|[13579][26]))$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style4">Avance</td>
                    <td style="height:50px; vertical-align:top"><asp:TextBox ID="AvanceTextBox" runat="server" Text='<%# Bind("Avance") %>' />
                        <asp:NumericUpDownExtender ID="AvanceTextBox_NumericUpDownExtender" 
                            runat="server" Enabled="True" Maximum="100" 
                            Minimum="0" RefValues="" ServiceDownMethod="" 
                            ServiceDownPath="" ServiceUpMethod="" Tag="" TargetButtonDownID="" 
                            TargetButtonUpID="" TargetControlID="AvanceTextBox" Width="50">
                        </asp:NumericUpDownExtender>
                        <asp:RangeValidator ID="RangeValidator2" runat="server" 
                            ControlToValidate="AvanceTextBox" CssClass="failureNotification" 
                            ErrorMessage="Favor de ingresar un valor entre 0 y 100" MaximumValue="100" 
                            MinimumValue="0" Type="Integer"></asp:RangeValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style4">Proyecto</td>
                    <td><asp:DropDownList ID="IdProyectoDropDownList" runat="server" 
                            SelectedValue='<%# Bind("IdProyecto") %>' DataSourceID="SqlDSProyectos" 
                            DataTextField="Proyecto" DataValueField="IdProyecto">
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td colspan="2"><asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                        CommandName="Insert" Text="Insertar" />&nbsp;
                                    <asp:LinkButton ID="InsertCancelButton" runat="server" 
                                        CausesValidation="False" CommandName="Cancel" Text="Cancelar" /></td>
                </tr>
            </table>
        </InsertItemTemplate>
        <ItemTemplate>
            <table style="width:551px">
                <tr>
                    <td class="style4">Id Actividad</td>
                    <td><asp:Label ID="IdActividadLabel" runat="server" Text='<%# Eval("IdActividad") %>' /></td>
                </tr>
                <tr>
                    <td class="style4">Expediente</td>
                    <td><asp:DropDownList ID="IdExpedienteDropDownList1" runat="server" 
                            DataSourceID="SqlDSExpedientes" DataTextField="Expediente" 
                            DataValueField="IDExpediente" SelectedValue='<%# Bind("IdExpediente") %>' 
                            Enabled="False" >
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="style4">Fecha Vencimiento</td>
                    <td><asp:Label ID="FechaVencimientoLabel" runat="server" Text='<%# Bind("FechaVencimiento") %>' /></td>
                </tr>
                <tr>
                    <td class="style4">Usuario Asignado</td>
                    <td><asp:DropDownList ID="IdUsuarioDropDownList" runat="server" 
                            DataSourceID="SqlDSUsuarios" DataTextField="Comment" DataValueField="UserId" 
                            Enabled="False" SelectedValue='<%# Bind("IdUsuario") %>'>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="style4">Estatus</td>
                    <td><asp:DropDownList ID="IdEstatusDropDownList" runat="server" 
                            DataSourceID="SqlDSEstatus" DataTextField="Status" DataValueField="IdStatus" 
                            Enabled="False" SelectedValue='<%# Bind("IdStatus") %>'>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="style4">Descripción</td>
                    <td><asp:Label ID="DescripcionLabel" runat="server" 
                            Text='<%# Bind("Descripcion") %>' CssClass="justify" /></td>
                </tr>
                <tr>
                    <td class="style4">Observaciones</td>
                    <td><asp:Label ID="ObservacionesLabel" runat="server" 
                            Text='<%# Bind("Observaciones") %>' CssClass="justify" /></td>
                </tr>
                <tr>
                    <td class="style4">Fecha Captura</td>
                    <td><asp:Label ID="FechaCapturaLabel" runat="server" Text='<%# Bind("FechaCaptura") %>' /></td>
                </tr>
                <tr>
                    <td class="style4">Fecha Acuerdo</td>
                    <td><asp:Label ID="FechaAcuerdoLabel" runat="server" Text='<%# Bind("FechaAcuerdo") %>' /></td>
                </tr>
                <tr>
                    <td class="style4">Fecha Publicación</td>
                    <td><asp:Label ID="FechaPublicacionLabel" runat="server" Text='<%# Bind("FechaPublicacion") %>' /></td>
                </tr>
                <tr>
                    <td class="style4">Tipo Actividad</td>
                    <td><asp:DropDownList ID="IdTipoDropDownList" runat="server" 
                            DataSourceID="SqlDSTiposActividad" DataTextField="TipoActividad" 
                            DataValueField="IdTipoActividad" Enabled="False" SelectedValue='<%# Bind("IdTipo") %>'>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="style4" height="0">Usuario Captura</td>
                    <td height="0"><asp:DropDownList ID="IdUserCapturaDropDownList" runat="server" 
                            DataSourceID="SqlDSUsuarios" DataTextField="Comment" DataValueField="UserId" 
                            Enabled="False" SelectedValue='<%# Bind("IdUserCaptura") %>'>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="style4">Fecha Inicio</td>
                    <td><asp:Label ID="FechaInicioLabel" runat="server" Text='<%# Bind("FechaInicio") %>' /></td>
                </tr>
                <tr>
                    <td class="style4">Avance</td>
                    <td><asp:Label ID="AvanceLabel" runat="server" Text='<%# Bind("Avance") %>' /></td>
                </tr>
                <tr>
                    <td class="style4">Proyecto</td>
                    <td><asp:DropDownList ID="IdProyectoDropDownList" runat="server" 
                            DataSourceID="SqlDSProyectos" DataTextField="Proyecto" 
                            DataValueField="IdProyecto" Enabled="False" SelectedValue='<%# Bind("IdProyecto") %>'>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td colspan="2"><asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar" />&nbsp;
                                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Nuevo" />&nbsp;
                    <asp:LinkButton ID="BackButton" runat="server" CausesValidation="False" 
                        PostBackUrl="javascript:history.go(-1)">Regresar</asp:LinkButton></td>
                </tr>
            </table>
        </ItemTemplate>
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDSActividades" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        InsertCommand="INSERT INTO [TActividades] ([IdExpediente], [FechaVencimiento], [IdUsuario], [IdStatus], [Descripcion], [Observaciones], [FechaCaptura], [FechaAcuerdo], [FechaPublicacion], [IdTipo], [IdUserCaptura], [FechaInicio], [Avance], [IdProyecto]) VALUES (@IdExpediente, @FechaVencimiento, @IdUsuario, @IdStatus, @Descripcion, @Observaciones, GETDATE(), @FechaAcuerdo, @FechaPublicacion, @IdTipo, @IdUserCaptura, @FechaInicio, @Avance, @IdProyecto) SELECT @NewID = SCOPE_IDENTITY()" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [TActividades] WHERE ([IdActividad] = @IdActividad)" 
        
        
        UpdateCommand="UPDATE [TActividades] SET [IdExpediente] = @IdExpediente, [FechaVencimiento] = @FechaVencimiento, [IdUsuario] = @IdUsuario, [IdStatus] = @IdStatus, [Descripcion] = @Descripcion, [Observaciones] = @Observaciones, [FechaAcuerdo] = @FechaAcuerdo, [FechaPublicacion] = @FechaPublicacion, [IdTipo] = @IdTipo, [FechaInicio] = @FechaInicio, [Avance] = @Avance, [IdProyecto] = @IdProyecto WHERE [IdActividad] = @original_IdActividad AND (([IdExpediente] = @original_IdExpediente) OR ([IdExpediente] IS NULL AND @original_IdExpediente IS NULL)) AND (([FechaVencimiento] = @original_FechaVencimiento) OR ([FechaVencimiento] IS NULL AND @original_FechaVencimiento IS NULL)) AND (([IdUsuario] = @original_IdUsuario) OR ([IdUsuario] IS NULL AND @original_IdUsuario IS NULL)) AND (([IdStatus] = @original_IdStatus) OR ([IdStatus] IS NULL AND @original_IdStatus IS NULL)) AND (([Descripcion] = @original_Descripcion) OR ([Descripcion] IS NULL AND @original_Descripcion IS NULL)) AND (([Observaciones] = @original_Observaciones) OR ([Observaciones] IS NULL AND @original_Observaciones IS NULL)) AND (([FechaAcuerdo] = @original_FechaAcuerdo) OR ([FechaAcuerdo] IS NULL AND @original_FechaAcuerdo IS NULL)) AND (([FechaPublicacion] = @original_FechaPublicacion) OR ([FechaPublicacion] IS NULL AND @original_FechaPublicacion IS NULL)) AND (([IdTipo] = @original_IdTipo) OR ([IdTipo] IS NULL AND @original_IdTipo IS NULL)) AND (([FechaInicio] = @original_FechaInicio) OR ([FechaInicio] IS NULL AND @original_FechaInicio IS NULL)) AND (([Avance] = @original_Avance) OR ([Avance] IS NULL AND @original_Avance IS NULL)) AND (([IdProyecto] = @original_IdProyecto) OR ([IdProyecto] IS NULL AND @original_IdProyecto IS NULL))" 
        oninserted="SqlDSActividades_Inserted">
        <InsertParameters>
            <asp:Parameter Name="IdExpediente" Type="Int32" />
            <asp:Parameter Name="FechaVencimiento" Type="DateTime" />
            <asp:Parameter Name="IdUsuario" Type="String" />
            <asp:Parameter Name="IdStatus" Type="String" />
            <asp:Parameter Name="Descripcion" Type="String" />
            <asp:Parameter Name="Observaciones" Type="String" />
            <asp:Parameter Name="FechaAcuerdo" Type="DateTime" />
            <asp:Parameter Name="FechaPublicacion" Type="DateTime" />
            <asp:Parameter Name="IdTipo" Type="String" />
            <asp:SessionParameter Name="IdUserCaptura" SessionField="IdUserCaptura" Type="String" />
            <asp:Parameter Name="FechaInicio" Type="DateTime" />
            <asp:Parameter Name="Avance" Type="Int32" />
            <asp:Parameter Name="IdProyecto" Type="Int32" />
            <asp:Parameter Direction="Output" Name="NewID" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="IdActividad" SessionField="Id" 
                Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="IdExpediente" Type="Int32" />
            <asp:Parameter Name="FechaVencimiento" Type="DateTime" />
            <asp:Parameter Name="IdUsuario" Type="String" />
            <asp:Parameter Name="IdStatus" Type="String" />
            <asp:Parameter Name="Descripcion" Type="String" />
            <asp:Parameter Name="Observaciones" Type="String" />
            <asp:Parameter Name="FechaAcuerdo" Type="DateTime" />
            <asp:Parameter Name="FechaPublicacion" Type="DateTime" />
            <asp:Parameter Name="IdTipo" Type="String" />
            <asp:Parameter Name="FechaInicio" Type="DateTime" />
            <asp:Parameter Name="Avance" Type="Int32" />
            <asp:Parameter Name="IdProyecto" Type="Int32" />
            <asp:Parameter Name="original_IdActividad" Type="Int32" />
            <asp:Parameter Name="original_IdExpediente" Type="Int32" />
            <asp:Parameter Name="original_FechaVencimiento" Type="DateTime" />
            <asp:Parameter Name="original_IdUsuario" Type="String" />
            <asp:Parameter Name="original_IdStatus" Type="String" />
            <asp:Parameter Name="original_Descripcion" Type="String" />
            <asp:Parameter Name="original_Observaciones" Type="String" />
            <asp:Parameter Name="original_FechaAcuerdo" Type="DateTime" />
            <asp:Parameter Name="original_FechaPublicacion" Type="DateTime" />
            <asp:Parameter Name="original_IdTipo" Type="String" />
            <asp:Parameter Name="original_FechaInicio" Type="DateTime" />
            <asp:Parameter Name="original_Avance" Type="Int32" />
            <asp:Parameter Name="original_IdProyecto" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDSExpedientes" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        
        SelectCommand="SELECT NULL IDExpediente, '_No Aplica' Expediente
UNION
SELECT IDExpediente, dbo.ufn_getExpedienteName(IDExpediente) AS Expediente FROM TExpediente ORDER BY Expediente">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDSUsuarios" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        SelectCommand="SELECT upper(UserId) UserId, Comment FROM aspnet_Membership ORDER BY CONVERT(varchar(MAX), Comment)">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDSEstatus" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        SelectCommand="SELECT IdStatus, Status FROM TStatus WHERE Estatus = 1 ORDER BY Status">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDSTiposActividad" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        SelectCommand="SELECT IdTipoActividad, TipoActividad FROM TTipoActividad WHERE Estatus = 1 ORDER BY TipoActividad">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDSProyectos" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        SelectCommand="SELECT IdProyecto, Proyecto FROM TProyectos WHERE Estatus = 1 ORDER BY Proyecto">
    </asp:SqlDataSource>
    <asp:ScriptManager ID="ScriptManager" runat="server"  EnableScriptGlobalization="True" />
</asp:Content>
