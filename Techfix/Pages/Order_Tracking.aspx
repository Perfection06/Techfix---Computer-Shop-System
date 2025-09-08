<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Order_Tracking.aspx.cs" Inherits="Techfix.Pages.Order_Tracking" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order Tracking</title>
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
            max-width: 1200px;
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

        h2 {
            font-size: 28px;
            color: #1E3A8A;
            margin-bottom: 25px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .table-container {
            overflow-x: auto;
            margin: 20px 0;
        }

        .table {
            width: 100%;
            min-width: 1000px;
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

        .cancel-btn {
            padding: 8px 15px;
            font-size: 14px;
            color: #fff;
            background-color: #dc3545;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            font-weight: 600;
        }

        .cancel-btn:hover {
            background-color: #c82333;
            transform: translateY(-1px);
            box-shadow: 0 4px 8px rgba(220, 53, 69, 0.3);
        }

        .cancel-btn:active {
            background-color: #a71d2a;
            transform: translateY(0);
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        .return-btn {
            padding: 8px 15px;
            font-size: 14px;
            color: #fff;
            background-color: #fd7e14;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            font-weight: 600;
        }

        .return-btn:hover {
            background-color: #e06b12;
            transform: translateY(-1px);
            box-shadow: 0 4px 8px rgba(253, 126, 20, 0.3);
        }

        .return-btn:active {
            background-color: #c75e10;
            transform: translateY(0);
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
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

            h2 {
                font-size: 24px;
            }

            th, td {
                padding: 8px;
                font-size: 0.9rem;
            }

            .cancel-btn, .return-btn {
                font-size: 12px;
                padding: 6px 12px;
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

            h2 {
                font-size: 20px;
            }

            th, td {
                padding: 6px;
                font-size: 0.8rem;
            }

            .cancel-btn, .return-btn {
                font-size: 10px;
                padding: 4px 10px;
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
            <h2>Order Tracking</h2>
            <div class="table-container">
                <asp:GridView ID="gvDeliveries" runat="server" AutoGenerateColumns="False" DataKeyNames="DeliveryID" OnRowCommand="gvDeliveries_RowCommand" CssClass="table">
                    <Columns>
                        <asp:BoundField DataField="DeliveryID" HeaderText="Delivery ID" ItemStyle-Width="10%" />
                        <asp:BoundField DataField="POID" HeaderText="PO ID" ItemStyle-Width="10%" />
                        <asp:BoundField DataField="SupplierName" HeaderText="Supplier Name" ItemStyle-Width="15%" />
                        <asp:BoundField DataField="BusinessName" HeaderText="Company Name" ItemStyle-Width="15%" />
                        <asp:BoundField DataField="ProductDescription" HeaderText="Product Description" ItemStyle-Width="20%" />
                        <asp:BoundField DataField="DeliveryStatus" HeaderText="Status" ItemStyle-Width="10%" />
                        <asp:BoundField DataField="ShippingConfirmation" HeaderText="Shipping Confirmation" ItemStyle-Width="10%" />
                        <asp:BoundField DataField="EstimatedDeliveryDate" HeaderText="Estimated Delivery" DataFormatString="{0:yyyy-MM-dd}" ItemStyle-Width="10%" />
                        <asp:BoundField DataField="ActualDeliveryDate" HeaderText="Actual Delivery" DataFormatString="{0:yyyy-MM-dd}" ItemStyle-Width="10%" />
                        <asp:TemplateField HeaderText="Cancel" ItemStyle-Width="5%">
                            <ItemTemplate>
                                <asp:Button ID="btnCancel" runat="server" CommandName="CancelDelivery" Text="Cancel" CommandArgument='<%# Eval("DeliveryID") %>' CssClass="cancel-btn" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Return" ItemStyle-Width="5%">
                            <ItemTemplate>
                                <asp:Button ID="btnReturn" runat="server" CommandName="ReturnDelivery" Text="Return" CommandArgument='<%# Eval("DeliveryID") %>' CssClass="return-btn" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <a href="Manager_Dashboard.aspx" class="btn-back">Back to Dashboard</a>
        </div>
    </form>
</body>
</html>