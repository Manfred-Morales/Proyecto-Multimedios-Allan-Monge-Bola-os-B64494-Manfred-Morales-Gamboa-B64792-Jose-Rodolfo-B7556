<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FrmUserRegistration.aspx.cs" Inherits="SuperMercadoOnline.FrmUserRegistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <section>
        <article class="form">
            <div class="form__header">
                <h1 class="form__title"><span class="form__span">User Register</span> </h1>
            </div>

            <asp:Label class="form__label" Text="Email:" runat="server" />
            <asp:TextBox class="form__input" ID="txtEmail" autocomplete="off" placeholder="Write the user email" runat="server" Required="true" />

            <asp:Label class="form__label" Text="Password:" runat="server" />
            <asp:TextBox TextMode="Password" class="form__input" ID="txtPassword" autocomplete="off" placeholder="Enter the user password" runat="server" Required="true" />

            <asp:Label class="form__label" Text="Full Name:" runat="server" />
            <asp:TextBox class="form__input" ID="txtName" autocomplete="off" placeholder="Enter the user's full name" runat="server" Required="true" />

            
            <asp:Label ID="lblTipo" class="form__label" Text="User type:" runat="server" />
            <asp:DropDownList ID="DropDownListTipe" runat="server" class="form__input">
                <%--<asp:ListItem>Administrador</asp:ListItem>--%>
                <asp:ListItem>Cliente</asp:ListItem>
            </asp:DropDownList>

            <div class="form__btnlist">
                <asp:Button class="form__submit" Text="Register" ID="btnRegister" runat="server" OnClick="btnRegister_Click"/>
                <asp:Button class="form__submit" Text="Update" ID="btnUpdate" runat="server" OnClick="btnUpdate_Click"/>
                <asp:Button class="form__submit" Text="Delete" ID="btnDelete" runat="server" OnClick="btnDelete_Click"/>
                <asp:Button class="form__submit" Text="Consult" ID="btnConsult" runat="server" OnClick="btnConsult_Click" />

                <asp:Label class="form__label" ID="lbNotificaciones" Text="" runat="server" />
            </div>

        </article>
    </section>
</asp:Content>
