using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace rentacar
{
    public partial class viewcars : System.Web.UI.Page
    {
        OleDbConnection cn = new OleDbConnection();
        OleDbCommand cmd = new OleDbCommand();
        void connect()
        {
            if (cn.State == System.Data.ConnectionState.Closed)
            {
                cn.ConnectionString = "Provider=SQLNCLI11;Data Source=.\\SQLEXPRESS;Integrated Security=SSPI;Initial Catalog=rentcardb";
                cmd.Connection = cn;
                cn.Open();
            }
        }
        void disconnect()
        {
            cmd.Parameters.Clear();
            cn.Close();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "bookcar")
            {
                cmd.CommandText = "select * from car where carid=" + e.CommandArgument + "";
                connect();
                cmd.Connection = cn;
                OleDbDataReader dr;
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    string usr = "sdf";
                    OleDbCommand cmdb = new OleDbCommand();
                    cmdb.CommandText = "delete from bookingtemp where username='" + usr + "'";
                    connect();
                    cmdb.Connection = cn;
                    cmdb.ExecuteNonQuery();
                    OleDbCommand cmda = new OleDbCommand();
                    cmda.CommandText = "insert into bookingtemp values('"+ usr +"',"+ dr[0] +",'"+ dr[1] + "', '" + dr[2] + "','" + dr[3] + "', " + dr[4] + "," + dr[5] + ")";
                    connect();
                    cmda.Connection = cn;
                    cmda.ExecuteNonQuery();
                    Response.Redirect("bookcar.aspx?usr=" + usr);
                }              
            }
        }
    }
}