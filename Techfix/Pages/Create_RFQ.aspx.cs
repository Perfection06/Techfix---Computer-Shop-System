using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Techfix.ProcurementService;

namespace Techfix.Pages
{
    public partial class Create_RFQ : System.Web.UI.Page
    {
        ProcurementServiceSoapClient client = new ProcurementServiceSoapClient();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {

                // Retrieve values from input fields
                string productDescription = txtProductDescription.Text;
                int quantity = int.Parse(txtQuantity.Text);
                string specifications = txtSpecifications.Text;
                string deliveryRequirements = txtDeliveryRequirements.Text;
                string pricingFormat = txtPricingFormat.Text;
                string paymentTerms = txtPaymentTerms.Text;
                DateTime validityPeriod = DateTime.Parse(txtValidityPeriod.Text);

                // Call SubmitRFQ service method
                string response = client.SubmitRFQ(
                    productDescription,
                    quantity,
                    specifications,
                    deliveryRequirements,
                    pricingFormat,
                    paymentTerms,
                    validityPeriod
                );

                // Display success message
                lblMessage.Text = "RFQ submitted successfully. Response: " + response;
                lblMessage.CssClass = "message success";
                lblMessage.Visible = true;
            }
            catch (Exception ex)
            {
                // Display error message
                lblMessage.Text = "Error submitting RFQ: " + ex.Message;
                lblMessage.CssClass = "message error";
                lblMessage.Visible = true;
            }
        }
    }
}