using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TechfixSystem.Models
{
    public class RFQ
    {
        public int RFQID { get; set; } 
        public string ProductDescription { get; set; } 
        public int Quantity { get; set; } 
        public string Specifications { get; set; } 
        public string DeliveryRequirements { get; set; } 
        public string PricingFormat { get; set; } 
        public string PaymentTerms { get; set; } 
        public DateTime ValidityPeriod { get; set; } 
        public DateTime RequestDate { get; set; } 
    }
}