using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection MyCon = new SqlConnection(System.Configuration.ConfigurationSettings.AppSettings["con"]);
   // SQLHelper1 objsql1 = new SQLHelper1();
    public static string phn, email, add, about,home,whatsapp;
    SQLHelper objsql = new SQLHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            slider();
            testi();
            news();
            course();
            menu();
            phn = Common.Get(objsql.GetSingleValue("select Description from tblPage where Id='4'"));
            phn = Regex.Replace(phn, "<.*?>", string.Empty);
            email = Common.Get(objsql.GetSingleValue("select Description from tblPage where Id='5'"));
            email = Regex.Replace(email, "<.*?>", string.Empty);
            whatsapp = Common.Get(objsql.GetSingleValue("select Description from tblPage where Id='6'"));
            whatsapp = Regex.Replace(whatsapp, "<.*?>", string.Empty);
            add = Common.Get(objsql.GetSingleValue("select Description from tblPage where Id='3'"));
            about = Common.Get(objsql.GetSingleValue("select Description from tblPage where Id='2'"));
            if(about.Length>200)
            {
                about = about.Substring(0, 200);
            }
            home = Common.Get(objsql.GetSingleValue("select Description from tblPage where Id='1'"));
           
        }
    }
    protected void menu()
    {
        DataTable dtmenu = new DataTable();
        dtmenu = objsql.GetTable("select  Cat_name from tblCategory where Status='1' order by priority asc");
        if(dtmenu.Rows.Count>0)
        {
            lvc.DataSource = dtmenu;
            lvc.DataBind();
        }
        DataSet ds = new DataSet();
        ds = objsql.GetDataset("select * from tblAchiever where Status='1'");
        if (ds.Tables[0].Rows.Count > 0)
        {
            lvac.DataSource = ds;
            lvac.DataBind();
        }
    }
    protected void slider()
    {
        SqlCommand cmd = new SqlCommand("selectSlider", MyCon);

        cmd.CommandType = CommandType.StoredProcedure;

        SqlDataAdapter da = new SqlDataAdapter(cmd);

        DataSet ds = new DataSet();

        da.Fill(ds);
        lvslider.DataSource = ds;
        lvslider.DataBind();
        ds.Tables.Clear();
    
    }
    protected void testi()
    {
        SqlCommand cmd = new SqlCommand("selectTestimonial", MyCon);

        cmd.CommandType = CommandType.StoredProcedure;

        SqlDataAdapter da = new SqlDataAdapter(cmd);

        DataSet ds = new DataSet();

        da.Fill(ds);
        lvtest.DataSource = ds;
        lvtest.DataBind();
        ds.Tables.Clear();
    }
    protected void news()
    {

        SqlCommand cmd = new SqlCommand("selectActiveNews", MyCon);

        cmd.CommandType = CommandType.StoredProcedure;

        SqlDataAdapter da = new SqlDataAdapter(cmd);

        DataSet ds = new DataSet();

        da.Fill(ds);
        lvnews.DataSource = ds;
        lvnews.DataBind();
        ds.Tables.Clear();
    }
    protected void course()
    {
       

        DataSet ds = new DataSet();

        ds = objsql.Get_DataSet("select * from tblService where Name!='Crash Course' and Status='1'");
        if (ds.Tables[0].Rows.Count>0)
        {
            lvcourse.DataSource = ds;
            lvcourse.DataBind();
        }
      
        ds.Tables.Clear();
    }

    protected void lnkrequest_Click(object sender, EventArgs e)
    {
        DataTable dt1 = new DataTable();
        dt1 = objsql.GetTable("select * from tblstudentdetail where rollno='" + txtroll.Value + "'");
        if (dt1.Rows.Count > 0)
        {
            Cache["RollNo"] = dt1.Rows[0]["rollno"].ToString();
            Response.Redirect("verification.aspx");
        }
    }
    protected void lvc_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        if (e.Item.ItemType == ListViewItemType.DataItem)
        {
            LinkButton cat = (LinkButton)e.Item.FindControl("lnkmain");
            ListView listsub = (ListView)e.Item.FindControl("lvsub");
            DataSet ds = new DataSet();
            ds = objsql.Get_DataSet("select * from tblService where Status='1' and Type='"+cat.Text+"' order by priority asc");
            if (ds.Tables[0].Rows.Count != 0)
            {
                listsub.DataSource = ds;
                listsub.DataBind();
            }
        }
    }
}