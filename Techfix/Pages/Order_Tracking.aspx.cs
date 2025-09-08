using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using Techfix.DeliveryService;
using TechfixSystem.Services;

namespace Techfix.Pages
{
    public partial class Order_Tracking : System.Web.UI.Page
    {
        private DeliveryServiceSoapClient _deliveryService = new DeliveryServiceSoapClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDeliveries();
            }
        }

        private void LoadDeliveries()
        {
            DataTable deliveries = _deliveryService.GetAllDeliveryDetails();

            // Ensure all expected columns exist in the DataTable
            if (!deliveries.Columns.Contains("SupplierName"))
            {
                deliveries.Columns.Add("SupplierName", typeof(string));
            }

            // Add 'BusinessName' column if it does not exist
            if (!deliveries.Columns.Contains("BusinessName"))
            {
                deliveries.Columns.Add("BusinessName", typeof(string));  
            }

            gvDeliveries.DataSource = deliveries;
            gvDeliveries.DataBind();
        }


        protected void gvDeliveries_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // Check if the command is either "CancelDelivery" or "ReturnDelivery"
            if (e.CommandName == "CancelDelivery" || e.CommandName == "ReturnDelivery")
            {
                // Retrieve the DeliveryID from the CommandArgument
                int deliveryID = Convert.ToInt32(e.CommandArgument);

                // Initialize the result string
                string result;

                // Execute the appropriate service method
                if (e.CommandName == "CancelDelivery")
                {
                    result = _deliveryService.CancelDelivery(deliveryID);
                }
                else
                {
                    result = _deliveryService.ReturnDelivery(deliveryID);
                }

                // Display the result in a JavaScript alert
                string script = $"alert('{result}');";
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", script, true);

                // Refresh the GridView
                LoadDeliveries();
            }
        }
    }
}
