using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.OleDb;
using InstamojoAPI;


namespace rentacar
{
    public partial class payment : System.Web.UI.Page
    {
        string usr="sdf";
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
            OleDbCommand cmda = new OleDbCommand();
            //this.InitializeComponent();
            cmda.CommandText = "select * from transactionid where username='" + usr + "'";
            connect();
            cmda.Connection = cn;
            OleDbDataReader dra;
            dra = cmda.ExecuteReader();
            while (dra.Read())
            {

                string ClientID = "lm0yIbueCMdnyDtG8IG2FFwNbDG4TwcCzu2uSYsT";
                string secretkey = "F8MsK5hAZ8IMgKwp9JmAkpNMfEREFMtM9dnMqECCzaP3xGnVJwhAJs0Ks1G2Iy8slOmvoy6p8ehZpjwpT1VuhDpKoMyCgU8fUHOaSZZuUlMs05OW6eGJGvrokPAuAuIY";
                string endpoint = "https://api.instamojo.com/v2/";
                string authendpoint = "https://www.instamojo.com/oauth2/token/";
                /***** Details of Payment order using TransactionId. *******/
                Instamojo objClass = InstamojoImplementation.getApi(ClientID, secretkey, endpoint, authendpoint);
                try
                {
                    PaymentOrderDetailsResponse objPaymentRequestDetailsResponse = objClass.getPaymentOrderDetailsByTransactionId(dra[0].ToString());
                    paymentid.Text = objPaymentRequestDetailsResponse.transaction_id;
                    phone.Text = objPaymentRequestDetailsResponse.phone;
                    paidamount.Text = objPaymentRequestDetailsResponse.amount.ToString();
                    status.Text = objPaymentRequestDetailsResponse.status;
                }
                catch (Exception ex)
                {
                    Label1.Visible = true;
                    Label1.Text = "**********No Data to be displayed***********";
                }
            }
        }

        


        protected void amount_TextChanged(object sender, EventArgs e)
        {

        }

        protected void confirm_Click(object sender, EventArgs e)
        {
            if (status.Text=="Completed")
            {
                cmd.CommandText = "update booking set status='" + "Booked" + "' where username='" + usr + "' and bookingid=" + paymentid.Text + " ";
                connect();
                cmd.Connection = cn;
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                cmd.CommandText = "insert into payment values("+ paymentid.Text +",'"+ DateTime.Now +"',"+ paymentid.Text +",'"+ phone.Text +"',"+ paidamount.Text +",'"+ status.Text +"')";
                connect();
                cmd.Connection = cn;
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                Response.Redirect("mybooking.aspx");
            }
            if (status.Text!="Completed")
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('As the payment was not completed the booking cannot be done.')</script>");
            }
           
        }
    }
}