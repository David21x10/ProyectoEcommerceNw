<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="Facturacion.aspx.cs" Inherits="ProyectoEcommerceNw.Facturacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<link rel="stylesheet" type="text/css" href="estilos/facturacion.css" />

<div class="factura-container">
    <h2>Factura</h2>

    <div class="info-factura">

        <p><strong>ID de Factura:</strong> <asp:Label ID="lblIdVenta" runat="server" /></p>
        <p><strong>Usuario:</strong> <asp:Label ID="lblUsuario" runat="server" /></p>
        <p><strong>Fecha:</strong> <asp:Label ID="lblFecha" runat="server" /></p>
        <p><strong>Dirección:</strong> <asp:TextBox ID="txtDireccion" runat="server" /></p>
    </div>

    <div class="detalle-productos">
        <h3>Productos del Carrito</h3>
        <asp:GridView ID="gvCarrito" runat="server" AutoGenerateColumns="False" CssClass="tabla-productos">
    <Columns>
        <asp:BoundField DataField="IdPro" HeaderText="ID Producto" Visible="False" />
        <asp:BoundField DataField="NomPro" HeaderText="Producto" />
        <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" />
        <asp:BoundField DataField="PrePro" HeaderText="Precio" DataFormatString="{0:C}" />
        <asp:TemplateField HeaderText="Subtotal">
            <ItemTemplate>
                <%# Convert.ToDecimal(Eval("PrePro")) * Convert.ToInt32(Eval("Cantidad")) %>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
        <p class="total-venta"><strong>Total de la venta:</strong> <asp:Label ID="lblTotal" runat="server" /></p>

    </div>

    <asp:Button ID="btnPagar" runat="server" Text="Pagar" CssClass="btn-pagar" OnClick="btnPagar_Click" />
</div>

        <asp:ScriptManager ID="ScriptManager1" runat="server" />

    


</asp:Content>
