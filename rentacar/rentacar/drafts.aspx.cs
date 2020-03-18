using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.IO;

namespace rentacar
{
    public partial class drafts : System.Web.UI.Page
    {
        OleDbConnection cn = new OleDbConnection();
        OleDbCommand cmd = new OleDbCommand();
        string usr = "sdf";
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
            if(DataList1.Items.Count<1)
            {
                Label9.Visible = true;
                Label9.Text = "No Data To Be Displayed";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
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
                    cmda.CommandText = "insert into bookingtemp values('" + usr + "'," + dr[0] + ",'" + dr[1] + "', '" + dr[2] + "','" + dr[3] + "', " + dr[4] + "," + dr[5] + ")";
                    connect();
                    cmda.Connection = cn;
                    cmda.ExecuteNonQuery();
                    Response.Redirect("bookcar.aspx?usr=" + usr);
                }
               
            }
            if (e.CommandName == "deletecar")
            {
               // Response.Redirect("bookcar.aspx?usr=" + usr);
                OleDbCommand cmdb = new OleDbCommand();
                cmdb.CommandText = "delete from draft where draftid=" + e.CommandArgument + "";
                connect();
                cmdb.Connection = cn;
                cmdb.ExecuteNonQuery();
                Label9.Text = cmdb.CommandText;
                Response.Redirect("drafts.aspx?usr=" + usr);
            }
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ImageButton1_Command(object sender, CommandEventArgs e)
        {

        }
    }
}