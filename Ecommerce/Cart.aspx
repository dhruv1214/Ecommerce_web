<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Cart.aspx.cs" Inherits="Ecommerce.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <h2>Cart</h2>
        <div class="row">
            <%-- row 1 --%>
            <div class="col-sm-6">

                <%-- cart display column --%>

                <asp:ListBox ID="lstCart" runat="server" CssClass="form-control" Height="180px" Width="100%"></asp:ListBox>
                <div class="form-group mt-4">
                    <%-- message label --%>
                    <asp:Label ID="lblMessage" runat="server" EnableViewState="False"
                        CssClass="text-danger col-sm-12" Font-Bold="True"></asp:Label>
                </div>
                <div class="form-group mt-4">
                    <asp:Label ID="lblTotalPrice" runat="server" CssClass="text-success" Font-Bold="True"></asp:Label>
                </div>
                <div class="mt-4">
                    <asp:Button ID="btnContinue" runat="server"
                        PostBackUrl="~/Order.aspx" Text="Continue Shopping" CausesValidation="False" CssClass="btn btn-success ml-2" Font-Bold="True" />
                    <asp:Button ID="btnCheckOut" runat="server" Text="Check Out"
                        OnClick="btnCheckOut_Click" CssClass="btn btn-primary" Font-Bold="True" />
                </div>
            </div>
            <div class="col-sm-6">

                <asp:Button ID="btnRemove" runat="server"
                    Text="Remove Item" OnClick="btnRemove_Click" CssClass="btn btn-danger mt-3" Font-Bold="True" />
                <asp:Button ID="btnEmpty" runat="server"
                    Text="Empty Cart" OnClick="btnEmpty_Click" CssClass="btn btn-danger mt-3" Font-Bold="True" />
            </div>

        </div>
        <%-- end of row 1 --%>
        <div class="row">
            <%-- row 2 --%>
            <div class="col-sm-12">
            </div>
        </div>
        <%-- end of row 2 --%>
    </div>
</asp:Content>
