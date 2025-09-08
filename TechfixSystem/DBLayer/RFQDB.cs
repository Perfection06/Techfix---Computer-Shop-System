using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using TechfixSystem.Models;
using System.Data;

namespace TechfixSystem.DBLayer
{
    public class RFQDB
    {
        private DBAccess _dbAccess = new DBAccess();

        //Add RFQ (Request for quotation)
        public bool AddRFQ(RFQ rfq)
        {
            string query = @"INSERT INTO RFQs 
                         (ProductDescription, Quantity, Specifications, DeliveryRequirements, 
                          PricingFormat, PaymentTerms, ValidityPeriod, RequestDate) 
                         VALUES 
                         (@ProductDescription, @Quantity, @Specifications, @DeliveryRequirements, 
                          @PricingFormat, @PaymentTerms, @ValidityPeriod, @RequestDate)";

            SqlParameter[] parameters = new SqlParameter[]
            {
            new SqlParameter("@ProductDescription", rfq.ProductDescription),
            new SqlParameter("@Quantity", rfq.Quantity),
            new SqlParameter("@Specifications", rfq.Specifications),
            new SqlParameter("@DeliveryRequirements", rfq.DeliveryRequirements),
            new SqlParameter("@PricingFormat", rfq.PricingFormat),
            new SqlParameter("@PaymentTerms", rfq.PaymentTerms),
            new SqlParameter("@ValidityPeriod", rfq.ValidityPeriod),
            new SqlParameter("@RequestDate", rfq.RequestDate)
            };

            int rowsAffected = _dbAccess.ExecuteNonQuery(query, parameters);
            return rowsAffected > 0;
        }

        //Get RFQs
        public List<RFQ> GetAllRFQs()
        {
            string query = "SELECT * FROM RFQs";
            DataTable rfqTable = _dbAccess.ExecuteQuery(query);

            List<RFQ> rfqList = new List<RFQ>();
            foreach (DataRow row in rfqTable.Rows)
            {
                rfqList.Add(new RFQ
                {
                    RFQID = Convert.ToInt32(row["RFQID"]),
                    ProductDescription = row["ProductDescription"].ToString(),
                    Quantity = Convert.ToInt32(row["Quantity"]),
                    Specifications = row["Specifications"].ToString(),
                    DeliveryRequirements = row["DeliveryRequirements"].ToString(),
                    PricingFormat = row["PricingFormat"].ToString(),
                    PaymentTerms = row["PaymentTerms"].ToString(),
                    ValidityPeriod = Convert.ToDateTime(row["ValidityPeriod"]),
                });
            }

            return rfqList;
        }

        //Update RFQ
        public bool UpdateRFQ(RFQ rfq)
        {
            string query = "UPDATE RFQs SET ProductDescription = @ProductDescription, Quantity = @Quantity, Specifications = @Specifications, DeliveryRequirements = @DeliveryRequirements, PricingFormat = @PricingFormat, PaymentTerms = @PaymentTerms, ValidityPeriod = @ValidityPeriod WHERE RFQID = @RFQID";

            SqlParameter[] parameters =
            {
                new SqlParameter("@ProductDescription", rfq.ProductDescription),
                new SqlParameter("@Quantity", rfq.Quantity),
                new SqlParameter("@Specifications", rfq.Specifications),
                new SqlParameter("@DeliveryRequirements", rfq.DeliveryRequirements),
                new SqlParameter("@PricingFormat", rfq.PricingFormat),
                new SqlParameter("@PaymentTerms", rfq.PaymentTerms),
                new SqlParameter("@ValidityPeriod", rfq.ValidityPeriod),
                new SqlParameter("@RFQID", rfq.RFQID),
            };

            int rowsAffected = _dbAccess.ExecuteNonQuery(query, parameters);
            return rowsAffected > 0;
        }

        //Get RFQ by ID
        public RFQ GetRFQByID(int rfqID)
        {
            string query = "SELECT * FROM RFQs WHERE RFQID = @RFQID";

            SqlParameter[] parameters = { new SqlParameter("@RFQID", rfqID) };
            DataTable rfqTable = _dbAccess.ExecuteQuery(query, parameters);

            if (rfqTable.Rows.Count > 0)
            {
                DataRow row = rfqTable.Rows[0];
                return new RFQ
                {
                    RFQID = Convert.ToInt32(row["RFQID"]),
                    ProductDescription = row["ProductDescription"].ToString(),
                    Quantity = Convert.ToInt32(row["Quantity"]),
                    Specifications = row["Specifications"].ToString(),
                    DeliveryRequirements = row["DeliveryRequirements"].ToString(),
                    PricingFormat = row["PricingFormat"].ToString(),
                    PaymentTerms = row["PaymentTerms"].ToString(),
                    ValidityPeriod = Convert.ToDateTime(row["ValidityPeriod"]),
                };
            }

            return null; 
        }


        // Delete RFQ
        public bool DeleteRFQ(int rfqID)
        {
            string query = "DELETE FROM RFQs WHERE RFQID = @RFQID";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@RFQID", rfqID)
            };

            return _dbAccess.ExecuteNonQuery(query, parameters) > 0;
        }


    }
}