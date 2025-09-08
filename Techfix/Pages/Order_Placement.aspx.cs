using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using Techfix.QuotationService;
using Techfix.RFQService;
using TechfixSystem.Models;

namespace Techfix.Pages
{
    public partial class Order_Placement : System.Web.UI.Page
    {
        QuotationServiceSoapClient quotationClient = new QuotationServiceSoapClient();
        RFQServiceSoapClient rfqClient = new RFQServiceSoapClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateProductDescriptions();
            }
        }

        private void PopulateProductDescriptions()
        {
            Techfix.RFQService.RFQ[] rfqArray = rfqClient.GetAllRFQs();
            List<Techfix.RFQService.RFQ> rfqList = new List<Techfix.RFQService.RFQ>(rfqArray);

            ddlProductDescription.DataSource = rfqList;
            ddlProductDescription.DataTextField = "ProductDescription";
            ddlProductDescription.DataValueField = "RFQID";
            ddlProductDescription.DataBind();

            ddlProductDescription.Items.Insert(0, new ListItem("Select a Product", ""));
        }

        protected void btnGetQuotations_Click(object sender, EventArgs e)
        {
            if (int.TryParse(ddlProductDescription.SelectedValue, out int rfqID))
            {
                DisplayQuotations(rfqID);
            }
            else
            {
                lblMessage.Text = "Please select a valid product description.";
            }
        }

        private void DisplayQuotations(int rfqID)
        {
            Techfix.QuotationService.Quotation[] quotationArray = quotationClient.GetQuotationsByRFQID(rfqID);
            List<Techfix.QuotationService.Quotation> quotations = new List<Techfix.QuotationService.Quotation>(quotationArray);

            gvQuotations.DataSource = quotations;
            gvQuotations.DataBind();
        }

        protected void btnAccept_Click(object sender, EventArgs e)
        {
            Button btnAccept = (Button)sender;
            GridViewRow row = (GridViewRow)btnAccept.NamingContainer;

            int quotationID = Convert.ToInt32(gvQuotations.DataKeys[row.RowIndex].Value);

            // Use SOAP client to accept a quotation
            QuotationServiceSoapClient quotationClient = new QuotationServiceSoapClient();
            string result = quotationClient.AcceptQuotation(quotationID);

            lblMessage.Text = result;
        }
    }
}
