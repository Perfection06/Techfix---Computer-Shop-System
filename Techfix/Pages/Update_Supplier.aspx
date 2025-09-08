<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Update_Supplier.aspx.cs" Inherits="Techfix.Pages.Update_Supplier" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Update/Delete Supplier</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #111827, #1E3A8A);
            min-height: 100vh;
            margin: 0;
            padding: 0;
            position: relative;
            overflow-x: hidden;
        }

        
        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('https://www.transparenttextures.com/patterns/circuit-board.png') repeat;
            opacity: 0.1;
            z-index: -1;
        }

        .dashboard-container {
            width: 90%;
            max-width: 1500px;
            margin: 50px auto;
            padding: 2rem;
            background-color: rgba(255, 255, 255, 0.95);
            box-shadow: 0 4px 20px rgba(34, 211, 238, 0.3);
            border-radius: 12px;
            text-align: center;
            animation: fadeIn 0.5s ease-out;
            overflow-x: auto; 
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        h2 {
            margin-bottom: 2rem;
            color: #1E3A8A;
            font-size: 2.25rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .gridview {
            width: 100%;
            min-width: 800px; 
            border-collapse: collapse;
            margin-top: 20px;
            table-layout: fixed;
        }

        .gridview th, .gridview td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            word-wrap: break-word;
            max-width: 200px;
        }

        .gridview th {
            background-color: #f2f2f2;
            font-weight: 600;
        }

        .gridview tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .gridview tr:hover {
            background-color: #e9ecef;
        }

        .gridview .btn {
            padding: 0.75rem 1rem;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 1rem;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        .gridview .btn-edit {
            background-color: #4CAF50;
            color: white;
        }

        .gridview .btn-edit:hover {
            background-color: #45a049;
            transform: translateY(-1px);
            box-shadow: 0 4px 8px rgba(76, 175, 80, 0.3);
        }

        .gridview .btn-delete {
            background-color: #f44336;
            color: white;
        }

        .gridview .btn-delete:hover {
            background-color: #c82333;
            transform: translateY(-1px);
            box-shadow: 0 4px 8px rgba(244, 67, 54, 0.3);
        }

        .gridview .btn-activate {
            background-color: #008CBA;
            color: white;
        }

        .gridview .btn-activate:hover {
            background-color: #0056b3;
            transform: translateY(-1px);
            box-shadow: 0 4px 8px rgba(0, 140, 186, 0.3);
        }

        .gridview .btn-deactivate {
            background-color: #6C757D;
            color: white;
        }

        .gridview .btn-deactivate:hover {
            background-color: #5a6268;
            transform: translateY(-1px);
            box-shadow: 0 4px 8px rgba(108, 117, 125, 0.3);
        }

        .btn-back {
            display: block;
            margin: 20px auto;
            padding: 1rem;
            background-color: #343A40;
            color: white;
            text-align: center;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            text-decoration: none;
            font-size: 1.1rem;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        .btn-back:hover {
            background-color: #23272b;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(52, 58, 64, 0.3);
        }

        @media (max-width: 768px) {
            .dashboard-container {
                margin: 20px;
                padding: 1.5rem;
            }

            h2 {
                font-size: 1.75rem;
            }

            .gridview th, .gridview td {
                padding: 8px;
                font-size: 0.9rem;
            }

            .gridview .btn {
                padding: 0.5rem 0.75rem;
                font-size: 0.9rem;
            }

            .btn-back {
                font-size: 1rem;
                padding: 0.75rem;
            }
        }

        @media (max-width: 480px) {
            .dashboard-container {
                width: 95%;
            }

            .gridview {
                min-width: 100%; 
            }

            .gridview th, .gridview td {
                padding: 6px;
                font-size: 0.8rem;
            }

            .gridview .btn {
                padding: 0.4rem 0.6rem;
                font-size: 0.8rem;
            }

            .btn-back {
                font-size: 0.9rem;
                padding: 0.6rem;
            }
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="dashboard-container">
            <h2>Update/Delete/Activate/Deactivate Suppliers</h2>
            <asp:GridView ID="gvSuppliers" runat="server" AutoGenerateColumns="False" CssClass="gridview" OnRowCommand="gvSuppliers_RowCommand" OnRowDeleting="gvSuppliers_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="BusinessName" HeaderText="Business Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" />
                    <asp:BoundField DataField="IsActive" HeaderText="Is Active" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnEdit" runat="server" CommandName="Edit" Text="Edit" CommandArgument='<%# Eval("SupplierID") %>' CssClass="btn btn-edit" />
                            <asp:Button ID="btnDelete" runat="server" CommandName="Delete" Text="Delete" CommandArgument='<%# Eval("SupplierID") %>' CssClass="btn btn-delete" />
                            <asp:Button ID="btnActivate" runat="server" CommandName="Activate" Text="Activate" CommandArgument='<%# Eval("SupplierID") %>' CssClass="btn btn-activate" Enabled='<%# !(bool)Eval("IsActive") %>' />
                            <asp:Button ID="btnDeactivate" runat="server" CommandName="Deactivate" Text="Deactivate" CommandArgument='<%# Eval("SupplierID") %>' CssClass="btn btn-deactivate" Enabled='<%# (bool)Eval("IsActive") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <a href="Supplier_Management.aspx" class="btn-back">Back</a>
        </div>
    </form>
</body>
</html>