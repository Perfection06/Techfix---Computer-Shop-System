using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TechfixSystem.DBLayer;
using TechfixSystem.Models;

namespace TechfixSystem.AppLogic
{
    public class QuotationLogic
    {
        private QuotationDB _quotationDB = new QuotationDB();
        private PurchaseOrderDB _purchaseOrderDB = new PurchaseOrderDB();

        // Submit Supplier Quotation
        public string SubmitSupplierQuotation(Quotation quotation)
        {
            if (quotation.RFQID <= 0 || quotation.SupplierID <= 0 || quotation.QuotationAmount <= 0)
            {
                return "Invalid quotation details.";
            }

            bool success = _quotationDB.SubmitQuotation(quotation);
            return success ? "Quotation submitted successfully." : "Failed to submit quotation.";
        }


        // Accept Quotation and Generate PO
        public string AcceptQuotationAndGeneratePO(int quotationID)
        {
            
            Quotation quotation = _quotationDB.GetQuotationById(quotationID);
            if (quotation == null)
            {
                return "Quotation not found!";
            }

            
            bool isPOCreated = _purchaseOrderDB.CreatePurchaseOrder(quotationID, quotation.QuotationAmount);
            if (isPOCreated)
            {
                
                bool isQuotationUpdated = _quotationDB.UpdateQuotationStatus(quotationID, "Accepted");
                if (isQuotationUpdated)
                {
                    return "Quotation accepted and PO generated successfully!";
                }
                else
                {
                    return "Failed to update quotation status!";
                }
            }

            return "Failed to generate Purchase Order!";
        }

        public List<Quotation> GetQuotationsByRFQID(int rfqID)
        {
            return _quotationDB.GetQuotationsByRFQID(rfqID);
        }

    }

}