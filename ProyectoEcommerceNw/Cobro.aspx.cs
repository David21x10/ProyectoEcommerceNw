using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoEcommerceNw
{
    public partial class Cobro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblFactura.Text = Session["IdVenta"] != null ? Session["IdVenta"].ToString() : "N/A";
                lblUsuario.Text = Session["usuario"] != null ? Session["usuario"].ToString() : "Invitado";
                lblDireccion.Text = Session["Direccion"] != null ? Session["Direccion"].ToString() : "No especificada";
                lblFecha.Text = DateTime.Now.ToString("dd/MM/yyyy");

                if (Session["ProductosVendidos"] != null)
                {
                    DataTable productos = Session["ProductosVendidos"] as DataTable;
                    gvProductosVendidos.DataSource = productos;
                    gvProductosVendidos.DataBind();
                }

                if (Session["TotalVenta"] != null)
                {
                    lblTotal.Text = "L " + Convert.ToDecimal(Session["TotalVenta"]).ToString("N2");
                }
            }
        }

        protected void btnSeguirComprando_Click(object sender, EventArgs e)
        {
            Response.Redirect("Catalogo.aspx");
        }
    }
}