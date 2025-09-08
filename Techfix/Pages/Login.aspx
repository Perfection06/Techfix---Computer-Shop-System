<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Techfix.Pages.Login" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Techfix Computer Shop - Login</title>
    
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet" />
    
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet" />
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #111827, #1E3A8A);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
            padding: 20px;
            position: relative;
            overflow: hidden;
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
            z-index: 0;
        }

        .login-container {
            background-color: rgba(255, 255, 255, 0.95);
            max-width: 400px;
            width: 100%;
            padding: 2.5rem;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(34, 211, 238, 0.3);
            position: relative;
            z-index: 1;
            animation: slideIn 0.5s ease-out;
        }

        @keyframes slideIn {
            from {
                transform: translateY(50px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        h2 {
            color: #1E3A8A;
            text-align: center;
            margin-bottom: 1.5rem;
            font-size: 2rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        label {
            display: block;
            color: #111827;
            font-weight: 500;
            margin-bottom: 0.5rem;
            font-size: 0.9rem;
        }

        .asp-textbox {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #D1D5DB;
            border-radius: 8px;
            font-size: 1rem;
            background-color: #F9FAFB;
            transition: all 0.3s ease;
        }

        .asp-textbox:focus {
            outline: none;
            border-color: #22D3EE;
            box-shadow: 0 0 8px rgba(34, 211, 238, 0.5);
            background-color: #FFFFFF;
        }

        .asp-textbox.error {
            border-color: #EF4444;
            box-shadow: 0 0 8px rgba(239, 68, 68, 0.3);
        }

        .password-container {
            position: relative;
        }

        .show-password {
            position: absolute;
            right: 12px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #22D3EE;
            font-size: 0.85rem;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .show-password:hover {
            color: #1E3A8A;
        }

        .asp-button {
            width: 100%;
            padding: 0.85rem;
            background-color: #22D3EE;
            color: #111827;
            font-weight: 600;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 2px 8px rgba(34, 211, 238, 0.4);
        }

        .asp-button:hover {
            background-color: #06B6D4;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(34, 211, 238, 0.6);
        }

        .error {
            color: #EF4444;
            font-size: 0.85rem;
            text-align: center;
            margin-top: 1rem;
            font-weight: 500;
        }

        .logo {
            display: block;
            margin: 0 auto 1.5rem;
            max-width: 180px;
            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));
        }

        .footer {
            text-align: center;
            margin-top: 1.5rem;
        }

        .footer a {
            color: #22D3EE;
            text-decoration: none;
            font-size: 0.9rem;
            margin: 0 10px;
            transition: color 0.3s ease;
        }

        .footer a:hover {
            color: #06B6D4;
            text-decoration: underline;
        }

        @media (max-width: 640px) {
            .login-container {
                padding: 1.5rem;
            }

            h2 {
                font-size: 1.5rem;
            }

            .logo {
                max-width: 140px;
            }
        }
    </style>
    <script>
       
        function togglePassword() {
            var passwordField = document.getElementById('<%= txtPassword.ClientID %>');
            var toggleText = document.getElementById('toggleText');
            if (passwordField.type === 'password') {
                passwordField.type = 'text';
                toggleText.textContent = 'Hide';
            } else {
                passwordField.type = 'password';
                toggleText.textContent = 'Show';
            }
        }

        
        function validateForm() {
            var username = document.getElementById('<%= txtUsername.ClientID %>');
            var password = document.getElementById('<%= txtPassword.ClientID %>');
            var isValid = true;

            if (username.value.trim() === '') {
                username.classList.add('error');
                isValid = false;
            } else {
                username.classList.remove('error');
            }

            if (password.value.trim() === '') {
                password.classList.add('error');
                isValid = false;
            } else {
                password.classList.remove('error');
            }

            return isValid;
        }
    </script>
</head>
<body>
    <form id="loginForm" runat="server" onsubmit="return validateForm();">
        <div class="login-container">
            <h2>Techfix Login</h2>
            <div class="form-group">
                <label for="txtUsername">Username</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="asp-textbox" placeholder="Enter your username"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtPassword">Password</label>
                <div class="password-container">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="asp-textbox" placeholder="Enter your password"></asp:TextBox>
                    <span id="toggleText" class="show-password" onclick="togglePassword()">Show</span>
                </div>
            </div>
            <div class="form-group">
                <asp:Button ID="btnLogin" runat="server" CssClass="asp-button" Text="Login" OnClick="btnLogin_Click" />
            </div>
            <asp:Label ID="lblErrorMessage" runat="server" CssClass="error"></asp:Label>
            <div class="footer">
                <a href="ForgotPassword.aspx">Forgot Password?</a>
                <a href="Register.aspx">Create Account</a>
            </div>
        </div>
    </form>
</body>
</html>