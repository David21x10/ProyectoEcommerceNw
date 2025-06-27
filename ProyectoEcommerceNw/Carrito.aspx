<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="ProyectoEcommerceNw.Carrito" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href='<%= ResolveUrl("~/estilos/estilo.css") %>' rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <h2>Tu Carrito</h2>
        <asp:Repeater ID="rptCarrito" runat="server" OnItemCommand="rptCarrito_ItemCommand">
            <ItemTemplate>
                <div class="card mb-3">
                    <div class="card-body">
                        <h5 class="card-title"><%# Eval("NomPro") %></h5>
                        <p class="card-text">Precio unitario: L <%# Eval("PrePro") %></p>
                        <div class="d-flex align-items-center gap-2 mb-2">
                            <asp:Button ID="btnMenos" runat="server" Text="−" CommandName="Menos" CommandArgument='<%# Container.ItemIndex %>' CssClass="btn btn-secondary btn-sm" />
                            <asp:Label ID="lblCantidad" runat="server" Text='<%# Eval("Cantidad") %>' CssClass="mx-2" />
                            <asp:Button ID="btnMas" runat="server" Text="+" CommandName="Mas" CommandArgument='<%# Container.ItemIndex %>' CssClass="btn btn-secondary btn-sm" />
                        </div>
                        <p class="card-text text-success font-weight-bold">
                            Subtotal: L <%# Convert.ToDecimal(Eval("PrePro")) * Convert.ToInt32(Eval("Cantidad")) %>
                        </p>
                        <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CommandName="Eliminar" CommandArgument='<%# Container.ItemIndex %>' CssClass="btn btn-danger" />
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <div class="text-end mt-3">
    <asp:Label ID="lblTotal" runat="server" CssClass="h4 text-success fw-bold" />
</div>

    </div>
</asp:Content>
