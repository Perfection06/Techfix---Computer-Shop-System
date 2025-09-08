using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using TechfixSystem.DBLayer;
using TechfixSystem.Models;

namespace TechfixSystem.AppLogic
{
    public class DeliveryLogic
    {
        private DeliveryDB _deliveryDB = new DeliveryDB();
        private PurchaseOrderDB _purchaseOrderDB = new PurchaseOrderDB();

        //Add Delivery
        public string AddDeliveryRecord(int purchaseOrderID, string shippingConfirmation, DateTime estimatedDeliveryDate)
        {
            if (purchaseOrderID <= 0)
            {
                return "Invalid Purchase Order ID.";
            }

            bool success = _deliveryDB.AddDelivery(purchaseOrderID, shippingConfirmation, estimatedDeliveryDate);
            return success ? "Delivery record added successfully." : "Error adding delivery record.";
        }

        //Update Delivery
        public string ChangeDeliveryStatus(int deliveryID, string status)
        {
            if (deliveryID <= 0 || string.IsNullOrEmpty(status))
            {
                return "Invalid Delivery ID or Status.";
            }

            bool success = _deliveryDB.UpdateDeliveryStatus(deliveryID, status);
            return success ? "Delivery status updated successfully." : "Error updating delivery status.";
        }


        // Update Actual Delivery Date
        public string UpdateDeliveryDate(int deliveryID, DateTime actualDeliveryDate)
        {
            if (deliveryID <= 0)
                return "Invalid Delivery ID.";

            if (actualDeliveryDate == DateTime.MinValue)
                return "Invalid Actual Delivery Date.";

            bool success = _deliveryDB.UpdateActualDeliveryDate(deliveryID, actualDeliveryDate);
            return success ? "Delivery date updated successfully." : "Failed to update delivery date.";
        }


        // Cancel Delivery
        public string CancelDelivery(int deliveryID)
        {
            if (deliveryID <= 0)
                return "Invalid Delivery ID.";

            bool success = _deliveryDB.CancelDelivery(deliveryID);
            return success ? "Delivery cancelled successfully." : "Cannot cancel delivery in its current status.";
        }


        // Get Delivery Details by ID
        public DeliveryDetail GetDeliveryDetailsByID(int deliveryID)
        {
            return _deliveryDB.FetchDeliveryDetailsByID(deliveryID);
        }

        // Get All Delivery Details
        public DataTable FetchAllDeliveryDetails()
        {
            DeliveryDB deliveryDB = new DeliveryDB();
            return deliveryDB.GetAllDeliveryDetails();
        }

        // Return Delivery
        public string ReturnDelivery(int deliveryID)
        {
            DeliveryDB deliveryDB = new DeliveryDB();
            if (deliveryDB.ReturnDelivery(deliveryID))
                return "Delivery returned successfully.";
            return "Failed to return the delivery.";
        }

        // Get Delivery with Product Info
        public DataTable FetchDeliveryWithProductInfo()
        {
            return _deliveryDB.GetDeliveryWithProductInfo();
        }

        public string UpdatePurchaseOrderStatus(int purchaseOrderID, string status)
        {
            if (purchaseOrderID <= 0)
                return "Invalid Purchase Order ID.";
            if (string.IsNullOrEmpty(status))
                return "Invalid Status.";

            bool success = _purchaseOrderDB.UpdatePOStatus(purchaseOrderID, status);
            return success ? "Purchase order status updated successfully." : "Failed to update purchase order status.";
        }
    }
}