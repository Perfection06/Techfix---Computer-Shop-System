using System;
using System.Data.SqlClient;
using System.Web.UI;
using Techfix.UserService; // SOAP Service reference

namespace Techfix.Pages
{
    public partial class Edit_User : System.Web.UI.Page
    {
        private UserServiceSoapClient userService = new UserServiceSoapClient(); 
        private int userID;

        private readonly string connectionString = "Data Source=PERFECTION;Initial Catalog=TechFix;Integrated Security=True"; // Your connection string

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (int.TryParse(Request.QueryString["userID"], out userID))
                {
                    LoadUserDetails(userID);
                }
                else
                {
                    Response.Write("<script>alert('Invalid User ID.');</script>");
                }
            }
        }

        // Fetch the user data from the database manually using ADO.NET
        private void LoadUserDetails(int userID)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string query = "SELECT * FROM Users WHERE UserID = @UserID";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@UserID", userID);
                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.HasRows)
                        {
                            reader.Read();
                            txtUserID.Text = reader["UserID"].ToString();
                            txtName.Text = reader["Name"].ToString();
                            txtUsername.Text = reader["Username"].ToString();
                            txtEmail.Text = reader["Email"].ToString();
                            ddlRole.SelectedValue = reader["Role"].ToString();
                        }
                        else
                        {
                            Response.Write("<script>alert('User not found.');</script>");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error loading user data: {ex.Message}');</script>");
            }
        }

        // Update the user data in the database (manual update via ADO.NET)
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                if (int.TryParse(txtUserID.Text, out int userID))
                {
                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        conn.Open();
                        string query = "SELECT * FROM Users WHERE UserID = @UserID";
                        using (SqlCommand cmd = new SqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@UserID", userID);
                            SqlDataReader reader = cmd.ExecuteReader();
                            if (reader.HasRows)
                            {
                                reader.Read();

                                // Prepare updated data, keeping existing values if fields are empty
                                string name = string.IsNullOrEmpty(txtName.Text) ? reader["Name"].ToString() : txtName.Text;
                                string username = string.IsNullOrEmpty(txtUsername.Text) ? reader["Username"].ToString() : txtUsername.Text;
                                string password = string.IsNullOrEmpty(txtPassword.Text) ? reader["Password"].ToString() : txtPassword.Text;
                                string email = string.IsNullOrEmpty(txtEmail.Text) ? reader["Email"].ToString() : txtEmail.Text;
                                string role = string.IsNullOrEmpty(ddlRole.SelectedValue) ? reader["Role"].ToString() : ddlRole.SelectedValue;

                                reader.Close(); // Close the reader before performing the update

                                // SQL query to update the user data
                                string updateQuery = @"
                                    UPDATE Users
                                    SET Name = @Name, Username = @Username, Password = @Password, Email = @Email, Role = @Role
                                    WHERE UserID = @UserID";

                                using (SqlCommand updateCmd = new SqlCommand(updateQuery, conn))
                                {
                                    updateCmd.Parameters.AddWithValue("@Name", name);
                                    updateCmd.Parameters.AddWithValue("@Username", username);
                                    updateCmd.Parameters.AddWithValue("@Password", password);
                                    updateCmd.Parameters.AddWithValue("@Email", email);
                                    updateCmd.Parameters.AddWithValue("@Role", role);
                                    updateCmd.Parameters.AddWithValue("@UserID", userID);

                                    int rowsAffected = updateCmd.ExecuteNonQuery();
                                    if (rowsAffected > 0)
                                    {
                                        Response.Write("<script>alert('User updated successfully.');</script>");
                                        Response.Redirect("Update_User.aspx");
                                    }
                                    else
                                    {
                                        Response.Write("<script>alert('Failed to update user.');</script>");
                                    }
                                }
                            }
                            else
                            {
                                Response.Write("<script>alert('User not found.');</script>");
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error updating user: {ex.Message}');</script>");
            }
        }
    }
}
