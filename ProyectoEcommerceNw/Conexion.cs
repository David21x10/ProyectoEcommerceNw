using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace ProyectoEcommerceNw
{
    public class Conexion
    {

        private string cadenaconexion= "Data Source=localhost; Initial Catalog=Proyecto-eCommerce; Integrated Security=true";

        public DataTable ObtenerCatalogo()
        {
            using (SqlConnection conn = new SqlConnection(cadenaconexion))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Productos", conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }

        public DataRow ObtenerProductos(string id)
        {
            using (SqlConnection conn = new SqlConnection(cadenaconexion))
            {
                SqlCommand cmd = new SqlCommand("SELECT NomPro, PrePro FROM Productos WHERE IdPro = @IdPro", conn);
                cmd.Parameters.AddWithValue("@IdPro", id);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    DataTable dt = new DataTable();
                    dt.Columns.Add("NomPro");
                    dt.Columns.Add("PrePro");

                    DataRow fila = dt.NewRow();
                    fila["NomPro"] = reader["NomPro"].ToString();
                    fila["PrePro"] = reader["PrePro"].ToString();
                    return fila;
                }
            }
            return null;
        }
    }

    
}