<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="DemoAuthorization.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://unpkg.com/feather-icons"></script>
    <style>
        .btn-outline-dark:hover {
            color: #fff;
            background-color: #e2e2e2!important;
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
                        Hi <b><asp:Literal runat="server" Text="user!" ID="ltlWelcomeMsg"></asp:Literal></b>
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
        <div class="container mt-5">
            <div class="btn-group" role="group" aria-label="Basic example">
                <button type="button" class="btn btn-outline-dark"><a href="AddPost.aspx" title="Add post" style="text-decoration: none; color: black;"><i data-feather="plus" style="width: 1.2em; line-height: 20px"></i>Add</a></button>
                <button type="button" class="btn btn-outline-dark"><a href="UpdatePost.aspx" title="Update post" style="text-decoration: none; color: black;"><i data-feather="edit-2" style="width: 1em; line-height: 20px"></i>Edit</a></button>
                <button type="button" class="btn btn-outline-dark"><a href="DeletePost.aspx" title="Delete post" style="text-decoration: none; color: black;"><i data-feather="trash" style="width: 1em; line-height: 20px"></i>Delete</a></button>
            </div>
        </div>
        <div class="container my-4">
            <% foreach (var post in listOfPosts)
                { %>
            <div class="card mb-3">
                <div class="card-body">
                    <h5 class="card-title"><%= post.PostName %></h5>
                    <p class="card-text"><%= post.Content %></p>
                    <p class="card-text"><small class="text-muted"><%= post.CreatedAt.ToString("d") %></small></p>
                </div>
            </div>
            <% } %>
        </div>
    </main>
    <footer>
        <script>
            feather.replace()
        </script>
    </footer>
</asp:Content>
