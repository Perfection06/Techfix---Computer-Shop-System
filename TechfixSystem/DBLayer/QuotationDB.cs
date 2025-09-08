using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using TechfixSystem.Models;

namespace TechfixSystem.DBLayer
{
    public class QuotationDB
    {
        private DBAccess _dbAccess = new DBAccess();

        // Submit Supplier Quotation
        public bool SubmitQuotation(Quotation quotation)
        {
            string query = @"INSERT INTO Quotations 
                     (RFQID, SupplierID, QuotationAmount, DeliverySchedule, QuotationDetails, SubmissionDate)
                     VALUES 
                     (@RFQID, @SupplierID, @QuotationAmount, @DeliverySchedule, @QuotationDetails, GETDATE())";

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@RFQID", quotation.RFQID),
                new SqlParameter("@SupplierID", quotation.SupplierID),
                new SqlParameter("@QuotationAmount", quotation.QuotationAmount),
                new SqlParameter("@DeliverySchedule", quotation.DeliverySchedule),
                new SqlParameter("@QuotationDetails", quotation.QuotationDetails),
            };

            int rowsAffected = _dbAccess.ExecuteNonQuery(query, parameters);
            return rowsAffected > 0;
        }


        // Get Quotations by RFQID 
        public List<Quotation> GetQuotationsByRFQID(int rfqID)
        {
            string query = @"
            SELECT 
                q.QuotationID,
                q.RFQID,
                q.SupplierID,
                s.Name AS SupplierName,
                q.QuotationAmount,
                q.DeliverySchedule,
                q.QuotationDetails,
                q.SubmissionDate
            FROM 
                Quotations q
            INNER JOIN 
                Suppliers s ON q.SupplierID = s.SupplierID
            WHERE 
                q.RFQID = @RFQID";

            SqlParameter[] parameters = { new SqlParameter("@RFQID", rfqID) };
            DataTable quotationTable = _dbAccess.ExecuteQuery(query, parameters);

            List<Quotation> quotationList = new List<Quotation>();
            foreach (DataRow row in quotationTable.Rows)
            {
                quotationList.Add(new Quotation
                {
                    QuotationID = Convert.ToInt32(row["QuotationID"]),
                    RFQID = Convert.ToInt32(row["RFQID"]),
                    SupplierID = Convert.ToInt32(row["SupplierID"]),
                    SupplierName = row["SupplierName"].ToString(),
                    QuotationAmount = Convert.ToDecimal(row["QuotationAmount"]),
                    DeliverySchedule = row["DeliverySchedule"].ToString(),
                    QuotationDetails = row["QuotationDetails"].ToString(),
                    SubmissionDate = Convert.ToDateTime(row["SubmissionDate"])
                });
            }

            return quotationList;
        }

        // Update Quotation Status
        public bool UpdateQuotationStatus(int quotationID, string status)
        {
            string query = @"UPDATE Quotations 
                     SET Status = @Status 
                     WHERE QuotationID = @QuotationID";

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@QuotationID", quotationID),
                new SqlParameter("@Status", status)
            };

            int rowsAffected = _dbAccess.ExecuteNonQuery(query, parameters);
            return rowsAffected > 0;
        }

    

        // Get quotation by ID
        public Quotation GetQuotationById(int quotationID)
        {
            string query = @"SELECT * FROM Quotations WHERE QuotationID = @QuotationID";

            SqlParameter[] parameters = new SqlParameter[]
            {
            new SqlParameter("@QuotationID", quotationID)
            };

            DataTable dt = _dbAccess.ExecuteQuery(query, parameters);
            if (dt.Rows.Count > 0)
            {
                return new Quotation
                {
                    QuotationID = Convert.ToInt32(dt.Rows[0]["QuotationID"]),
                    QuotationAmount = Convert.ToDecimal(dt.Rows[0]["QuotationAmount"]),
                    Status = dt.Rows[0]["Status"].ToString(),
                    
                };
            }

            return null;
        }


    }

}