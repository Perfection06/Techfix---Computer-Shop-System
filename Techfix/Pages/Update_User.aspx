<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Update_User.aspx.cs" Inherits="Techfix.Pages.Update_User" %>

<!DOCTYPE html>


<html>
<head runat="server">
    <title>Update/Delete User</title>
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
        width: 100%;
        max-width: 1500px;
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

    .logo {
        max-width: 180px;
        margin: 0 auto 1.5rem;
        display: block;
        filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));
    }

    h2 {
        margin-bottom: 2rem;
        color: #1E3A8A;
        font-size: 2.25rem;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 1px;
    }

    .gridview {
        width: 100%;
        min-width: 800px; 
        border-collapse: collapse;
        margin-top: 20px;
        table-layout: fixed;
    }

    .gridview th, .gridview td {
        padding: 12px;
        text-align: left;
        border-bottom: 1px solid #ddd;
        word-wrap: break-word;
        max-width: 200px;
    }

    .gridview th {
        background-color: #f2f2f2;
        font-weight: 600;
    }

    .gridview tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    .gridview tr:hover {
        background-color: #e9ecef;
    }

    .gridview .btn {
        padding: 1rem;
        margin: 0.5rem 0;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        font-size: 1.1rem;
        font-weight: 600;
        transition: all 0.3s ease;
        box-shadow: 0 2px 8px rgba(34, 211, 238, 0.3);
        width: 48%; 
        display: inline-block;
    }

    .gridview .btn-edit {
        background-color: #22D3EE;
        color: #111827;
    }

    .gridview .btn-edit:hover {
        background-color: #06B6D4;
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(34, 211, 238, 0.5);
    }

    .gridview .btn-delete {
        background-color: #DC3545;
        color: white;
    }

    .gridview .btn-delete:hover {
        background-color: #c82333;
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(34, 211, 238, 0.5);
    }

    .gridview .btn-activate {
        background-color: #007BFF;
        color: white;
    }

    .gridview .btn-activate:hover {
        background-color: #0056b3;
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(34, 211, 238, 0.5);
    }

    .gridview .btn-block {
        background-color: #6C757D;
        color: white;
    }

    .gridview .btn-block:hover {
        background-color: #5a6268;
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(34, 211, 238, 0.5);
    }

    .btn-back {
        display: block;
        margin: 20px auto;
        padding: 1rem;
        background-color: #343A40;
        color: white;
        text-align: center;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        text-decoration: none;
        font-size: 1.1rem;
        font-weight: 600;
        transition: all 0.3s ease;
        box-shadow: 0 2px 8px rgba(34, 211, 238, 0.3);
    }

    .btn-back:hover {
        background-color: #23272b;
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(34, 211, 238, 0.5);
    }

    @media (max-width: 768px) {
        .dashboard-container {
            margin: 20px;
            padding: 1.5rem;
        }

        h2 {
            font-size: 1.75rem;
        }

        .gridview th, .gridview td {
            padding: 8px;
            font-size: 14px;
        }

        .gridview .btn {
            width: 100%; 
            font-size: 1rem;
            padding: 0.75rem;
        }

        .logo {
            max-width: 140px;
        }
    }

    @media (max-width: 480px) {
        .gridview {
            min-width: 100%;
        }

        .gridview th, .gridview td {
            padding: 6px;
            font-size: 12px;
        }

        .gridview .btn {
            font-size: 0.9rem;
            padding: 0.5rem;
        }

        .btn-back {
            font-size: 1rem;
            padding: 0.75rem;
        }
    }
</style>
    
</head>

<body>
    <form id="form1" runat="server">
        <div class="dashboard-container">
            <h2>Update Users</h2>
            <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" CssClass="gridview" OnRowCommand="gvUsers_RowCommand" OnRowDeleting="gvUsers_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="Username" HeaderText="Username" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Role" HeaderText="Role" />
                    <asp:BoundField DataField="IsActive" HeaderText="Is Active" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnEdit" runat="server" CommandName="Edit" Text="Edit" CommandArgument='<%# Eval("UserID") %>' CssClass="btn btn-edit" />
                            <asp:Button ID="btnDelete" runat="server" CommandName="Delete" Text="Delete" CommandArgument='<%# Eval("UserID") %>' CssClass="btn btn-delete" />
                            <asp:Button ID="btnActivate" runat="server" CommandName="Activate" Text="Activate" CommandArgument='<%# Eval("UserID") %>' CssClass="btn btn-activate" Enabled='<%# !(bool)Eval("IsActive") %>' />
                            <asp:Button ID="btnBlock" runat="server" CommandName="Block" Text="Block" CommandArgument='<%# Eval("UserID") %>' CssClass="btn btn-block" Enabled='<%# (bool)Eval("IsActive") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <a href="User_Management.aspx" class="btn-back">Back</a>
        </div>
    </form>
</body>
</html>