using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using TechfixSystem.Models;
using TechfixSystem.DBLayer;
using System.Data;


namespace TechfixSystem.DBLayer
{
    public class SupplierDB
    {
        private DBAccess _dbAccess = new DBAccess();

        //Add supplier
        public bool AddSupplier(SupplierModel supplier)
        {
            string query = "INSERT INTO Suppliers (Name, Email, Phone, Address, BusinessName, IsActive, Username, Password) " +
                           "VALUES (@Name, @Email, @Phone, @Address, @BusinessName, @IsActive, @Username, @Password)";

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@Name", supplier.Name),
                new SqlParameter("@Email", supplier.Email),
                new SqlParameter("@Phone", supplier.Phone ?? (object)DBNull.Value),
                new SqlParameter("@Address", supplier.Address ?? (object)DBNull.Value),
                new SqlParameter("@BusinessName", supplier.BusinessName),
                new SqlParameter("@IsActive", supplier.IsActive),
                new SqlParameter("@Username", supplier.Username),
                new SqlParameter("@Password", supplier.Password)
            };

            int rowsAffected = _dbAccess.ExecuteNonQuery(query, parameters);
            return rowsAffected > 0;
        }

        //View suppliers
        public List<SupplierModel> GetAllSuppliers()
        {
            List<SupplierModel> suppliers = new List<SupplierModel>();
            string query = "SELECT SupplierID, Name, Email, Phone, Address, BusinessName, IsActive, Username, Password FROM Suppliers";

            DataTable dt = _dbAccess.ExecuteQuery(query);

            foreach (DataRow row in dt.Rows)
            {
                suppliers.Add(new SupplierModel
                {
                    SupplierID = int.Parse(row["SupplierID"].ToString()),
                    Name = row["Name"].ToString(),
                    Email = row["Email"].ToString(),
                    Phone = row["Phone"] != DBNull.Value ? row["Phone"].ToString() : null,
                    Address = row["Address"] != DBNull.Value ? row["Address"].ToString() : null,
                    BusinessName = row["BusinessName"].ToString(),
                    IsActive = bool.Parse(row["IsActive"].ToString()),
                    Username = row["Username"].ToString(),
                    Password = row["Password"].ToString()
                });
            }

            return suppliers;
        }

        //Update suppliers
        public bool UpdateSupplier(SupplierModel supplier)
        {
            string query = @"
            UPDATE Suppliers
            SET Name = @Name,
                Username = @Username,
                Password = @Password,
                Email = @Email,
                Phone = @Phone,
                Address = @Address,
                BusinessName = @BusinessName
            WHERE SupplierID = @SupplierID";

                SqlParameter[] parameters = {
            new SqlParameter("@SupplierID", supplier.SupplierID),
            new SqlParameter("@Name", supplier.Name),
            new SqlParameter("@Username", supplier.Username),
            new SqlParameter("@Password", supplier.Password),
            new SqlParameter("@Email", supplier.Email),
            new SqlParameter("@Phone", supplier.Phone),
            new SqlParameter("@Address", supplier.Address),
            new SqlParameter("@BusinessName", supplier.BusinessName)
        };
            return _dbAccess.ExecuteNonQuery(query, parameters) > 0;
        }

        //Toggle status of suppliers
        public bool SetSupplierStatus(int supplierID, bool isActive)
        {
            string query = "UPDATE Suppliers SET IsActive = @IsActive WHERE SupplierID = @SupplierID";

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@IsActive", isActive),
                new SqlParameter("@SupplierID", supplierID)
            };

            return _dbAccess.ExecuteNonQuery(query, parameters) > 0;
        }

        //Delete a supplier 
        public bool DeleteSupplier(int supplierID)
        {
            string query = "DELETE FROM Suppliers WHERE SupplierID = @SupplierID";

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@SupplierID", supplierID)
            };

            return _dbAccess.ExecuteNonQuery(query, parameters) > 0;
        }

        // Fetch supplier details by SupplierID
        public SupplierModel GetSupplierByID(int supplierID)
        {
            string query = "SELECT SupplierID, Name, Email, Phone, Address, IsActive FROM Suppliers WHERE SupplierID = @SupplierID";

            SqlParameter[] parameters = new SqlParameter[]
            {
        new SqlParameter("@SupplierID", supplierID)
            };

            DataTable dt = _dbAccess.ExecuteDataTable(query, parameters);

            if (dt.Rows.Count > 0)
            {
                DataRow row = dt.Rows[0];
                return new SupplierModel
                {
                    SupplierID = int.Parse(row["SupplierID"].ToString()),
                    Name = row["Name"].ToString(),
                    Email = row["Email"].ToString(),
                    Phone = row["Phone"].ToString(),
                    Address = row["Address"].ToString(),
                    IsActive = bool.Parse(row["IsActive"].ToString())
                };
            }

            return null; 
        }


    }
}