using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Techfix.SupplierService;
using System.Data.SqlClient;
using System.Text.RegularExpressions;


namespace Techfix.Pages
{
    public partial class Add_Supplier : System.Web.UI.Page
    {
        private SupplierServiceSoapClient supplierService = new SupplierServiceSoapClient();
        private readonly string connectionString = "Data Source=PERFECTION;Initial Catalog=TechFix;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            // Page initialization logic if required
        }

        protected void btnAddSupplier_Click(object sender, EventArgs e)
        {
            try
            {
                // Gather input from the form
                string name = txtName.Text.Trim();
                string username = txtUsername.Text.Trim();
                string password = txtPassword.Text.Trim();
                string email = txtEmail.Text.Trim();
                string phone = txtPhone.Text.Trim();
                string address = txtAddress.Text.Trim();
                string businessName = txtBusinessName.Text.Trim();
                bool isActive = chkIsActive.Checked;

                // Validate phone number length
                if (phone.Length != 10 || !Regex.IsMatch(phone, @"^\d{10}$"))
                {
                    Response.Write("<script>alert('Phone number must be exactly 10 digits.');</script>");
                    return;
                }

                // Validate email format
                if (!IsValidEmail(email))
                {
                    Response.Write("<script>alert('Please enter a valid email address.');</script>");
                    return;
                }

                // Check if username, email, phone, or business name already exists
                if (IsUsernameExists(username))
                {
                    Response.Write("<script>alert('The username is already taken. Please choose a different username.');</script>");
                    return;
                }

                if (IsEmailExists(email))
                {
                    Response.Write("<script>alert('The email is already registered. Please use a different email.');</script>");
                    return;
                }

                if (IsPhoneExists(phone))
                {
                    Response.Write("<script>alert('The phone number is already registered. Please use a different phone number.');</script>");
                    return;
                }

                if (IsBusinessNameExists(businessName))
                {
                    Response.Write("<script>alert('The business name is already taken. Please use a different business name.');</script>");
                    return;
                }

                // Call the SOAP service to add the supplier
                bool result = supplierService.AddSupplier(name, email, username, password, phone, address, businessName, isActive);

                if (result)
                {
                    // Success
                    Response.Write("<script>alert('Supplier added successfully.'); window.location='Supplier_Management.aspx';</script>");
                }
                else
                {
                    // Failure
                    Response.Write("<script>alert('Failed to add supplier.');</script>");
                }
            }
            catch (Exception ex)
            {
                // Handle any errors
                Response.Write($"<script>alert('Error: {ex.Message}');</script>");
            }
        }

        // Validation function for checking if email format is correct
        private bool IsValidEmail(string email)
        {
            var emailPattern = @"^[^@]+@[^@]+\.[^@]+$";
            return Regex.IsMatch(email, emailPattern);
        }

        private bool IsUsernameExists(string username)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM Suppliers WHERE Username = @Username";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Username", username);

                connection.Open();
                int count = (int)command.ExecuteScalar();
                return count > 0;
            }
        }

        private bool IsEmailExists(string email)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM Suppliers WHERE Email = @Email";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Email", email);

                connection.Open();
                int count = (int)command.ExecuteScalar();
                return count > 0;
            }
        }

        private bool IsPhoneExists(string phone)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM Suppliers WHERE Phone = @Phone";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Phone", phone);

                connection.Open();
                int count = (int)command.ExecuteScalar();
                return count > 0;
            }
        }

        private bool IsBusinessNameExists(string businessName)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM Suppliers WHERE BusinessName = @BusinessName";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@BusinessName", businessName);

                connection.Open();
                int count = (int)command.ExecuteScalar();
                return count > 0;
            }
        }
    }
}
