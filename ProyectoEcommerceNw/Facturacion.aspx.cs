using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoEcommerceNw
{
    public partial class Facturacion : System.Web.UI.Page
    {
        Conexion conexion = new Conexion();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["usuario"] != null)
                {
                    lblUsuario.Text = Session["usuario"].ToString();
                }
                else
                {
                    lblUsuario.Text = "Invitado";
                }

                if (Session["Carrito"] != null)
                {
                    DataTable carrito = (DataTable)Session["Carrito"];
                    gvCarrito.DataSource = carrito;
                    gvCarrito.DataBind();
                }
            }

            lblFecha.Text = DateTime.Now.ToString("yyyy-MM-dd");

            DataSet dsa = new DataSet();
            dsa = conexion.Consultas("Select MAX(IdVen) + 1 from Ventas");

            lblIdVenta.Text = dsa.Tables[0].Rows[0][0].ToString();
        }
        protected void btnPagar_Click(object sender, EventArgs e)
        {
            string idVen = lblIdVenta.Text;
            string usuario = lblUsuario.Text;
            string direccion = txtDireccion.Text;
            string fecha = DateTime.Now.ToString("yyyy-MM-dd");

            DataTable carrito = (DataTable)Session["Carrito"];

            if (carrito != null && carrito.Rows.Count > 0)
            {
                decimal total = 0; 

                foreach (DataRow fila in carrito.Rows)
                {
                    string idPro = fila["IdPro"].ToString();
                    int cantidad = Convert.ToInt32(fila["Cantidad"]);
                    decimal precio = Convert.ToDecimal(fila["PrePro"]);

                    total += cantidad * precio;

                    string sql = "exec InsertarVenta " + idVen + ", '" + usuario + "', '" + fecha + "', " + idPro + ", " + cantidad + ", '" + direccion + "'";
                    conexion.Modificaciones(sql);
                }

                lblTotal.Text = total.ToString("F2");

                Session["IdVenta"] = idVen;
                Session["Direccion"] = direccion;
                Session["ProductosVendidos"] = carrito;
                Session["TotalVenta"] = total.ToString("F2");

                Session["Carrito"] = null;

                string script = "alert('Compra realizada con éxito'); window.location='Cobro.aspx';";
                ClientScript.RegisterStartupScript(this.GetType(), "alertRedirect", script, true);
            }
        }



    }

}
