using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;
using System.IO;
using System.Drawing;

public partial class Auth_add_edit_Category : System.Web.UI.Page
{
    SqlConnection MyCon = new SqlConnection(WebConfigurationManager.ConnectionStrings["con"].ConnectionString);
    SQLHelper objsql = new SQLHelper();
    public static string imagename = "", img = "", cook = "", albumcode;
    Common cm = new Common();
   // GetImage gm = new GetImage();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Admin"] == "" && Session["Admin"] == null)
            Response.Redirect("login.aspx");
        if (!IsPostBack)
        {
            if (Cache["Val"] != "" && Cache["Val"] != null)
            {
                cook = Cache["Val"].ToString();
                BindData();
            }
        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (sliderimage.HasFile)
        {
            string sliderpic = sliderimage.FileName;
            imagename = "PH" + "_" + cm.GenerateClassCode() + "_" + sliderpic;
            string filePath2 = MapPath("../uploadimage/" + imagename);
            Stream Buffer2 = sliderimage.PostedFile.InputStream;
            System.Drawing.Image Image2 = System.Drawing.Image.FromStream(Buffer2);
           // Bitmap bmp2 = gm.ResizeImage(Image2, Image2.Height, Image2.Width);
           // bmp2.Save(filePath2, System.Drawing.Imaging.ImageFormat.Jpeg);
        }
        else
        {
            imagename = img;
        }
        string p = Common.Get(objsql.GetSingleValue("select priority from tblCategory where priority='" + txtpre.Text + "'"));
        if (p == "")
        {
            goto ss;
        }
        if (Convert.ToInt32(p) > 0)
        {
            goto xx;
        }
    ss: ;
        if (cook != null && cook != "")
        {
            SqlCommand cmd = new SqlCommand("UpdateCategory", MyCon);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Id", cook);

            cmd.Parameters.AddWithValue("@Cat_name", txtname.Text);
            cmd.Parameters.AddWithValue("@discription", txtdisc.Text);
            cmd.Parameters.AddWithValue("@Image", imagename);
            cmd.Parameters.AddWithValue("@priority", txtpre.Text);
            MyCon.Open();

            cmd.ExecuteNonQuery();

            MyCon.Close();
        }
        else
        {
            SqlCommand cmd = new SqlCommand("insertCategory", MyCon);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Cat_name", txtname.Text);

            cmd.Parameters.AddWithValue("@Status", 1);
            cmd.Parameters.AddWithValue("@discription", txtdisc.Text);
            cmd.Parameters.AddWithValue("@Image", imagename);
            cmd.Parameters.AddWithValue("@priority", txtpre.Text);

            MyCon.Open();

            cmd.ExecuteNonQuery();

            MyCon.Close();
        }
        cook = "";
        Cache.Remove("Val");
        Response.Redirect("View-category.aspx");
    xx:
        if (Convert.ToInt32(p) > 0)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Priority Already Busy')", true);
        }
        ;
    }
    #region Bind Data By Id
    public void BindData()
    {
        if (cook != "" && cook != null)
        {
            SqlCommand cmd = new SqlCommand("CategoryByid", MyCon);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Id", cook);

            SqlDataAdapter da = new SqlDataAdapter(cmd);

            DataSet ds = new DataSet();

            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                txtname.Text = ds.Tables[0].Rows[0]["Cat_name"].ToString();
                txtdisc.Text = ds.Tables[0].Rows[0]["discription"].ToString();
                img = ds.Tables[0].Rows[0]["image"].ToString();
                txtpre.Text = ds.Tables[0].Rows[0]["priority"].ToString();
                ds.Clear();
            }
        }
    }
    #endregion
}