<%@ Page Title="Login in" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DemoAuthorization.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        html,
        body {
            height: 100%;
        }

        body {
            display: flex;
            align-items: center;
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #f5f5f5;
        }

        .form-signin {
            width: 100%;
            max-width: 330px;
            padding: 15px;
            margin: auto;
        }

            .form-signin .checkbox {
                font-weight: 400;
            }

            .form-signin .form-floating:focus-within {
                z-index: 2;
            }

            .form-signin input[type="email"] {
                margin-bottom: -1px;
                border-bottom-right-radius: 0;
                border-bottom-left-radius: 0;
            }

            .form-signin input[type="password"] {
                margin-bottom: 10px;
                border-top-left-radius: 0;
                border-top-right-radius: 0;
            }

        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <body>
        <main class="form-signin text-center">
            <form id="mainForm" runat="server">
                <img class="mb-4" src="Content/Images/logo.png" alt="" width="100">
                <h1 class="h3 mb-3 fw-normal">Please sign in</h1>
                <div class="form-floating">
                    <asp:TextBox runat="server" TextMode="SingleLine" CssClass="form-control mb-2" ID="txbUsername"></asp:TextBox>
                    <label for="floatingInput">User name</label>
                </div>
                <div class="form-floating">
                    <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="txbPassword"></asp:TextBox>
                    <label for="floatingPassword">Password</label>
                </div>
                <asp:Button runat="server" ID="btnLogin" CssClass="w-100 btn btn-lg btn-dark mt-2" Text="Sign in" OnClick="btnLogin_OnClick"/>
                <p class="mt-5 mb-3 text-muted">&copy; 2021 Dat Duy Tran</p>
            </form>
        </main>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</asp:Content>
