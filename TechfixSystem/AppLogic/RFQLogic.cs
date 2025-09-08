using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TechfixSystem.DBLayer;
using TechfixSystem.Models;

namespace TechfixSystem.AppLogic
{
    public class RFQLogic
    {
        private RFQDB _rfqDB = new RFQDB();
        private QuotationDB _quotationDB = new QuotationDB();

        //Add RFQ (Request for quotation)
        public string SubmitRFQ(RFQ rfq)
        {
            if (string.IsNullOrEmpty(rfq.ProductDescription) || rfq.Quantity <= 0)
            {
                return "Invalid RFQ details. Please provide valid product description and quantity.";
            }

            bool success = _rfqDB.AddRFQ(rfq);
            return success ? "RFQ submitted successfully." : "Error submitting RFQ.";
        }

        //Get RFQs
        public List<RFQ> ViewAllRFQs()
        {
            return _rfqDB.GetAllRFQs();
        }

        //Update RFQ
        public string ManageRFQ(RFQ rfq)
        {
            if (rfq == null || rfq.RFQID <= 0)
            {
                return "Invalid RFQ details.";
            }

            bool success = _rfqDB.UpdateRFQ(rfq);
            return success ? "RFQ updated successfully." : "Failed to update RFQ.";
        }

        //Get RFQ by ID
        public RFQ GetRFQByID(int rfqID)
        {
            if (rfqID <= 0)
            {
                return null;
            }

            return _rfqDB.GetRFQByID(rfqID);
        }

        // Get Quotations for a specific RFQ
        public List<Quotation> GetQuotationsByRFQID(int rfqID)
        {
            return _quotationDB.GetQuotationsByRFQID(rfqID);
        }

        // Delete RFQ
        public bool DeleteRFQ(int rfqID)
        {
            return _rfqDB.DeleteRFQ(rfqID);
        }


    }
}