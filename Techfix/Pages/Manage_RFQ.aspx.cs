using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Techfix.RFQService;


namespace TechfixSystem.Pages
{
    public partial class Manage_RFQ : System.Web.UI.Page
    {
        RFQServiceSoapClient client = new RFQServiceSoapClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRFQs();
            }
        }

        private void LoadRFQs()
        {
            var rfqs = client.GetAllRFQs();
            gvRFQs.DataSource = rfqs;
            gvRFQs.DataBind();
        }

        protected void btnDelete_Command(object sender, System.Web.UI.WebControls.CommandEventArgs e)
        {
            int rfqID = Convert.ToInt32(e.CommandArgument);

            bool success = client.DeleteRFQ(rfqID);

            if (success)
            {
                LoadRFQs();
                Response.Write("<script>alert('RFQ deleted successfully.')</script>");
            }
            else
            {
                // Handle delete failure
                Response.Write("<script>alert('Failed to delete RFQ.')</script>");
            }
        }
    }
}