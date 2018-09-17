using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contact : System.Web.UI.Page
{
    SQLHelper objsql = new SQLHelper();
    public static string phn, email, add, about;
    protected void Page_Load(object sender, EventArgs e)
    {
        phn = Common.Get(objsql.GetSingleValue("select Description from tblPage where Id='4'"));
        email = Common.Get(objsql.GetSingleValue("select Description from tblPage where Id='5'"));
        add = Common.Get(objsql.GetSingleValue("select Description from tblPage where Id='3'"));

    }
    protected string GetBody()
    {
        string body = "";
        body += "<table>";

        body += "<tr><td>Name:</td><td>" + this.txtname.Value + "</td></tr>";
        
        body += "<tr><td>E-mail:</td><td>" + this.txtemail.Value + "</td></tr>";
       


        body += "<tr><td>Course:</td><td>" + txtmsz.Value+ "</td></tr>";
        body += "</table>";

        return body;
    }
    protected void lnksubmit_Click(object sender, EventArgs e)
    {
        Mails objmail = new Mails();


        string tomail = System.Configuration.ConfigurationSettings.AppSettings["TO"];
        objmail.To = tomail;
        objmail.From = txtemail.Value;
        objmail.Subject = "Future Vision: Contact-Us";

        objmail.Body = GetBody();
        objmail.Send();
        this.txtname.Value = "";
       
        this.txtmsz.Value= "";

    }
}