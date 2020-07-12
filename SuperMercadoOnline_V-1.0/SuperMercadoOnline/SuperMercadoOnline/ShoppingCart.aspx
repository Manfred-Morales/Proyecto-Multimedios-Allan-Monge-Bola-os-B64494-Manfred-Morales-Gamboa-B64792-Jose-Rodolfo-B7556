<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="SuperMercadoOnline.ShoppingCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <main class="main">

        <section class="section section__grid">
            <asp:GridView ID="dgtShoppingCart" CssClass="gridview" runat="server" AutoGenerateColumns="false"
                OnRowDeleting="dgtShoppingCart_RowDeleting" OnRowEditing="dgtShoppingCart_RowEditing">
                <Columns>
                    <asp:BoundField HeaderStyle-CssClass="gridview__header" ItemStyle-CssClass="gridview__item" DataField="name" HeaderText="Product Name" Visible="true" />
                    <asp:BoundField HeaderStyle-CssClass="gridview__header" ItemStyle-CssClass="gridview__item" DataField="price" HeaderText="Product Price" Visible="true" />


                    <asp:CommandField HeaderStyle-CssClass="gridview__headerQ" ItemStyle-CssClass="gridview__commandQ" HeaderImageUrl="www/img/less_icon.png" DeleteImageUrl="www/img/less_icon.png"
                        InsertVisible="false" ShowCancelButton="false" ButtonType="Image" ShowDeleteButton="true" />

                    <asp:BoundField HeaderStyle-CssClass="gridview__headerQ" ItemStyle-CssClass="gridview__commandQ" DataField="quantity" HeaderText="Quantity" Visible="true" />

                    <asp:CommandField HeaderStyle-CssClass="gridview__headerQ" ItemStyle-CssClass="gridview__commandQ" InsertVisible="false" ShowCancelButton="false" ButtonType="Image"
                        ShowEditButton="true" HeaderImageUrl="www/img/plus_icon.png" EditImageUrl="www/img/plus_icon.png" />

                    <asp:BoundField HeaderStyle-CssClass="gridview__header" ItemStyle-CssClass="gridview__item" DataField="subtotal" HeaderText="Subtotal" Visible="true" />
                </Columns>
            </asp:GridView>
        </section>
        <section class="section">
            <asp:Button ID="btnBuy" CssClass="section__button" Text="Buy!" runat="server" OnClick="btnBuy_Click"/>
            <asp:Button ID="btnCatalog" CssClass="section__button" Text="Products" runat="server" OnClick="btnCatalog_Click"/>
        </section>
    </main>
</asp:Content>
