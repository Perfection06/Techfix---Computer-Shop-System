using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using TechfixSystem.AppLogic;
using TechfixSystem.Models;



namespace TechfixSystem.Services
{
    /// <summary>
    /// Summary description for SupplierService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class SupplierService : System.Web.Services.WebService
    {
        private SupplierLogic _supplierLogic = new SupplierLogic();

        [WebMethod]
        public bool AddSupplier(string name, string email, string username, string password, string phone, string address, string businessName, bool isActive)
        {
            SupplierModel supplier = new SupplierModel
            {
                Name = name,
                Username = username,
                Password = password,
                Email = email,
                Phone = phone,
                Address = address,
                BusinessName = businessName,
                IsActive = isActive
            };

            return _supplierLogic.AddSupplier(supplier);
        }

        [WebMethod]
        public List<SupplierModel> GetAllSuppliers()
        {
            return _supplierLogic.GetAllSuppliers();
        }

        [WebMethod]
        public bool UpdateSupplier(int supplierID, string name, string username, string password, string email, string phone, string address, string businessName)
        {
            SupplierModel supplier = new SupplierModel
            {
                SupplierID = supplierID,
                Name = name,
                Username = username,
                Password = password,
                Email = email,
                Phone = phone,
                Address = address,
                BusinessName = businessName
            };

            return _supplierLogic.UpdateSupplier(supplier);
        }

        [WebMethod]
        public bool SetSupplierStatus(int supplierID, bool isActive)
        {
            return _supplierLogic.SetSupplierStatus(supplierID, isActive);
        }

        [WebMethod]
        public bool DeleteSupplier(int supplierID)
        {
            return _supplierLogic.DeleteSupplier(supplierID);
        }

        
        [WebMethod]
        public SupplierModel GetSupplierByID(int supplierID)
        {
            return _supplierLogic.GetSupplierByID(supplierID);
        }



    }
}
