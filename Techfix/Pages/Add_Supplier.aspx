<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_Supplier.aspx.cs" Inherits="Techfix.Pages.Add_Supplier" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Add Supplier</title>
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

        input[type="text"],
        input[type="email"],
        input[type="password"],
        textarea {
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
        input[type="email"]:focus,
        input[type="password"]:focus,
        textarea:focus {
            outline: none;
            border-color: #22D3EE;
            box-shadow: 0 0 8px rgba(34, 211, 238, 0.5);
        }

        input[type="checkbox"] {
            margin-right: 10px;
        }

        .btn-add {
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

        .btn-add:hover {
            background-color: #06B6D4;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(34, 211, 238, 0.5);
        }

        .btn-add:active {
            background-color: #0284C7;
            transform: translateY(0);
            box-shadow: 0 2px 6px rgba(34, 211, 238, 0.3);
        }

        .btn-back {
            width: 100%;
            padding: 1rem;
            display: inline-block;
            padding: 1rem;
            background-color: #343A40;
            border: none;
            color: white;
            font-size: 1.1rem;
            font-weight: 600;
            border-radius: 8px;
            cursor: pointer;
            text-decoration: none;
            transition: all 0.3s ease;
            box-shadow: 0 2px 8px rgba(34, 211, 238, 0.3);
        }

        .btn-back:hover {
            background-color: #23272b;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(34, 211, 238, 0.5);
        }

        .btn-back:active {
            background-color: #1c252a;
            transform: translateY(0);
            box-shadow: 0 2px 6px rgba(34, 211, 238, 0.3);
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
            input[type="email"],
            input[type="password"],
            textarea {
                font-size: 0.9rem;
                padding: 0.6rem;
            }

            .btn-add,
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
            input[type="email"],
            input[type="password"],
            textarea {
                font-size: 0.8rem;
                padding: 0.5rem;
            }

            .btn-add,
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
            <h2>Add Supplier</h2>
            <div class="form-group">
                <label>Name:</label>
                <asp:TextBox ID="txtName" runat="server" />
            </div>
            <div class="form-group">
                <label>Username:</label>
                <asp:TextBox ID="txtUsername" runat="server" />
            </div>
            <div class="form-group">
                <label>Password:</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
            </div>
            <div class="form-group">
                <label>Email:</label>
                <asp:TextBox ID="txtEmail" runat="server" />
            </div>
            <div class="form-group">
                <label>Phone:</label>
                <asp:TextBox ID="txtPhone" runat="server" />
            </div>
            <div class="form-group">
                <label>Address:</label>
                <asp:TextBox ID="txtAddress" runat="server" />
            </div>
            <div class="form-group">
                <label>Business Name:</label>
                <asp:TextBox ID="txtBusinessName" runat="server" />
            </div>
            <div class="form-group">
                <label>
                    <asp:CheckBox ID="chkIsActive" runat="server" /> Active
                </label>
            </div>
            <asp:Button ID="btnAddSupplier" runat="server" Text="Add Supplier" OnClick="btnAddSupplier_Click" CssClass="btn-add" />
            <button type="button" class="btn-back" onclick="location.href='Supplier_Management.aspx'">Back</button>
        </div>
    </form>
</body>
</html>