using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SuperMercadoOnline
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            Session["productsList"] = Session["productsList"];
            Session["userName"] = Session["userName"];
            Session["user"] = Session["user"];
            if (Session["userName"] != null)
            {
                this.lblUser.Text = Session["userName"].ToString();
            }
            
        }
    }
}