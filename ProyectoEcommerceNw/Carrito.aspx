<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="ProyectoEcommerceNw.Carrito" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href='<%= ResolveUrl("~/estilos/estilo.css") %>' rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5 text-center">

     
        <h1 style="color: #2e8b57; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">
            Carrito de Compras 
        </h1>
        <p style="margin-bottom: 30px; color: #555;">
            Revisa los productos seleccionados antes de proceder con tu compra.
        </p>


        <asp:Repeater ID="rptCarrito" runat="server" OnItemCommand="rptCarrito_ItemCommand">
            <ItemTemplate>
                <div class="d-flex justify-content-center">
                    <div class="card mb-4 shadow-sm" style="width: 350px;">
                        <div class="card-body text-center">
                            <h5 class="card-title"><%# Eval("NomPro") %></h5>
                            <p class="card-text mb-1">Precio unitario: <strong>L <%# Eval("PrePro") %></strong></p>

                            <div class="d-flex justify-content-center align-items-center gap-2 mb-3">
                                <asp:Button ID="btnMenos" runat="server" Text="−" CommandName="Menos" CommandArgument='<%# Container.ItemIndex %>' CssClass="btn btn-outline-secondary btn-sm" />
                                <asp:Label ID="lblCantidad" runat="server" Text='<%# Eval("Cantidad") %>' CssClass="mx-2" />
                                <asp:Button ID="btnMas" runat="server" Text="+" CommandName="Mas" CommandArgument='<%# Container.ItemIndex %>' CssClass="btn btn-outline-secondary btn-sm" />
                            </div>

                            <p class="card-text text-success fw-bold">
                                Subtotal: L <%# Convert.ToDecimal(Eval("PrePro")) * Convert.ToInt32(Eval("Cantidad")) %>
                            </p>

                            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CommandName="Eliminar" CommandArgument='<%# Container.ItemIndex %>' CssClass="btn btn-danger" />
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

     
        <div class="mt-4">
            <asp:Label ID="lblTotal" runat="server" CssClass="h4 text-success fw-bold" />
        </div>

    </div>
</asp:Content>
