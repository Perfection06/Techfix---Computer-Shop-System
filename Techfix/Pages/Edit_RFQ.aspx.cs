using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Techfix.RFQService;

namespace TechfixSystem.Pages
{
    public partial class Edit_RFQ : System.Web.UI.Page
    {
        RFQServiceSoapClient client = new RFQServiceSoapClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    int rfqID = Convert.ToInt32(Request.QueryString["rfqID"]);
                    LoadRFQDetails(rfqID);
                }
                catch (Exception ex)
                {
                    // Log error and show alert
                    Response.Write($"<script>alert('Error loading RFQ details: {ex.Message}')</script>");
                }
            }
        }

        private void LoadRFQDetails(int rfqID)
        {
            try
            {
                RFQ rfq = client.GetRFQByID(rfqID);

                if (rfq != null)
                {
                    hfRFQID.Value = rfq.RFQID.ToString();
                    txtProductDescription.Text = rfq.ProductDescription;
                    txtQuantity.Text = rfq.Quantity.ToString();
                    txtSpecifications.Text = rfq.Specifications;
                    txtDeliveryRequirements.Text = rfq.DeliveryRequirements;
                    txtPricingFormat.Text = rfq.PricingFormat;
                    txtPaymentTerms.Text = rfq.PaymentTerms;
                    txtValidityPeriod.Text = rfq.ValidityPeriod.ToString("yyyy-MM-dd");
                }
                else
                {
                    Response.Write("<script>alert('RFQ not found.')</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error retrieving RFQ: {ex.Message}')</script>");
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                RFQ rfq = new RFQ
                {
                    RFQID = Convert.ToInt32(hfRFQID.Value),
                    ProductDescription = txtProductDescription.Text.Trim(),
                    Quantity = Convert.ToInt32(txtQuantity.Text.Trim()),
                    Specifications = txtSpecifications.Text.Trim(),
                    DeliveryRequirements = txtDeliveryRequirements.Text.Trim(),
                    PricingFormat = txtPricingFormat.Text.Trim(),
                    PaymentTerms = txtPaymentTerms.Text.Trim(),
                    ValidityPeriod = DateTime.Parse(txtValidityPeriod.Text.Trim())
                };

                string result = client.ManageRFQ(rfq.RFQID, rfq.ProductDescription, rfq.Quantity, rfq.Specifications,
                                                 rfq.DeliveryRequirements, rfq.PricingFormat, rfq.PaymentTerms,
                                                 rfq.ValidityPeriod);

                if (result == "RFQ updated successfully.")
                {
                    // Redirect with a success alert
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "SuccessAlert",
                        "alert('RFQ updated successfully.'); window.location='Manage_RFQ.aspx';", true);
                }
                else
                {
                    // Show error alert from service response
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ErrorAlert",
                        $"alert('{result}');", true);
                }
            }
            catch (Exception ex)
            {
                // Show unexpected error alert
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ExceptionAlert",
                    $"alert('Error updating RFQ: {ex.Message}');", true);
            }
        }
    }
}
