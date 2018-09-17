using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Text;
using System.IO;
using System.Web.Caching;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Auth_add_edit_File : System.Web.UI.Page
{
    SqlConnection MyCon = new SqlConnection(WebConfigurationManager.ConnectionStrings["con"].ConnectionString);
    public static string filedata = "", file = "", cook = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Admin"] == "" && Session["Admin"] == null)
            Response.Redirect("login.aspx");
         if (Cache["Val"] != "" && Cache["Val"] != null)
            {
                cook = Cache["Val"].ToString();
                BindData();
            }
    }
    #region Submit button code
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (sliderimage.HasFile)
        {
            string filename = Path.GetFileName(sliderimage.FileName);
            sliderimage.SaveAs(Server.MapPath("../Files/") + filename);
            String fPath = "../Files/" + filename;
            file = filename;
        }
        else
        {
             file = filedata;
        }
        if (cook != null && cook != "")
        {
            SqlCommand cmd = new SqlCommand("UpdateFile", MyCon);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Id", cook);

            cmd.Parameters.AddWithValue("@Name", txtname.Text);

            cmd.Parameters.AddWithValue("@File_Val", file);


            MyCon.Open();

            cmd.ExecuteNonQuery();

            MyCon.Close();
        }
        else
        {
            SqlCommand cmd = new SqlCommand("insertFile", MyCon);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Name", txtname.Text);

            cmd.Parameters.AddWithValue("@File_Val", file);

            cmd.Parameters.AddWithValue("@Status", 1);

            MyCon.Open();

            cmd.ExecuteNonQuery();

            MyCon.Close();
        }
        cook = "";
        Cache.Remove("Val");
        Response.Redirect("View-file.aspx");
    }
    #endregion
    #region Bind Data By Id
    public void BindData()
    {
        if (cook != "" && cook != null)
        {
            SqlCommand cmd = new SqlCommand("FileByid", MyCon);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Id", cook);

            SqlDataAdapter da = new SqlDataAdapter(cmd);

            DataSet ds = new DataSet();

            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                txtname.Text = ds.Tables[0].Rows[0]["Name"].ToString();
                filedata = ds.Tables[0].Rows[0]["File_Val"].ToString();
                ds.Clear();
            }
        }
    }
    #endregion
}