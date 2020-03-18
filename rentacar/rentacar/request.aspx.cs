using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;


namespace rentacar
{
    public partial class request : System.Web.UI.Page
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
        void refreshgrid()
        {
            OleDbCommand cmda = new OleDbCommand();
            cmda.CommandText = "select * from booking where status='"+ "Booked" +"'";
            connect();
            cmda.Connection = cn;
            cmda.ExecuteNonQuery();
            OleDbDataAdapter da = new OleDbDataAdapter();
            DataTable dt = new DataTable("dt");
            da.SelectCommand = cmda;
            da.Fill(dt);
            gridview1.DataSource = dt;
            gridview1.DataBind();
            if (gridview1.Rows.Count >= 1)
            {
                Label1.Visible = false;
                Label1.Text = "No Data To Be Displayed";
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(gridview1.Rows.Count<1)
            {
                Label1.Visible = true;
                Label1.Text = "No Data To Be Displayed";
            }
        }

        protected void Unnamed2_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void gridview1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName=="confirm")
            {
                
                Response.Redirect("viewcars.aspx");
            }
        }

        protected void gridview1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
           
        }

        protected void gridview1_SelectedIndexChanged(object sender, EventArgs e)
        {
            OleDbCommand cmda = new OleDbCommand();
            cmda.CommandText = "update booking set status='"+ "Confirmed" +"' where bookingid=" + gridview1.SelectedRow.Cells[0].Text + "";
            connect();
            cmda.Connection = cn;
            cmda.ExecuteNonQuery();
            //send customer msg
            refreshgrid();
            Response.Write("<script LANGUAGE='JavaScript' >alert('Booking Confirmed')</script>");
           


        }

        protected void gridview1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            OleDbCommand cmda = new OleDbCommand();
            cmda.CommandText = "update booking set status='" + "Cancelled" + "' where bookingid=" + gridview1.SelectedRow.Cells[0].Text + "";
            connect();
            cmda.Connection = cn;
            cmda.ExecuteNonQuery();
            //send customer msg
            refreshgrid();
            Response.Write("<script LANGUAGE='JavaScript' >alert('Booking Cancelled')</script>");
        }
    }
}