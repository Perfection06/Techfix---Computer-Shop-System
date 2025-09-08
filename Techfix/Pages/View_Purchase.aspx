<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View_Purchase.aspx.cs" Inherits="Techfix.Pages.View_Purchase" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>View Approved Quotations and Purchase Orders</title>
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
            max-width: 1200px;
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

        .error-message {
            color: #dc3545;
            font-size: 16px;
            text-align: center;
            margin-bottom: 20px;
            font-weight: 500;
        }

        .table {
            width: 100%;
            min-width: 1000px;
            border-collapse: collapse;
            margin-top: 20px;
            table-layout: fixed;
        }

        .table th {
            background-color: #1E3A8A;
            padding: 12px;
            text-align: left;
            border-bottom: 2px solid #ddd;
            color: white;
            font-weight: 600;
        }

        .table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            word-break: break-all;
            background-color: #f9f9f9;
        }

        .table tr:nth-child(even) {
            background-color: #ffffff;
        }

        .table tr:hover {
            background-color: #e0e7ff;
        }

        .pagination {
            margin-top: 20px;
            text-align: center;
        }

        .pagination a {
            padding: 8px 16px;
            margin: 0 4px;
            background-color: #22D3EE;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        .pagination a:hover {
            background-color: #06B6D4;
            transform: translateY(-1px);
            box-shadow: 0 4px 8px rgba(34, 211, 238, 0.3);
        }

        .pagination .current {
            background-color: #06B6D4;
            color: white;
            font-weight: 700;
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

            .table th, .table td {
                padding: 8px;
                font-size: 0.9rem;
            }

            .pagination a {
                padding: 6px 12px;
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

            .table {
                min-width: 100%;
            }

            .table th, .table td {
                padding: 6px;
                font-size: 0.8rem;
            }

            .pagination a {
                padding: 4px 10px;
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
            <h2>Approved Quotations and Purchase Orders</h2>
            <asp:Label ID="lblErrorMessage" runat="server" CssClass="error-message" Visible="false"></asp:Label>
            <asp:GridView ID="gvQuotation" runat="server" AutoGenerateColumns="False" CssClass="table" EmptyDataText="No approved quotations or purchase orders found." OnPageIndexChanging="gvQuotation_PageIndexChanging">
                <Columns>
                    <asp:BoundField DataField="SupplierName" HeaderText="Supplier Name" SortExpression="SupplierName" ItemStyle-Width="20%" />
                    <asp:BoundField DataField="QuotationAmount" HeaderText="Quotation Amount" SortExpression="QuotationAmount" ItemStyle-Width="10%" />
                    <asp:BoundField DataField="DeliverySchedule" HeaderText="Delivery Schedule" SortExpression="DeliverySchedule" ItemStyle-Width="15%" />
                    <asp:BoundField DataField="QuotationDetails" HeaderText="Quotation Details" SortExpression="QuotationDetails" ItemStyle-Width="20%" />
                    <asp:BoundField DataField="QuotationStatus" HeaderText="Quotation Status" SortExpression="QuotationStatus" ItemStyle-Width="10%" />
                    <asp:BoundField DataField="POAmount" HeaderText="PO Amount" SortExpression="POAmount" ItemStyle-Width="10%" />
                    <asp:BoundField DataField="POStatus" HeaderText="PO Status" SortExpression="POStatus" ItemStyle-Width="10%" />
                    <asp:BoundField DataField="OrderDate" HeaderText="Order Date" SortExpression="OrderDate" ItemStyle-Width="15%" />
                </Columns>
            </asp:GridView>
            <div class="pagination">
                <asp:Literal ID="ltPagination" runat="server"></asp:Literal>
            </div>
            <a href="Reports.aspx" class="btn-back">Back</a>
        </div>
    </form>
</body>
</html>