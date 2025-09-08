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
    public partial class Orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPurchaseOrders();
            }
        }

        private void LoadPurchaseOrders()
        {
            // Retrieve SupplierID from session
            if (Session["SupplierID"] == null)
            {
                // If the supplier is not logged in, redirect to the login page
                Response.Redirect("Login.aspx");
                return;
            }

            int supplierID = Convert.ToInt32(Session["SupplierID"]); // Get SupplierID from session
            string connectionString = "Data Source=PERFECTION;Initial Catalog=TechFix;Integrated Security=True";
            string query = @"
            SELECT
                PO.POID,
                Q.QuotationDetails,
                RFQ.ProductDescription,
                PO.POAmount,
                PO.POStatus,
                PO.OrderDate
            FROM PurchaseOrders PO
            INNER JOIN Quotations Q ON PO.QuotationID = Q.QuotationID
            INNER JOIN RFQs RFQ ON Q.RFQID = RFQ.RFQID
            WHERE Q.SupplierID = @SupplierID
            AND PO.POStatus != 'Accepted'"; 

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@SupplierID", supplierID); // Use the session SupplierID
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                try
                {
                    adapter.Fill(dt);
                    gvPurchaseOrders.DataSource = dt;
                    gvPurchaseOrders.DataBind();
                }
                catch (SqlException ex)
                {
                    // Log or handle the error appropriately
                    Response.Write($"Error: {ex.Message}");
                }
            }
        }

        protected void gvPurchaseOrders_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ConfirmDelivery")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvPurchaseOrders.Rows[rowIndex];
                int purchaseOrderID = Convert.ToInt32(row.Cells[0].Text);

                // Redirect to Add_Delivery.aspx with POID
                Response.Redirect($"Add_Delivery.aspx?POID={purchaseOrderID}");
            }
        }
    }
}
