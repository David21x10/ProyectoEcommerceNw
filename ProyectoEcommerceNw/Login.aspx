<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ProyectoEcommerceNw.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="estilos/logincss.css" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login-box">
        <h2>Login</h2>
        <asp:TextBox ID="txtUsuario" runat="server" Placeholder="Usuario"></asp:TextBox>
        <asp:TextBox ID="txtClave" runat="server" TextMode="Password" Placeholder="Contraseña"></asp:TextBox>
        <asp:Button ID="btnLogin" runat="server" Text="Iniciar Sesión" CssClass="btn-login" OnClick="btnLogin_Click" />
        <asp:Label ID="lblMensaje" runat="server" ForeColor="Red" />
    </div>
</asp:Content>


