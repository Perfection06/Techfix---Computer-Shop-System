using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TechfixSystem.DBLayer;
using TechfixSystem.Models;


namespace TechfixSystem.AppLogic
{
    public class UserLogic
    {
        private UserDB _userDB = new UserDB();

        // Method to Validate and Add a New User
        public string AddNewUser(UserModel user)
        {
            if (string.IsNullOrEmpty(user.Name) || string.IsNullOrEmpty(user.Email) || string.IsNullOrEmpty(user.Password) || string.IsNullOrEmpty(user.Username))
            {
                return "Name, Email, Username, and Password cannot be empty.";
            }

            bool success = _userDB.AddUser(user);
            return success ? "User added successfully." : "Error adding user.";
        }

        // Update a existing User
        public string UpdateExistingUser(UserModel user)
        {
            if (user.UserID <= 0)
            {
                return "Invalid User ID.";
            }
            if (string.IsNullOrEmpty(user.Name) || string.IsNullOrEmpty(user.Email) || string.IsNullOrEmpty(user.Password))
            {
                return "Name, Email, and Password cannot be empty.";
            }

            bool success = _userDB.UpdateExistingUser(user);
            return success ? "User updated successfully." : "Error updating user.";
        }

        // Delete a existing User
        public string RemoveUser(int userID)
        {
            if (userID <= 0)
            {
                return "Invalid User ID.";
            }

            bool success = _userDB.DeleteUser(userID);
            return success ? "User deleted successfully." : "Error deleting user.";
        }

        // View all User
        public List<UserModel> FetchAllUsers()
        {
            return _userDB.GetAllUsers();
        }

        // Deactivate a User
        public bool DeactivateUser(int userID)
        {
            if (userID <= 0)
            {
                throw new ArgumentException("Invalid UserID.");
            }

            return _userDB.DeactivateUser(userID);
        }

        //Activate a User
        public bool ActivateUser(int userID)
        {
            if (userID <= 0)
            {
                throw new ArgumentException("Invalid UserID.");
            }

            return _userDB.ActivateUser(userID);
        }

        //Get user by id
        public UserModel GetUserById(int userID)
        {
            if (userID <= 0)
            {
                throw new ArgumentException("Invalid UserID.");
            }

            return _userDB.GetUserById(userID);
        }

    }
}