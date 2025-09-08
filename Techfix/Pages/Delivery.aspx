<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Delivery.aspx.cs" Inherits="Techfix.Pages.Delivery" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Delivery Management</title>
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
            max-width: 1200px;
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

        h1 {
            font-size: 28px;
            color: #1E3A8A;
            margin-bottom: 20px;
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

        .action-btn, .action-link {
            padding: 8px 15px;
            font-size: 14px;
            color: #fff;
            background-color: #28a745;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            transition: all 0.3s ease;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            font-weight: 600;
        }

        .action-btn:hover, .action-link:hover {
            background-color: #218838;
            transform: translateY(-1px);
            box-shadow: 0 4px 8px rgba(40, 167, 69, 0.3);
        }

        .lbl-message {
            text-align: center;
            font-size: 1.2em;
            margin-top: 20px;
            color: #dc3545;
        }

        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1000;
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 20px;
            border-radius: 12px;
            max-width: 600px;
            width: 90%;
            box-shadow: 0 4px 20px rgba(34, 211, 238, 0.3);
            position: relative;
            animation: fadeIn 0.5s ease-out;
        }

        .modal-content h2 {
            font-size: 24px;
            color: #1E3A8A;
            margin-top: 0;
            font-weight: 700;
        }

        .modal-content p {
            margin: 10px 0;
            font-size: 1em;
            color: #333;
        }

        .modal-content .close-btn {
            position: absolute;
            top: 10px;
            right: 15px;
            font-size: 1.5em;
            cursor: pointer;
            color: #333;
            transition: color 0.3s ease;
        }

        .modal-content .close-btn:hover {
            color: #dc3545;
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

            h1 {
                font-size: 24px;
            }

            th, td {
                padding: 8px;
                font-size: 0.9rem;
            }

            .action-btn, .action-link {
                font-size: 12px;
                padding: 6px 12px;
            }

            .btn-back {
                font-size: 1rem;
                padding: 0.75rem;
            }

            .modal-content {
                width: 95%;
            }
        }

        @media (max-width: 480px) {
            .dashboard-container {
                margin: 10px;
                padding: 10px;
            }

            h1 {
                font-size: 20px;
            }

            th, td {
                padding: 6px;
                font-size: 0.8rem;
            }

            .action-btn, .action-link {
                font-size: 10px;
                padding: 4px 10px;
            }

            .btn-back {
                font-size: 0.9rem;
                padding: 0.6rem;
            }

            .modal-content h2 {
                font-size: 20px;
            }

            .modal-content p {
                font-size: 0.9rem;
            }
        }
    </style>
    <script type="text/javascript">
        function showDeliveryDetails(deliveryID, productDescription, estimatedDeliveryDate, actualDeliveryDate, status) {
            document.getElementById("modalDeliveryID").innerText = deliveryID;
            document.getElementById("modalProductDescription").innerText = productDescription;
            document.getElementById("modalEstimatedDeliveryDate").innerText = estimatedDeliveryDate;
            document.getElementById("modalActualDeliveryDate").innerText = actualDeliveryDate || "N/A";
            document.getElementById("modalStatus").innerText = status;
            document.getElementById("deliveryModal").style.display = "flex";
        }

        function closeModal() {
            document.getElementById("deliveryModal").style.display = "none";
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="dashboard-container">
            <h1>Delivery Management</h1>
            <div class="table-container">
                <asp:GridView ID="gvDeliveries" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="DeliveryID,ProductDescription,EstimatedDeliveryDate,ActualDeliveryDate,DeliveryStatus" CssClass="table">
                    <Columns>
                        <asp:BoundField DataField="DeliveryID" HeaderText="Delivery ID" ReadOnly="True" ItemStyle-Width="15%" />
                        <asp:BoundField DataField="ProductDescription" HeaderText="Product Description" ItemStyle-Width="30%" />
                        <asp:BoundField DataField="EstimatedDeliveryDate" HeaderText="Estimated Delivery Date" DataFormatString="{0:yyyy-MM-dd}" ItemStyle-Width="20%" />
                        <asp:BoundField DataField="DeliveryStatus" HeaderText="Status" ItemStyle-Width="15%" />
                        <asp:TemplateField HeaderText="Actions" ItemStyle-Width="20%">
                            <ItemTemplate>
                                <asp:HyperLink ID="lnkEdit" runat="server" NavigateUrl='<%# "Edit_Delivery.aspx?DeliveryID=" + Eval("DeliveryID") %>' 
                                    Text="Edit" Visible='<%# Eval("DeliveryStatus").ToString() != "Delivered" %>' CssClass="action-link" />
                                <asp:Button ID="btnView" runat="server" Text="View" 
                                    OnClientClick='<%# "showDeliveryDetails(\"" + Eval("DeliveryID") + "\", \"" + 
                                        Eval("ProductDescription").ToString().Replace("\"", "\\\"") + "\", \"" + 
                                        Eval("EstimatedDeliveryDate", "{0:yyyy-MM-dd}") + "\", \"" + 
                                        (Eval("ActualDeliveryDate") != DBNull.Value ? Eval("ActualDeliveryDate", "{0:yyyy-MM-dd}") : "") + "\", \"" + 
                                        Eval("DeliveryStatus") + "\"); return false;" %>' 
                                    Visible='<%# Eval("DeliveryStatus").ToString() == "Delivered" %>' CssClass="action-btn" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <asp:Label ID="lblMessage" runat="server" CssClass="lbl-message"></asp:Label>
            <div id="deliveryModal" class="modal">
                <div class="modal-content">
                    <span class="close-btn" onclick="closeModal()">×</span>
                    <h2>Delivery Details</h2>
                    <p><strong>Delivery ID:</strong> <span id="modalDeliveryID"></span></p>
                    <p><strong>Product Description:</strong> <span id="modalProductDescription"></span></p>
                    <p><strong>Estimated Delivery Date:</strong> <span id="modalEstimatedDeliveryDate"></span></p>
                    <p><strong>Actual Delivery Date:</strong> <span id="modalActualDeliveryDate"></span></p>
                    <p><strong>Status:</strong> <span id="modalStatus"></span></p>
                </div>
            </div>
            <a href="Supplier_Dashboard.aspx" class="btn-back">Back to Dashboard</a>
        </div>
    </form>
</body>
</html>