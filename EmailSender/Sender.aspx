<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sender.aspx.cs" Inherits="EmailSender.Sender" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Send Email</title>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <center>
            <h1>Send Email(s) to a sad git</h1>
            <table>
                <tr>
                    <td colspan="2" style="display:none;column-span:all" id="errorRow" runat="server">
                        <asp:Label ID="_errorMsg" runat="server" Text="error" CssClass="text-danger"></asp:Label>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td>
                        <h4>Your Email:</h4>
                    </td>
                    <td>
                        <asp:TextBox ID="_email" runat="server" CssClass="text-success" Width="100%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h4>Your Password:</h4>
                    </td>
                    <td>
                        <asp:TextBox ID="_password" runat="server" CssClass="text-success" Width="100%" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h4>Recipient Email:</h4>
                    </td>
                    <td>
                        <asp:TextBox ID="_theirEmail" runat="server" CssClass="text-info" Width="100%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h4>Subject:</h4>
                    </td>
                    <td>
                        <asp:TextBox ID="_subject" runat="server" CssClass="text-info" Width="100%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h4>Body:</h4>
                    </td>
                    <td>
                        <textarea id="_body" rows="5" cols="50" CssClass="text-info" runat="server"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h4>Number of emails to send <br /> (max 200), defult: 1</h4>
                    </td>
                    <td>
                        <asp:TextBox ID="_numberOfEmails" runat="server" CssClass="text-info" Width="100%"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td colspan="2">
                        <asp:RadioButtonList ID="_emailProvidor" runat="server"  CssClass="btn-group">
                            <asp:ListItem Selected="True" Text="Gmail" Value="gmail">Gmail</asp:ListItem>
                            <asp:ListItem Text="Yahoo" Value="yahoo">Yahoo Mail</asp:ListItem>
                            <asp:ListItem Text="Hotmail" Value="hotmail">Hotmail /Live</asp:ListItem>
                            <asp:ListItem Text="Outlook" Value="outlook">Outlook</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
            </table>
            <br />
            <asp:Button ID="_sendEmail" runat="server" Text="Send Emails" OnClick="sendEmail_Click" CssClass="btn btn-success"/>
        </center>
    </div>       
    </form>
</body>
</html>
