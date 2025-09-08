using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using TechfixSystem.Services;
using TechfixSystem.Models;
using Techfix.RFQService;

namespace Techfix.Pages
{
    public partial class View_RFQ : System.Web.UI.Page
    {
        private RFQServiceSoapClient rfqService = new RFQServiceSoapClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRFQGrid();
            }
        }

        private void BindRFQGrid()
        {
            try
            {
                var rfqs = rfqService.GetAllRFQs();
                gvRFQs.DataSource = rfqs;
                gvRFQs.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error fetching RFQs: {ex.Message}');</script>");
            }
        }

        protected void gvRFQs_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Suppress default RowDeleting behavior
            e.Cancel = true;

            // Get RFQ ID from DataKeys
            int rfqID = Convert.ToInt32(gvRFQs.DataKeys[e.RowIndex].Value);

            try
            {
                // Call Delete RFQ service method
                bool result = rfqService.DeleteRFQ(rfqID);

                // Show result message
                Response.Write($"<script>alert('RFQ Deleted Successfully');</script>");

                // Refresh grid after deletion
                BindRFQGrid();
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error deleting RFQ: {ex.Message}');</script>");
            }
        }
    }
}
