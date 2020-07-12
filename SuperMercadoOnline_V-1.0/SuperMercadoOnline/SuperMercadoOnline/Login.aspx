<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SuperMercadoOnline.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Login </title>
    <link href="www/css/main.css" rel="stylesheet" />
</head>
<body class="body_login">

    <form id="form1" runat="server">
        <section class="login_box">

        <article class="login">

            <img src="www/img/logo4.jpg" class="login__logo" alt="logo Image" />
            <h1 class="login__title">Login Here</h1>
            
            <asp:Label class="login__data" Text="Username" runat="server" />
            <asp:TextBox class="login__text" ID="txtUser" type="text" placeholder="Enter Username" AutoComplete="off" runat="server" />  
            <asp:Label class="login__data" Text="Password" runat="server" />
            <asp:TextBox class="login__text" ID="txtPassword" TextMode="Password" placeholder="Enter Password" runat="server" />  

            <asp:Button class="login__button" Text="Log In" runat="server" ID="bntLogin" OnClick="bntLogin_Click" />

            <a class="login__vinculos" href="#">Forgot your password?</a><br />
            <a class="login__vinculos" href="FRMUserRegistration.aspx">Don't have An account?</a>

        </article>

    </section>
    </form>     
    
</body>
</html>
