using DataAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity.Core.Common.CommandTrees.ExpressionBuilder;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using System.ComponentModel.DataAnnotations;

namespace SuperMercadoOnline
{
    public partial class ShoppingCart : System.Web.UI.Page
    {
        private List<TblProduct> shoppingCart;
        private marketsaveusEntities entities;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!HttpContext.Current.User.Identity.IsAuthenticated)
                Response.Redirect("Login.aspx");

            this.shoppingCart = (List<TblProduct>)Session["productsList"];
            if (this.shoppingCart != null)
                this.fillGrid();
            else
                Response.Redirect("ProductCatalog.aspx");
        }

        private void fillGrid()
        {
            try
            {
                DataTable table = new DataTable();
                decimal subtotal = 0;

                table.Columns.Add("code", typeof(string));
                table.Columns.Add("name", typeof(string));
                table.Columns.Add("price", typeof(decimal));
                table.Columns.Add("quantity", typeof(int));
                table.Columns.Add("subtotal", typeof(string));

                for (int i = 0; i < this.shoppingCart.Count; i++)
                {
                    DataRow row = table.NewRow();
                    row["code"] = this.shoppingCart[i].code;
                    row["name"] = this.shoppingCart[i].productName;
                    row["price"] = this.shoppingCart[i].prize;
                    row["quantity"] = this.shoppingCart[i].stock;
                    subtotal = this.shoppingCart[i].prize * decimal.Parse(this.shoppingCart[i].stock.ToString());
                    row["subtotal"] = "$ " + subtotal;
                    table.Rows.Add(row);
                }
                this.dgtShoppingCart.DataSource = table;
                this.dgtShoppingCart.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void dgtShoppingCart_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = e.RowIndex;

            for (int i = 0; i < shoppingCart.Count; i++)
            {
                if (index == i)
                {
                    if (shoppingCart[i].stock == 1)
                    {
                        this.shoppingCart.RemoveAt(i);
                        break;
                    }
                    else
                    {
                        this.shoppingCart[i].stock--;
                        break;
                    }
                }
            }
            Session["productsList"] = this.shoppingCart;
            this.fillGrid();
        }

        protected void dgtShoppingCart_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int index = e.NewEditIndex;

            for (int i = 0; i < shoppingCart.Count; i++)
            {
                if (index == i)
                {
                    this.shoppingCart[i].stock++;
                    break;
                }
            }
            Session["productsList"] = this.shoppingCart;
            this.fillGrid();
            e.Cancel = true;
        }

        protected void btnBuy_Click(object sender, EventArgs e)
        {
            try
            {
                this.entities = new marketsaveusEntities();
                int idInv = this.createInvoice();
                if (idInv != -1)
                {
                    this.fillInvoiceDesc(idInv);
                    this.entities.SaveChanges();
                    Session["productsList"] = null;
                    Response.Redirect("About.aspx");
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void fillInvoiceDesc(int id)
        {
            for (int i = 0; i < this.shoppingCart.Count; i++)
            {
                this.entities = new marketsaveusEntities();
                TblDescInvoice tblDesc = new TblDescInvoice();
                tblDesc.idInvoice = id;
                tblDesc.productCode = this.shoppingCart[i].code;
                tblDesc.quantity = int.Parse(this.shoppingCart[i].stock.ToString());
                tblDesc.subtotal = decimal.Parse(this.shoppingCart[i].stock.ToString()) * this.shoppingCart[i].prize;

                this.entities.TblDescInvoice.Add(tblDesc);
                this.entities.SaveChanges();
            }
        }

        private int createInvoice()
        {
            int id = -1;
            TblInvoice invoice = new TblInvoice();
            invoice.dateInvoice = DateTime.Now.Date;
            invoice.userEmail = Session["user"].ToString();
            this.entities.TblInvoice.Add(invoice);
            this.entities.SaveChanges();
            id = this.entities.TblInvoice.OrderByDescending(i => i.idInvoice).First().idInvoice;
            return id;

        }

        protected void btnCatalog_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProductCatalog.aspx");
        }
    }
}