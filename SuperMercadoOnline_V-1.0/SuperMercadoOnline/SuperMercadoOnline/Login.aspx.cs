using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
namespace SuperMercadoOnline
{
    public partial class Login : System.Web.UI.Page
    {
        private TblUser user;
       
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["user"] = Session["user"];
            Session["userName"] = Session["userName"];
        }

        protected void bntLogin_Click(object sender, EventArgs e)
        {
            try
            {
                if (this.intentoAutenticacion(this.txtUser.Text.Trim(), this.txtPassword.Text.Trim()))
                {
                    Session["userName"] = user.fullName;
                    Session["user"] = user.email;
                    if (user.tipo.Equals("c"))
                    {

                        
                        FormsAuthentication.SetAuthCookie(this.txtUser.Text.Trim(), false);

                        Response.Redirect("About.aspx");

                    }
                    else
                    {
                       
                        FormsAuthentication.SetAuthCookie(this.txtUser.Text.Trim(), false);
                        Response.Redirect("About.aspx");
                    }

                }
                else
                {
                    Response.Write("<script language='JavaScript'>" +
                        "alert('Usuario o contraseña inconrrecta')</script>");
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


        private bool intentoAutenticacion(string userName, string password)
        {
            try
            {

                bool autenticado = false;
                marketsaveusEntities entidades = new marketsaveusEntities();

                user = entidades.TblUser.FirstOrDefault(u => u.fullName == userName);
                

               
                if (user != null)
                {
                    if (user.passw.Equals(password))
                    {
                        autenticado = true;
                    }
                }
                return autenticado;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}