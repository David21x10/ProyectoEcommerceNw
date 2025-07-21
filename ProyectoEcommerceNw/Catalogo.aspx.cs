using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoEcommerceNw
{
    public partial class Catalogo : System.Web.UI.Page
    {
        Conexion conexion = new Conexion();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarCatalogo();

                if (Session["Carrito"] == null)
                {
                    DataTable dt = new DataTable();
                    dt.Columns.Add("IdPro");
                    dt.Columns.Add("NomPro");
                    dt.Columns.Add("PrePro");
                    dt.Columns.Add("Cantidad", typeof(int));
                    Session["Carrito"] = dt;
                }

            }
        }

        private void CargarCatalogo()
        {
            rptCatalogo.DataSource = conexion.ObtenerCatalogo(); 
            rptCatalogo.DataBind();
        }


        protected void rptCatalogo_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Mas" || e.CommandName == "Menos")
            {
                TextBox txtCantidad = (TextBox)e.Item.FindControl("txtCantidad");
                int cantidad = int.TryParse(txtCantidad.Text, out int c) ? c : 1;

                cantidad = e.CommandName == "Mas" ? cantidad + 1 : Math.Max(1, cantidad - 1);
                txtCantidad.Text = cantidad.ToString();
            }

            if (e.CommandName == "Agregar")
            {
                string[] datos = e.CommandArgument.ToString().Split('|');
                string id = datos[0];
                int itemIndex = int.Parse(datos[1]);

                TextBox txtCantidad = (TextBox)rptCatalogo.Items[itemIndex].FindControl("txtCantidad");
                int cantidad = int.Parse(txtCantidad.Text);

                DataRow producto = conexion.ObtenerProductos(id);

                if (producto != null)
                {
                    DataTable carrito = (DataTable)Session["Carrito"];
                    DataRow fila = carrito.NewRow();
                    fila["IdPro"] = id;  
                    fila["NomPro"] = producto["NomPro"];
                    fila["PrePro"] = producto["PrePro"];
                    fila["Cantidad"] = cantidad;
                    carrito.Rows.Add(fila);
                    Session["Carrito"] = carrito;
                }

                Response.Write("<script>alert('Producto agregado al carrito')</script>");

            }
        }
    }
}
