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
                SqlCommand cmd = new SqlCommand("SELECT IdPro, NomPro, PrePro FROM Productos WHERE IdPro = @IdPro", conn);
                cmd.Parameters.AddWithValue("@IdPro", id);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    DataTable dt = new DataTable();
                    dt.Columns.Add("IdPro");
                    dt.Columns.Add("NomPro");
                    dt.Columns.Add("PrePro");

                    DataRow fila = dt.NewRow();
                    fila["IdPro"] = reader["IdPro"].ToString();
                    fila["NomPro"] = reader["NomPro"].ToString();
                    fila["PrePro"] = reader["PrePro"].ToString();
                    return fila;
                }
            }
            return null;
        }


        public bool LoginValidar(string correo, string contrasena)
        {
            using (SqlConnection conn = new SqlConnection(cadenaconexion))
            {
                string consulta = "SELECT COUNT(*) FROM Usuarios WHERE CorUsu = @correo AND ConUsu = @contrasena";
                SqlCommand cmd = new SqlCommand(consulta, conn);
                cmd.Parameters.AddWithValue("@correo", correo);
                cmd.Parameters.AddWithValue("@contrasena", contrasena);

                conn.Open();
                int cantidad = (int)cmd.ExecuteScalar();
                return cantidad > 0;
            }
        }

        public bool Modificaciones(string Comando)
        {
            SqlConnection sqlConnection = new SqlConnection(cadenaconexion);
            SqlCommand sqlCommand = new SqlCommand(Comando, sqlConnection);
            sqlConnection.Open();

            sqlCommand.ExecuteNonQuery();

            sqlCommand.Dispose();
            sqlConnection.Dispose();

            return true;
        }
        public DataSet Consultas(string Comando)
        {

            DataSet cons = new DataSet();
            DataSet dsa = new DataSet();

            SqlConnection sqlConnection = new SqlConnection(cadenaconexion);

            SqlDataAdapter DA = new SqlDataAdapter(Comando, sqlConnection);

            DA.Fill(dsa, "Tabla");

            cons = dsa;

            DA.Dispose();
            dsa.Dispose();
            sqlConnection.Dispose();

            return cons;
        }

    }


}