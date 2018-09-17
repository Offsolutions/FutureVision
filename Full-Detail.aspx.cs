using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Full_Detail : System.Web.UI.Page
{
    SQLHelper objsql = new SQLHelper();
    public static string image, title, disc;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind();
        }
    }
    protected void bind()
    {
        DataTable dt = new DataTable();
        dt=objsql.GetTable("select * from tblservice where Id='"+Request.QueryString["id"]+"'");
        if(dt.Rows.Count>0)
        {
            image=dt.Rows[0]["Image"].ToString();
            title=dt.Rows[0]["Name"].ToString();
            disc=dt.Rows[0]["Description"].ToString();
        }
        DataTable DT2 = new DataTable();
        DT2 = objsql.GetTable("SELECT Top 5 * FROM tblservice ORDER BY NEWID()");
        if (DT2.Rows.Count > 0)
        {
            lvrelate.DataSource = DT2;
            lvrelate.DataBind();
            lvcat.DataSource = DT2;
            lvcat.DataBind();
        }
                                                
    }
}