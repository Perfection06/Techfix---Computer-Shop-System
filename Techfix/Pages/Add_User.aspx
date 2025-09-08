<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_User.aspx.cs" Inherits="Techfix.Pages.Add_User" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Techfix Computer Shop - Add User</title>

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
            margin-top: 100px;
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

        h2 {
            margin-bottom: 2rem;
            color: #1E3A8A;
            font-size: 2rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        label {
            display: block;
            margin: 1rem 0 0.5rem;
            color: #111827;
            font-weight: 500;
            font-size: 0.9rem;
            text-align: left;
        }

        input[type="text"], input[type="email"], input[type="password"], select {
            width: 100%;
            padding: 0.75rem;
            margin-bottom: 0.5rem;
            border: 1px solid #D1D5DB;
            border-radius: 6px;
            font-size: 1rem;
            background-color: #F9FAFB;
            transition: all 0.3s ease;
        }

        input[type="text"]:focus, input[type="email"]:focus, input[type="password"]:focus, select:focus {
            outline: none;
            border-color: #22D3EE;
            box-shadow: 0 0 8px rgba(34, 211, 238, 0.5);
            background-color: #FFFFFF;
        }

        input.error, select.error {
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

        input[type="checkbox"] {
            margin-right: 0.5rem;
            accent-color: #22D3EE;
        }

        .checkbox-label {
            display: flex;
            align-items: center;
            margin: 1rem 0;
            color: #111827;
            font-size: 0.9rem;
        }

        button {
            display: inline-block;
            padding: 0.75rem 1.5rem;
            margin: 0.5rem;
            background-color: #22D3EE;
            color: #111827;
            border: none;
            border-radius: 6px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 2px 8px rgba(34, 211, 238, 0.3);
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

        .back-button {
            background-color: #6B7280;
        }

        .back-button:hover {
            background-color: #4B5563;
        }

        .back-button:active {
            background-color: #374151;
        }

        @media (max-width: 768px) {
            .container {
                margin: 20px;
                padding: 1.5rem;
            }

            h2 {
                font-size: 1.75rem;
            }

            button {
                width: 100%;
                font-size: 0.9rem;
            }

            .logo {
                max-width: 140px;
            }
        }
    </style>
    <script>
        
        function togglePassword() {
            var passwordField = document.getElementById('<%= passwordInput.ClientID %>');
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
            var fields = [
                { id: '<%= nameInput.ClientID %>', element: document.getElementById('<%= nameInput.ClientID %>') },
                { id: '<%= usernameInput.ClientID %>', element: document.getElementById('<%= usernameInput.ClientID %>') },
                { id: '<%= emailInput.ClientID %>', element: document.getElementById('<%= emailInput.ClientID %>') },
                { id: '<%= passwordInput.ClientID %>', element: document.getElementById('<%= passwordInput.ClientID %>') },
                { id: '<%= roleDropdown.ClientID %>', element: document.getElementById('<%= roleDropdown.ClientID %>') }
            ];
            var isValid = true;

            fields.forEach(function(field) {
                if (field.element.value.trim() === '') {
                    field.element.classList.add('error');
                    isValid = false;
                } else {
                    field.element.classList.remove('error');
                }
            });

            return isValid;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server" onsubmit="return validateForm();">
        <div class="container">
            <h2>Add User</h2>
            <label>Name:</label>
            <input type="text" id="nameInput" runat="server" placeholder="Enter full name" required />
            <label>Username:</label>
            <input type="text" id="usernameInput" runat="server" placeholder="Enter username" required />
            <label>Email:</label>
            <input type="email" id="emailInput" runat="server" placeholder="Enter email" required />
            <label>Password:</label>
            <div class="password-container">
                <input type="password" id="passwordInput" runat="server" placeholder="Enter password" required />
                <span id="toggleText" class="show-password" onclick="togglePassword()">Show</span>
            </div>
            <label>Role:</label>
            <select id="roleDropdown" runat="server" required>
                <option value="Admin">Admin</option>
                <option value="Manager">Manager</option>
            </select>
            <label class="checkbox-label">
                <input type="checkbox" id="isActiveCheckbox" runat="server" /> Active
            </label>
            <button type="button" runat="server" onserverclick="AddUser_Click">Add User</button>
            <button type="button" class="back-button" onclick="location.href='User_Management.aspx'">Back</button>
        </div>
    </form>
</body>
</html>