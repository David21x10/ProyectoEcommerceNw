<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="Cobro.aspx.cs" Inherits="ProyectoEcommerceNw.Cobro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="estilos/cobro.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
<div class="cobro-container">
        <h2>¡Gracias por tu compra!</h2>

        <p><strong>Número de Factura:</strong> <asp:Label ID="lblFactura" runat="server" /></p>
        <p><strong>Usuario:</strong> <asp:Label ID="lblUsuario" runat="server" /></p>
        <p><strong>Fecha:</strong> <asp:Label ID="lblFecha" runat="server" /></p>
        <p><strong>Dirección de envío:</strong> <asp:Label ID="lblDireccion" runat="server" /></p>
        <p class="total-venta"><strong>Total:</strong> <asp:Label ID="lblTotal" runat="server" /></p>

        <h3>Detalle de productos</h3>
        <asp:GridView ID="gvProductosVendidos" runat="server" AutoGenerateColumns="false" CssClass="grid-vendidos">
            <Columns>
                <asp:BoundField DataField="NomPro" HeaderText="Producto" />
                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" />
                <asp:BoundField DataField="PrePro" HeaderText="Precio Unitario" DataFormatString="{0:C}" />
                <asp:TemplateField HeaderText="Subtotal">
                    <ItemTemplate>
                        <%# Convert.ToDecimal(Eval("PrePro")) * Convert.ToInt32(Eval("Cantidad")) %>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

       <asp:Button ID="btnSeguirComprando" runat="server" Text="Seguir comprando" CssClass="btn-seguir" OnClick="btnSeguirComprando_Click" />

    </div>

</asp:Content>
