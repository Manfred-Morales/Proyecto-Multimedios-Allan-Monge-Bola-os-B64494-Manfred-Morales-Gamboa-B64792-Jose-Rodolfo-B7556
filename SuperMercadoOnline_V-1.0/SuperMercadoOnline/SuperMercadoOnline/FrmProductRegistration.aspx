<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FrmProductRegistration.aspx.cs" Inherits="SuperMercadoOnline.FrmRegistroProductos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section>

        <article class="form">
            <div class="form__header">
                <h1 class="form__title">P<span class="form__span">roducto Register</span> </h1>
            </div>

            <asp:Label class="form__label" Text="Code:" runat="server" />
            <asp:TextBox class="form__input" ID="txtCode" autocomplete="off" placeholder="Write the product code" runat="server" Required="true" />

            <asp:Label class="form__label" Text="Product Name:" runat="server" />
            <asp:TextBox class="form__input" ID="txtname" autocomplete="off" placeholder="Enter the product name" runat="server" Required="true" />

            <asp:Label class="form__label" Text="Price:" runat="server" />
            <asp:TextBox class="form__input" ID="txtprize" TextMode="Number" min="1" autocomplete="off" placeholder="Enter the product price" runat="server" Required="true" />

            <asp:Label class="form__label" Text="Stock:" runat="server" />
            <asp:TextBox class="form__input" ID="txtInventory" TextMode="Number" min="1" autocomplete="off" placeholder="Enter the inventory quantity" runat="server" Required="true" />

            <asp:Label class="form__label" Text="Description:" runat="server" />
            <asp:TextBox class="form__textarea" ID="txtDescripcion" autocomplete="off" placeholder="Enter the description" runat="server" TextMode="MultiLine" Required="true" />

            <asp:Label class="form__label" Text="Image Product:" ID="lblImage" runat="server" />
            <asp:FileUpload class="form__image" FileName="Imagen" runat="server" ID="txtImage" Required="true"></asp:FileUpload>

            <div class="form__btnlist">
                <asp:Button class="form__submit" Text="Register" ID="btnRegister" runat="server" OnClick="btnRegister_Click" />
                <asp:Button class="form__submit" Text="Update" ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" />
                <asp:Button class="form__submit" Text="Delete" ID="btnDelete" runat="server" OnClick="btnDelete_Click" />
                <asp:Button class="form__submit" Text="Consult" ID="btnConsult" runat="server" OnClick="btnConsult_Click" />

                <asp:Label class="form__label" ID="lbNotificaciones" Text="" runat="server" />
            </div>

        </article>
    </section>



</asp:Content>
