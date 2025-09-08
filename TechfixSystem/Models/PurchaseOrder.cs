using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TechfixSystem.Models
{
    public class PurchaseOrder
    {
        public int POID { get; set; }
        public int QuotationID { get; set; }
        public int ManagerID { get; set; }
        public decimal POAmount { get; set; }
        public string POStatus { get; set; }
        public DateTime OrderDate { get; set; }
    }

}