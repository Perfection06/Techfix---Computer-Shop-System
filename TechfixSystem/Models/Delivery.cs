using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TechfixSystem.Models
{
    public class Delivery
    {
        public int DeliveryID { get; set; }
        public int POID { get; set; }
        public string DeliveryStatus { get; set; }
        public string ShippingConfirmation { get; set; }
        public DateTime? EstimatedDeliveryDate { get; set; }
        public DateTime? ActualDeliveryDate { get; set; }
    }

}