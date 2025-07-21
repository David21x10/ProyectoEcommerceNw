using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoEcommerceNw
{
    public partial class Login : System.Web.UI.Page
    {
        Conexion cn = new Conexion();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                Session["usuario"] = null;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string correo = txtUsuario.Text;
            string contrasena = txtClave.Text;

            bool usuarioValido = cn.LoginValidar(correo, contrasena);

            if (usuarioValido)
            {
                Session["usuario"] = correo;
                Response.Redirect("Catalogo.aspx");
            }
            else
            {
                lblMensaje.Text = "Correo o contraseña incorrectos.";
            }
        }
    }
}