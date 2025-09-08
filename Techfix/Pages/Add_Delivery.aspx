<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_Delivery.aspx.cs" Inherits="Techfix.Pages.Add_Delivery" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Confirm Delivery</title>
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
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(34, 211, 238, 0.3);
            text-align: center;
            animation: fadeIn 0.5s ease-out;
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
            margin-bottom: 20px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        label {
            display: block;
            font-size: 16px;
            color: #333;
            margin-bottom: 8px;
            font-weight: 600;
            text-align: left;
        }

        input[type="text"], input[type="date"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 14px;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus, input[type="date"]:focus {
            border-color: #22D3EE;
            outline: none;
            box-shadow: 0 0 5px rgba(34, 211, 238, 0.3);
        }

        input[readonly] {
            background-color: #f9f9f9;
            cursor: not-allowed;
        }

        .confirm-delivery-btn {
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            background-color: #28a745;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            font-weight: 600;
        }

        .confirm-delivery-btn:hover {
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

            label {
                font-size: 14px;
            }

            input[type="text"], input[type="date"] {
                font-size: 12px;
                padding: 8px;
            }

            .confirm-delivery-btn {
                font-size: 14px;
                padding: 8px 15px;
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

            label {
                font-size: 12px;
            }

            input[type="text"], input[type="date"] {
                font-size: 10px;
                padding: 6px;
            }

            .confirm-delivery-btn {
                font-size: 12px;
                padding: 6px 12px;
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
            <h2>Confirm Delivery</h2>
            <label for="txtPOID">Purchase Order ID:</label>
            <asp:TextBox ID="txtPOID" runat="server" ReadOnly="True" />
            
            <label for="txtShippingConfirmation">Shipping Confirmation:</label>
            <asp:TextBox ID="txtShippingConfirmation" runat="server" placeholder="Enter shipping confirmation" />
            
            <label for="txtEstimatedDeliveryDate">Estimated Delivery Date:</label>
            <asp:TextBox ID="txtEstimatedDeliveryDate" runat="server" TextMode="Date" />
            
            <asp:Button ID="btnAddDelivery" runat="server" Text="Confirm Delivery" OnClick="btnAddDelivery_Click" CssClass="confirm-delivery-btn" />
            <a href="Orders.aspx" class="btn-back">Back to Orders</a>
        </div>
    </form>
</body>
</html>