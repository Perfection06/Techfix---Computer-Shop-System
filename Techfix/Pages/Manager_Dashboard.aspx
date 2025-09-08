<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manager_Dashboard.aspx.cs" Inherits="Techfix.Pages.Manager_Dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manager Dashboard</title>
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
            margin: 300px auto;
            padding: 30px;
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

        .dashboard-title {
            font-size: 28px;
            color: #1E3A8A;
            margin-bottom: 30px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .button-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 15px;
            margin-top: 20px;
        }

        .dashboard-button {
            display: block;
            padding: 15px 30px;
            font-size: 16px;
            color: #fff;
            background-color: #22D3EE;
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

        .dashboard-button:hover {
            background-color: #06B6D4;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(34, 211, 238, 0.4);
        }

        .dashboard-button:active {
            background-color: #0891B2;
            transform: translateY(0);
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        .logout-button {
            display: block;
            padding: 15px 30px;
            font-size: 16px;
            color: #fff;
            background-color: #dc3545;
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

        .logout-button:hover {
            background-color: #c82333;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(220, 53, 69, 0.4);
        }

        .logout-button:active {
            background-color: #a71d2a;
            transform: translateY(0);
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        @media (max-width: 768px) {
            .dashboard-container {
                margin: 20px;
                padding: 20px;
            }

            .dashboard-title {
                font-size: 24px;
            }

            .dashboard-button, .logout-button {
                font-size: 14px;
                padding: 12px 25px;
                max-width: 250px;
            }
        }

        @media (max-width: 480px) {
            .dashboard-container {
                margin: 10px;
                padding: 15px;
            }

            .dashboard-title {
                font-size: 20px;
            }

            .dashboard-button, .logout-button {
                font-size: 12px;
                padding: 10px 20px;
                max-width: 200px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="dashboard-container">
            <h1 class="dashboard-title">Manager Dashboard</h1>
            <div class="button-container">
                <a href="RFQ_Management.aspx" class="dashboard-button">RFQ Management</a>
                <a href="Order_Placement.aspx" class="dashboard-button">Order Placement</a>
                <a href="Order_Tracking.aspx" class="dashboard-button">Order Tracking</a>
                <a href="Login.aspx" class="logout-button">Logout</a>
            </div>
        </div>
    </form>
</body>
</html>