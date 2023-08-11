<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Ecommerce.Product1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container mt-4">
        <h2>Product List</h2>
        <div class="row">
            <div class="col-md-4">
                <asp:Label ID="Label1" runat="server" Text="Select Category :" CssClass="control-label"></asp:Label>
            </div>
            <div class="col-md-4">
                <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control" AutoPostBack="True" DataSourceID="sdsCategory" DataTextField="ShortName" DataValueField="CategoryID"></asp:DropDownList>

                <asp:SqlDataSource ID="sdsCategory" runat="server" ConnectionString="<%$ ConnectionStrings:ESConnectionString %>" SelectCommand="SELECT [CategoryID], [ShortName] FROM [Categories]"></asp:SqlDataSource>
            </div>
        </div>
        <div class="row mt-4">
            <asp:SqlDataSource ID="sdsProducts" runat="server" ConnectionString="<%$ ConnectionStrings:ESConnectionString %>" SelectCommand="SELECT * FROM [Products] WHERE ([CategoryID] = @CategoryID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlCategory" Name="CategoryID" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:ListView ID="lvProducts" runat="server" DataSourceID="sdsProducts">
                <LayoutTemplate>
                    <div class="row">
                        <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                    </div>
                </LayoutTemplate>
                <ItemTemplate>
                    <div class="col-md-3 mb-4">
                        <div class="card text-center custom-card">
                            <div class="card-body">
                                <div class="text-center">
                                    <img class="card-img-top" src='<%# GetImageURL(Eval("ImageFile")) %>' alt='<%# Eval("Name") %>' style="max-width: 200px; max-height: 200px;" />
                                </div>
                                <h5 class="card-title"><%# Eval("Name") %></h5>
                                <p class="card-text"><%# Eval("ShortDescription") %></p>
                                <p class="card-text">Price: $<%# Eval("UnitPrice", "{0:N2}") %></p>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>


            </asp:ListView>

        </div>
    </div>
</asp:Content>
