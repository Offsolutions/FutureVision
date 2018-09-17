using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class verification : System.Web.UI.Page
{
    SQLHelper objsql1 = new SQLHelper();
    public DataTable dt = new DataTable();
    public string Roll = "";
    double totalmarks = 0.0,totalobtain=0.0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
          //  result();
        }
    }
    protected void result()
    {
        dt = objsql1.GetTable("select distinct s.name,r.courseid,r.cno,r.rollno,s.fname,r.date,r.timefrom,r.timeto,r.duration,r.place from result r , tblstudentdetail s where r.rollno=s.rollno and s.rollno='"+Roll+"' order by timefrom asc");
        if (dt.Rows.Count > 0)
        {
            
            ListView1.DataSource = dt;
            ListView1.DataBind();
           // lblper.Text = ((Convert.ToDouble(lblobt.Text) * 100) / Convert.ToDouble(lbltotal.Text)).ToString();
            grade();
        }

    }
  
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        DataTable dt1 = new DataTable();
        dt1 = objsql1.GetTable("select * from tblstudentdetail where rollno='" + txtroll.Text + "' and name='"+txtname.Text+"'");
        if (dt1.Rows.Count > 0)
        {
            Roll = dt1.Rows[0]["rollno"].ToString();
            result();
            pnlresult.Visible = true;
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Result Not Found');", true);
        }

    }
    protected void gvresult_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Label obtain = (Label)e.Row.FindControl("lbltotal");
            //Label max = (Label)e.Row.FindControl("lblmax");
            //Label total = (Label)e.Row.FindControl("lbltotal");
            //totalmarks += Convert.ToDouble(max.Text);
            //totalobtain += Convert.ToDouble(obtain.Text);
            //total.Text = totalmarks.ToString();
            //total.Text = totalobtain.ToString();


        }
      //  lblper.Text = ((Convert.ToDouble(lblobt.Text) * 100)/Convert.ToDouble(lbltotal.Text)).ToString();
    }
    protected void grade()
    {

        //double per = Convert.ToDouble(lblper.Text);
        //if (per > 80)
        //{
        //    lblgrade.Text = "A+";
        //}
        //else if (per >= 70 && per <= 79.9)
        //{
        //    lblgrade.Text = "A";
        //}
        //else if (per >= 55 && per <= 69.9)
        //{
        //    lblgrade.Text = "B";
        //}
        //else if (per >= 33 && per <= 54.9)
        //{
        //    lblgrade.Text = "C";
        //}
    }
    protected void lnkclear_Click(object sender, EventArgs e)
    {
        //gvresult.DataSource = "";
        //gvresult.DataBind();
        pnlresult.Visible = false;
        txtroll.Text = "";
        txtroll.Focus();
    }

    protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        if (e.Item.ItemType == ListViewItemType.DataItem)
        {
            Label rollno = (Label)e.Item.FindControl("lblroll");
            Label course = (Label)e.Item.FindControl("lblcourse");
            Label total = (Label)e.Item.FindControl("lbltotal");
            Label obt = (Label)e.Item.FindControl("lblobt");
            Label per = (Label)e.Item.FindControl("lblper");
            Label lblgrade = (Label)e.Item.FindControl("lblgrade");
            GridView gv = (GridView)e.Item.FindControl("gvresult");
            DataTable dt1 = new DataTable();
            dt1 = objsql1.GetTable("select * from result where rollno='" + rollno.Text + "' and courseid='" + course.Text + "'");
            if (dt1.Rows.Count > 0)
            {
                gv.DataSource = dt1;
                gv.DataBind();  
            }
            totalmarks = 0.0;
            totalobtain = 0.0;
            foreach (GridViewRow row in gv.Rows)
            {
                Label obtain2 = (Label)row.FindControl("lbltotal");
                Label max2 = (Label)row.FindControl("lblmax");
                totalmarks += Convert.ToDouble(max2.Text);
                totalobtain += Convert.ToDouble(obtain2.Text);

            }
            total.Text = totalmarks.ToString();
            obt.Text = totalobtain.ToString();
             per.Text = ((Convert.ToDouble(obt.Text) * 100)/Convert.ToDouble(total.Text)).ToString();
            if (Convert.ToDouble(per.Text) > 80)
            {
                lblgrade.Text = "A+";
            }
            else if (Convert.ToDouble(per.Text) >= 70 && Convert.ToDouble(per.Text) <= 79.9)
            {
                lblgrade.Text = "A";
            }
            else if (Convert.ToDouble(per.Text) >= 55 && Convert.ToDouble(per.Text) <= 69.9)
            {
                lblgrade.Text = "B";
            }
            else if (Convert.ToDouble(per.Text) >= 33 && Convert.ToDouble(per.Text) <= 54.9)
            {
                lblgrade.Text = "C";
            }

        }




        //total.Text = totalobtain.ToString();
    }
}