using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using TechfixSystem.Models;

namespace TechfixSystem.DBLayer
{
    public class DeliveryDB
    {
        private DBAccess _dbAccess = new DBAccess();

        // Add Delivery for PO
        public bool AddDelivery(int purchaseOrderID, string shippingConfirmation, DateTime estimatedDeliveryDate)
        {
            string query = @"INSERT INTO Delivery 
             (POID, ShippingConfirmation, EstimatedDeliveryDate, DeliveryStatus) 
             VALUES 
             (@POID, @ShippingConfirmation, @EstimatedDeliveryDate, 'Pending')";

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@POID", purchaseOrderID), 
                new SqlParameter("@ShippingConfirmation", shippingConfirmation ?? (object)DBNull.Value),
                new SqlParameter("@EstimatedDeliveryDate", estimatedDeliveryDate)
            };

            int rowsAffected = _dbAccess.ExecuteNonQuery(query, parameters);
            return rowsAffected > 0;
        }


        //Update Delivery 
        public bool UpdateDeliveryStatus(int deliveryID, string status)
        {
            string query = "UPDATE Delivery SET DeliveryStatus = @DeliveryStatus WHERE DeliveryID = @DeliveryID";

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@DeliveryStatus", status),
                new SqlParameter("@DeliveryID", deliveryID)
            };

