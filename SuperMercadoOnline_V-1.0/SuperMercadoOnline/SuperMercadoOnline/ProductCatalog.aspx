<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ProductCatalog.aspx.cs" Inherits="SuperMercadoOnline.ProductCatalog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <main class="main">
        <section class="section">
            <asp:DataList ID="productList" runat="server" DataKeyField="code"
                OnItemCommand="productList_ItemCommand" DataSourceID="SqlDataSource1">
                <ItemTemplate>

                    <article class="article">
                        <img src='<%#Eval("productImage")%>' class="article__img" alt="Product Image" />

                        <aside class="article__productInfo">

                            <div class="article__row">
                                <asp:Label Text="Product Name:" runat="server" />
                                <asp:Label ID="lblProductName" Text='<%#Eval("productName")%>' runat="server" />
                            </div>

                            <div class="article__row">
                                <asp:Label Text="Product Descripcion:" runat="server" />
                                <br />
                                <asp:Label ID="lblProductDescription" CssClass="article__description" Text='<%#Eval("productDescription")%>' runat="server" />
                            </div>

                            <div class="article__row">
                                <asp:Label Text="Product Price: $" runat="server" />
                                <asp:Label ID="lblProductPrice" Text='<%#Eval("prize")%>' runat="server" />
                            </div>

                            <div class="article__row">
                                <asp:Label Text="Quantity:" runat="server" />
                                <asp:TextBox Text="1" ID="txtProductQuantity" CssClass="article__number" min="1" max='<%#Eval("stock")%>'
                                    TextMode="Number" runat="server" />
                            </div>

                            <asp:Button ID="btnMarket" CssClass="article__icon" CommandName="btnMarket"
                                CommandArgument="<%#((DataListItem) Container).ItemIndex%>" runat="server" />

                            <asp:Label ID="lblCode" Text='<%#Eval("code")%>' runat="server" Visible="false" />

                        </aside>
                    </article>
                </ItemTemplate>
            </asp:DataList>

            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:marketsaveusConnectionString2 %>' SelectCommand="SELECT [code], [productName], [productDescription], [prize], [stock], [productImage] FROM [TblProduct] WHERE ([stock] > @stock)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="0" Name="stock" Type="Int32"></asp:Parameter>
                </SelectParameters>
            </asp:SqlDataSource>
        </section>
    </main>
</asp:Content>


