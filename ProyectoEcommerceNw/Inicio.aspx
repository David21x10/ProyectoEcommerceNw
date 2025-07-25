<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="ProyectoEcommerceNw.Inicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link rel="stylesheet" href="../estilos/inicio.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  

    <section class="bienvenida">
        <h2>¡Bienvenido a tu tienda de tecnología!</h2>
        <p>Descubre ofertas, novedades y lo último en equipos tecnológicos.</p>
    </section>

   
    <section class="beneficios">
        <div class="beneficio">
            <img src="img/ENVIO.jpg" alt="Envío gratis" />
            <h3>Envío Gratis</h3>
            <p>Compras mayores a L.2,000</p>
        </div>
        <div class="beneficio">
            <img src="img/ST.jpg" alt="Soporte técnico" />
            <h3>Soporte Técnico</h3>
            <p>24/7 y especializado</p>
        </div>
        <div class="beneficio">
            <img src="img/PS.jpg" alt="Pagos seguros" />
            <h3>Pagos Seguros</h3>
            <p>Protección en cada compra</p>
        </div>
    </section>

 
    <section class="destacados">
        <h2>Productos Destacados</h2>
        <div class="productos-grid">
            <div class="producto">
                <img src="img/LAPTOP.jpg" alt="Laptop Gaming" />
                <h4>Laptop Gaming OMEN 17</h4>
                <p class="precio">L. 26,000.00</p>
                <a href="Producto.aspx?id=1" class="btn-comprar">Ver más</a>
            </div>
            <div class="producto">
                <img src="img/MAUSE.jpg" alt="Mouse Dell" />
                <h4>Mouse inalámbrico Dell MS3320W</h4>
                <p class="precio">L. 400.00</p>
                <a href="Producto.aspx?id=2" class="btn-comprar">Ver más</a>
            </div>
            <div class="producto">
                <img src="img/PC.jpg" alt="PC de escritorio" />
                <h4>PC de escritorio INSPIRON</h4>
                <p class="precio">L. 32,999.00</p>
                <a href="Producto.aspx?id=3" class="btn-comprar">Ver más</a>
            </div>
        </div>
    </section>

</asp:Content>