using System;
using System.Web.UI;
using Techfix.QuotationService;
using Techfix.RFQService;
using TechfixSystem.Models;

namespace Techfix.Pages
{
    public partial class Quotations : System.Web.UI.Page
    {
        private RFQServiceSoapClient rfqService = new RFQServiceSoapClient(); // Correct SOAP client

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRFQs();
            }
        }

        // Method to load RFQs using the RFQService SOAP service
        private void LoadRFQs()
        {
            try
            {
                // Fetching RFQs using SOAP client
                var rfqs = rfqService.GetAllRFQs();

                // Binding the fetched RFQs to GridView
                gvRFQs.DataSource = rfqs;
                gvRFQs.DataBind();
            }
            catch (Exception ex)
            {
                // Handle the error gracefully
                Response.Write($"<script>alert('Error fetching RFQs: {ex.Message}');</script>");
            }
        }

        // Handle the button click to submit a quotation
        protected void gvRFQs_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName == "SubmitQuotation")
            {
                int rfqID = Convert.ToInt32(e.CommandArgument);

                // Redirect to the SubmitQuotation.aspx page with the RFQ ID as a query string
                Response.Redirect($"Submit_Quotation.aspx?RFQID={rfqID}");
            }
        }
    }
}
