using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using TechfixSystem.AppLogic;
using TechfixSystem.DBLayer;
using TechfixSystem.Models;

namespace TechfixSystem.Services
{
    /// <summary>
    /// Summary description for RFQService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class RFQService : System.Web.Services.WebService
    {
        private RFQLogic _rfqLogic = new RFQLogic();


        [WebMethod]
        public List<RFQ> GetAllRFQs()
        {
            return _rfqLogic.ViewAllRFQs();
        }

        [WebMethod]
        public string ManageRFQ(int rfqID, string productDescription, int quantity, string specifications, string deliveryRequirements, string pricingFormat, string paymentTerms, DateTime validityPeriod)
        {
            
            RFQ rfq = new RFQ
            {
                RFQID = rfqID,
                ProductDescription = productDescription,
                Quantity = quantity,
                Specifications = specifications,
                DeliveryRequirements = deliveryRequirements,
                PricingFormat = pricingFormat,
                PaymentTerms = paymentTerms,
                ValidityPeriod = validityPeriod
            };

            return _rfqLogic.ManageRFQ(rfq);  
        }


        [WebMethod]
        public RFQ GetRFQByID(int rfqID)
        {
            return _rfqLogic.GetRFQByID(rfqID);
        }

        [WebMethod]
        public List<Quotation> GetQuotationsByRFQID(int rfqID)
        {
            return _rfqLogic.GetQuotationsByRFQID(rfqID);
        }

        [WebMethod]
        public bool DeleteRFQ(int rfqID)
        {
            return _rfqLogic.DeleteRFQ(rfqID);
        }



    }
}
