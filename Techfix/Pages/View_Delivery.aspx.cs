using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Techfix.Pages
{
    public partial class View_Delivery : System.Web.UI.Page
    {
        private string connectionString = "Data Source=PERFECTION;Initial Catalog=TechFix;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetDeliveryDetails();
            }
        }

        private void GetDeliveryDetails()
        {
            string query = @"
                SELECT 
                    S.Name AS SupplierName, 
                    S.BusinessName, 
                    RFQ.ProductDescription, 
                    D.EstimatedDeliveryDate, 
                    D.DeliveryStatus
                FROM 
                    Delivery D
                JOIN 
                    PurchaseOrders PO ON D.POID = PO.POID
                JOIN 
                    Quotations Q ON PO.QuotationID = Q.QuotationID
                JOIN 
                    Suppliers S ON Q.SupplierID = S.SupplierID
                JOIN 
                    RFQs RFQ ON Q.RFQID = RFQ.RFQID";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();

                try
                {
                    conn.Open();
                    da.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        gvDeliveryDetails.DataSource = dt;
                        gvDeliveryDetails.DataBind();
                        lblErrorMessage.Visible = false;
                    }
                    else
                    {
                        lblErrorMessage.Text = "No delivery records found.";
                        lblErrorMessage.Visible = true;
                        gvDeliveryDetails.DataSource = null;
                        gvDeliveryDetails.DataBind();
                    }
                }
                catch (Exception ex)
                {
                    lblErrorMessage.Text = "Error: " + ex.Message;
                    lblErrorMessage.Visible = true;
                }
            }
        }
    }
}