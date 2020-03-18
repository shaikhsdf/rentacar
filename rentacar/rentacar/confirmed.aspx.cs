using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace rentacar
{
    public partial class confirmed : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (GridView1.Rows.Count < 1)
            {
                Label1.Visible = true;
                Label1.Text = "No Data To Be Displayed";
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}