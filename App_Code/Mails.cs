using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Net.Mail;
using System.Collections;
using System.IO;
using System.Net;


public class Mails
{
    #region To & From & Bcc & Subject & Body & Template & Values
    string _To;
    public string To
    {
        set
        {
            _To = value;
        }
        get
        {
            return _To;
        }
    }

    string _From;
    public string From
    {
        set
        {
            _From = value;
        }
        get
        {
            return _From;
        }
    }

    string _Bcc;
    public string Bcc
    {
        set
        {
            _Bcc = value;
        }
        get
        {
            return _Bcc;
        }

    }

    string _Subject;
    public string Subject
    {
        set
        {
            _Subject = value;
        }
        get
        {
            return _Subject;
        }
    }

    string _Body;
    public string Body
    {
        set
        {
            _Body = value;
        }
        get
        {
            return _Body;
        }
    }

    string _TamplatePath;
    public string TamplatePath
    {
        set
        {
            _TamplatePath = value;
        }
        get
        {
            return _TamplatePath;
        }
    }

    ArrayList _Values;
    public ArrayList Values
    {
        set
        {
            _Values = value;
        }
        get
        {
            return _Values;
        }
    }

    #endregion

    #region Send & SendTemplate
    public string Send()
    {

        try
        {
            using (MailMessage mm = new MailMessage(_From, _To))
            {
                mm.Subject = _Subject;
                mm.Body = _Body;
                mm.From = new MailAddress(_From);
                mm.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                NetworkCredential NetworkCred = new NetworkCredential("gagansngh966@gmail.com", "hatelove900");
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 587;
                smtp.Send(mm);
             //   ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Email sent.');", true);
            }
            //MailMessage mail = new MailMessage();

            ////set the addresses 
            //mail.From = new MailAddress("accutest@8055.in");
            //mail.To.Add("gagansngh966@gmail.com");

            ////set the content 
            //mail.Subject = _Subject;
            //mail.Body = _Body;
            //mail.IsBodyHtml = true;
            ////send the message 
            //SmtpClient smtp = new SmtpClient("mail.8055.in");

            //NetworkCredential Credentials = new NetworkCredential("accutest@8055.in", "weF2n3bV4cNv");
            //smtp.Credentials = Credentials;
            //smtp.Send(mail);
           // lblMessage.Text = "Mail Sent"; 

            //MailMessage MM = new MailMessage(_From, _To);
            //MM.Subject = _Subject;
            //MM.IsBodyHtml = true;
            //MM.Body = _Body;
            //// SmtpClient sc = new SmtpClient("jewelsfashion.com");
            //SmtpClient sc = new SmtpClient("smtpout.secureserver.net");
            //System.Net.NetworkCredential basicAuthenticationInfo = new System.Net.NetworkCredential("master@cosmodent.co.in", "Admin@123");
            //sc.Port = 25;
            //sc.UseDefaultCredentials = false;
            //sc.Credentials = basicAuthenticationInfo;
            //sc.Send(MM);
            //sc = null;

            //return "";
        }
        catch (Exception e)
        {
            return e.Message;
        }
        return "";
    }

    public string SendTemplate()
    {
        try
        {
            MailMessage MM = new MailMessage(_From, _To);
            MM.Subject = _Subject;
            MM.IsBodyHtml = true;
            MM.Body = _Body;
            // SmtpClient sc = new SmtpClient("jewelsfashion.com");
            SmtpClient sc = new SmtpClient("mail.aztechdoors.com");
            System.Net.NetworkCredential basicAuthenticationInfo = new System.Net.NetworkCredential("master@aztechdoors.com", "dharm@123");
            //sc.Port = 25;
            sc.UseDefaultCredentials = false;
            sc.Credentials = basicAuthenticationInfo;
            sc.Send(MM);
            sc = null;

            //MailMessage MM = new MailMessage();
            //MM.To.Add(_To);
            //MM.From = new MailAddress(_From);
            //MM.Subject = _Subject;
            //MM.IsBodyHtml = true;
            //MM.Body = GetMailMessage();
            //SmtpClient sc = new SmtpClient("74.53.42.196");
            //sc.Send(MM);
            //return "";
        }
        catch (Exception ex)
        {
            return ex.Message;

        }
        return "";
    }

    private string GetMailMessage()
    {
        try
        {
            string path = _TamplatePath;
            FileStream fs = new FileStream(path, FileMode.Open);
            StreamReader sw = new StreamReader(fs);
            string str = sw.ReadToEnd();
            sw.Close();
            fs.Close();
            for (int i = 0; i < _Values.Count; i++)
                str = str.Replace("%v" + (i + 1).ToString() + "%", _Values[i].ToString());
            return str;
        }
        catch
        {
            return "";
        }
    }
    #endregion
}

