using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sistema_Ventas
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LlenarGrid();
        }


        protected void LlenarGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["Sistema_VentasConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("select C.Nombre_Cajero,C.Apellidos_Cajero,P.Nombre_Producto,P.Precio_Producto,MR.Piso_MaqRegis,MR.Codigo_MaqRegis from Ventas v inner join Mae_Cajeros C on C.Codigo_Cajero=V.Codigo_Cajero inner join Mae_Productos P on P.Codigo_Producto = V.Codigo_Producto inner join Mae_Maquinas_Registradoras MR on MR.Codigo_MaqRegis = V.Codigo_MaqRegis"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                        }
                    }
                }
            }
        }

        protected void BIngresar_Click(object sender, EventArgs e)
        {
            String s = System.Configuration.ConfigurationManager.ConnectionStrings["Sistema_VentasConnectionString"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            SqlCommand comando = new SqlCommand(" insert into ventas (Codigo_Cajero,Codigo_Producto,Codigo_MaqRegis)values ('" + DDL_CODCAJERO.SelectedValue + "', '" + DDL_CODPRODUCTO.SelectedValue + "', '" + DDL_CODMR.SelectedValue + "'  )", conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            LlenarGrid();
        }
    }
}