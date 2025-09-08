<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Quotations.aspx.cs" Inherits="Techfix.Pages.Quotations" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Submit Quotations</title>
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
            max-width: 1000px;
            margin: 50px auto;
            padding: 20px;
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
            text-align: center;
            margin-bottom: 20px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
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

        asp\:Button {
            padding: 8px 15px;
            font-size: 14px;
            color: #fff;
            background-color: #22D3EE;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            font-weight: 600;
        }

        asp\:Button:hover {
            background-color: #06B6D4;
            transform: translateY(-1px);
            box-shadow: 0 4px 8px rgba(34, 211, 238, 0.3);
        }

        .submit-quotation-btn {
            padding: 5px;
            font-size: 16px;
            color: #fff;
            background-color: #28a745;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            font-weight: 700;
        }

        .submit-quotation-btn:hover {
            background-color: #218838;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(40, 167, 69, 0.4);
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
                padding: 15px;
            }

            h2 {
                font-size: 24px;
            }

            th, td {
                padding: 8px;
                font-size: 0.9rem;
            }

            asp\:Button {
                font-size: 12px;
                padding: 6px 12px;
            }

            .submit-quotation-btn {
                font-size: 14px;
                padding: 10px 20px;
            }

            .btn-back {
                font-size: 1rem;
                padding: 0.75rem;
            }
        }

        @media (max-width: 480px) {
            .dashboard-container {
                margin: 10px;
                padding: 10px;
            }

            h2 {
                font-size: 20px;
            }

            th, td {
                padding: 6px;
                font-size: 0.8rem;
            }

            asp\:Button {
                font-size: 10px;
                padding: 4px 10px;
            }

            .submit-quotation-btn {
                font-size: 12px;
                padding: 8px 15px;
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
            <h2>View RFQs</h2>
            <div class="table-container">
                <asp:GridView ID="gvRFQs" runat="server" AutoGenerateColumns="False" OnRowCommand="gvRFQs_RowCommand" CssClass="table">
                    <Columns>
                        <asp:BoundField DataField="ProductDescription" HeaderText="Product Description" SortExpression="ProductDescription" ItemStyle-Width="35%" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ItemStyle-Width="15%" />
                        <asp:BoundField DataField="DeliveryRequirements" HeaderText="Delivery Requirements" SortExpression="DeliveryRequirements" ItemStyle-Width="20%" />
                        <asp:BoundField DataField="PricingFormat" HeaderText="Pricing Format" SortExpression="PricingFormat" ItemStyle-Width="15%" />
                        <asp:BoundField DataField="PaymentTerms" HeaderText="Payment Terms" SortExpression="PaymentTerms" ItemStyle-Width="15%" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnSubmitQuotation" runat="server" Text="Submit Quotation" CommandName="SubmitQuotation" CommandArgument='<%# Eval("RFQID") %>' OnClientClick="return confirm('Are you sure you want to submit your quotation?');" CssClass="submit-quotation-btn" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <a href="Supplier_Dashboard.aspx" class="btn-back">Back</a>
        </div>
    </form>
</body>
</html>