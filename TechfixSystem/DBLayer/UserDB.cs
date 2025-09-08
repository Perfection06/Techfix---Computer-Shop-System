using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using TechfixSystem.Models;
using TechfixSystem.DBLayer;
using System.Data;





namespace TechfixSystem.DBLayer
{
    public class UserDB
    {
        private DBAccess _dbAccess = new DBAccess();

        //Add a New User
        public bool AddUser(UserModel user)
        {
            string query = "INSERT INTO Users (Name, Username, Email, Password, Role, IsActive) VALUES (@Name, @Username, @Email, @Password, @Role, @IsActive)";

            SqlParameter[] parameters =
            {
                new SqlParameter("@Name", user.Name),
                new SqlParameter("@Username", user.Username),
                new SqlParameter("@Email", user.Email),
                new SqlParameter("@Password", user.Password),
                new SqlParameter("@Role", user.Role),
                new SqlParameter("@IsActive", user.IsActive)
            };

            int rowsAffected = _dbAccess.ExecuteNonQuery(query, parameters);
            return rowsAffected > 0;
        }

        //Update a User
        public bool UpdateExistingUser(UserModel user)
        {
            string query = @"UPDATE Users 
              SET Name = @Name,
                  Username = @Username, 
                  Email = @Email, 
                  Password = @Password, 
                  Role = @Role, 
                  IsActive = @IsActive
              WHERE UserID = @UserID";

                    SqlParameter[] parameters =
                    {
                new SqlParameter("@UserID", user.UserID),
                new SqlParameter("@Name", user.Name), // Ensure Name is passed correctly
                new SqlParameter("@Username", user.Username),
                new SqlParameter("@Email", user.Email),
                new SqlParameter("@Password", user.Password ?? (object)DBNull.Value),
                new SqlParameter("@Role", user.Role),
                new SqlParameter("@IsActive", user.IsActive)
            };

            try
            {
                Console.WriteLine($"Updating user ID: {user.UserID}, Name: {user.Name}");
                int rowsAffected = _dbAccess.ExecuteNonQuery(query, parameters);
                return rowsAffected > 0;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error updating user: {ex.Message}");
                return false;
            }
        }




        //Delete a User
        public bool DeleteUser(int userID)
        {
            string query = "DELETE FROM Users WHERE UserID = @UserID";

            SqlParameter[] parameters =
            {
                new SqlParameter("@UserID", userID)
            };

            int rowsAffected = _dbAccess.ExecuteNonQuery(query, parameters);
            return rowsAffected > 0; 
        }

        //View All Users
        public List<UserModel> GetAllUsers()
        {
            List<UserModel> users = new List<UserModel>();
            string query = "SELECT UserID, Name, Username, Email, Role, IsActive FROM Users";

            DataTable dt = _dbAccess.ExecuteDataTable(query, null);

            foreach (DataRow row in dt.Rows)
            {
                users.Add(new UserModel
                {
                    UserID = int.Parse(row["UserID"].ToString()),
                    Name = row["Name"].ToString(),
                    Username = row["Username"].ToString(),
                    Email = row["Email"].ToString(),
                    Role = row["Role"].ToString(),
                    IsActive = bool.Parse(row["IsActive"].ToString())
                });
            }

            return users;
        }

        //Deactivate a Users
        public bool DeactivateUser(int userID)
        {
            string query = "UPDATE Users SET IsActive = @IsActive WHERE UserID = @UserID";

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IsActive", false), 
                new SqlParameter("@UserID", userID)
            };

            int rowsAffected = _dbAccess.ExecuteNonQuery(query, parameters);
            return rowsAffected > 0; 
        }

        //Activate a Users
        public bool ActivateUser(int userID)
        {
            string query = "UPDATE Users SET IsActive = @IsActive WHERE UserID = @UserID";

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IsActive", true), 
                new SqlParameter("@UserID", userID)
             };

            int rowsAffected = _dbAccess.ExecuteNonQuery(query, parameters);
            return rowsAffected > 0; 
        }

        //Get user by id
        public UserModel GetUserById(int userID)
        {
            string query = "SELECT UserID, Name, Email, Role, IsActive FROM Users WHERE UserID = @UserID";

            SqlParameter[] parameters = new SqlParameter[]
            {
        new SqlParameter("@UserID", userID)
            };

            DataTable dt = _dbAccess.ExecuteQuery(query, parameters);

            if (dt.Rows.Count > 0)
            {
                DataRow row = dt.Rows[0];
                return new UserModel
                {
                    UserID = int.Parse(row["UserID"].ToString()),
                    Name = row["Name"].ToString(),
                    Email = row["Email"].ToString(),
                    Role = row["Role"].ToString(),
                    IsActive = bool.Parse(row["IsActive"].ToString())
                };
            }
            else
            {
                return null; // User not found
            }
        }

    }
}

