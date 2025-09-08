using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TechfixSystem.Models;
using Techfix.UserService;



namespace Techfix.Pages
{
    public partial class Update_User : System.Web.UI.Page
    {
        private UserServiceSoapClient userService = new UserServiceSoapClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindUserGrid();
            }
        }

        private void BindUserGrid()
        {
            try
            {
                var users = userService.GetAllUsers();
                gvUsers.DataSource = users;
                gvUsers.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error fetching users: {ex.Message}');</script>");
            }
        }

        protected void gvUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Suppress the default behavior
            e.Cancel = true;
        }

        protected void gvUsers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                int userID = Convert.ToInt32(e.CommandArgument); // Extract UserID

                try
                {
                    // Call the delete function in your service
                    string result = userService.DeleteUser(userID);

                    // Show success message
                    ClientScript.RegisterStartupScript(this.GetType(), "Alert", $"alert('{result}');", true);

                    // Refresh the GridView
                    BindUserGrid();
                }
                catch (Exception ex)
                {
                    // Show error message
                    ClientScript.RegisterStartupScript(this.GetType(), "Alert", $"alert('Error deleting user: {ex.Message}');", true);
                }
            }
            else if (e.CommandName == "Edit")
            {
                int userID = Convert.ToInt32(e.CommandArgument);

                // Redirect to Edit_User.aspx with user ID in query string
                Response.Redirect($"Edit_User.aspx?userID={userID}");
            }
            else if (e.CommandName == "Activate")
            {
                int userID = Convert.ToInt32(e.CommandArgument);

                try
                {
                    bool result = userService.ActivateUser(userID);
                    ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('User activated successfully.');", true);
                    BindUserGrid();
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Alert", $"alert('Error activating user: {ex.Message}');", true);
                }
            }
            else if (e.CommandName == "Block")
            {
                int userID = Convert.ToInt32(e.CommandArgument);

                try
                {
                    bool result = userService.DeactivateUser(userID);
                    ClientScript.RegisterStartupScript(this.GetType(), "Alert", "alert('User blocked successfully.');", true);
                    BindUserGrid();
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Alert", $"alert('Error blocking user: {ex.Message}');", true);
                }
            }
        }
    }
}