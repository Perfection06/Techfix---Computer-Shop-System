using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using Techfix.UserService;
using System.Text.RegularExpressions;

namespace Techfix.Pages
{
    public partial class Add_User : System.Web.UI.Page
    {
        private UserServiceSoapClient userService = new UserServiceSoapClient();
        private readonly string connectionString = "Data Source=PERFECTION;Initial Catalog=TechFix;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Any necessary initialization
            }
        }

        protected void AddUser_Click(object sender, EventArgs e)
        {
            string name = nameInput.Value.Trim();
            string username = usernameInput.Value.Trim();
            string email = emailInput.Value.Trim();
            string password = passwordInput.Value.Trim();
            string role = roleDropdown.Value;
            bool isActive = isActiveCheckbox.Checked;

            

            // Validate email format
            if (!IsValidEmail(email))
            {
                Response.Write("<script>alert('Please enter a valid email address.');</script>");
                return;
            }

            // Check if username or email already exists
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

            // Call the service to add the user
            string result = userService.AddUser(name, username, email, password, role, isActive);

            if (!string.IsNullOrEmpty(result)) 
            {
                Response.Write($"<script>alert('{result}');</script>");
            }
            else
            {
                // Show success message and redirect to User_Management.aspx after clicking OK
                Response.Write("<script>alert('User added successfully!'); window.location='Add_User.aspx';</script>");

            }

        }

        // Validate if the email format is correct
        private bool IsValidEmail(string email)
        {
            var emailPattern = @"^[^@]+@[^@]+\.[^@]+$";
            return Regex.IsMatch(email, emailPattern);
        }

        private bool IsUsernameExists(string username)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM Users WHERE Username = @Username";
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
                string query = "SELECT COUNT(*) FROM Users WHERE Email = @Email";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Email", email);

                connection.Open();
                int count = (int)command.ExecuteScalar();
                return count > 0;
            }
        }
    }
}
