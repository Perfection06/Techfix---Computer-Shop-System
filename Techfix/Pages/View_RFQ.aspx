<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View_RFQ.aspx.cs" Inherits="Techfix.Pages.View_RFQ" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>View RFQs</title>
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
            max-width: 1000px;
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

        .gridview th {
            background-color: #e9ecef;
            padding: 12px;
            text-align: left;
            border-bottom: 2px solid #ddd;
            font-weight: 600;
            color: #1E3A8A;
        }

        .gridview td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            word-break: break-all;
        }

        .gridview tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .gridview tr:nth-child(odd) {
            background-color: #ffffff;
        }

        .gridview tr:hover {
            background-color: #e0e7ff;
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
            margin-left: 5px;
        }

        .gridview .btn-delete {
            background-color: #e74c3c;
            color: white;
        }

        .gridview .btn-delete:hover {
            background-color: #c0392b;
            transform: translateY(-1px);
            box-shadow: 0 4px 8px rgba(231, 76, 60, 0.3);
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
            <h2>Request for Quotations</h2>
            <asp:GridView ID="gvRFQs" runat="server" AutoGenerateColumns="False" DataKeyNames="RFQID" OnRowDeleting="gvRFQs_RowDeleting" CssClass="gridview">
                <Columns>
                    <asp:BoundField DataField="ProductDescription" HeaderText="Product Description" ItemStyle-Width="20%" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" ItemStyle-Width="10%" />
                    <asp:BoundField DataField="Specifications" HeaderText="Specifications" ItemStyle-Width="20%" />
                    <asp:BoundField DataField="DeliveryRequirements" HeaderText="Delivery Requirements" ItemStyle-Width="15%" />
                    <asp:BoundField DataField="PricingFormat" HeaderText="Pricing Format" ItemStyle-Width="10%" />
                    <asp:BoundField DataField="PaymentTerms" HeaderText="Payment Terms" ItemStyle-Width="15%" />
                    <asp:BoundField DataField="ValidityPeriod" HeaderText="Validity Period" DataFormatString="{0:yyyy-MM-dd}" ItemStyle-Width="10%" />
                    <asp:TemplateField HeaderText="Actions" ItemStyle-Width="10%">
                        <ItemTemplate>
                            <asp:Button ID="btnDelete" runat="server" CommandName="Delete" Text="Delete" CommandArgument='<%# Eval("RFQID") %>' CssClass="btn btn-delete" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <a href="Reports.aspx" class="btn-back">Back</a>
        </div>
    </form>
</body>
</html>