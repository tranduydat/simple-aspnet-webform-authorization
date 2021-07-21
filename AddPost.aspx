<%@ Page Title="Add new post" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddPost.aspx.cs" Inherits="DemoAuthorization.AddPost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://unpkg.com/feather-icons"></script>
    <style>
        .btn-outline-dark:hover {
            color: #fff;
            background-color: #e2e2e2 !important;
            border-color: #212529;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <header>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container">
                <a class="navbar-brand" href="#"><span style="font-weight: 500">Dat Tran</span></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-end" id="navbarNavAltMarkup">
                    <div style="padding-right: 10px">
                        Hi <b>
                            <asp:Literal runat="server" Text="user!" ID="ltlWelcomeMsg"></asp:Literal></b>
                    </div>
                    <div class="navbar-nav">
                        <a class="nav-link active" aria-current="page" href="Dashboard.aspx">Dashboard</a>
                        <a class="nav-link" href="Logout.aspx" tabindex="-1">Logout</a>
                    </div>
                </div>
            </div>
        </nav>
    </header>
    <main>
        <div class="container my-4">
            <form id="mainForm" runat="server">
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label">Title</label>
                    <asp:TextBox runat="server" CssClass="form-control" TextMode="SingleLine" ID="txbPostTitle"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlTextarea1" class="form-label">Content</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txbContent" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div>
                    <asp:Button runat="server" ID="btnAdd" CssClass="btn btn-dark" Text="Add" OnClick="btnAdd_OnClick" />
                </div>
            </form>
        </div>
    </main>
    <footer>
        <script>
            feather.replace()
        </script>
    </footer>
</asp:Content>
