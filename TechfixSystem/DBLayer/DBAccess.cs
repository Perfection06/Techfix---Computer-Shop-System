using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace TechfixSystem.DBLayer
{
    public class DBAccess
    {
        private readonly string _connectionString = "Data Source=PERFECTION;Initial Catalog=TechFix;Integrated Security=True";

        // Method to Open a Connection
        public SqlConnection OpenConnection()
        {
            SqlConnection conn = new SqlConnection(_connectionString);
            try
            {
                conn.Open();
                return conn;
            }
            catch (Exception ex)
            {
                throw new Exception("Error while opening the database connection: " + ex.Message);
            }
        }

        // Method to Execute INSERT, UPDATE, DELETE Queries
        public int ExecuteNonQuery(string query, SqlParameter[] parameters = null)
        {
            using (SqlConnection conn = OpenConnection())
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                if (parameters != null)
                    cmd.Parameters.AddRange(parameters);

                return cmd.ExecuteNonQuery();
            }
        }

        // Method to Execute SELECT Queries and Return a DataTable
        public DataTable ExecuteQuery(string query, SqlParameter[] parameters = null)
        {
            using (SqlConnection conn = OpenConnection())
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                if (parameters != null)
                    cmd.Parameters.AddRange(parameters);

                DataTable dt = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);
                return dt;
            }
        }

        // Method to Execute Scalar Queries (e.g., Returning a Single Value)
        public object ExecuteScalar(string query, SqlParameter[] parameters = null)
        {
            using (SqlConnection conn = OpenConnection())
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                if (parameters != null)
                    cmd.Parameters.AddRange(parameters);

                return cmd.ExecuteScalar();
            }
        }

        // Method to Execute Queries and Return a DataTable
        public DataTable ExecuteDataTable(string query, SqlParameter[] parameters)
        {
            using (SqlConnection conn = OpenConnection()) 
            {
                SqlDataAdapter adapter = new SqlDataAdapter(query, conn); 

                if (parameters != null)
                {
                    adapter.SelectCommand.Parameters.AddRange(parameters);
                }

                DataTable dt = new DataTable();
                adapter.Fill(dt);
                return dt;
            }
        }
    }
}