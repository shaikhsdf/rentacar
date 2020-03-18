using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;
using System.IO;


namespace rentacar
{
    public partial class createcar : System.Web.UI.Page
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
        void refresh()
        {

            OleDbDataReader dra;
            OleDbCommand cmda = new OleDbCommand();
            //this.InitializeComponent();
            cmda.CommandText = "select max(carid) from car";
            connect();
            cmda.Connection = cn;
            dra = cmda.ExecuteReader();
            while (dra.Read())
            {
                if (dra.GetValue(0) == DBNull.Value)
                {
                    carid.Text = "1";
                }
                else
                {
                    int id = Convert.ToInt32(dra[0]);
                    id += 1;
                    carid.Text = id.ToString();

                }
            }
            carimage.ImageUrl = "images//defaultcar.jpg";
            dra.Close();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void new_Click(object sender, EventArgs e)
        {
            refresh();
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            cmd.CommandText = "insert into car values(" + carid.Text + ",'" + carname.Text.Trim() + "', '" + carimage.ImageUrl + "','" + inputfuel.SelectedValue + "'," + inputseat.SelectedValue + "," + inputfare.Text + ",'" + inputno.Text + "','" + inputStatus.Text + "')";
            connect();
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            //Response.Write("<script LANGUAGE='JavaScript' >alert(" + img +")</script>");
            Response.Write("<script LANGUAGE='JavaScript' >alert('Data Saved')</script>");

            refresh();
        }

        protected void upload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                FileUpload1.SaveAs(Server.MapPath("images\\" + FileUpload1.FileName));



                carimage.ImageUrl = "images\\" + FileUpload1.FileName;

                // carname.Text = carimage.ImageUrl;

            }
            else
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Please choose a car image')</script>");
                //return;

            }
        }

        protected void find_Click(object sender, EventArgs e)
        {
            Response.Redirect("managecar.aspx");
        }
    }
}