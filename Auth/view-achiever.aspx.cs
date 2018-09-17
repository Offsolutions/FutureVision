using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Auth1_view_achiever : System.Web.UI.Page
{
    SQLHelper objsql = new SQLHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Admin"] == "" && Session["Admin"] == null)
            Response.Redirect("login.aspx");
        if (!IsPostBack)
        {
            Cache.Remove("Val");
            Bind();
        }
    }
    protected void btnadd_Click(object sender, EventArgs e)
    {
        Response.Redirect("add-edit-achiever.aspx");
    }
    protected void btnback_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
    public void Bind()
    {
        DataTable dt = new DataTable();
        dt = objsql.GetTable("select * from tblAchiever order by id");
        if (dt.Rows.Count > 0)
        {
            gridlist.DataSource = dt;
            gridlist.DataBind();
        }
    }
    protected void gridlist_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        Cache.Remove("Val");
        if (e.CommandName == "edit")
        {
            Cache["Val"] = e.CommandArgument.ToString();
            Cache.Insert("key", Cache["Val"]);
            Response.Redirect("add-edit-achiever.aspx");
        }
        if (e.CommandName == "Activate")
        {
            objsql.ExecuteNonQuery("update tblAchiever set Status='1' where id=" + e.CommandArgument);
            Bind();
        }
        if (e.CommandName == "Deactivate")
        {
            objsql.ExecuteNonQuery("update tblAchiever set Status='0' where id=" + e.CommandArgument);
            Bind();
        }
    }
}