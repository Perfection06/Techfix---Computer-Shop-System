using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TechfixSystem.Models
{
    public class DeliveryDetail
    {
        public string SupplierName { get; set; }
        public string BusinessName { get; set; }
        public string ProductDescription { get; set; }
        public DateTime? EstimatedDeliveryDate { get; set; }
        public string DeliveryStatus { get; set; }
    }

}