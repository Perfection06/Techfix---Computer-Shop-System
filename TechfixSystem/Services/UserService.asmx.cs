using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using TechfixSystem.AppLogic;
using TechfixSystem.Models;

namespace TechfixSystem.Services
{
    /// <summary>
    /// Summary description for UserService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class UserService : System.Web.Services.WebService
    {

        private UserLogic _userLogic = new UserLogic();

        [WebMethod]
        public string AddUser(string name, string username, string email, string password, string role, bool isActive)
        {
            UserModel user = new UserModel
            {
                Name = name,
                Username = username,
                Email = email,
                Password = password,
                Role = role,
                IsActive = isActive
            };

            return _userLogic.AddNewUser(user);
        }


        [WebMethod]
        public string UpdateUser(int userID, string name, string username, string email, string password, string role, bool isActive)
        {
            // Log or debug here to check the incoming values
            Console.WriteLine($"Updating user with ID: {userID}, Name: {name}, Username: {username}, Email: {email}, Role: {role}");

            UserModel user = new UserModel
            {
                UserID = userID,
                Name = name,
                Username = username,
                Email = email,
                Password = password,  // Handle null if password is empty
                Role = role,
                IsActive = isActive
            };

            // Call the logic to update the user
            string result = _userLogic.UpdateExistingUser(user);
            return result == "Success" ? "User updated successfully" : "Update failed";
        }


        [WebMethod]
        public string DeleteUser(int userID)
        {
            return _userLogic.RemoveUser(userID);
        }

        [WebMethod]
        public List<UserModel> GetAllUsers()
        {
            return _userLogic.FetchAllUsers();
        }

        [WebMethod]
        public bool DeactivateUser(int userID)
        {
            return _userLogic.DeactivateUser(userID);
        }

        [WebMethod]
        public bool ActivateUser(int userID)
        {
            return _userLogic.ActivateUser(userID);
        }

        [WebMethod]
        public UserModel GetUserById(int userID)
        {
            return _userLogic.GetUserById(userID);
        }


    }
}
