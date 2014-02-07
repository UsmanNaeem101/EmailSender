using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmailSender
{
    public partial class Sender : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            errorRow.Style.Add("display", "none");
        }

        protected void sendEmail_Click(object sender, EventArgs e)
        {
            int portNumber = 587;
            bool enableSSL = true;

            string smtpAddress = "smtp.gmail.com";
            string emailFrom = _email.Text.ToString();
            string password = _password.Text.ToString();
            string emailTo = _theirEmail.Text.ToString();
            string subject = _subject.Text.ToString();
            string body = _body.Value.ToString();

            int smtpClient = _emailProvidor.SelectedIndex;

            switch (smtpClient)
            {
                case 0: //gmail
                    smtpAddress = "smtp.gmail.com";
                    break;
                case 1: //yahoo
                    smtpAddress = "smtp.mail.yahoo.com";
                    break;
                case 2: //hotmail
                    smtpAddress = "smtp.live.com";
                    break;
                case 3: //outlook
                    smtpAddress = "mail.outlook.com";
                    break;
            }

            string numberOfEmailsString = _numberOfEmails.Text.ToString();
            int numberOfEmailsInt = 1;
            if (numberOfEmailsString != "")
            {
                numberOfEmailsInt = Int32.Parse(_numberOfEmails.Text.ToString());
            }

            using (MailMessage mail = new MailMessage())
            {
                mail.From = new MailAddress(emailFrom);
                mail.To.Add(emailTo);
                mail.Subject = subject;
                mail.Body = body;
                mail.IsBodyHtml = true;
                // Can set to false, if you are sending pure text.

                using (SmtpClient smtp = new SmtpClient(smtpAddress, portNumber))
                {
                    smtp.Credentials = new NetworkCredential(emailFrom, password);
                    smtp.EnableSsl = enableSSL;
                    try
                    {
                        for (int i = 0; i < numberOfEmailsInt; i++)
                            smtp.Send(mail);
                    }
                    catch (Exception ex)
                    {
                        errorRow.Style.Remove("display");
                        errorRow.Style.Add("display", "inline");
                        _errorMsg.Text = ex.Message.ToString();
                    }
                }
            }
        }
    }
}