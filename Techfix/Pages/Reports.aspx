<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="Techfix.Pages.Reports" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Navigation</title>
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
            text-align: center;
            background-color: rgba(255, 255, 255, 0.95);
            padding: 40px 50px;
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(34, 211, 238, 0.3);
            width: 100%;
            max-width: 600px;
            margin: 300px auto; 
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
            margin-bottom: 30px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .buttons {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        button {
            font-size: 16px;
            padding: 12px 20px;
            margin: 10px 0;
            color: #fff;
            background-color: #22D3EE;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            font-weight: 600;
        }

        button:hover {
            background-color: #06B6D4;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(34, 211, 238, 0.5);
        }

        button:active {
            background-color: #0284C7;
            transform: translateY(0);
            box-shadow: 0 2px 6px rgba(34, 211, 238, 0.3);
        }

        button:focus {
            outline: none;
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
                width: 80%;
                padding: 30px;
                margin: 200px auto; 
            }

            h1 {
                font-size: 24px;
            }

            button {
                font-size: 14px;
                padding: 10px 18px;
            }

            .btn-back {
                font-size: 1rem;
                padding: 0.75rem;
            }
        }

        @media (max-width: 480px) {
            .dashboard-container {
                width: 90%;
                padding: 20px;
                margin: 150px auto; 
            }

            h1 {
                font-size: 20px;
            }

            button {
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
            <h1>Choose a Section</h1>
            <div class="buttons">
                <button type="button" onclick="location.href='View_RFQ.aspx';">View RFQs</button>
                <button type="button" onclick="location.href='View_Purchase.aspx';">View Purchases</button>
            </div>
            <a href="Admin_Dashboard.aspx" class="btn-back">Back</a>
        </div>
    </form>
</body>
</html>