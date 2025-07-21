using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoEcommerceNw
{
    public partial class Administrador : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["usuario"] != null)
                {
                    lblUsuario.Text = Session["usuario"].ToString();
                    linkLogin.Attributes["style"] = "pointer-events: none; color: gray; text-decoration: none;";
                    linkLogin.InnerText = "Sesión iniciada";
                }
                else
                {
                    lblUsuario.Text = "";
                }
            }

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Catalogo.aspx");
        }
    }
}