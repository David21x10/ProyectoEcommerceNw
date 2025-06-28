using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace ProyectoEcommerceNw
{
    public partial class Carrito : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                MostrarCarrito();
        }

        private void MostrarCarrito()
        {
            if (Session["Carrito"] != null)
            {
                DataTable carrito = (DataTable)Session["Carrito"];
                rptCarrito.DataSource = carrito;
                rptCarrito.DataBind();

                decimal total = 0;
                foreach (DataRow row in carrito.Rows)
                {
                    decimal precio = Convert.ToDecimal(row["PrePro"]);
                    int cantidad = Convert.ToInt32(row["Cantidad"]);
                    total += precio * cantidad;
                }

                lblTotal.Text = "Total a pagar: L " + total.ToString("N2");
            }
            else
            {
                lblTotal.Text = "Tu carrito está vacío.";
            }
        }

        protected void rptCarrito_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            DataTable carrito = (DataTable)Session["Carrito"];
            int index = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "Eliminar")
            {
                carrito.Rows.RemoveAt(index);
            }
            else if (e.CommandName == "Mas")
            {
                carrito.Rows[index]["Cantidad"] = Convert.ToInt32(carrito.Rows[index]["Cantidad"]) + 1;
            }
            else if (e.CommandName == "Menos")
            {
                int cantidadActual = Convert.ToInt32(carrito.Rows[index]["Cantidad"]);
                if (cantidadActual > 1)
                    carrito.Rows[index]["Cantidad"] = cantidadActual - 1;
            }

            Session["Carrito"] = carrito;
            MostrarCarrito();
        }

    }
}