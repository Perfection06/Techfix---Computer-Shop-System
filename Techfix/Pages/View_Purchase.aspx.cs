using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Techfix.Pages
{
    public partial class View_Purchase : Page
    {
        private string connectionString = "Data Source=PERFECTION;Initial Catalog=TechFix;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            // Load the approved quotations and purchase orders when the page is first loaded
            if (!IsPostBack)
            {
                GetApprovedQuotationsAndPurchaseOrders();
            }
        }

        // This method fetches the approved quotations and their corresponding purchase orders
        private void GetApprovedQuotationsAndPurchaseOrders()
        {
            // SQL query to fetch approved quotations and their corresponding purchase orders
            string query = @"
                SELECT 
                    q.QuotationID, 
                    s.Name AS SupplierName, 
                    q.QuotationAmount, 
                    q.DeliverySchedule, 
                    q.QuotationDetails, 
                    q.Status AS QuotationStatus,
                    po.POAmount, 
                    po.POStatus, 
                    po.OrderDate
                FROM dbo.Quotations q
                INNER JOIN dbo.Suppliers s ON q.SupplierID = s.SupplierID
                INNER JOIN dbo.PurchaseOrders po ON q.QuotationID = po.QuotationID
                WHERE q.Status = 'Accepted'";  

            // Create a connection to the database
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();

                try
                {
                    // Open the connection and fill the DataTable
                    conn.Open();
                    da.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        // Bind the data to the GridView
                        gvQuotation.DataSource = dt;
                        gvQuotation.DataBind();

                        // Hide the error message if data is found
                        lblErrorMessage.Visible = false;
                    }
                    else
                    {
                        // Display a message if no data is found
                        lblErrorMessage.Text = "No approved quotations or purchase orders found.";
                        lblErrorMessage.Visible = true;

                        // Clear the GridView if no data is found
                        gvQuotation.DataSource = null;
                        gvQuotation.DataBind();
                    }
                }
                catch (Exception ex)
                {
                    // Display any error that occurs
                    lblErrorMessage.Text = "Error: " + ex.Message;
                    lblErrorMessage.Visible = true;
                }
            }
        }

        // Handle pagination in GridView
        protected void gvQuotation_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvQuotation.PageIndex = e.NewPageIndex;
            GetApprovedQuotationsAndPurchaseOrders();
        }
    }
}
