using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Techfix.SupplierService;

namespace Techfix.Pages
{
    public partial class Edit_Supplier : System.Web.UI.Page
    {
        private SupplierServiceSoapClient supplierService = new SupplierServiceSoapClient();
        private int supplierID;

        private readonly string connectionString = "Data Source=PERFECTION;Initial Catalog=TechFix;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (int.TryParse(Request.QueryString["supplierID"], out supplierID))
                {
                    LoadSupplierData(supplierID);
                }
                else
                {
                    lblMessage.Text = "Invalid supplier ID.";
                }
            }
        }

        private void LoadSupplierData(int supplierID)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string query = "SELECT * FROM Suppliers WHERE SupplierID = @SupplierID";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@SupplierID", supplierID);
                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.HasRows)
                        {
                            reader.Read();
                            txtName.Text = reader["Name"].ToString();
                            txtUsername.Text = reader["Username"].ToString();
                            txtEmail.Text = reader["Email"].ToString();
                            txtPhone.Text = reader["Phone"].ToString();
                            txtAddress.Text = reader["Address"].ToString();
                            txtBusinessName.Text = reader["BusinessName"].ToString();
                            // You can add IsActive field handling if needed
                        }
                        else
                        {
                            lblMessage.Text = "Supplier not found.";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = $"Error loading supplier data: {ex.Message}";
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                if (int.TryParse(Request.QueryString["supplierID"], out int supplierID))
                {
                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        conn.Open();
                        string query = "SELECT * FROM Suppliers WHERE SupplierID = @SupplierID";
                        using (SqlCommand cmd = new SqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@SupplierID", supplierID);
                            SqlDataReader reader = cmd.ExecuteReader();
                            if (reader.HasRows)
                            {
                                reader.Read();

                                // Prepare updated data
                                string name = string.IsNullOrEmpty(txtName.Text) ? reader["Name"].ToString() : txtName.Text;
                                string username = string.IsNullOrEmpty(txtUsername.Text) ? reader["Username"].ToString() : txtUsername.Text;
                                string password = string.IsNullOrEmpty(txtPassword.Text) ? reader["Password"].ToString() : txtPassword.Text;
                                string email = string.IsNullOrEmpty(txtEmail.Text) ? reader["Email"].ToString() : txtEmail.Text;
                                string phone = string.IsNullOrEmpty(txtPhone.Text) ? reader["Phone"].ToString() : txtPhone.Text;
                                string address = string.IsNullOrEmpty(txtAddress.Text) ? reader["Address"].ToString() : txtAddress.Text;
                                string businessName = string.IsNullOrEmpty(txtBusinessName.Text) ? reader["BusinessName"].ToString() : txtBusinessName.Text;
                                bool isActive = Convert.ToBoolean(reader["IsActive"]);

                                reader.Close(); // Close the reader before updating the record

                                // Update the supplier data in the database
                                string updateQuery = @"
                            UPDATE Suppliers
                            SET Name = @Name, Username = @Username, Password = @Password, Email = @Email, 
                                Phone = @Phone, Address = @Address, BusinessName = @BusinessName
                            WHERE SupplierID = @SupplierID";
                                using (SqlCommand updateCmd = new SqlCommand(updateQuery, conn))
                                {
                                    updateCmd.Parameters.AddWithValue("@Name", name);
                                    updateCmd.Parameters.AddWithValue("@Username", username);
                                    updateCmd.Parameters.AddWithValue("@Password", password);
                                    updateCmd.Parameters.AddWithValue("@Email", email);
                                    updateCmd.Parameters.AddWithValue("@Phone", phone);
                                    updateCmd.Parameters.AddWithValue("@Address", address);
                                    updateCmd.Parameters.AddWithValue("@BusinessName", businessName);
                                    updateCmd.Parameters.AddWithValue("@SupplierID", supplierID);

                                    int rowsAffected = updateCmd.ExecuteNonQuery();
                                    if (rowsAffected > 0)
                                    {
                                        lblMessage.ForeColor = System.Drawing.Color.Green;
                                        lblMessage.Text = "Supplier updated successfully.";
                                        ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('Supplier updated successfully.'); window.location='Update_supplier.aspx';", true);
                                    }
                                    else
                                    {
                                        lblMessage.ForeColor = System.Drawing.Color.Red;
                                        lblMessage.Text = "Failed to update supplier.";
                                    }
                                }
                            }
                            else
                            {
                                lblMessage.Text = "Supplier not found.";
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = $"Error updating supplier: {ex.Message}";
            }
        }
    }
}