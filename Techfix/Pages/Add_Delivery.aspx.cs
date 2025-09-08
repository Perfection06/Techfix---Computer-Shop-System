using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Techfix.DeliveryService;
using TechfixSystem.DBLayer;


namespace Techfix.Pages
{
    public partial class Add_Delivery : System.Web.UI.Page
    {
        private DeliveryServiceSoapClient deliveryService = new DeliveryServiceSoapClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int purchaseOrderID;
                if (int.TryParse(Request.QueryString["POID"], out purchaseOrderID))
                {
                    txtPOID.Text = purchaseOrderID.ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Purchase Order ID');</script>");
                    Response.Redirect("ViewPurchaseOrders.aspx");
                }
            }
        }

        protected void btnAddDelivery_Click(object sender, EventArgs e)
        {
            int purchaseOrderID = Convert.ToInt32(txtPOID.Text);
            string shippingConfirmation = txtShippingConfirmation.Text;
            DateTime estimatedDeliveryDate;

            if (!DateTime.TryParse(txtEstimatedDeliveryDate.Text, out estimatedDeliveryDate))
            {
                Response.Write("<script>alert('Please enter a valid delivery date.');</script>");
                return;
            }

            try
            {
                // Call the SOAP service to add delivery
                string deliveryResult = deliveryService.AddDelivery(
                    purchaseOrderID,
                    shippingConfirmation,
                    estimatedDeliveryDate
                );

                // Check the delivery result
                if (deliveryResult == "Delivery record added successfully.")
                {
                    // Update POStatus to Accepted
                    string poStatusResult = deliveryService.UpdatePurchaseOrderStatus(purchaseOrderID, "Accepted");
                    if (poStatusResult != "Purchase order status updated successfully.")
                    {
                        Response.Write($"<script>alert('Delivery confirmed, but failed to update purchase order status: {HttpUtility.JavaScriptStringEncode(poStatusResult)}');</script>");
                        return;
                    }

                    Response.Write("<script>alert('Delivery confirmed successfully!');</script>");
                    Response.Redirect("Orders.aspx");
                }
                else
                {
                    Response.Write($"<script>alert('{HttpUtility.JavaScriptStringEncode(deliveryResult)}');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('An error occurred: {HttpUtility.JavaScriptStringEncode(ex.Message)}');</script>");
            }
        }
    }
}