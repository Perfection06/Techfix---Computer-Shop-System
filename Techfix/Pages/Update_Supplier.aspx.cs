using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using Techfix.SupplierService;



namespace Techfix.Pages
{
    public partial class Update_Supplier : System.Web.UI.Page
    {
        private SupplierServiceSoapClient supplierService = new SupplierServiceSoapClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSuppliers();
            }
        }

        private void LoadSuppliers()
        {
            try
            {
                var suppliers = supplierService.GetAllSuppliers();
                gvSuppliers.DataSource = suppliers;
                gvSuppliers.DataBind();
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", $"alert('Error loading suppliers: {ex.Message}');", true);
            }
        }

        protected void gvSuppliers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Suppress default RowDeleting behavior
            e.Cancel = true;
        }

        protected void gvSuppliers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int supplierID = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "Delete")
            {
                try
                {
                    bool result = supplierService.DeleteSupplier(supplierID);
                    string message = result ? "Supplier deleted successfully." : "Failed to delete supplier.";
                    ClientScript.RegisterStartupScript(this.GetType(), "Alert", $"alert('{message}');", true);
                    LoadSuppliers();
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Alert", $"alert('Error deleting supplier: {ex.Message}');", true);
                }
            }
            else if (e.CommandName == "Edit")
            {
                Response.Redirect($"Edit_Supplier.aspx?supplierID={supplierID}");
            }
            else if (e.CommandName == "Activate")
            {
                try
                {
                    bool result = supplierService.SetSupplierStatus(supplierID, true);
                    string message = result ? "Supplier activated successfully." : "Failed to activate supplier.";
                    ClientScript.RegisterStartupScript(this.GetType(), "Alert", $"alert('{message}');", true);
                    LoadSuppliers();
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Alert", $"alert('Error activating supplier: {ex.Message}');", true);
                }
            }
            else if (e.CommandName == "Deactivate")
            {
                try
                {
                    bool result = supplierService.SetSupplierStatus(supplierID, false);
                    string message = result ? "Supplier deactivated successfully." : "Failed to deactivate supplier.";
                    ClientScript.RegisterStartupScript(this.GetType(), "Alert", $"alert('{message}');", true);
                    LoadSuppliers();
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Alert", $"alert('Error deactivating supplier: {ex.Message}');", true);
                }
            }
        }
    }
}
