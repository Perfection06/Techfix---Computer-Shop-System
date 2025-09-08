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
    /// Summary description for ProcurementService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class ProcurementService : System.Web.Services.WebService
    {
        private RFQLogic _rfqLogic = new RFQLogic();

        [WebMethod]
        public string SubmitRFQ(string productDescription, int quantity, string specifications,
                             string deliveryRequirements, string pricingFormat,
                             string paymentTerms, DateTime validityPeriod)
        {
            RFQ rfq = new RFQ
            {
                ProductDescription = productDescription,
                Quantity = quantity,
                Specifications = specifications,
                DeliveryRequirements = deliveryRequirements,
                PricingFormat = pricingFormat,
                PaymentTerms = paymentTerms,
                ValidityPeriod = validityPeriod,
                RequestDate = DateTime.Now
            };

            return _rfqLogic.SubmitRFQ(rfq);
        }
    }
}
