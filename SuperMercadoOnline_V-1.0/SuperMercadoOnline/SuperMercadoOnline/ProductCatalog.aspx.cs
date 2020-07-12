using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;

namespace SuperMercadoOnline
{
    public partial class ProductCatalog : System.Web.UI.Page
    {
        private marketsaveusEntities entities;
        private List<TblProduct> productsList;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!HttpContext.Current.User.Identity.IsAuthenticated)
                Response.Redirect("Login.aspx");
        }

        protected void productList_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName.Equals("btnMarket"))
            {
                int posicion = Convert.ToInt32(e.CommandArgument);
                DataListItem item = this.productList.Items[posicion];

                this.productsList = (List<TblProduct>)Session["productsList"];

                Label code = (Label)item.FindControl("lblCode");
                TextBox quantity = (TextBox)item.FindControl("txtProductQuantity");
                Label name = (Label)item.FindControl("lblProductName");
                Label price = (Label)item.FindControl("lblProductPrice");

                TblProduct product = new TblProduct();
                product.code = code.Text;
                product.productName = name.Text;
                product.prize = decimal.Parse(price.Text);
                product.stock = int.Parse(quantity.Text);

                if (this.productsList != null)
                {
                    if (!this.existingCode(code.Text))
                    {
                        this.productsList.Add(product);
                    }
                    else
                    {
                        this.quantity(code.Text, int.Parse(quantity.Text));
                    }
                }
                else
                {
                    this.productsList = new List<TblProduct>();
                    this.productsList.Add(product);
                }
                Session["productsList"] = this.productsList;
                ((TextBox)item.FindControl("txtProductQuantity")).Text = "1";
            }
        }

        private bool existingCode(string cod)
        {
            bool found = false;
            for (int i = 0; i < this.productsList.Count; i++)
            {
                if (cod.Equals(this.productsList[i].code))
                {
                    found = true;
                    break;
                }
            }
            return found;
        }

        private bool quantity(string cod, int q)
        {
            bool can = false;
            for (int i = 0; i < this.productsList.Count; i++)
            {
                this.entities = new marketsaveusEntities();
                if (this.productsList[i].stock + q <= this.entities.TblProduct.FirstOrDefault(p => p.code == cod).stock)
                {
                    this.productsList[i].stock += q;
                    can = true;
                    break;
                }
            }
            return can;
        }
    }
}