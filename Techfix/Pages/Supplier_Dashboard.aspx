<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Supplier_Dashboard.aspx.cs" Inherits="Techfix.Pages.Supplier_Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Supplier Dashboard</title>
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
            padding: 40px 20px;
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
            font-size: 2.25rem;
            color: white;
            text-align: center;
            margin-bottom: 40px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .logout-button {
            display: block;
            margin: 20px auto;
            background-color: #dc3545;
            color: white;
            padding: 10px 20px;
            font-size: 0.95em;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            text-decoration: none;
            transition: all 0.3s ease;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        .logout-button:hover {
            background-color: #c82333;
            transform: translateY(-1px);
            box-shadow: 0 4px 8px rgba(220, 53, 69, 0.3);
        }

        .dashboard-box {
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 4px 20px rgba(34, 211, 238, 0.3);
            text-align: center;
        }

        .dashboard-box::before {
            content: '';
            position: absolute;
            top: -5px;
            left: -5px;
            right: -5px;
            bottom: -5px;
            border: 1px solid rgba(34, 211, 238, 0.3);
            border-radius: 15px;
            z-index: -1;
            background: url('https://www.transparenttextures.com/patterns/circuit-board.png') repeat;
            opacity: 0.05;
        }

        .dashboard-box h3 {
            margin-bottom: 25px;
            font-size: 24px;
            color: #444;
            display: none; 
        }

        .dashboard-link {
            display: block;
            margin: 15px auto;
            width: 60%;
            background-color: #22D3EE;
            color: white;
            padding: 15px;
            text-decoration: none;
            font-size: 18px;
            border-radius: 8px;
            transition: all 0.3s ease;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            font-weight: 600;
        }

        .dashboard-link:hover {
            background-color: #06B6D4;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(34, 211, 238, 0.5);
        }

        @media (max-width: 768px) {
            .dashboard-container {
                margin: 20px;
                padding: 20px;
            }

            h2 {
                font-size: 1.75rem;
            }

            .dashboard-link {
                width: 80%;
                font-size: 16px;
                padding: 12px;
            }

            .logout-button {
                padding: 8px 15px;
                font-size: 0.85em;
            }
        }

        @media (max-width: 480px) {
            .dashboard-container {
                margin: 10px;
                padding: 15px;
            }

            h2 {
                font-size: 1.5rem;
            }

            .dashboard-link {
                width: 90%;
                font-size: 14px;
                padding: 10px;
            }

            .logout-button {
                padding: 6px 12px;
                font-size: 0.75em;
            }
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <h2>Supplier Dashboard</h2>
        <div class="dashboard-container">
            <div class="dashboard-box">
                <a href="Quotations.aspx" class="dashboard-link">Go to Quotations</a>
                <a href="Orders.aspx" class="dashboard-link">Go to Orders</a>
                <a href="Delivery.aspx" class="dashboard-link">Go to Deliveries</a>
                <a href="Login.aspx" class="logout-button">Logout</a>
            </div>
        </div>
    </form>
</body>
</html>