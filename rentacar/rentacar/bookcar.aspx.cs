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
    public partial class bookcar : System.Web.UI.Page
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

        void instamojopay()
        {
            /***** Create a new payment order *******/
             string ClientID = "lm0yIbueCMdnyDtG8IG2FFwNbDG4TwcCzu2uSYsT";
            string secretkey = "F8MsK5hAZ8IMgKwp9JmAkpNMfEREFMtM9dnMqECCzaP3xGnVJwhAJs0Ks1G2Iy8slOmvoy6p8ehZpjwpT1VuhDpKoMyCgU8fUHOaSZZuUlMs05OW6eGJGvrokPAuAuIY";
            string endpoint = "https://api.instamojo.com/v2/";
            string authendpoint = "https://www.instamojo.com/oauth2/token/";
            Instamojo objClass = InstamojoImplementation.getApi( ClientID, secretkey, endpoint,authendpoint );



            PaymentOrder objPaymentRequest = new PaymentOrder();
        //Required POST parameters
        objPaymentRequest.name = inputname.Text;
  objPaymentRequest.email = "sadafvop@yahoo.com";
  objPaymentRequest.phone = inputphone.Text;
  objPaymentRequest.amount = Convert.ToDouble(total.Text);
  objPaymentRequest.transaction_id = bookingid.Text; // Unique Id to be provided

            objPaymentRequest.redirect_url = "http://localhost:51150/payment.aspx";
            //webhook is optional.
            //objPaymentRequest.webhook_url = "https://your.server.com/webhook";
            

            if (objPaymentRequest.validate())
  {
              
               if (objPaymentRequest.nameInvalid)
               {
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Name is not valid')</script>");
               }
               if (objPaymentRequest.phoneInvalid)
               {
                   
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Phone is not valid')</script>");
                }
                           
              
               if (objPaymentRequest.redirectUrlInvalid)
               {
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Redirect Url Id is not valid')</script>");

                }
               

}else
{
               try
               {
                    CreatePaymentOrderResponse objPaymentResponse = objClass.createNewPaymentRequest(objPaymentRequest);
                    //objPaymentRequest.redirect_url = "www.google.com";
                    Response.Write("Payment URL = " + objPaymentResponse.payment_options.payment_url);
                    Response.Redirect(objPaymentResponse.payment_options.payment_url);
                }
               catch (ArgumentNullException ex)
               {
                    Response.Write("<script LANGUAGE='JavaScript' >alert('"+ ex.Message +"')</script>");
                }
               
               catch (IOException ex)
               {
                    Response.Write("<script LANGUAGE='JavaScript' >alert('" + ex.Message + "')</script>");
                }
                catch (InvalidPaymentOrderException ex)
                {
                    if (!ex.IsWebhookValid())
                    {
                        Response.Write("<script LANGUAGE='JavaScript' >alert('" + ex.Message + "')</script>");
                    }

                   
                }
                catch (ConnectionException ex)
               {
                    Response.Write("<script LANGUAGE='JavaScript' >alert('" + ex.Message + "')</script>");
                }
               catch (BaseException ex)
               {
                    Response.Write("<script LANGUAGE='JavaScript' >alert('" + ex.Message + "')</script>");
                }
               catch (Exception ex)
               {
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Error:' " + ex.Message + "')</script>");
                }
}

        }

        void newbookingid()
        {
            OleDbCommand cmda = new OleDbCommand();
            OleDbDataReader dra;
            cmda.CommandText = "select max(bookingid) from booking";
            connect();
            cmda.Connection = cn;
            dra = cmda.ExecuteReader();
            while (dra.Read())
            {
                if (dra.GetValue(0) == DBNull.Value)
                {
                    bookingid.Text = "1";
                }
                else
                {
                    int id = Convert.ToInt32(dra[0]);
                    id += 1;
                    bookingid.Text = id.ToString();

                }
            }
        }
        void getfare()
        {
            OleDbCommand cmda = new OleDbCommand();
            OleDbDataReader dra;
            cmda.CommandText = "select fare from bookingtemp where username='"+ usr +"'";
            connect();
            cmda.Connection = cn;
            dra = cmda.ExecuteReader();
            while (dra.Read())
            {
                fare.Text = dra["fare"].ToString();

            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            newbookingid();
            getfare();
        }

        protected void todate_TextChanged(object sender, EventArgs e)
        {
           
            try
            {
                
                DateTime d1 = Convert.ToDateTime(fromdate.Text);
                DateTime d2 = Convert.ToDateTime(todate.Text);
                if(d2< DateTime.Today)
                {
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Choose a valid date ')</script>");
                }

                TimeSpan s = d2.Subtract(d1);
                int totaldays = s.Days + 1;
                days.Text = totaldays.ToString();
                double amt;
                amt = Convert.ToDouble(fare.Text) * Convert.ToDouble(days.Text);
                total.Text = amt.ToString();
            }
            catch (Exception FormatException )
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Choose From Date ')</script>");
            }    
                                          
        }



        protected void days_TextChanged(object sender, EventArgs e)
        {

        }

        protected void fromdate_TextChanged(object sender, EventArgs e)
        {
            try
            {

                DateTime d1 = Convert.ToDateTime(fromdate.Text);
                DateTime d2 = Convert.ToDateTime(todate.Text);
                if (d1 < DateTime.Today)
                {
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Choose a valid date ')</script>");
                }
                TimeSpan s = d2.Subtract(d1);
                int totaldays = s.Days + 1;
                days.Text = totaldays.ToString();
                double amt;
                amt = Convert.ToDouble(fare.Text) * Convert.ToDouble(days.Text);
                total.Text = amt.ToString();
            }
            catch (Exception FormatException)
            {
                days.Text = "0";
            }
        }

        protected void fare_TextChanged(object sender, EventArgs e)
        {
           

        }

        protected void later_Click(object sender, EventArgs e)
        {
            OleDbCommand cmda = new OleDbCommand();
            OleDbDataReader dra;
            cmda.CommandText = "select * from bookingtemp where username='" + usr + "'";
            connect();
            cmda.Connection = cn;
            dra = cmda.ExecuteReader();
            while (dra.Read())
            {
                cmd.CommandText = "insert into draft values(" + bookingid.Text + ",'" + inputname.Text + "','" + inputphone.Text + "','" + inputaddress.Text + "'," + dra[1] + ",'" + dra[2] + "','"+ dra[3] +"','" + dra[4] + "',"+ dra[5] +"," + fare.Text + ",'" + fromdate.Text + "','" + todate.Text + "'," + days.Text + "," + total.Text + ",'"+ "Draft" +"','" + usr + "')";
                connect();
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                Response.Redirect("drafts.aspx?id="+ usr);

                //Response.Write("<script LANGUAGE='JavaScript' >alert(" + img +")</script>");
               // Response.Write("<script LANGUAGE='JavaScript' >alert('Data Saved')</script>");
            }
                
            
        }

        protected void confirm_Click(object sender, EventArgs e)
        {
            


            OleDbCommand cmda = new OleDbCommand();
            OleDbDataReader dra;
            cmda.CommandText = "select * from bookingtemp where username='" + usr + "'";
            connect();
            cmda.Connection = cn;
            dra = cmda.ExecuteReader();
            while (dra.Read())
            {
                cmd.CommandText = "insert into booking values(" + bookingid.Text + ",'" + DateTime.Today + "','" + inputname.Text + "','" + inputphone.Text + "','" + inputaddress.Text + "'," + dra[1] + ",'" + dra[2] + "','" + dra[4] + "'," + fare.Text + ",'" + fromdate.Text + "','" + todate.Text + "'," + days.Text + "," + total.Text + ",'" + "Pending" + "','" + "Booking Pending" + "','" + usr + "')";
                connect();
                cmd.Connection = cn;
                cmd.ExecuteNonQuery();
                cmd.Dispose();

                cmd.CommandText = "delete from transactionid where username='" + usr + "'";
                connect();
                cmd.Connection = cn;
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                cmd.CommandText = "insert into transactionid values('" + bookingid.Text + "','" + usr + "')";
                connect();
                cmd.Connection = cn;
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                instamojopay();
                // Response.Redirect("mybooking.aspx?usr=" + usr);
                //Response.Write("<script LANGUAGE='JavaScript' >alert(" + img +")</script>");
                // Response.Write("<script LANGUAGE='JavaScript' >alert('Data Saved')</script>");
            }
        }
    }
}