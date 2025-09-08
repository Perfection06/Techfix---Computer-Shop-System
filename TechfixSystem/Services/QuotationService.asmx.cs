using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using TechfixSystem.AppLogic;
using TechfixSystem.DBLayer;
using TechfixSystem.Models;

namespace TechfixSystem.Services
{
    /// <summary>
    /// Summary description for QuotationService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class QuotationService : System.Web.Services.WebService
    {
        private QuotationLogic _quotationLogic = new QuotationLogic();

        [WebMethod]
        public string SubmitQuotation(int rfqID, int supplierID, decimal quotationAmount, string deliverySchedule, string quotationDetails)
        {
            Quotation quotation = new Quotation
            {
                RFQID = rfqID,
                SupplierID = supplierID,
                QuotationAmount = quotationAmount,
                DeliverySchedule = deliverySchedule,
                QuotationDetails = quotationDetails,
            };

            return _quotationLogic.SubmitSupplierQuotation(quotation);
        }

        [WebMethod]
        public string AcceptQuotation(int quotationID)
        {
            QuotationLogic quotationLogic = new QuotationLogic();
            return quotationLogic.AcceptQuotationAndGeneratePO(quotationID);
        }

        [WebMethod]
        public List<Quotation> GetQuotationsByRFQID(int rfqID)
        {
            QuotationLogic quotationLogic = new QuotationLogic();
            return quotationLogic.GetQuotationsByRFQID(rfqID);
        }


    }
}
