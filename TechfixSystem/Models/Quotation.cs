using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TechfixSystem.Models
{
    public class Quotation
    {
        public int QuotationID { get; set; }
        public int RFQID { get; set; }
        public int SupplierID { get; set; }
        public string SupplierName { get; set; } 
        public decimal QuotationAmount { get; set; }
        public string DeliverySchedule { get; set; }
        public string QuotationDetails { get; set; }
        public DateTime SubmissionDate { get; set; }
        public string Status { get; set; }
    }


}