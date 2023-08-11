<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Ecommerce._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <section class="row" aria-labelledby="aspnetTitle">
            <h1 class="mt-4 text-info">Welcome, <%: Session["username"] %>!</h1>
            
        </section>

        <asp:Panel runat="server" ID="adminTab">
            <div class="row mt-4">
                <div class="col-md-12">
                    <!-- Navs (Tabs) using Bootstrap -->
                    <ul class="nav nav-tabs" id="managementTabs" role="tablist">
                        <!-- Category Management Tab -->
                        <li class="nav-item" role="presentation">
                            <a class="nav-link active" id="category-tab" data-bs-toggle="tab" href="#categoryContent" role="tab" aria-controls="categoryContent" aria-selected="true">Category Management</a>
                        </li>
                        <!-- Product Management Tab -->
                        <li class="nav-item" role="presentation">
                            <a class="nav-link" id="product-tab" data-bs-toggle="tab" href="#productContent" role="tab" aria-controls="productContent" aria-selected="false">Product Management</a>
                        </li>
                        <!-- Order Management Tab -->
                        <li class="nav-item" role="presentation">
                            <a class="nav-link" id="order-tab" data-bs-toggle="tab" href="#orderContent" role="tab" aria-controls="orderContent" aria-selected="false">Order Management</a>
                        </li>
                        <!-- User Management Tab -->
                        <li class="nav-item" role="presentation">
                            <a class="nav-link" id="user-tab" data-bs-toggle="tab" href="#userContent" role="tab" aria-controls="userContent" aria-selected="false">User Management</a>
                        </li>
                    </ul>


                    <div class="tab-content" id="managementTabContent">


                        <!-- Category Management Tab Content -->
                        <div class="tab-pane fade show active mt-4" id="categoryContent" role="tabpanel" aria-labelledby="category-tab">
                            <h1 class="mt-3">Manage Category </h1>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <asp:GridView ID="gvCategories" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None"
                                                DataKeyNames="CategoryID"
                                                AutoGenerateSelectButton="True" OnSelectedIndexChanged="gvCategories_SelectedIndexChanged">
                                                <AlternatingRowStyle BackColor="White" />
                                                <EditRowStyle BackColor="#2461BF" />
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                <RowStyle BackColor="#EFF3FB" />
                                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                            </asp:GridView>
                                        </div>

                                        <div class="col-md-8 mt-4">

                                            <asp:SqlDataSource ID="sdsCategory" runat="server" ConnectionString="<%$ ConnectionStrings:ESConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Categories] WHERE ([CategoryID] = @CategoryID)" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Categories] WHERE [CategoryID] = @original_CategoryID AND [ShortName] = @original_ShortName AND [LongName] = @original_LongName" InsertCommand="INSERT INTO [Categories] ([CategoryID], [ShortName], [LongName]) VALUES (@CategoryID, @ShortName, @LongName)" UpdateCommand="UPDATE [Categories] SET [ShortName] = @ShortName, [LongName] = @LongName WHERE [CategoryID] = @original_CategoryID AND [ShortName] = @original_ShortName AND [LongName] = @original_LongName">
                                                <DeleteParameters>
                                                    <asp:Parameter Name="original_CategoryID" Type="String" />
                                                    <asp:Parameter Name="original_ShortName" Type="String" />
                                                    <asp:Parameter Name="original_LongName" Type="String" />
                                                </DeleteParameters>
                                                <InsertParameters>
                                                    <asp:Parameter Name="CategoryID" Type="String" />
                                                    <asp:Parameter Name="ShortName" Type="String" />
                                                    <asp:Parameter Name="LongName" Type="String" />
                                                </InsertParameters>
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="gvCategories" Name="CategoryID" PropertyName="SelectedValue" Type="String" />
                                                </SelectParameters>
                                                <UpdateParameters>
                                                    <asp:Parameter Name="ShortName" Type="String" />
                                                    <asp:Parameter Name="LongName" Type="String" />
                                                    <asp:Parameter Name="original_CategoryID" Type="String" />
                                                    <asp:Parameter Name="original_ShortName" Type="String" />
                                                    <asp:Parameter Name="original_LongName" Type="String" />
                                                </UpdateParameters>
                                            </asp:SqlDataSource>
                                            <asp:DetailsView ID="dvCategoryNew" runat="server" Height="50px" Width="100%" AutoGenerateRows="False" DataKeyNames="CategoryID" DataSourceID="sdsCategory" OnDataBound="dvCategoryNew_DataBound" OnItemDeleting="dvCategoryNew_ItemDeleting" CellPadding="4" ForeColor="#333333" GridLines="None"
                                                OnItemInserted="dvCategoryNew_ItemInserted"
                                                OnItemUpdated="dvCategoryNew_ItemUpdated" OnItemDeleted="dvCategoryNew_ItemDeleted">
                                                <AlternatingRowStyle BackColor="White" />
                                                <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                                                <EditRowStyle BackColor="#2461BF" />
                                                <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                                                <Fields>
                                                    <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" ReadOnly="True" SortExpression="CategoryID" />
                                                    <asp:BoundField DataField="ShortName" HeaderText="ShortName" SortExpression="ShortName" />
                                                    <asp:BoundField DataField="LongName" HeaderText="LongName" SortExpression="LongName" />
                                                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                                                </Fields>
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                <RowStyle BackColor="#EFF3FB" />
                                            </asp:DetailsView>
                                        </div>

                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>

                        <!-- Product Management Tab Content -->
                        <div class="tab-pane fade mt-4" id="productContent" role="tabpanel" aria-labelledby="product-tab">
                            <h1 class="mt-3">Manage Products </h1>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <asp:SqlDataSource ID="sdsProducts" runat="server" ConnectionString="<%$ ConnectionStrings:ESConnectionString %>" SelectCommand="SELECT [ProductID], [Name], [CategoryID], [UnitPrice] FROM [Products]"></asp:SqlDataSource>
                                            <asp:GridView ID="gvProducts" runat="server" AllowPaging="True" CellPadding="4" DataSourceID="sdsProducts" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="ProductID">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:CommandField ShowSelectButton="True" />
                                                    <asp:BoundField DataField="ProductID" HeaderText="ProductID" ReadOnly="True" SortExpression="ProductID" />
                                                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                                    <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID" />
                                                    <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" />
                                                </Columns>
                                                <EditRowStyle BackColor="#2461BF" />
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                <RowStyle BackColor="#EFF3FB" />
                                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                            </asp:GridView>
                                        </div>
                                        <div class="col-md-6">
                                            <asp:SqlDataSource ID="sdsAllProductDetails" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ESConnectionString %>" DeleteCommand="DELETE FROM [Products] WHERE [ProductID] = @original_ProductID AND [Name] = @original_Name AND [ShortDescription] = @original_ShortDescription AND [LongDescription] = @original_LongDescription AND [CategoryID] = @original_CategoryID AND (([ImageFile] = @original_ImageFile) OR ([ImageFile] IS NULL AND @original_ImageFile IS NULL)) AND [UnitPrice] = @original_UnitPrice AND [OnHand] = @original_OnHand" InsertCommand="INSERT INTO [Products] ([ProductID], [Name], [ShortDescription], [LongDescription], [CategoryID], [ImageFile], [UnitPrice], [OnHand]) VALUES (@ProductID, @Name, @ShortDescription, @LongDescription, @CategoryID, @ImageFile, @UnitPrice, @OnHand)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Products] WHERE ([ProductID] = @ProductID)" UpdateCommand="UPDATE [Products] SET [Name] = @Name, [ShortDescription] = @ShortDescription, [LongDescription] = @LongDescription, [CategoryID] = @CategoryID, [ImageFile] = @ImageFile, [UnitPrice] = @UnitPrice, [OnHand] = @OnHand WHERE [ProductID] = @original_ProductID AND [Name] = @original_Name AND [ShortDescription] = @original_ShortDescription AND [LongDescription] = @original_LongDescription AND [CategoryID] = @original_CategoryID AND (([ImageFile] = @original_ImageFile) OR ([ImageFile] IS NULL AND @original_ImageFile IS NULL)) AND [UnitPrice] = @original_UnitPrice AND [OnHand] = @original_OnHand">
                                                <DeleteParameters>
                                                    <asp:Parameter Name="original_ProductID" Type="String" />
                                                    <asp:Parameter Name="original_Name" Type="String" />
                                                    <asp:Parameter Name="original_ShortDescription" Type="String" />
                                                    <asp:Parameter Name="original_LongDescription" Type="String" />
                                                    <asp:Parameter Name="original_CategoryID" Type="String" />
                                                    <asp:Parameter Name="original_ImageFile" Type="String" />
                                                    <asp:Parameter Name="original_UnitPrice" Type="Decimal" />
                                                    <asp:Parameter Name="original_OnHand" Type="Int32" />
                                                </DeleteParameters>
                                                <InsertParameters>
                                                    <asp:Parameter Name="ProductID" Type="String" />
                                                    <asp:Parameter Name="Name" Type="String" />
                                                    <asp:Parameter Name="ShortDescription" Type="String" />
                                                    <asp:Parameter Name="LongDescription" Type="String" />
                                                    <asp:Parameter Name="CategoryID" Type="String" />
                                                    <asp:Parameter Name="ImageFile" Type="String" />
                                                    <asp:Parameter Name="UnitPrice" Type="Decimal" />
                                                    <asp:Parameter Name="OnHand" Type="Int32" />
                                                </InsertParameters>
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="gvProducts" Name="ProductID" PropertyName="SelectedValue" Type="String" />
                                                </SelectParameters>
                                                <UpdateParameters>
                                                    <asp:Parameter Name="Name" Type="String" />
                                                    <asp:Parameter Name="ShortDescription" Type="String" />
                                                    <asp:Parameter Name="LongDescription" Type="String" />
                                                    <asp:Parameter Name="CategoryID" Type="String" />
                                                    <asp:Parameter Name="ImageFile" Type="String" />
                                                    <asp:Parameter Name="UnitPrice" Type="Decimal" />
                                                    <asp:Parameter Name="OnHand" Type="Int32" />
                                                    <asp:Parameter Name="original_ProductID" Type="String" />
                                                    <asp:Parameter Name="original_Name" Type="String" />
                                                    <asp:Parameter Name="original_ShortDescription" Type="String" />
                                                    <asp:Parameter Name="original_LongDescription" Type="String" />
                                                    <asp:Parameter Name="original_CategoryID" Type="String" />
                                                    <asp:Parameter Name="original_ImageFile" Type="String" />
                                                    <asp:Parameter Name="original_UnitPrice" Type="Decimal" />
                                                    <asp:Parameter Name="original_OnHand" Type="Int32" />
                                                </UpdateParameters>
                                            </asp:SqlDataSource>
                                            <asp:DetailsView ID="dvProduct" runat="server" Height="50px" Width="100%" AllowPaging="True" AutoGenerateRows="False" CellPadding="4" DataKeyNames="ProductID" DataSourceID="sdsAllProductDetails" ForeColor="#333333" GridLines="None"
                                                nItemInserted="dvProduct_ItemInserted"
                                                OnItemUpdated="dvProduct_ItemUpdated" OnItemDeleted="dvProduct_ItemDeleted">
                                                <AlternatingRowStyle BackColor="White" />
                                                <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                                                <EditRowStyle BackColor="#2461BF" />
                                                <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                                                <Fields>
                                                    <asp:BoundField DataField="ProductID" HeaderText="ProductID" ReadOnly="True" SortExpression="ProductID" />
                                                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                                    <asp:BoundField DataField="ShortDescription" HeaderText="ShortDescription" SortExpression="ShortDescription" />
                                                    <asp:BoundField DataField="LongDescription" HeaderText="LongDescription" SortExpression="LongDescription" />
                                                    <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID" />
                                                    <asp:BoundField DataField="ImageFile" HeaderText="ImageFile" SortExpression="ImageFile" />
                                                    <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" />
                                                    <asp:BoundField DataField="OnHand" HeaderText="OnHand" SortExpression="OnHand" />
                                                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                                                </Fields>
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                <RowStyle BackColor="#EFF3FB" />
                                            </asp:DetailsView>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <!-- Order Management Tab Content -->
                        <div class="tab-pane fade mt-4" id="orderContent" role="tabpanel" aria-labelledby="user-tab">
                            <h1 class="mt-3">Manage Orders </h1>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:SqlDataSource ID="sdsOrders" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ESConnectionString %>" DeleteCommand="DELETE FROM [invoices] WHERE [invoiceNumber] = @original_invoiceNumber AND (([customer_name] = @original_customer_name) OR ([customer_name] IS NULL AND @original_customer_name IS NULL)) AND (([customer_email] = @original_customer_email) OR ([customer_email] IS NULL AND @original_customer_email IS NULL)) AND (([invoice_date] = @original_invoice_date) OR ([invoice_date] IS NULL AND @original_invoice_date IS NULL)) AND (([total_amount] = @original_total_amount) OR ([total_amount] IS NULL AND @original_total_amount IS NULL)) AND (([payment_status] = @original_payment_status) OR ([payment_status] IS NULL AND @original_payment_status IS NULL))" InsertCommand="INSERT INTO [invoices] ([invoiceNumber], [customer_name], [customer_email], [invoice_date], [total_amount], [payment_status]) VALUES (@invoiceNumber, @customer_name, @customer_email, @invoice_date, @total_amount, @payment_status)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [invoices]" UpdateCommand="UPDATE [invoices] SET [customer_name] = @customer_name, [customer_email] = @customer_email, [invoice_date] = @invoice_date, [total_amount] = @total_amount, [payment_status] = @payment_status WHERE [invoiceNumber] = @original_invoiceNumber AND (([customer_name] = @original_customer_name) OR ([customer_name] IS NULL AND @original_customer_name IS NULL)) AND (([customer_email] = @original_customer_email) OR ([customer_email] IS NULL AND @original_customer_email IS NULL)) AND (([invoice_date] = @original_invoice_date) OR ([invoice_date] IS NULL AND @original_invoice_date IS NULL)) AND (([total_amount] = @original_total_amount) OR ([total_amount] IS NULL AND @original_total_amount IS NULL)) AND (([payment_status] = @original_payment_status) OR ([payment_status] IS NULL AND @original_payment_status IS NULL))">
                                        <DeleteParameters>
                                            <asp:Parameter Name="original_invoiceNumber" Type="Int32" />
                                            <asp:Parameter Name="original_customer_name" Type="String" />
                                            <asp:Parameter Name="original_customer_email" Type="String" />
                                            <asp:Parameter DbType="Date" Name="original_invoice_date" />
                                            <asp:Parameter Name="original_total_amount" Type="Decimal" />
                                            <asp:Parameter Name="original_payment_status" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="invoiceNumber" Type="Int32" />
                                            <asp:Parameter Name="customer_name" Type="String" />
                                            <asp:Parameter Name="customer_email" Type="String" />
                                            <asp:Parameter DbType="Date" Name="invoice_date" />
                                            <asp:Parameter Name="total_amount" Type="Decimal" />
                                            <asp:Parameter Name="payment_status" Type="String" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="customer_name" Type="String" />
                                            <asp:Parameter Name="customer_email" Type="String" />
                                            <asp:Parameter DbType="Date" Name="invoice_date" />
                                            <asp:Parameter Name="total_amount" Type="Decimal" />
                                            <asp:Parameter Name="payment_status" Type="String" />
                                            <asp:Parameter Name="original_invoiceNumber" Type="Int32" />
                                            <asp:Parameter Name="original_customer_name" Type="String" />
                                            <asp:Parameter Name="original_customer_email" Type="String" />
                                            <asp:Parameter DbType="Date" Name="original_invoice_date" />
                                            <asp:Parameter Name="original_total_amount" Type="Decimal" />
                                            <asp:Parameter Name="original_payment_status" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <asp:GridView ID="gvOrders" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="invoiceNumber" DataSourceID="sdsOrders" CellPadding="4" ForeColor="#333333" GridLines="None">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                            <asp:BoundField DataField="invoiceNumber" HeaderText="Invoice Number" ReadOnly="True" SortExpression="invoiceNumber" />
                                            <asp:BoundField DataField="customer_name" HeaderText="Customer Name" SortExpression="customer_name" />
                                            <asp:BoundField DataField="customer_email" HeaderText="Customer Email" SortExpression="customer_email" />
                                            <asp:BoundField DataField="invoice_date" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Invoice Date" SortExpression="invoice_date" />
                                            <asp:BoundField DataField="total_amount" DataFormatString="{0:C}" HeaderText="Total Amount" SortExpression="total_amount" />
                                            <asp:BoundField DataField="payment_status" HeaderText="Payment Status" SortExpression="payment_status" />
                                        </Columns>
                                        <EditRowStyle BackColor="#2461BF" />
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                    </asp:GridView>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <!-- User Management Tab Content -->
                        <div class="tab-pane fade mt-4" id="userContent" role="tabpanel" aria-labelledby="user-tab">
                            <h1 class="mt-3">Manage Users </h1>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:SqlDataSource ID="sdsUsers" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ESConnectionString %>" DeleteCommand="DELETE FROM [Users] WHERE [id] = @original_id AND [username] = @original_username AND [password] = @original_password AND [userType] = @original_userType" InsertCommand="INSERT INTO [Users] ([username], [password], [userType]) VALUES (@username, @password, @userType)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Users]" UpdateCommand="UPDATE [Users] SET [username] = @username, [password] = @password, [userType] = @userType WHERE [id] = @original_id AND [username] = @original_username AND [password] = @original_password AND [userType] = @original_userType">
                                        <DeleteParameters>
                                            <asp:Parameter Name="original_id" Type="Int32" />
                                            <asp:Parameter Name="original_username" Type="String" />
                                            <asp:Parameter Name="original_password" Type="String" />
                                            <asp:Parameter Name="original_userType" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="username" Type="String" />
                                            <asp:Parameter Name="password" Type="String" />
                                            <asp:Parameter Name="userType" Type="String" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="username" Type="String" />
                                            <asp:Parameter Name="password" Type="String" />
                                            <asp:Parameter Name="userType" Type="String" />
                                            <asp:Parameter Name="original_id" Type="Int32" />
                                            <asp:Parameter Name="original_username" Type="String" />
                                            <asp:Parameter Name="original_password" Type="String" />
                                            <asp:Parameter Name="original_userType" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <asp:GridView ID="gvUsers" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="sdsUsers" ForeColor="#333333" GridLines="None">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                            <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                            <asp:BoundField DataField="username" HeaderText="Username" SortExpression="username" />
                                            <asp:BoundField DataField="password" HeaderText="Password" SortExpression="password" />
                                            <asp:BoundField DataField="userType" HeaderText="User Type" SortExpression="userType" />
                                        </Columns>
                                        <EditRowStyle BackColor="#2461BF" />
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                    </asp:GridView>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
            </div>

        </asp:Panel>
    </main>

</asp:Content>
