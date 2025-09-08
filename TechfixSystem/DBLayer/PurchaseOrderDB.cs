using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace TechfixSystem.DBLayer
{
    public class PurchaseOrderDB
    {
        private DBAccess _dbAccess = new DBAccess();



        public bool CreatePurchaseOrder(int quotationID, decimal poAmount)
        {
            string query = @"INSERT INTO PurchaseOrders
                        (QuotationID, POAmount, OrderDate)
                        VALUES
                        (@QuotationID, @POAmount, GETDATE())";

            SqlParameter[] parameters = new SqlParameter[]
            {
            new SqlParameter("@QuotationID", quotationID),
            new SqlParameter("@POAmount", poAmount)
            };

            int rowsAffected = _dbAccess.ExecuteNonQuery(query, parameters);
            return rowsAffected > 0;
        }

        public bool UpdatePOStatus(int purchaseOrderID, string status)
        {
            string query = @"UPDATE PurchaseOrders
                        SET POStatus = @POStatus
                        WHERE POID = @PurchaseOrderID";

            SqlParameter[] parameters = new SqlParameter[]
            {
            new SqlParameter("@POStatus", status),
            new SqlParameter("@PurchaseOrderID", purchaseOrderID)
            };

            int rowsAffected = _dbAccess.ExecuteNonQuery(query, parameters);
            return rowsAffected > 0;
        }
    }
}