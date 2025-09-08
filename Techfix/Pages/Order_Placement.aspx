<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Order_Placement.aspx.cs" Inherits="Techfix.Pages.Order_Placement" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order Placement</title>
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
            max-width: 800px;
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

        .form-group {
            margin-bottom: 25px;
            text-align: left;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-size: 16px;
            font-weight: 600;
        }

        .form-control {
            width: 100%;
            padding: 12px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 6px;
            box-sizing: border-box;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
            background-color: #fff;
        }

        .form-control:focus {
            border-color: #22D3EE;
            box-shadow: 0 0 5px rgba(34, 211, 238, 0.5);
            outline: none;
        }

        .get-quotations-btn {
            display: block;
            padding: 12px 30px;
            font-size: 16px;
            color: #fff;
            background-color: #28a745;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            font-weight: 600;
            width: 100%;
            max-width: 300px;
            text-align: center;
        }

        .get-quotations-btn:hover {
            background-color: #218838;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(40, 167, 69, 0.4);
        }

        .get-quotations-btn:active {
            background-color: #1e7e34;
            transform: translateY(0);
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
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

        .accept-btn {
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

        .accept-btn:hover {
            background-color: #06B6D4;
            transform: translateY(-1px);
            box-shadow: 0 4px 8px rgba(34, 211, 238, 0.4);
        }

        .accept-btn:active {
            background-color: #0891B2;
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

        .message {
            display: block;
            margin-top: 20px;
            padding: 12px;
            text-align: center;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 500;
            color: #dc3545;
            background-color: rgba(220, 53, 69, 0.1);
            border: 1px solid #dc3545;
        }

        .error-message {
            color: #dc3545;
            font-size: 13px;
            margin-top: 8px;
            padding: 5px;
            background-color: rgba(220, 53, 69, 0.1);
            border-radius: 4px;
            display: none;
            text-align: left;
        }

        @media (max-width: 768px) {
            .container {
                margin: 20px;
                padding: 20px;
            }

            h1 {
                font-size: 24px;
            }

            label {
                font-size: 14px;
            }

            .form-control {
                padding: 10px;
                font-size: 13px;
            }

            .get-quotations-btn, .btn-back {
                font-size: 14px;
                padding: 10px 20px;
                max-width: 250px;
            }

            th, td {
                padding: 8px;
                font-size: 0.9rem;
            }

            .accept-btn {
                font-size: 12px;
                padding: 6px 12px;
            }

            .message {
                font-size: 13px;
            }

            .error-message {
                font-size: 12px;
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

            label {
                font-size: 13px;
            }

            .form-control {
                padding: 8px;
                font-size: 12px;
            }

            .get-quotations-btn, .btn-back {
                font-size: 12px;
                padding: 8px 15px;
                max-width: 200px;
            }

            th, td {
                padding: 6px;
                font-size: 0.8rem;
            }

            .accept-btn {
                font-size: 10px;
                padding: 4px 10px;
            }

            .message {
                font-size: 12px;
            }

            .error-message {
                font-size: 11px;
            }
        }
    </style>
    <script>
        function validateForm() {
            var isValid = true;
            var productDescription = document.getElementById('<%= ddlProductDescription.ClientID %>').value;

            if (productDescription === "") {
                document.getElementById("productDescriptionError").style.display = "block";
                isValid = false;
            } else {
                document.getElementById("productDescriptionError").style.display = "none";
            }

            return isValid;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server" onsubmit="return validateForm();">
        <div class="container">
            <h1>Order Placement</h1>
            <div class="form-group">
                <label for="ddlProductDescription">Select Product Description:</label>
                <asp:DropDownList ID="ddlProductDescription" runat="server" CssClass="form-control">
                    <asp:ListItem Text="-- Select Product --" Value="" />
                </asp:DropDownList>
                <div id="productDescriptionError" class="error-message">Please select a product description.</div>
            </div>
            <div class="form-group">
                <asp:Button ID="btnGetQuotations" runat="server" Text="Get Quotations" OnClick="btnGetQuotations_Click" CssClass="get-quotations-btn" />
            </div>
            <div class="table-container">
                <asp:GridView ID="gvQuotations" runat="server" AutoGenerateColumns="False" DataKeyNames="QuotationID" CssClass="table">
                    <Columns>
                        <asp:BoundField DataField="SupplierName" HeaderText="Supplier Name" ItemStyle-Width="20%" />
                        <asp:BoundField DataField="QuotationAmount" HeaderText="Amount" DataFormatString="{0:C}" ItemStyle-Width="15%" />
                        <asp:BoundField DataField="DeliverySchedule" HeaderText="Delivery Schedule" ItemStyle-Width="20%" />
                        <asp:BoundField DataField="QuotationDetails" HeaderText="Details" ItemStyle-Width="35%" />
                        <asp:TemplateField HeaderText="Action" ItemStyle-Width="10%">
                            <ItemTemplate>
                                <asp:Button ID="btnAccept" runat="server" Text="Accept" OnClick="btnAccept_Click" CommandName="Accept" CssClass="accept-btn" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <asp:Label ID="lblMessage" runat="server" CssClass="message" Visible="False"></asp:Label>
            <a href="Manager_Dashboard.aspx" class="btn-back">Back to Dashboard</a>
        </div>
    </form>
</body>
</html>