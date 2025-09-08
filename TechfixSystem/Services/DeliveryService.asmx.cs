using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using TechfixSystem.AppLogic;

namespace TechfixSystem.Services
{
    /// <summary>
    /// Summary description for DeliveryService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class DeliveryService : System.Web.Services.WebService
    {
        private DeliveryLogic _deliveryLogic = new DeliveryLogic();

        [WebMethod]
        public string AddDelivery(int purchaseOrderID, string shippingConfirmation, DateTime estimatedDeliveryDate)
        {
            return _deliveryLogic.AddDeliveryRecord(purchaseOrderID, shippingConfirmation, estimatedDeliveryDate);
        }

        [WebMethod]
        public string UpdateDeliveryStatus(int deliveryID, string status)
        {
            return _deliveryLogic.ChangeDeliveryStatus(deliveryID, status);
        }

        [WebMethod]
        public string UpdateActualDeliveryDate(int deliveryID, DateTime actualDeliveryDate)
        {
            return _deliveryLogic.UpdateDeliveryDate(deliveryID, actualDeliveryDate);
        }

        // DeliveryService
        [WebMethod]
        public DataTable GetDeliveryWithProductInfo()
        {
            try
            {
                return _deliveryLogic.FetchDeliveryWithProductInfo();
            }
            catch (Exception ex)
            {
                // Handle and log the exception (logging omitted for brevity)
                throw new SoapException("An error occurred while fetching delivery details with product info.", SoapException.ServerFaultCode, ex);
            }
        }

        [WebMethod]
        public string ReturnDelivery(int deliveryID)
        {
            DeliveryLogic deliveryLogic = new DeliveryLogic();
            return deliveryLogic.ReturnDelivery(deliveryID);
        }

        [WebMethod]
        public string CancelDelivery(int deliveryID)
        {
            return _deliveryLogic.CancelDelivery(deliveryID);
        }

        [WebMethod]
        public DataTable GetAllDeliveryDetails()
        {
            try
            {
                return _deliveryLogic.FetchAllDeliveryDetails();
            }
            catch (Exception ex)
            {
                // Handle exception (logging omitted for brevity)
                throw new SoapException("An error occurred while fetching delivery details.", SoapException.ServerFaultCode, ex);
            }
        }

        [WebMethod]
        public string GetDeliveryDetailsByID(int deliveryID)
        {
            var delivery = _deliveryLogic.GetDeliveryDetailsByID(deliveryID);

            // Manually build the response as a string
            return $"Supplier: {delivery.SupplierName}, " +
                   $"Business: {delivery.BusinessName}, " +
                   $"Product: {delivery.ProductDescription}, " +
                   $"Estimated Date: {delivery.EstimatedDeliveryDate}, " +
                   $"Status: {delivery.DeliveryStatus}";
        }

        [WebMethod]
        public string UpdatePurchaseOrderStatus(int purchaseOrderID, string status)
        {
            return _deliveryLogic.UpdatePurchaseOrderStatus(purchaseOrderID, status);
        }
    }
}
