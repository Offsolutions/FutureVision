using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Data;

public partial class Auth1_add_edit_achiever : System.Web.UI.Page
{
    SQLHelper objsql = new SQLHelper();
    public static string imgsta = "", staimg = "", img = "", cook = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Admin"] == "" && Session["Admin"] == null)
            Response.Redirect("login.aspx");
        if (!IsPostBack)
        {
            if (Cache["Val"] != "" && Cache["Val"] != null)
            {
                cook = Cache["Val"].ToString();
                Bind();
            }
        }
    }
    private static Bitmap ResizeImage(System.Drawing.Image imgPhoto, int Height, int Width)
    {
        int sourceWidth = imgPhoto.Width;
        int sourceHeight = imgPhoto.Height;
        int sourceX = 0;
        int sourceY = 0;
        int destX = 0;
        int destY = 0;
        float nPercent = 0;
        float nPercentW = 0;
        float nPercentH = 0;

        nPercentW = ((float)Width / (float)sourceWidth);
        nPercentH = ((float)Height / (float)sourceHeight);
        if (nPercentH < nPercentW)
        {
            nPercent = nPercentH;
            destX = System.Convert.ToInt16((Width - (sourceWidth * nPercent)) / 2);
        }
        else
        {
            nPercent = nPercentW;
            destY = System.Convert.ToInt16((Height - (sourceHeight * nPercent)) / 2);
        }

        int destWidth = (int)Math.Ceiling(sourceWidth * nPercent);
        int destHeight = (int)Math.Ceiling(sourceHeight * nPercent);

        Bitmap bmPhoto = new Bitmap(Width, Height, imgPhoto.PixelFormat);

        bmPhoto.SetResolution(imgPhoto.HorizontalResolution, imgPhoto.VerticalResolution);

        Graphics grPhoto = Graphics.FromImage(bmPhoto);
        grPhoto.Clear(Color.White);

        grPhoto.CompositingQuality = CompositingQuality.HighQuality;
        grPhoto.SmoothingMode = SmoothingMode.HighQuality;
        grPhoto.InterpolationMode = InterpolationMode.HighQualityBicubic;
        Rectangle rect = new Rectangle(0, 0, Width, Height);
        grPhoto.DrawImage(imgPhoto, rect, new Rectangle(sourceX, sourceY, sourceWidth, sourceHeight), GraphicsUnit.Pixel);
        grPhoto.Dispose();
        return bmPhoto;
    }
    protected void btnadd_Click(object sender, EventArgs e)
    {
        //string newsimage = Path.GetFileName(stafffile.PostedFile.FileName);
        if (stuimg.HasFile)
        {
            imgsta = stuimg.FileName;
            staimg = "Photo" + "_" + Common.GenerateClassCode() + "_" + imgsta;
            string filePath2 = MapPath("../uploadimage/" + staimg);
            Stream Buffer2 = stuimg.PostedFile.InputStream;
            System.Drawing.Image Image2 = System.Drawing.Image.FromStream(Buffer2);
            Bitmap bmp2 = ResizeImage(Image2, Image2.Height, Image2.Width);
            bmp2.Save(filePath2, System.Drawing.Imaging.ImageFormat.Jpeg);
        }
        else
        {
            staimg = img;
        }
        if (cook != null && cook != "")
        {
            objsql.ExecuteNonQuery("update tblAchiever set Name='" + txtname.Text + "',Band='" + txtband.Text + "',Image='" + staimg + "' where Id='" + cook + "'");
        }
        else
        {
            objsql.ExecuteNonQuery("insert into tblAchiever(Name,Band,Image,Status) values('" + txtname.Text + "','" + txtband.Text + "','" + staimg + "','1')");
        }
        Cache.Remove("Val");
        Response.Redirect("view-achiever.aspx");
    }
    public void Bind()
    {
        DataTable dt = new DataTable();
        dt = objsql.GetTable("select * from tblAchiever where Id='" + cook + "'");
        if (dt.Rows.Count > 0)
        {
            txtname.Text = dt.Rows[0]["Name"].ToString();
            txtband.Text = dt.Rows[0]["Band"].ToString();
            img = dt.Rows[0]["Image"].ToString();
        }
    }
}