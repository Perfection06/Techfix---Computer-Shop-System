<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit_Delivery.aspx.cs" Inherits="Techfix.Pages.Edit_Delivery" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Delivery</title>
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
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
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
            margin-bottom: 20px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        td {
            padding: 12px 15px;
            font-size: 1em;
            vertical-align: middle;
        }

        td:first-child {
            text-align: right;
            font-weight: 600;
            color: #333;
            width: 40%;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 6px;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
        }

        .form-control:focus {
            border-color: #22D3EE;
            outline: none;
            box-shadow: 0 0 5px rgba(34, 211, 238, 0.3);
        }

        .form-control:disabled {
            background-color: #f9f9f9;
            cursor: not-allowed;
        }

        .save-btn {
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            background-color: #28a745;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            font-weight: 600;
            width: 100%;
            margin-top: 20px;
        }

        .save-btn:hover {
            background-color: #218838;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(40, 167, 69, 0.4);
        }

        .error-message {
            color: #dc3545;
            font-size: 0.9em;
            margin-top: 5px;
            display: block;
            text-align: left;
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
                padding: 15px;
            }

            h1 {
                font-size: 24px;
            }

            td {
                padding: 8px;
                font-size: 0.9rem;
            }

            .form-control {
                font-size: 12px;
                padding: 8px;
            }

            .save-btn {
                font-size: 14px;
                padding: 8px 15px;
            }

            .btn-back {
                font-size: 1rem;
                padding: 0.75rem;
            }
        }

        @media (max-width: 480px) {
            .dashboard-container {
                margin: 10px;
                padding: 10px;
            }

            h1 {
                font-size: 20px;
            }

            td {
                padding: 6px;
                font-size: 0.8rem;
            }

            .form-control {
                font-size: 10px;
                padding: 6px;
            }

            .save-btn {
                font-size: 12px;
                padding: 6px 12px;
            }

            .btn-back {
                font-size: 0.9rem;
                padding: 0.6rem;
            }
        }
    </style>
    <script type="text/javascript">
        function toggleActualDeliveryDate() {
            var status = document.getElementById('<%= ddlStatus.ClientID %>').value;
            var txtActualDeliveryDate = document.getElementById('<%= txtActualDeliveryDate.ClientID %>');
            var validator = document.getElementById('<%= rfvActualDeliveryDate.ClientID %>');

            if (status === 'Delivered') {
                txtActualDeliveryDate.disabled = false;
                validator.enabled = true;
                if (!txtActualDeliveryDate.value) {
                    var today = new Date();
                    var year = today.getFullYear();
                    var month = ('0' + (today.getMonth() + 1)).slice(-2);
                    var day = ('0' + today.getDate()).slice(-2);
                    txtActualDeliveryDate.value = year + '-' + month + '-' + day;
                }
            } else {
                txtActualDeliveryDate.disabled = true;
                txtActualDeliveryDate.value = '';
                validator.enabled = false;
            }
        }

        window.onload = toggleActualDeliveryDate;
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="dashboard-container">
            <h1>Edit Delivery</h1>
            <table>
                <tr>
                    <td>Delivery ID:</td>
                    <td><asp:Label ID="lblDeliveryID" runat="server" CssClass="form-control"></asp:Label></td>
                </tr>
                <tr>
                    <td>Product Description:</td>
                    <td><asp:Label ID="lblProductDescription" runat="server" CssClass="form-control"></asp:Label></td>
                </tr>
                <tr>
                    <td>Estimated Delivery Date:</td>
                    <td><asp:Label ID="lblEstimatedDeliveryDate" runat="server" CssClass="form-control"></asp:Label></td>
                </tr>
                <tr>
                    <td>Status:</td>
                    <td>
                        <asp:DropDownList ID="ddlStatus" runat="server" onchange="toggleActualDeliveryDate();" CssClass="form-control">
                            <asp:ListItem Text="Pending" Value="Pending" />
                            <asp:ListItem Text="In Process" Value="In Process" />
                            <asp:ListItem Text="Shipped" Value="Shipped" />
                            <asp:ListItem Text="On The Way" Value="On The Way" />
                            <asp:ListItem Text="Delivered" Value="Delivered" />
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>Actual Delivery Date:</td>
                    <td>
                        <asp:TextBox ID="txtActualDeliveryDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvActualDeliveryDate" runat="server" 
                            ControlToValidate="txtActualDeliveryDate" 
                            ErrorMessage="Actual Delivery Date is required when status is Delivered."
                            CssClass="error-message" 
                            Display="Dynamic" 
                            Enabled="false">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="save-btn" />
                    </td>
                </tr>
            </table>
            <a href="Delivery.aspx" class="btn-back">Back to Delivery</a>
        </div>
    </form>
</body>
</html>