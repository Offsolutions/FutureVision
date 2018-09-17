using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Courses : System.Web.UI.Page
{
    SQLHelper objsql = new SQLHelper();
    SqlConnection MyCon = new SqlConnection(System.Configuration.ConfigurationSettings.AppSettings["con"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        course();
    }
    protected void course()
    {
        DataTable ds = new DataTable();
        ds = objsql.GetTable("select * from tblService where Type='" + Request.QueryString["id"] + "'");
        lvcourse.DataSource = ds;
        lvcourse.DataBind();
        
    }
}