            int rowsAffected = _dbAccess.ExecuteNonQuery(query, parameters);
            return rowsAffected > 0;
        }



        // Update Actual Delivery Date for a delivery
        public bool UpdateActualDeliveryDate(int deliveryID, DateTime actualDeliveryDate)
        {
            string query = @"UPDATE Delivery 
                     SET ActualDeliveryDate = @ActualDeliveryDate, 
                         DeliveryStatus = 'Delivered'
                     WHERE DeliveryID = @DeliveryID";

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@DeliveryID", deliveryID),
                new SqlParameter("@ActualDeliveryDate", actualDeliveryDate)
            };

            int rowsAffected = _dbAccess.ExecuteNonQuery(query, parameters);
            return rowsAffected > 0;
        }

        // Update Delivery Status to Returned or Cancelled
        public bool UpdateDeliveryStatusToReturnedOrCancelled(int deliveryID, string status)
        {
            string query = @"UPDATE Delivery 
                     SET DeliveryStatus = @Status 
                     WHERE DeliveryID = @DeliveryID";

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@DeliveryID", deliveryID),
                new SqlParameter("@Status", status)
            };

            int rowsAffected = _dbAccess.ExecuteNonQuery(query, parameters);
            return rowsAffected > 0;
        }

        // Check if a delivery can be cancelled
        public bool CanCancelDelivery(int deliveryID)
        {
            string query = @"SELECT DeliveryStatus FROM Delivery WHERE DeliveryID = @DeliveryID";
            SqlParameter[] parameters = { new SqlParameter("@DeliveryID", deliveryID) };

            DataTable result = _dbAccess.ExecuteQuery(query, parameters);

            if (result.Rows.Count == 0)
                return false; // Delivery does not exist

            string currentStatus = result.Rows[0]["DeliveryStatus"].ToString();
            return currentStatus == "Pending" || currentStatus == "In Process"; 
        }

        // Cancel a delivery
        public bool CancelDelivery(int deliveryID)
        {
            if (!CanCancelDelivery(deliveryID))
                return false; 

            string query = @"UPDATE Delivery 
                     SET DeliveryStatus = 'Cancelled' 
                     WHERE DeliveryID = @DeliveryID";

            SqlParameter[] parameters = { new SqlParameter("@DeliveryID", deliveryID) };

            int rowsAffected = _dbAccess.ExecuteNonQuery(query, parameters);
            return rowsAffected > 0;
        }


        // Fetch Delivery IDs
        public List<int> FetchDeliveryIDs()
        {
            string query = "SELECT DeliveryID FROM Delivery";
            DataTable dt = _dbAccess.ExecuteQuery(query);

            List<int> deliveryIDs = new List<int>();
            foreach (DataRow row in dt.Rows)
            {
                deliveryIDs.Add(Convert.ToInt32(row["DeliveryID"]));
            }

            return deliveryIDs;
        }

        // Fetch Delivery Details by ID
        public DeliveryDetail FetchDeliveryDetailsByID(int deliveryID)
        {
            string query = @"
        SELECT 
            S.Name AS SupplierName, 
            S.BusinessName, 
            RFQ.ProductDescription, 
            D.EstimatedDeliveryDate, 
            D.DeliveryStatus
        FROM 
            Delivery D
        JOIN 
            PurchaseOrders PO ON D.POID = PO.POID
        JOIN 
            Quotations Q ON PO.QuotationID = Q.QuotationID
        JOIN 
            Suppliers S ON Q.SupplierID = S.SupplierID
        JOIN 
            RFQs RFQ ON Q.RFQID = RFQ.RFQID
        WHERE 
            D.DeliveryID = @DeliveryID";

            SqlParameter[] parameters = new SqlParameter[]
            {
        new SqlParameter("@DeliveryID", deliveryID)
            };

            DataTable dt = _dbAccess.ExecuteQuery(query, parameters);

            if (dt.Rows.Count == 0) return null;

            DataRow row = dt.Rows[0];
            return new DeliveryDetail
            {
                SupplierName = row["SupplierName"].ToString(),
                BusinessName = row["BusinessName"].ToString(),
                ProductDescription = row["ProductDescription"].ToString(),
                EstimatedDeliveryDate = row["EstimatedDeliveryDate"] as DateTime?,
                DeliveryStatus = row["DeliveryStatus"].ToString()
            };
        }

        // Fetch Delivery Details
        public DataTable GetAllDeliveryDetails()
        {
            string query = @"
                SELECT 
                    D.DeliveryID, 
                    D.POID, 
                    D.DeliveryStatus, 
                    D.ShippingConfirmation, 
                    D.EstimatedDeliveryDate, 
                    D.ActualDeliveryDate, 
                    S.Name AS SupplierName, 
                    S.BusinessName, 
                    RFQ.ProductDescription
                FROM Delivery D
                JOIN PurchaseOrders PO ON D.POID = PO.POID
                JOIN Quotations Q ON PO.QuotationID = Q.QuotationID
                JOIN Suppliers S ON Q.SupplierID = S.SupplierID
                JOIN RFQs RFQ ON Q.RFQID = RFQ.RFQID
                WHERE D.DeliveryStatus NOT IN ('Cancelled', 'Returned')";

            DataTable deliveries = _dbAccess.ExecuteQuery(query);

            // Set table name for serialization
            deliveries.TableName = "DeliveryDetails";
            return deliveries;
        }

        // Return Delivery
        public bool ReturnDelivery(int deliveryID)
        {
            string query = @"UPDATE Delivery SET DeliveryStatus = 'Returned' WHERE DeliveryID = @DeliveryID";

            SqlParameter[] parameters = { new SqlParameter("@DeliveryID", deliveryID) };

            int rowsAffected = _dbAccess.ExecuteNonQuery(query, parameters);
            return rowsAffected > 0;
        }

        // Get Delivery with Product Info
        public DataTable GetDeliveryWithProductInfo()
        {
            string query = @"
        SELECT 
            D.DeliveryID, 
            RFQ.ProductDescription, 
            D.EstimatedDeliveryDate, 
            D.DeliveryStatus
        FROM 
            Delivery D
        JOIN 
            PurchaseOrders PO ON D.POID = PO.POID
        JOIN 
            Quotations Q ON PO.QuotationID = Q.QuotationID
        JOIN 
            RFQs RFQ ON Q.RFQID = RFQ.RFQID";

            DataTable result = _dbAccess.ExecuteQuery(query);

            // Set the TableName to avoid serialization errors
            result.TableName = "DeliveryWithProductInfo";

            return result;
        }

    }
}