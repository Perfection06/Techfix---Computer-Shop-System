using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Techfix.Pages
{
    public partial class Delivery : System.Web.UI.Page
    {
        string connectionString = "Data Source=PERFECTION;Initial Catalog=TechFix;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDeliveries();
            }
        }

        private void LoadDeliveries()
        {
            try
            {
                // Get SupplierID from session
                if (Session["SupplierID"] == null)
                {
                    Response.Redirect("Login.aspx"); // Redirect to login page if the user is not logged in
                    return;
                }

                int supplierID = Convert.ToInt32(Session["SupplierID"]); // Get SupplierID from session

                // SQL query to fetch deliveries for the logged-in supplier, including ProductDescription and ActualDeliveryDate
                string query = @"
                SELECT
                    D.DeliveryID,
                    PO.POID,
                    PO.POAmount,
                    PO.POStatus,
                    D.DeliveryStatus,
                    D.ShippingConfirmation,
                    D.EstimatedDeliveryDate,
                    D.ActualDeliveryDate,
                    RFQ.ProductDescription
                FROM Delivery D
                INNER JOIN PurchaseOrders PO ON D.POID = PO.POID
                INNER JOIN Quotations Q ON PO.QuotationID = Q.QuotationID
                INNER JOIN RFQs RFQ ON Q.RFQID = RFQ.RFQID
                WHERE Q.SupplierID = @SupplierID";

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@SupplierID", supplierID);
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    gvDeliveries.DataSource = dt;
                    gvDeliveries.DataBind();
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error loading deliveries: " + ex.Message;
            }
        }
    }
}
