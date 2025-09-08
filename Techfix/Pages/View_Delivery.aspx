<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View_Delivery.aspx.cs" Inherits="Techfix.Pages.View_Delivery" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Delivery Details</title>
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

        .container {
            max-width: 900px;
            margin: 50px auto;
            padding: 30px;
            background-color: rgba(255, 255, 255, 0.95);
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
            margin-bottom: 25px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .error-message {
            display: block;
            margin: 20px 0;
            padding: 12px;
            text-align: center;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 500;
            color: #dc3545;
            background-color: rgba(220, 53, 69, 0.1);
            border: 1px solid #dc3545;
        }

        .table-container {
            overflow-x: auto;
            margin: 20px 0;
        }

        .table {
            width: 100%;
            min-width: 700px;
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

        .empty-data {
            text-align: center;
            padding: 20px;
            font-size: 16px;
            color: #666;
            font-style: italic;
        }

        .btn-back {
            display: block;
            margin: 20px auto;
            padding: 12px 30px;
            font-size: 16px;
            color: #fff;
            background-color: #343A40;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            text-decoration: none;
            transition: all 0.3s ease;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            font-weight: 600;
            width: 100%;
            max-width: 300px;
            text-align: center;
        }

        .btn-back:hover {
            background-color: #23272b;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(52, 58, 64, 0.3);
        }

        .btn-back:active {
            background-color: #1c2526;
            transform: translateY(0);
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        @media (max-width: 768px) {
            .container {
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

            .error-message {
                font-size: 13px;
            }

            .empty-data {
                font-size: 14px;
            }

            .btn-back {
                font-size: 14px;
                padding: 10px 20px;
                max-width: 250px;
            }
        }

        @media (max-width: 480px) {
            .container {
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

            .error-message {
                font-size: 12px;
            }

            .empty-data {
                font-size: 13px;
            }

            .btn-back {
                font-size: 12px;
                padding: 8px 15px;
                max-width: 200px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Delivery Details</h1>
            <asp:Label ID="lblErrorMessage" runat="server" CssClass="error-message" Visible="False"></asp:Label>
            <div class="table-container">
                <asp:GridView ID="gvDeliveryDetails" runat="server" AutoGenerateColumns="False" 
                    CssClass="table" EmptyDataText="No delivery records found." EmptyDataRowStyle-CssClass="empty-data">
                    <Columns>
                        <asp:BoundField DataField="SupplierName" HeaderText="Supplier Name" ItemStyle-Width="20%" />
                        <asp:BoundField DataField="BusinessName" HeaderText="Business Name" ItemStyle-Width="20%" />
                        <asp:BoundField DataField="ProductDescription" HeaderText="Product Description" ItemStyle-Width="30%" />
                        <asp:BoundField DataField="EstimatedDeliveryDate" HeaderText="Estimated Delivery Date" 
                            DataFormatString="{0:yyyy-MM-dd}" ItemStyle-Width="15%" />
                        <asp:BoundField DataField="DeliveryStatus" HeaderText="Delivery Status" ItemStyle-Width="15%" />
                    </Columns>
                </asp:GridView>
            </div>
            <a href="Admin_Dashboard.aspx" class="btn-back">Back to Dashboard</a>
        </div>
    </form>
</body>
</html>