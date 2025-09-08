<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="Techfix.Pages.Inventory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Inventory Monitoring</title>
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
            max-width: 900px;
            margin: 50px auto;
            background-color: rgba(255, 255, 255, 0.95);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(34, 211, 238, 0.3);
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

        h1 {
            font-size: 28px;
            color: #1E3A8A;
            text-align: center;
            margin-bottom: 30px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .error-message {
            color: #dc3545;
            text-align: center;
            margin-bottom: 20px;
            font-weight: 500;
        }

        .table-container {
            overflow-x: auto;
        }

        table {
            width: 100%;
            min-width: 800px;
            border-collapse: collapse;
            margin: 20px 0;
            table-layout: fixed;
        }

        th, td {
            text-align: left;
            padding: 12px;
            border: 1px solid #ddd;
            word-break: break-all;
        }

        th {
            background-color: #1E3A8A;
            color: white;
            font-weight: 600;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:nth-child(odd) {
            background-color: #ffffff;
        }

        tr:hover {
            background-color: #e0e7ff;
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
                padding: 20px;
            }

            h1 {
                font-size: 24px;
            }

            th, td {
                padding: 8px;
                font-size: 0.9rem;
            }

            .btn-back {
                font-size: 1rem;
                padding: 0.75rem;
            }
        }

        @media (max-width: 480px) {
            .dashboard-container {
                margin: 10px;
                padding: 15px;
            }

            h1 {
                font-size: 20px;
            }

            th, td {
                padding: 6px;
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
            <h1>Inventory Monitoring</h1>
            <asp:Label ID="lblErrorMessage" runat="server" CssClass="error-message" Visible="false"></asp:Label>
            <div class="table-container">
                <asp:GridView ID="gvInventory" runat="server" AutoGenerateColumns="False" CssClass="table" EmptyDataText="No inventory records found.">
                    <Columns>
                        <asp:BoundField DataField="ProductDescription" HeaderText="Product Description" ItemStyle-Width="40%" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" ItemStyle-Width="15%" />
                        <asp:BoundField DataField="Specifications" HeaderText="Specifications" ItemStyle-Width="25%" />
                        <asp:BoundField DataField="POAmount" HeaderText="Price (PO Amount)" ItemStyle-Width="20%" />
                    </Columns>
                </asp:GridView>
            </div>
            <a href="Admin_Dashboard.aspx" class="btn-back">Back</a>
        </div>
    </form>
</body>
</html>