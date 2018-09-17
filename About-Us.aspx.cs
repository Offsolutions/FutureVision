using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class About_Us : System.Web.UI.Page
{
    SQLHelper objsql = new SQLHelper();
    public static string data, img;
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        dt = objsql.GetTable("select * from tblPage where Id='2'");
        if (dt.Rows.Count > 0)
        {
            data = dt.Rows[0]["Description"].ToString();
            img = dt.Rows[0]["Image"].ToString();
        }
    }
}