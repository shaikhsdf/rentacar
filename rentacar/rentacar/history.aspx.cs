using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.IO;
using System.Data;


namespace rentacar
{
    public partial class history : System.Web.UI.Page
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
            cmda.CommandText = "select * from booking order by bookingid desc";
            connect();
            cmda.Connection = cn;
            cmda.ExecuteNonQuery();
            OleDbDataAdapter da = new OleDbDataAdapter();
            DataTable dt = new DataTable("dt");
            da.SelectCommand = cmda;
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            if (GridView1.Rows.Count >= 1)
            {
                Label1.Visible = false;
                Label1.Text = "No Data To Be Displayed";
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (GridView1.Rows.Count < 1)
            {
                Label1.Visible = true;
                Label1.Text = "No Data To Be Displayed";
            }
            if (GridView1.Rows.Count >= 1)
            {
                Label1.Visible = false;
                Label1.Text = "No Data To Be Displayed";
            }

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void searchstatus_SelectedIndexChanged(object sender, EventArgs e)
        {            
            OleDbCommand cmda = new OleDbCommand();
            //this.InitializeComponent();
            cmda.CommandText = "select * from booking where status='"+ searchstatus.SelectedValue +"'";
            connect();
            cmda.Connection = cn;
            cmda.ExecuteNonQuery();
            OleDbDataAdapter da = new OleDbDataAdapter();
            DataTable dt = new DataTable("dt");
            da.SelectCommand = cmda;
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            if (GridView1.Rows.Count >= 1)
            {
                Label1.Visible = false;
                Label1.Text = "No Data To Be Displayed";
            }
        }

        protected void searchbookid_TextChanged(object sender, EventArgs e)
        {
            OleDbCommand cmda = new OleDbCommand();
            //this.InitializeComponent();
            cmda.CommandText = "select * from booking where bookingid=" + searchbookid.Text + "";
            connect();
            cmda.Connection = cn;
            cmda.ExecuteNonQuery();
            OleDbDataAdapter da = new OleDbDataAdapter();
            DataTable dt = new DataTable("dt");
            da.SelectCommand = cmda;
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            if (GridView1.Rows.Count >= 1)
            {
                Label1.Visible = false;
                Label1.Text = "No Data To Be Displayed";
            }
        }

        protected void searchphone_TextChanged(object sender, EventArgs e)
        {
            OleDbCommand cmda = new OleDbCommand();
            //this.InitializeComponent();
            cmda.CommandText = "select * from booking where customerphone='" + searchphone.Text + "'";
            connect();
            cmda.Connection = cn;
            cmda.ExecuteNonQuery();
            OleDbDataAdapter da = new OleDbDataAdapter();
            DataTable dt = new DataTable("dt");
            da.SelectCommand = cmda;
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            if (GridView1.Rows.Count >= 1)
            {
                Label1.Visible = false;
                Label1.Text = "No Data To Be Displayed";
            }
        }

        protected void searchname_TextChanged(object sender, EventArgs e)
        {
            OleDbCommand cmda = new OleDbCommand();
            //this.InitializeComponent();
            cmda.CommandText = "select * from booking where customername='" + searchname.Text + "'";
            connect();
            cmda.Connection = cn;
            cmda.ExecuteNonQuery();
            OleDbDataAdapter da = new OleDbDataAdapter();
            DataTable dt = new DataTable("dt");
            da.SelectCommand = cmda;
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            if (GridView1.Rows.Count >= 1)
            {
                Label1.Visible = false;
                Label1.Text = "No Data To Be Displayed";
            }
        }

        protected void searchcarid_TextChanged(object sender, EventArgs e)
        {
            OleDbCommand cmda = new OleDbCommand();
            //this.InitializeComponent();
            cmda.CommandText = "select * from booking where carid='" + searchcarid.Text + "'";
            connect();
            cmda.Connection = cn;
            cmda.ExecuteNonQuery();
            OleDbDataAdapter da = new OleDbDataAdapter();
            DataTable dt = new DataTable("dt");
            da.SelectCommand = cmda;
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            if (GridView1.Rows.Count >= 1)
            {
                Label1.Visible = false;
                Label1.Text = "No Data To Be Displayed";
            }
        }

        protected void refresh_Click(object sender, ImageClickEventArgs e)
        {
            refreshgrid();
        }
    }
}