<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FrmConsultarProductos.aspx.cs" Inherits="SuperMercadoOnline.FrmConsultarProductos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <main class="main">
        <section class="section">

        

            <asp:GridView runat="server" ID="dtgListProduct"
                DataKeyNames="code" CssClass="gridview"
                AutoGenerateColumns="false" DataSourceID="sqlDatos">

                <Columns>
                    <asp:HyperLinkField DataNavigateUrlFields="code"
                        HeaderStyle-CssClass="gridview__header"
                        DataNavigateUrlFormatString="FrmProductRegistration.aspx?code={0}"
                        DataTextField="code" HeaderText="Code" ItemStyle-CssClass="gridview__item" />
                    <asp:BoundField DataField="productName" HeaderText="Product Name"
                        HeaderStyle-CssClass="gridview__header" ItemStyle-CssClass="gridview__item" />
                    <asp:BoundField DataField="prize" HeaderText="Prize"
                        HeaderStyle-CssClass="gridview__header" ItemStyle-CssClass="gridview__item" />
                    <asp:BoundField DataField="stock" HeaderText="Stock"
                        HeaderStyle-CssClass="gridview__header" ItemStyle-CssClass="gridview__item" />

                </Columns>

            </asp:GridView>
            <asp:SqlDataSource ID="sqlDatos" runat="server" ConnectionString='<%$ ConnectionStrings:marketsaveusConnectionString %>' SelectCommand="SELECT [code], [productName], [prize], [stock] FROM [TblProduct]" />

        </section>
    </main>


</asp:Content>
