<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Create_RFQ.aspx.cs" Inherits="Techfix.Pages.Create_RFQ" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create RFQ</title>
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

        h1 {
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
        input[type="number"],
        input[type="date"],
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
        input[type="number"]:focus,
        input[type="date"]:focus,
        textarea:focus {
            border-color: #22D3EE;
            box-shadow: 0 0 5px rgba(34, 211, 238, 0.5);
            outline: none;
        }

        .submit-btn {
            display: block;
            padding: 12px 30px;
            font-size: 16px;
            color: #fff;
            background-color: #22D3EE;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            font-weight: 600;
            width: 100%;
            text-align: center;
        }

        .submit-btn:hover {
            background-color: #06B6D4;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(34, 211, 238, 0.4);
        }

        .submit-btn:active {
            background-color: #0891B2;
            transform: translateY(0);
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        .btn-back {
            display: block;
            margin: 20px auto;
            padding: 12px 30px;
            font-size: 16px;
            color: #fff;
            background-color: #343A40;
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

        .btn-back:hover {
            background-color: #23272b;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(52, 58, 64, 0.3);
        }

        .btn-back:active {
            background-color: #1c2526;
            transform: translateY(0);
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        .message {
            margin-top: 20px;
            padding: 12px;
            text-align: center;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 500;
        }

        .message.success {
            background-color: rgba(40, 167, 69, 0.1);
            color: #28a745;
            border: 1px solid #28a745;
        }

        .message.error {
            background-color: rgba(220, 53, 69, 0.1);
            color: #dc3545;
            border: 1px solid #dc3545;
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

        @media (max-width: 768px) {
            .container {
                margin: 20px;
                padding: 20px;
            }

            h1 {
                font-size: 24px;
            }

            label {
                font-size: 14px;
            }

            input[type="text"],
            input[type="number"],
            input[type="date"],
            textarea {
                padding: 10px;
                font-size: 13px;
            }

            .submit-btn, .btn-back {
                font-size: 14px;
                padding: 10px 20px;
            }

            .message {
                font-size: 13px;
            }

            .error-message {
                font-size: 12px;
            }
        }

        @media (max-width: 480px) {
            .container {
                margin: 10px;
                padding: 15px;
            }

            h1 {
                font-size: 20px;
            }

            label {
                font-size: 13px;
            }

            input[type="text"],
            input[type="number"],
            input[type="date"],
            textarea {
                padding: 8px;
                font-size: 12px;
            }

            .submit-btn, .btn-back {
                font-size: 12px;
                padding: 8px 15px;
            }

            .message {
                font-size: 12px;
            }

            .error-message {
                font-size: 11px;
            }
        }
    </style>
    <script>
        function validateForm() {
            var isValid = true;

            var productDescription = document.getElementById('<%= txtProductDescription.ClientID %>').value.trim();
            var quantity = document.getElementById('<%= txtQuantity.ClientID %>').value.trim();
            var specifications = document.getElementById('<%= txtSpecifications.ClientID %>').value.trim();
            var deliveryRequirements = document.getElementById('<%= txtDeliveryRequirements.ClientID %>').value.trim();
            var pricingFormat = document.getElementById('<%= txtPricingFormat.ClientID %>').value.trim();
            var paymentTerms = document.getElementById('<%= txtPaymentTerms.ClientID %>').value.trim();
            var validityPeriod = document.getElementById('<%= txtValidityPeriod.ClientID %>').value.trim();

            if (productDescription === "") {
                document.getElementById("productDescriptionError").style.display = "block";
                isValid = false;
            } else {
                document.getElementById("productDescriptionError").style.display = "none";
            }

            if (quantity === "" || isNaN(quantity) || parseInt(quantity) <= 0) {
                document.getElementById("quantityError").style.display = "block";
                isValid = false;
            } else {
                document.getElementById("quantityError").style.display = "none";
            }

            if (specifications === "") {
                document.getElementById("specificationsError").style.display = "block";
                isValid = false;
            } else {
                document.getElementById("specificationsError").style.display = "none";
            }

            if (deliveryRequirements === "") {
                document.getElementById("deliveryRequirementsError").style.display = "block";
                isValid = false;
            } else {
                document.getElementById("deliveryRequirementsError").style.display = "none";
            }

            if (pricingFormat === "") {
                document.getElementById("pricingFormatError").style.display = "block";
                isValid = false;
            } else {
                document.getElementById("pricingFormatError").style.display = "none";
            }

            if (paymentTerms === "") {
                document.getElementById("paymentTermsError").style.display = "block";
                isValid = false;
            } else {
                document.getElementById("paymentTermsError").style.display = "none";
            }

            if (validityPeriod === "") {
                document.getElementById("validityPeriodError").style.display = "block";
                isValid = false;
            } else {
                document.getElementById("validityPeriodError").style.display = "none";
            }

            return isValid;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server" onsubmit="return validateForm();">
        <div class="container">
            <h1>Create RFQ</h1>
            <div class="form-group">
                <label for="txtProductDescription">Product Description:</label>
                <asp:TextBox ID="txtProductDescription" runat="server" placeholder="Enter product description"></asp:TextBox>
                <div id="productDescriptionError" class="error-message">Please enter a product description.</div>
            </div>
            <div class="form-group">
                <label for="txtQuantity">Quantity:</label>
                <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number" placeholder="Enter quantity"></asp:TextBox>
                <div id="quantityError" class="error-message">Please enter a valid quantity.</div>
            </div>
            <div class="form-group">
                <label for="txtSpecifications">Specifications:</label>
                <asp:TextBox ID="txtSpecifications" runat="server" TextMode="MultiLine" placeholder="Enter specifications"></asp:TextBox>
                <div id="specificationsError" class="error-message">Please enter specifications.</div>
            </div>
            <div class="form-group">
                <label for="txtDeliveryRequirements">Delivery Requirements:</label>
                <asp:TextBox ID="txtDeliveryRequirements" runat="server" placeholder="Enter delivery requirements"></asp:TextBox>
                <div id="deliveryRequirementsError" class="error-message">Please enter delivery requirements.</div>
            </div>
            <div class="form-group">
                <label for="txtPricingFormat">Pricing Format:</label>
                <asp:TextBox ID="txtPricingFormat" runat="server" placeholder="Enter pricing format"></asp:TextBox>
                <div id="pricingFormatError" class="error-message">Please enter a pricing format.</div>
            </div>
            <div class="form-group">
                <label for="txtPaymentTerms">Payment Terms:</label>
                <asp:TextBox ID="txtPaymentTerms" runat="server" placeholder="Enter payment terms"></asp:TextBox>
                <div id="paymentTermsError" class="error-message">Please enter payment terms.</div>
            </div>
            <div class="form-group">
                <label for="txtValidityPeriod">Validity Period:</label>
                <asp:TextBox ID="txtValidityPeriod" runat="server" TextMode="Date"></asp:TextBox>
                <div id="validityPeriodError" class="error-message">Please select a validity period.</div>
            </div>
            <div class="form-group">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit RFQ" OnClick="btnSubmit_Click" CssClass="submit-btn" />
            </div>
            <asp:Label ID="lblMessage" runat="server" CssClass="message" Visible="False"></asp:Label>
            <a href="RFQ_Management.aspx" class="btn-back">Back</a>
        </div>
    </form>
</body>
</html>