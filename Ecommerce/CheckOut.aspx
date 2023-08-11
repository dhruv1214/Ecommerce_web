<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="CheckOut.aspx.cs" Inherits="Ecommerce.CheckOut" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

        <div class="container mt-4">
            <h1>Checkout</h1>
            <div class="mt-4">
                <asp:ValidationSummary ID="valSummary" runat="server" ValidationGroup="checkoutValidationGroup" ForeColor="Red" CssClass="mb-3" />
                <asp:Label ID="lblmsg" runat="server" />


                <h3>Contact Information</h3>
                <div>
                    <table class="table">
                        <tr>
                            <td>
                                <label for="textEmail">Email Address:</label>
                            </td>
                            <td>
                                <asp:TextBox ID="textEmail" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="textEmail" ErrorMessage="Email Address is required!" ForeColor="Red" ValidationGroup="checkoutValidationGroup" Display="Dynamic" CssClass="text-danger" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="textEmail" ErrorMessage="Invalid Email Address!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red" ValidationGroup="checkoutValidationGroup" Display="Dynamic" CssClass="text-danger"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="textReEmail">Email Re-entry:</label>
                            </td>
                            <td>
                                <asp:TextBox ID="textReEmail" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="textReEmail" ErrorMessage="Email Re-entry is required!" ForeColor="Red" ValidationGroup="checkoutValidationGroup" Display="Dynamic" CssClass="text-danger" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="textEmail" ControlToValidate="textReEmail" ErrorMessage="Email and Re-entry Email must match!" ForeColor="Red" ValidationGroup="checkoutValidationGroup" Display="Dynamic" CssClass="text-danger"></asp:CompareValidator>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <label>First Name:</label>
                            </td>
                            <td>
                                <asp:TextBox ID="textFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="First Name is Required!" ControlToValidate="textFirstName" ForeColor="Red" ValidationGroup="checkoutValidationGroup" SetFocusOnError="True" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Last Name:</label>
                            </td>
                            <td>
                                <asp:TextBox ID="textLastName" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Last Name is required!" ControlToValidate="textLastName" SetFocusOnError="True" ForeColor="Red" ValidationGroup="checkoutValidationGroup" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Phone Number:</label>
                            </td>
                            <td>
                                <asp:TextBox ID="textPhoneNumber" runat="server" CssClass="form-control" Placeholder="XXX-XXX-XXXX"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Phone Number is required!" ControlToValidate="textPhoneNumber" ForeColor="Red" ValidationGroup="checkoutValidationGroup" SetFocusOnError="True" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid Phone Number!" ControlToValidate="textPhoneNumber" SetFocusOnError="True" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" ForeColor="Red" ValidationGroup="checkoutValidationGroup" Display="Dynamic" CssClass="text-danger"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="mt-4">
                <h3>Billing Address</h3>
                <div>
                    <table class="table">
                        <tr>
                            <td>
                                <label>Address:</label>
                            </td>
                            <td>
                                <asp:TextBox ID="textAddress" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Address is required!" ControlToValidate="textAddress" ForeColor="Red" ValidationGroup="checkoutValidationGroup" SetFocusOnError="True" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>City:</label>
                            </td>
                            <td>
                                <asp:TextBox ID="textCity" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="City is required!" ControlToValidate="textCity" SetFocusOnError="True" ForeColor="Red" ValidationGroup="checkoutValidationGroup" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>State:</label>
                            </td>
                            <td>
                                <asp:DropDownList ID="selState" runat="server"  CssClass="form-control">
                                    <asp:ListItem Value="">Select State</asp:ListItem>
                                    <asp:ListItem Value="1">Ontario</asp:ListItem>
                                    <asp:ListItem Value="2">British Columbia</asp:ListItem>
                                    <asp:ListItem Value="3">Quebec</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ErrorMessage="State is required!" ControlToValidate="selState" ValidationGroup="checkoutValidationGroup" CssClass="text-danger" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Zip Code : </label>
                            </td>
                            <td>
                                <asp:TextBox ID="textZipCode" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Zip Code is required!" ValidationGroup="checkoutValidationGroup" ControlToValidate="textZipCode" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>

                        </tr>
                    </table>
                </div>
            </div>
            <div class="mt-4">
                <h3>Optional Data</h3>
                <label>Please let me know about:</label>
                <table class="table">
                    <tr>
                        <td>
                            <asp:CheckBox ID="chkNewProduct" runat="server" CssClass="form-check-input" />
                            <label class="form-check-label">New Products</label>
                        </td>
                        <td>
                            <asp:CheckBox ID="chkNewEditions" runat="server" CssClass="form-check-input" />
                            <label class="form-check-label">New Editions</label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox ID="chkSpecialOffers" runat="server" CssClass="form-check-input" />
                            <label class="form-check-label">Special Offers</label>
                        </td>
                        <td>
                            <asp:CheckBox ID="chkLocalEvents" runat="server" CssClass="form-check-input" />
                            <label class="form-check-label">Local Events</label>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="mt-4">
               
                <div>
                    <label>Please contact me via : </label>
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="Facebook" CssClass="form-check-input">Facebook&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                        <asp:ListItem CssClass="form-check-input">WhatsApp&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                        <asp:ListItem CssClass="form-check-input">Text Message&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                        <asp:ListItem CssClass="form-check-input">Email</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>
            <div class="mt-4">
                <asp:Button ID="ButtonCheckout" runat="server" Text="Checkout" CssClass="btn btn-primary" Font-Bold="True" ValidationGroup="checkoutValidationGroup" CausesValidation="true" OnClick="ButtonCheckout_Click" />
                <asp:Button ID="BtnCancel" runat="server" Text="Cancel Order" CssClass="btn btn-secondary" Font-Bold="True" OnClick="BtnCancel_Click" />
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Products.aspx" CssClass="btn btn-link">Continue shopping</asp:HyperLink>
            </div>
        </div>
    
   </asp:Content>
