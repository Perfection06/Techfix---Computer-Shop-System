<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit_Supplier.aspx.cs" Inherits="Techfix.Pages.Edit_Supplier" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Edit Supplier</title>
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

        .form-group {
            text-align: left;
            margin-bottom: 1.5rem;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            color: #1E3A8A;
            font-weight: 500;
        }

        #lblMessage {
            display: block;
            margin-bottom: 1rem;
            color: #dc3545; 
            font-weight: 500;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"] {
            width: 100%;
            padding: 0.75rem;
            margin-bottom: 0.5rem;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            font-size: 1rem;
            background-color: #f9fafb;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="password"]:focus,
        input[type="email"]:focus {
            outline: none;
            border-color: #22D3EE;
            box-shadow: 0 0 8px rgba(34, 211, 238, 0.5);
        }

        .btn-update {
            width: 100%;
            padding: 1rem;
            background-color: #22D3EE;
            border: none;
            color: #111827;
            font-size: 1.1rem;
            font-weight: 600;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 2px 8px rgba(34, 211, 238, 0.3);
            margin-bottom: 1rem;
        }

        .btn-update:hover {
            background-color: #06B6D4;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(34, 211, 238, 0.5);
        }

        .btn-update:active {
            background-color: #0284C7;
            transform: translateY(0);
            box-shadow: 0 2px 6px rgba(34, 211, 238, 0.3);
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

        .btn-back:active {
            background-color: #1c252a;
            transform: translateY(0);
            box-shadow: 0 2px 6px rgba(52, 58, 64, 0.3);
        }

        @media (max-width: 768px) {
            .dashboard-container {
                margin: 20px;
                padding: 1.5rem;
            }

            h2 {
                font-size: 1.75rem;
            }

            input[type="text"],
            input[type="password"],
            input[type="email"] {
                font-size: 0.9rem;
                padding: 0.6rem;
            }

            .btn-update,
            .btn-back {
                font-size: 1rem;
                padding: 0.75rem;
            }
        }

        @media (max-width: 480px) {
            .dashboard-container {
                width: 95%;
            }

            input[type="text"],
            input[type="password"],
            input[type="email"] {
                font-size: 0.8rem;
                padding: 0.5rem;
            }

            .btn-update,
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
            <h2>Edit Supplier</h2>
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
            <div class="form-group">
                <label for="txtName">Name</label>
                <asp:TextBox ID="txtName" runat="server" />
            </div>
            <div class="form-group">
                <label for="txtUsername">Username</label>
                <asp:TextBox ID="txtUsername" runat="server" />
            </div>
            <div class="form-group">
                <label for="txtPassword">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
            </div>
            <div class="form-group">
                <label for="txtEmail">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" />
            </div>
            <div class="form-group">
                <label for="txtPhone">Phone</label>
                <asp:TextBox ID="txtPhone" runat="server" />
            </div>
            <div class="form-group">
                <label for="txtAddress">Address</label>
                <asp:TextBox ID="txtAddress" runat="server" />
            </div>
            <div class="form-group">
                <label for="txtBusinessName">Business Name</label>
                <asp:TextBox ID="txtBusinessName" runat="server" />
            </div>
            <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" CssClass="btn-update" />
            <a href="Update_Supplier.aspx" class="btn-back">Back</a>
        </div>
    </form>
</body>
</html>