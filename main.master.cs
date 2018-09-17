using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class main : System.Web.UI.MasterPage
{
    SQLHelper objsql = new SQLHelper();
    public static string phn, email, add, about,whatsapp;
    protected void Page_Load(object sender, EventArgs e)
    {
        phn = Common.Get(objsql.GetSingleValue("select Description from tblPage where Id='4'"));
        phn = Regex.Replace(phn, "<.*?>", string.Empty);
        email = Common.Get(objsql.GetSingleValue("select Description from tblPage where Id='5'"));
        email = Regex.Replace(email, "<.*?>", string.Empty);

        add = Common.Get(objsql.GetSingleValue("select Description from tblPage where Id='3'"));
        whatsapp = Common.Get(objsql.GetSingleValue("select Description from tblPage where Id='6'"));
        whatsapp = Regex.Replace(whatsapp, "<.*?>", string.Empty);
        about = Common.Get(objsql.GetSingleValue("select Description from tblPage where Id='2'"));
        if (about.Length > 200)
        {
            about = about.Substring(0, 200);
        }
        menu();

    }
    protected void menu()
    {
        DataTable dtmenu = new DataTable();
        dtmenu = objsql.GetTable("select Cat_name from tblCategory where Status='1' order by Priority asc");
        if (dtmenu.Rows.Count > 0)
        {
            lvc.DataSource = dtmenu;
            lvc.DataBind();
        }
    }
    protected void lvc_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        if (e.Item.ItemType == ListViewItemType.DataItem)
        {
            LinkButton cat = (LinkButton)e.Item.FindControl("lnkmain");
            ListView listsub = (ListView)e.Item.FindControl("lvsub");
            DataSet ds = new DataSet();
            ds = objsql.Get_DataSet("select * from tblService where Status='1' and Type='" + cat.Text + "' order by priority asc");
            if (ds.Tables[0].Rows.Count != 0)
            {
                listsub.DataSource = ds;
                listsub.DataBind();
            }
        }
    }

}
