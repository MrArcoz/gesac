<%@ Page Title="Iniciar sesión" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs" Inherits="GESAC.Account.Login"%>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Iniciar sesión
    </h2>
    <asp:Login ID="LoginUser" runat="server" EnableViewState="False" onauthenticate="LoginUser_Authenticate" 
    style="font-weight: 700" BackColor="#F7F7DE" BorderColor="#CCCC99" 
    BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
    Font-Size="10pt" DestinationPageUrl="~/About.aspx" 
        onloggedin="LoginUser_LoggedIn" VisibleWhenLoggedIn="False">
        <LayoutTemplate>
            <span class="failureNotificationLogin">
                <asp:Literal ID="FailureText" runat="server"></asp:Literal>
            </span>
            <asp:ValidationSummary ID="LoginUserValidationSummary" runat="server" CssClass="failureNotificationLogin" 
                 ValidationGroup="LoginUserValidationGroup"/>
            <div class="accountInfo">
                <fieldset class="login">
                    <legend>Información de cuenta</legend>
                    <p>
                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Nombre de usuario:</asp:Label>
                        <asp:TextBox ID="UserName" runat="server" CssClass="textEntry"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" 
                             CssClass="failureNotification" ErrorMessage="El nombre de usuario es obligatorio." ToolTip="El nombre de usuario es obligatorio." 
                             ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Contraseña:</asp:Label>
                        <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" 
                             CssClass="failureNotification" ErrorMessage="La contraseña es obligatoria." ToolTip="La contraseña es obligatoria." 
                             ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <asp:CheckBox ID="RememberMe" runat="server" Visible="False"/>
                        <asp:Label ID="RememberMeLabel" runat="server" AssociatedControlID="RememberMe" 
                            CssClass="inline" Visible="False">Mantenerme conectado</asp:Label>
                    </p>
                </fieldset>
                <p class="submitButton">
                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" 
                        Text="Iniciar sesión" ValidationGroup="LoginUserValidationGroup" 
                        />
                </p>
        </LayoutTemplate>
        <TitleTextStyle BackColor="#6B696B" Font-Bold="True" ForeColor="#FFFFFF" />
    </asp:Login>
    </div>
</asp:Content>
