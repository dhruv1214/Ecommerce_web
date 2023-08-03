<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Ecommerce.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">

        <section class="text-center text-lg-start">
            <style>
                .cascading-right {
                    margin-right: -50px;
                }

                @media (max-width: 991.98px) {
                    .cascading-right {
                        margin-right: 0;
                    }
                }

                .validation-error {
                    margin-left: -415px;
                }
            </style>



            <!-- Jumbotron -->
            <div class="container py-4">
                <div class="row g-0 align-items-center">
                    <div class="col-lg-6 mb-5 mb-lg-0">
                        <div class="card cascading-right" style="background: hsla(0, 0%, 100%, 0.55); backdrop-filter: blur(30px);">
                            <div class="card-body p-5 shadow-5 text-center">
                                <h2 class="fw-bold mb-5">Register</h2>
                                <asp:Label ID="lblRegistrationMessage" runat="server" CssClass="alert alert-success mt-3" Visible="false" Text="Registration Successful"></asp:Label>
                                <asp:Label ID="lblErrorMessage" runat="server" CssClass="text-danger" Visible="false"></asp:Label>

                                <div class="form-outline">
                                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control mt-3" placeholder="Username" />
                                    <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername" ErrorMessage="Username is required." ForeColor="Red" CssClass="validation-error" />
                                </div>


                                <!-- Password input -->
                                <div class="form-outline">
                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control mt-3" TextMode="Password" placeholder="Password" />
                                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required." ForeColor="Red" CssClass="validation-error" />

                                </div>
                                <div class="form-outline">
                                    <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control mt-3" TextMode="Password" placeholder="Confirm Password" />
                                    <asp:CompareValidator ID="cvPasswordMatch" runat="server" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" ErrorMessage="Passwords do not match." ForeColor="Red" CssClass="validation-error"/>
                                </div>
                                <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-primary mt-3" OnClick="btnRegister_Click" />

                                <!-- Register buttons -->


                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6 mb-5 mb-lg-0">
                        <img src="https://mdbootstrap.com/img/new/ecommerce/vertical/004.jpg" class="w-100 rounded-4 shadow-4"
                            alt="" />
                    </div>
                </div>
            </div>
            <!-- Jumbotron -->
        </section>
        <h2>Registration</h2>





    </div>
</asp:Content>
