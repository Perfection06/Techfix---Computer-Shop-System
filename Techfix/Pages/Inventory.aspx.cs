using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Techfix.Pages
{
    public partial class Inventory : System.Web.UI.Page
    {
        private string connectionString = "Data Source=PERFECTION;Initial Catalog=TechFix;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetInventoryInfo();
            }
        }

        private void GetInventoryInfo()
        {
            string query = @"
                SELECT 
                    RFQ.ProductDescription, 
                    RFQ.Quantity, 
                    RFQ.Specifications, 
                    PO.POAmount
                FROM 
                    Delivery D
                JOIN 
                    PurchaseOrders PO ON D.POID = PO.POID
                JOIN 
                    Quotations Q ON PO.QuotationID = Q.QuotationID
                JOIN 
                    RFQs RFQ ON Q.RFQID = RFQ.RFQID
                WHERE 
                    D.DeliveryStatus = 'Delivered'";

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
                        gvInventory.DataSource = dt;
                        gvInventory.DataBind();
                        lblErrorMessage.Visible = false;
                    }
                    else
                    {
                        lblErrorMessage.Text = "No inventory records found.";
                        lblErrorMessage.Visible = true;
                        gvInventory.DataSource = null;
                        gvInventory.DataBind();
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