<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Order.aspx.cs" Inherits="Ecommerce.Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <header class="jumbotron"><%-- image set in site.css --%></header>
    <div class="row">
        <%-- row 1 --%>
        <div class="col-sm-6">
            <%-- product drop down and info column --%>
            <div class="form-group">
                <label class="col-sm-6">Please select a product:</label>
                <div class="col-sm-6">
                    <asp:DropDownList ID="ddlProducts" runat="server" AutoPostBack="True"
                        DataSourceID="SqlDataSource1" DataTextField="Name"
                        DataValueField="ProductID" CssClass="form-control">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                        ConnectionString='<%$ ConnectionStrings:ESConnectionString %>'
                        SelectCommand="SELECT * FROM [Products] ORDER BY [Name]"></asp:SqlDataSource>
                </div>
            </div>
            </div>
        </div>
            <div class="row mt-4">
                <div class="col-sm-6">
                    <div class="form-group">
                        <div class="col-sm-12">
                            <h4>
                                <asp:Label ID="lblNameText" runat="server" Text="Name : " Font-Bold="True"></asp:Label>
                                <asp:Label ID="lblName" runat="server"></asp:Label>
                            </h4>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-12">
                            <asp:Label ID="lblShortDescriptionTxt" runat="server" Text="Short Description : " Font-Bold="True"></asp:Label>
                            <asp:Label ID="lblShortDescription" runat="server"></asp:Label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-12">
                            <asp:Label ID="lblLongDescriptionTxt" runat="server" Text="Long Description : " Font-Bold="True"></asp:Label>
                            <asp:Label ID="lblLongDescription" runat="server"></asp:Label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-12">
                            <asp:Label ID="lblUnitPriceTxt" runat="server" Text="Unit Price : " Font-Bold="True"></asp:Label>
                            <asp:Label ID="lblUnitPrice" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <%-- product image column --%>
                    <asp:Image ID="imgProduct" runat="server" />
                   
                </div>


            </div>

    <div class="row">
        <%-- row 2 --%>
        <div class="col-sm-12">
            <div class="form-group">
                <label class="col-sm-2">Quantity:</label>
                <div class="col-sm-3">
                    <asp:TextBox ID="txtQuantity" runat="server"
                        CssClass="form-control"></asp:TextBox>
                </div>

                <div class="col-sm-7">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger"
                        runat="server" ControlToValidate="txtQuantity" Display="Dynamic"
                        ErrorMessage="Quantity is a required field."></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" CssClass="text-danger"
                        ControlToValidate="txtQuantity" Display="Dynamic"
                        ErrorMessage="Quantity must range from 1 to 500."
                        MaximumValue="500" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                </div>
            </div>

            <div class="form-group mt-4">
                <div class="col-sm-12">
                    <asp:Button ID="btnAdd" runat="server" Text="Add to Cart" OnClick="btnAdd_Click" CssClass="btn btn-success"></asp:Button>

                    <%--<asp:Button ID="btnCart" runat="server" Text="Go to Cart"
                        PostBackUrl="~/Cart.aspx" CausesValidation="False" CssClass="btn btn-secondary" />--%>
                    <asp:LinkButton runat="server" ID="btnCart1" CssClass="btn btn-primary" CausesValidation="False" PostBackUrl="~/Cart.aspx" Text="Go to Cart">
                        <span class="glyphicon glyphicon-shopping-cart"></span>Go to Cart
                        <span class="badge" id="spanCartSize" runat="server"></span>
                    </asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
    <%-- end of row 2 --%>
</asp:Content>
