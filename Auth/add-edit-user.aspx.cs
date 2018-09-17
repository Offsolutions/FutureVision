using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Security.Cryptography;
public partial class Auth_add_edit_user : System.Web.UI.Page
{
    const string passphrase = "password";
    public static string cook = "";
    SqlConnection MyCon = new SqlConnection(WebConfigurationManager.ConnectionStrings["con"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["Admin"] == "" && Session["Admin"] == null)
        //        Response.Redirect("login.aspx");
        if (!IsPostBack)
        {
            if (Cache["Val"] != "" && Cache["Val"] != null)
            {
                cook = Cache["Val"].ToString();
                BindData();
            }
        }
    }
    #region Submit Button Code
    protected void btnubmit_Click(object sender, EventArgs e)
    {
        if (cook != null && cook != "")
        {
            SqlCommand cmd = new SqlCommand("UpdateUser", MyCon);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Id", cook);

            cmd.Parameters.AddWithValue("@Name", txtname.Text);

            cmd.Parameters.AddWithValue("@Phone_no", txtphone.Text);

            cmd.Parameters.AddWithValue("@Usertype", txttype.Text);

            cmd.Parameters.AddWithValue("@Username", txtusername.Text);

            cmd.Parameters.AddWithValue("@Password", EncryptData(txtpassword.Text));

            MyCon.Open();

            cmd.ExecuteNonQuery();

            MyCon.Close();
        }
        else
        {
            SqlCommand cmd = new SqlCommand("insertUser", MyCon);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Name", txtname.Text);

            cmd.Parameters.AddWithValue("@Phone_no", txtphone.Text);

            cmd.Parameters.AddWithValue("@Usertype", txttype.Text);

            cmd.Parameters.AddWithValue("@Username", txtusername.Text);

            cmd.Parameters.AddWithValue("@Password", EncryptData(txtpassword.Text));

            cmd.Parameters.AddWithValue("@Status", 1);

            MyCon.Open();

            cmd.ExecuteNonQuery();

            MyCon.Close();
        }
        cook = "";
        Cache.Remove("Val");
        Response.Redirect("View-User.aspx");
    }
    #endregion
    #region Encrypt/Decrypt Data
    public static string EncryptData(string Message)
    {
        byte[] Results;
        System.Text.UTF8Encoding UTF8 = new System.Text.UTF8Encoding();
        MD5CryptoServiceProvider HashProvider = new MD5CryptoServiceProvider();
        byte[] TDESKey = HashProvider.ComputeHash(UTF8.GetBytes(passphrase));
        TripleDESCryptoServiceProvider TDESAlgorithm = new TripleDESCryptoServiceProvider();
        TDESAlgorithm.Key = TDESKey;
        TDESAlgorithm.Mode = CipherMode.ECB;
        TDESAlgorithm.Padding = PaddingMode.PKCS7;
        byte[] DataToEncrypt = UTF8.GetBytes(Message);
        try
        {
            ICryptoTransform Encryptor = TDESAlgorithm.CreateEncryptor();
            Results = Encryptor.TransformFinalBlock(DataToEncrypt, 0, DataToEncrypt.Length);
        }
        finally
        {
            TDESAlgorithm.Clear();
            HashProvider.Clear();
        }
        return Convert.ToBase64String(Results);
    }
    public static string DecryptData(string Message)
    {
        byte[] Results;
        System.Text.UTF8Encoding UTF8 = new System.Text.UTF8Encoding();
        MD5CryptoServiceProvider HashProvider = new MD5CryptoServiceProvider();
        byte[] TDESKey = HashProvider.ComputeHash(UTF8.GetBytes(passphrase));
        TripleDESCryptoServiceProvider TDESAlgorithm = new TripleDESCryptoServiceProvider();
        TDESAlgorithm.Key = TDESKey;
        TDESAlgorithm.Mode = CipherMode.ECB;
        TDESAlgorithm.Padding = PaddingMode.PKCS7;
        byte[] DataToDecrypt = Convert.FromBase64String(Message);
        try
        {
            ICryptoTransform Decryptor = TDESAlgorithm.CreateDecryptor();
            Results = Decryptor.TransformFinalBlock(DataToDecrypt, 0, DataToDecrypt.Length);
        }
        finally
        {
            TDESAlgorithm.Clear();
            HashProvider.Clear();
        }
        return UTF8.GetString(Results);
    }
    #endregion
    #region Bind Data By Id
    public void BindData()
    {
        if (cook != "" && cook != null)
        {
            SqlCommand cmd = new SqlCommand("UserByid", MyCon);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Id", cook);

            SqlDataAdapter da = new SqlDataAdapter(cmd);

            DataSet ds = new DataSet();

            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                txtname.Text = ds.Tables[0].Rows[0]["Name"].ToString();
                txtphone.Text = ds.Tables[0].Rows[0]["Phone_no"].ToString();
                txttype.Text = ds.Tables[0].Rows[0]["Usertype"].ToString();
                txtusername.Text = ds.Tables[0].Rows[0]["Username"].ToString();
                txtpassword.Text = DecryptData(ds.Tables[0].Rows[0]["Password"].ToString());
                txtpassword.TextMode = TextBoxMode.SingleLine;
                ds.Clear();
            }
        }
    }
    #endregion
}