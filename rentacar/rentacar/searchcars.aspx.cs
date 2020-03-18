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
    public partial class searchcars : System.Web.UI.Page
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
            //this.InitializeComponent();
            cmda.CommandText = "select * from car order by carid";
            connect();
            cmda.Connection = cn;
            cmda.ExecuteNonQuery();
            OleDbDataAdapter da = new OleDbDataAdapter();
            DataTable dt = new DataTable("dt");
            da.SelectCommand = cmda;
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            displaynodata();
        }
        void displaynodata()
        {
            if (GridView1.Rows.Count >= 1)
            {
                Label1.Visible = false;
                Label1.Text = "No Data To Be Displayed";
            }
            if (GridView1.Rows.Count < 1)
            {
                Label1.Visible = true;
                Label1.Text = "No Data To Be Displayed";
            }
        }
        protected void Page_Load(object sender, EventArgs e)

        {
            refreshgrid();
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

        protected void refresh_Click(object sender, ImageClickEventArgs e)
        {
            refreshgrid();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            cmd.CommandText = "delete from cartemp";
            connect();
            cmd.Connection = cn;
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            OleDbCommand cmda = new OleDbCommand();
            cmda.CommandText = "select * from car where carid="+ GridView1.SelectedRow.Cells[0].Text +" ";
            connect();
            cmda.Connection = cn;
            OleDbDataReader dra;
            dra = cmda.ExecuteReader();
            while(dra.Read())
            {
                cmd.CommandText = "insert into cartemp values(" + dra[0] + ",'" + dra[1] + "', '" + dra[2] + "','" + dra[3] + "'," + dra[4] + "," + dra[5] + ",'" + dra[6] + "','" + dra[7] + "')";
                connect();
                cmd.Connection = cn;
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                Response.Redirect("managecar.aspx");

            }
        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            

        }

        protected void searchcarid_TextChanged(object sender, EventArgs e)
        {
            OleDbCommand cmda = new OleDbCommand();
            //this.InitializeComponent();
            cmda.CommandText = "select * from car where carid="+ searchcarid.Text +"";
            connect();
            cmda.Connection = cn;
            cmda.ExecuteNonQuery();
            OleDbDataAdapter da = new OleDbDataAdapter();
            DataTable dt = new DataTable("dt");
            da.SelectCommand = cmda;
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            displaynodata();
        }

        protected void searchcarname_TextChanged(object sender, EventArgs e)
        {
            OleDbCommand cmda = new OleDbCommand();
            //this.InitializeComponent();
            cmda.CommandText = "select * from car where name='" + searchcarname.Text + "'";
            connect();
            cmda.Connection = cn;
            cmda.ExecuteNonQuery();
            OleDbDataAdapter da = new OleDbDataAdapter();
            DataTable dt = new DataTable("dt");
            da.SelectCommand = cmda;
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            displaynodata();
        }

        protected void searchcarno_TextChanged(object sender, EventArgs e)
        {
            OleDbCommand cmda = new OleDbCommand();
            //this.InitializeComponent();
            cmda.CommandText = "select * from car where noplate like '" + searchcarno.Text + "%' ";
            connect();
            cmda.Connection = cn;
            cmda.ExecuteNonQuery();
            OleDbDataAdapter da = new OleDbDataAdapter();
            DataTable dt = new DataTable("dt");
            da.SelectCommand = cmda;
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            displaynodata();
        }

        protected void searchstatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            OleDbCommand cmda = new OleDbCommand();
            //this.InitializeComponent();
            cmda.CommandText = "select * from car where status='" + searchstatus.SelectedValue + "'";
            connect();
            cmda.Connection = cn;
            cmda.ExecuteNonQuery();
            OleDbDataAdapter da = new OleDbDataAdapter();
            DataTable dt = new DataTable("dt");
            da.SelectCommand = cmda;
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            displaynodata();
        }
    }
}