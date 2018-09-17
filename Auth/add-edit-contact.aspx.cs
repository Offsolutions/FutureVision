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


public partial class Auth_add_edit_contact : System.Web.UI.Page
{
    SqlConnection MyCon = new SqlConnection(WebConfigurationManager.ConnectionStrings["con"].ConnectionString);
    public static string imagename = "", img = "", cook = "";
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
    #region Image unique code
    public static string GenerateClassCode()
    {
        StringBuilder classCode = new StringBuilder();
        Random r = new Random();

        string alphabets = "abcdefghijklmnopqrstuvwxyz";
        string numbers = "01234567890123456789012345";

        for (int i = 0; i <= 2; i++)
        {
            classCode.Append(alphabets[r.Next(alphabets.Length)].ToString().ToUpper());
            classCode.Append(numbers[r.Next(numbers.Length)]);
        }
        return classCode.ToString();
    }
    #endregion
    #region Submit button code
    protected void btnsubmit_Click(object sender, EventArgs e)
    {

        
        if (cook != null && cook != "")
        {
            SqlCommand cmd = new SqlCommand("Updatecontact", MyCon);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Id", cook);

            cmd.Parameters.AddWithValue("@address", txtname.Text);
            cmd.Parameters.AddWithValue("@phone", txtphone.Text);


            cmd.Parameters.AddWithValue("@email", txtemail.Text);

            MyCon.Open();

            cmd.ExecuteNonQuery();

            MyCon.Close();
        }
        
        cook = "";
        Cache.Remove("Val");
        Response.Redirect("View-contact.aspx");
    }
    #endregion
    
    #region Bind Data By Id
    public void BindData()
    {
        if (cook != "" && cook != null)
        {
            SqlCommand cmd = new SqlCommand("ContactByid", MyCon);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Id", cook);

            SqlDataAdapter da = new SqlDataAdapter(cmd);

            DataSet ds = new DataSet();

            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                txtname.Text = ds.Tables[0].Rows[0]["address"].ToString();
                txtphone.Text = ds.Tables[0].Rows[0]["phone"].ToString();
               txtemail.Text = ds.Tables[0].Rows[0]["email"].ToString();
                ds.Clear();
            }
        }
    }
    #endregion
}