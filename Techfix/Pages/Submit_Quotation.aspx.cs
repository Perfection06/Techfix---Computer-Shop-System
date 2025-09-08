using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Techfix.QuotationService;
using TechfixSystem.Models;
using TechfixSystem.Services;


namespace Techfix.Pages
{
    public partial class Submit_Quotation : System.Web.UI.Page
    {
        private QuotationServiceSoapClient quotationService = new QuotationServiceSoapClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int rfqID = Convert.ToInt32(Request.QueryString["RFQID"]);
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int rfqID = Convert.ToInt32(Request.QueryString["RFQID"]);

            // Get SupplierID from the session
            if (Session["SupplierID"] == null)
            {
                Response.Write("<script>alert('You must be logged in as a supplier to submit a quotation.');</script>");
                return;
            }

            int supplierID = Convert.ToInt32(Session["SupplierID"]);
            decimal quotationAmount = Convert.ToDecimal(txtQuotationAmount.Value);
            string deliverySchedule = txtDeliverySchedule.Value;
            string quotationDetails = txtQuotationDetails.Value;

            try
            {
                // Call the SubmitQuotation service
                string result = quotationService.SubmitQuotation(
                    rfqID,
                    supplierID,
                    quotationAmount,
                    deliverySchedule,
                    quotationDetails
                );

                // Show the result message and redirect
                Response.Write($"<script>alert('{HttpUtility.JavaScriptStringEncode(result)}'); window.location.href='Quotations.aspx';</script>");
            }
            catch (Exception ex)
            {
                // Handle any unexpected errors
                Response.Write($"<script>alert('An error occurred: {HttpUtility.JavaScriptStringEncode(ex.Message)}');</script>");
            }
        }
    }
}
