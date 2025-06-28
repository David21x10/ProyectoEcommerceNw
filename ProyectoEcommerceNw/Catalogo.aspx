<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="Catalogo.aspx.cs" Inherits="ProyectoEcommerceNw.Catalogo" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server" >
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<link href="estilos/estilo.css" rel="stylesheet" type="text/css" />

<h2 class="titulo-catalogo">
    Catálogo de productos
</h2>

<div style="display: flex; flex-wrap: wrap; gap: 20px;">
    <asp:Repeater ID="rptCatalogo" runat="server" OnItemCommand="rptCatalogo_ItemCommand">
        <ItemTemplate>
            <div class="card-producto">
                <h3><%# Eval("NomPro") %></h3>
                <p><%# Eval("DesPro") %></p>
                <p class="precio">L. <%# Eval("PrePro", "{0:N2}") %></p>

                <div class="cantidad-controls">
                    <asp:LinkButton ID="btnMenos" runat="server" Text="−" CommandName="Menos" CommandArgument='<%# Container.ItemIndex %>' CssClass="btn-mas-menos" />
                    <asp:LinkButton ID="btnMas" runat="server" Text="+" CommandName="Mas" CommandArgument='<%# Container.ItemIndex %>' CssClass="btn-mas-menos" />
                    <asp:TextBox ID="txtCantidad" runat="server" Text="1" CssClass="txt-cantidad" />
                </div>

                <asp:Button ID="btnAgregar" runat="server" Text="Agregar a la Carretilla"
                    CommandName="Agregar"
                    CommandArgument='<%# Eval("IdPro") + "|" + Container.ItemIndex %>'
                    CssClass="boton-verde" />
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>


</asp:Content>
