using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TechfixSystem.Models;
using TechfixSystem.DBLayer;

namespace TechfixSystem.AppLogic
{
    public class SupplierLogic
    {
        private SupplierDB _supplierDB = new SupplierDB();

        //Add supplier
        public bool AddSupplier(SupplierModel supplier)
        {
            if (string.IsNullOrEmpty(supplier.Name) || string.IsNullOrEmpty(supplier.Email) || string.IsNullOrEmpty(supplier.BusinessName) || string.IsNullOrEmpty(supplier.Username) || string.IsNullOrEmpty(supplier.Password))
            {
                throw new ArgumentException("Supplier Name, Email, Username, Password and Business Name are required.");
            }

            return _supplierDB.AddSupplier(supplier);
        }

        //View suppliers
        public List<SupplierModel> GetAllSuppliers()
        {
            return _supplierDB.GetAllSuppliers();
        }

        //Update suppliers
        public bool UpdateSupplier(SupplierModel supplier)
        {
            
            if (string.IsNullOrEmpty(supplier.Name) || string.IsNullOrEmpty(supplier.Email))
            {
                throw new Exception("Supplier Name and Email are required.");
            }

            return _supplierDB.UpdateSupplier(supplier);
        }

        //Toggle status of suppliers
        public bool SetSupplierStatus(int supplierID, bool isActive)
        {
            return _supplierDB.SetSupplierStatus(supplierID, isActive);
        }

        //Permanently delete a supplier
        public bool DeleteSupplier(int supplierID)
        {
            return _supplierDB.DeleteSupplier(supplierID);
        }

        // Logic to retrieve a supplier by ID
        public SupplierModel GetSupplierByID(int supplierID)
        {
            return _supplierDB.GetSupplierByID(supplierID);
        }

    }
}