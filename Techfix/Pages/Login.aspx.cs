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
    public partial class Login : System.Web.UI.Page
    {
        // Database connection string
        private readonly string connectionString = "Data Source=PERFECTION;Initial Catalog=TechFix;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            // Clear error message on page load
            lblErrorMessage.Text = string.Empty;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                lblErrorMessage.Text = "Username and password are required.";
                return;
            }

            string role = ValidateLogin(username, password);

            // Redirect based on role
            if (role == "Admin")
            {
                Response.Redirect("Admin_Dashboard.aspx");
            }
            else if (role == "Manager")
            {
                Response.Redirect("Manager_Dashboard.aspx");
            }
            else if (role == "Supplier")
            {
                // Set Supplier ID in session after successful login
                SetSupplierSession(username, password);
                Response.Redirect("Supplier_Dashboard.aspx");
            }
            else
            {
                lblErrorMessage.Text = "Invalid username or password.";
            }
        }

        private string ValidateLogin(string username, string password)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                try
                {
                    // Check Users table for Admin and Manager roles
                    string userQuery = "SELECT Role FROM Users WHERE Username = @Username AND Password = @Password AND IsActive = 1";
                    using (SqlCommand cmd = new SqlCommand(userQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@Username", username);
                        cmd.Parameters.AddWithValue("@Password", password);

                        object role = cmd.ExecuteScalar();
                        if (role != null)
                        {
                            string roleString = role.ToString().Trim(); // Ensure no trailing spaces
                            System.Diagnostics.Debug.WriteLine($"Login successful: Role = {roleString}");
                            return roleString;
                        }
                    }

                    // Check Suppliers table for Supplier role
                    string supplierQuery = "SELECT SupplierID FROM Suppliers WHERE Username = @Username AND Password = @Password AND IsActive = 1";
                    using (SqlCommand cmd = new SqlCommand(supplierQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@Username", username);
                        cmd.Parameters.AddWithValue("@Password", password);

                        object supplier = cmd.ExecuteScalar();
                        if (supplier != null)
                        {
                            // Successfully logged in as Supplier
                            System.Diagnostics.Debug.WriteLine("Login successful: Role = Supplier");
                            return "Supplier";
                        }
                    }
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine($"Error during login validation: {ex.Message}");
                }
            }

            System.Diagnostics.Debug.WriteLine("Invalid login attempt");
            return "Invalid"; // Default case for invalid credentials
        }

        private void SetSupplierSession(string username, string password)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                string query = "SELECT SupplierID FROM Suppliers WHERE Username = @Username AND Password = @Password AND IsActive = 1";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password);

                    object supplierId = cmd.ExecuteScalar();
                    if (supplierId != null)
                    {
                        // Set the SupplierID in the session
                        Session["SupplierID"] = supplierId.ToString();
                    }
                }
            }
        }
    }
}