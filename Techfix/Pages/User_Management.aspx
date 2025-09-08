<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_Management.aspx.cs" Inherits="Techfix.Pages.User_Managment" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Techfix Computer Shop - User Management</title>
    
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet" />
    
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet" />
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
            width: 100%;
            max-width: 600px;
            margin: 50px auto;
            padding: 2rem;
            margin-top: 300px;
            background-color: rgba(255, 255, 255, 0.95);
            box-shadow: 0 4px 20px rgba(34, 211, 238, 0.3);
            border-radius: 12px;
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

        .logo {
            max-width: 180px;
            margin: 0 auto 1.5rem;
            display: block;
            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));
        }

        h1 {
            margin-bottom: 2rem;
            color: #1E3A8A;
            font-size: 2.25rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .btn {
            display: inline-block;
            width: 45%;
            padding: 1rem;
            margin: 0.5rem;
            background-color: #22D3EE;
            color: #111827;
            border: none;
            border-radius: 8px;
            font-size: 1.1rem;
            font-weight: 600;
            text-decoration: none;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 2px 8px rgba(34, 211, 238, 0.3);
        }

        .btn:hover {
            background-color: #06B6D4;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(34, 211, 238, 0.5);
        }

        .btn:active {
            background-color: #0284C7;
            transform: translateY(0);
            box-shadow: 0 2px 6px rgba(34, 211, 238, 0.3);
        }

        @media (max-width: 768px) {
            .container {
                margin: 20px;
                padding: 1.5rem;
            }

            h1 {
                font-size: 1.75rem;
            }

            .btn {
                width: 100%;
                font-size: 1rem;
            }

            .logo {
                max-width: 140px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>User Management</h1>
            <a href="Add_User.aspx" class="btn">Add User</a>
            <a href="Update_User.aspx" class="btn">Update User</a>
            <a href="Admin_Dashboard.aspx" class="btn">Back</a>
        </div>
    </form>
</body>
</html>
