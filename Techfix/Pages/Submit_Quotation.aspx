<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Submit_Quotation.aspx.cs" Inherits="Techfix.Pages.Submit_Quotation" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Submit Quotation</title>
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

        h2 {
            font-size: 28px;
            color: #1E3A8A;
            margin-bottom: 25px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .form-group {
            margin-bottom: 25px;
            text-align: left;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-size: 16px;
            font-weight: 600;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 12px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 6px;
            box-sizing: border-box;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
            background-color: #fff;
        }

        textarea {
            resize: vertical;
            min-height: 100px;
            max-height: 200px;
        }

        input[type="text"]:focus,
        textarea:focus {
            border-color: #22D3EE;
            box-shadow: 0 0 5px rgba(34, 211, 238, 0.5);
            outline: none;
        }

        .error-message {
            color: #dc3545;
            font-size: 13px;
            margin-top: 8px;
            padding: 5px;
            background-color: rgba(220, 53, 69, 0.1);
            border-radius: 4px;
            display: none;
            text-align: left;
        }

        .submit-btn {
            display: inline-block;
            padding: 12px 30px;
            font-size: 16px;
            color: #fff;
            background-color: #28a745;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            font-weight: 600;
            width: 100%;
        }

        .submit-btn:hover {
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
                padding: 20px;
            }

            h2 {
                font-size: 24px;
            }

            label {
                font-size: 14px;
            }

            input[type="text"],
            textarea {
                padding: 10px;
                font-size: 13px;
            }

            .submit-btn {
                font-size: 14px;
                padding: 10px 20px;
            }

            .btn-back {
                font-size: 1rem;
                padding: 0.75rem;
            }

            .error-message {
                font-size: 12px;
            }
        }

        @media (max-width: 480px) {
            .dashboard-container {
                margin: 10px;
                padding: 15px;
            }

            h2 {
                font-size: 20px;
            }

            label {
                font-size: 13px;
            }

            input[type="text"],
            textarea {
                padding: 8px;
                font-size: 12px;
            }

            .submit-btn {
                font-size: 12px;
                padding: 8px 15px;
            }

            .btn-back {
                font-size: 0.9rem;
                padding: 0.6rem;
            }

            .error-message {
                font-size: 11px;
            }
        }
    </style>
    <script>
        function validateForm() {
            var isValid = true;

            var amount = document.getElementById("txtQuotationAmount").value.trim();
            var schedule = document.getElementById("txtDeliverySchedule").value.trim();
            var details = document.getElementById("txtQuotationDetails").value.trim();

            if (amount === "" || isNaN(amount) || parseFloat(amount) <= 0) {
                document.getElementById("amountError").style.display = "block";
                isValid = false;
            } else {
                document.getElementById("amountError").style.display = "none";
            }

            if (schedule === "") {
                document.getElementById("scheduleError").style.display = "block";
                isValid = false;
            } else {
                document.getElementById("scheduleError").style.display = "none";
            }

            if (details === "") {
                document.getElementById("detailsError").style.display = "block";
                isValid = false;
            } else {
                document.getElementById("detailsError").style.display = "none";
            }

            return isValid;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server" onsubmit="return validateForm();">
        <div class="dashboard-container">
            <h2>Submit Quotation</h2>
            <div class="form-group">
                <label for="txtQuotationAmount">Quotation Amount:</label>
                <input type="text" id="txtQuotationAmount" runat="server" placeholder="Enter quotation amount" />
                <div id="amountError" class="error-message">Please enter a valid amount.</div>
            </div>
            <div class="form-group">
                <label for="txtDeliverySchedule">Delivery Schedule:</label>
                <input type="text" id="txtDeliverySchedule" runat="server" placeholder="Enter delivery schedule" />
                <div id="scheduleError" class="error-message">Please enter a delivery schedule.</div>
            </div>
            <div class="form-group">
                <label for="txtQuotationDetails">Quotation Details:</label>
                <textarea id="txtQuotationDetails" runat="server" placeholder="Enter quotation details"></textarea>
                <div id="detailsError" class="error-message">Please enter quotation details.</div>
            </div>
            <div>
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="submit-btn" />
            </div>
            <a href="Quotations.aspx" class="btn-back">Back to Quotations</a>
        </div>
    </form>
</body>
</html>