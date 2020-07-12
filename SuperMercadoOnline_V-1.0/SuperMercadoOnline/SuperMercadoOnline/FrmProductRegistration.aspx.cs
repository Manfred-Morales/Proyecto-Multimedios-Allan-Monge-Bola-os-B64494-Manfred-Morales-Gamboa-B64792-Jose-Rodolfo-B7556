using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;

namespace SuperMercadoOnline
{
    public partial class FrmRegistroProductos : System.Web.UI.Page
    {
        private string strCode;
        private marketsaveusEntities entidades;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!HttpContext.Current.User.Identity.IsAuthenticated)
            {
                Response.Redirect("Login.aspx");
            }

            else
            {
                this.btnUpdate.Visible = false;
                this.btnDelete.Visible = false;
                this.btnConsult.Visible = false;
                if (Request.QueryString["code"] != null)
                {
                    this.strCode = Request.QueryString["code"];
                }
                else
                {
                    this.strCode = null;
                }


                if (!IsPostBack)
                    this.fillproducts(this.strCode);
            }



        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            this.entidades = new marketsaveusEntities();
            string pcode = this.txtCode.Text;
            TblProduct tblProduct =
                this.entidades.TblProduct.FirstOrDefault(u => u.code == pcode);
            if (tblProduct == null)
            {

                
                TblProduct tableProduct = new TblProduct();

                tableProduct.code = this.txtCode.Text;
                tableProduct.prize = Convert.ToDecimal(this.txtprize.Text);
                tableProduct.productDescription = this.txtDescripcion.Text;
                tableProduct.productName = this.txtname.Text;
                tableProduct.stock = Convert.ToInt32(this.txtInventory.Text);
                tableProduct.productImage = "www/img/" + txtImage.FileName;

                this.entidades.TblProduct.Add(tableProduct);

                //se guardan los cambios
                this.entidades.SaveChanges();

                this.txtCode.Text = "";
                this.txtDescripcion.Text = "";
                this.txtInventory.Text = "";
                this.txtname.Text = "";
                this.txtprize.Text = "";

                Response.Redirect("FrmConsultarProductos.aspx");
            }
            else
            {
                lbNotificaciones.Text = "The number of the entered code is already saved, please enter a new one";
            }
        }

        private void fillproducts(string pCode)
        {
            
            this.entidades = new marketsaveusEntities();
            TblProduct products =
                this.entidades.TblProduct.FirstOrDefault(e => e.code == pCode);

           

            if (products != null)
            {
                
                this.txtCode.Text = products.code;
                this.txtDescripcion.Text = products.productDescription;
                this.txtInventory.Text = products.stock.ToString();
                this.txtname.Text = products.productName;
                this.txtprize.Text = products.prize.ToString();

                this.txtImage.Visible = false;
                this.lblImage.Visible = false;
                this.btnRegister.Visible = false;
                this.btnDelete.Visible = true;
                this.btnConsult.Visible = true;
                this.btnUpdate.Visible = true;
                this.txtCode.Enabled = false;
            }
        }

        protected void btnConsult_Click(object sender, EventArgs e)
        {
            Response.Redirect("FrmConsultarProductos.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            this.entidades = new marketsaveusEntities();

           
            TblProduct products = this.entidades.TblProduct.FirstOrDefault(u => u.code == this.strCode);

            products.productDescription = this.txtDescripcion.Text;
            products.productName = this.txtname.Text;
            products.prize = Convert.ToDecimal(this.txtprize.Text);
            products.stock = Convert.ToInt32(this.txtInventory.Text);
           
            this.entidades.SaveChanges();

           
            Response.Redirect("FrmConsultarProductos.aspx");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
           

            this.entidades = new marketsaveusEntities();
           

            TblProduct products =
                this.entidades.TblProduct.FirstOrDefault(u => u.code == this.strCode);

           
            this.entidades.TblProduct.Remove(products);

          
            this.entidades.SaveChanges();

          

            Response.Redirect("FrmConsultarProductos.aspx");
        }
    }
}