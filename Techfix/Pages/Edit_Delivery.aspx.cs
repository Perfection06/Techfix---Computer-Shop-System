using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Techfix.DeliveryService;

namespace Techfix.Pages
{
    public partial class Edit_Delivery : System.Web.UI.Page
    {
        private DeliveryServiceSoapClient _client = new DeliveryServiceSoapClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int deliveryID;
                if (int.TryParse(Request.QueryString["DeliveryID"], out deliveryID))
                {
                    LoadDeliveryDetails(deliveryID);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid Delivery ID.');", true);
                }
            }
        }

        private void LoadDeliveryDetails(int deliveryID)
        {
            try
            {
                DataTable dt = _client.GetDeliveryWithProductInfo();
                DataRow[] rows = dt.Select("DeliveryID = " + deliveryID);
                if (rows.Length > 0)
                {
                    DataRow row = rows[0];
                    lblDeliveryID.Text = deliveryID.ToString();
                    lblProductDescription.Text = row["ProductDescription"].ToString();
                    lblEstimatedDeliveryDate.Text = Convert.ToDateTime(row["EstimatedDeliveryDate"]).ToString("yyyy-MM-dd");
                    ddlStatus.SelectedValue = row["DeliveryStatus"].ToString();
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Delivery not found.');", true);
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error loading delivery details: " + ex.Message + "');", true);
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                int deliveryID = int.Parse(lblDeliveryID.Text);
                string status = ddlStatus.SelectedValue;

                // Update delivery status
                string statusUpdateResult = _client.UpdateDeliveryStatus(deliveryID, status);

                // Update actual delivery date only if status is Delivered
                if (status == "Delivered")
                {
                    DateTime actualDeliveryDate;
                    if (string.IsNullOrEmpty(txtActualDeliveryDate.Text))
                    {
                        // Set to current date if not provided
                        actualDeliveryDate = DateTime.Today;
                    }
                    else
                    {
                        actualDeliveryDate = DateTime.Parse(txtActualDeliveryDate.Text);
                    }
                    string dateUpdateResult = _client.UpdateActualDeliveryDate(deliveryID, actualDeliveryDate);
                }

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Updates saved successfully!'); window.location='Delivery.aspx';", true);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error saving updates: " + ex.Message + "');", true);
            }
        }
    }
}