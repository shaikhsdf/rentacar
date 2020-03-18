using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace rentacar
{
    public partial class managecar : System.Web.UI.Page
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

            OleDbCommand cmda = new OleDbCommand();
            //this.InitializeComponent();
            cmda.CommandText = "select * from cartemp";
            connect();
            cmda.Connection = cn;
            OleDbDataReader dra;
            dra = cmda.ExecuteReader();
            while (dra.Read())
            {
                carid.Text = dra[0].ToString();
                carname.Text = dra[1].ToString();
                carimage.ImageUrl = dra[2].ToString();
                inputfuel.SelectedValue = dra[3].ToString();
                inputseat.SelectedValue = dra[4].ToString();
                inputfare.Text = dra[5].ToString();
                inputno.Text = dra[6].ToString();
                inputStatus.SelectedValue = dra[7].ToString();


            }
        }    

        protected void Page_Load(object sender, EventArgs e)
        {
            refresh();

        }

        //protected void Save_Click(object sender, EventArgs e)
        //{
        //    cmd.CommandText = "insert into car values(" + carid.Text + ",'" + carname.Text.Trim() + "', '" + carimage.ImageUrl + "','" + inputfuel.SelectedValue + "'," + inputseat.SelectedValue + "," + inputfare.Text + ",'" + inputno.Text + "','" + inputStatus.Text + "')";
        //    connect();
        //    cmd.ExecuteNonQuery();
        //    cmd.Dispose();
        //    //Response.Write("<script LANGUAGE='JavaScript' >alert(" + img +")</script>");
        //    Response.Write("<script LANGUAGE='JavaScript' >alert('Data Saved')</script>");
        //    refresh();

        //}

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

        protected void new_Click(object sender, EventArgs e)
        {
            refresh();

        }

        protected void Update_Click(object sender, EventArgs e)
        {
            cmd.CommandText = "update car set carid=" + carid.Text + ",name='" + carname.Text.Trim() + "',pic='" + carimage.ImageUrl + "',fueltype='" + inputfuel.SelectedValue + "',seater=" + inputseat.SelectedValue + ",fare=" + inputfare.Text + ",noplate='" + inputno.Text + "',status='" + inputStatus.Text + "' where carid=" + carid.Text + "";
            connect();
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            cmd.CommandText = "delete from cartemp";
            connect();
            cmd.ExecuteNonQuery();
            cmd.Dispose();
           
            Response.Write("<script LANGUAGE='JavaScript' >alert('Data Updated')</script>");
            refresh();
            carimage.ImageUrl = "images//defaultcar.jpg";
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            cmd.CommandText = "delete from car where carid=" + carid.Text + "";
            connect();
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            cmd.CommandText = "delete from cartemp";
            connect();
            cmd.ExecuteNonQuery();
            cmd.Dispose();
          
            Response.Write("<script LANGUAGE='JavaScript' >alert('Car Deleted Successfully')</script>");
            refresh();
            carimage.ImageUrl = "images//defaultcar.jpg";
        }

        protected void viewcarslist_Click(object sender, EventArgs e)
        {
            Response.Redirect("searchcars.aspx");
        }
    }
}