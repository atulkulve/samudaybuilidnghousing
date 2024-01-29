<%@ Page Language="VB" AutoEventWireup="false" CodeFile="newlogin.aspx.vb" Inherits="newlogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center">
        <table width="1005">
            <tr>
                <td style="height: 172px">
                    <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0"
                        style="height: 170px" width="1005">
                        <param name="movie" value="softimages/logo_ani.swf">
                        <param name="quality" value="high">
                        <param name="SCALE" value="noborder">
                        <embed height="171" pluginspage="http://www.macromedia.com/go/getflashplayer" quality="high"
                            scale="noborder" src="softimages/logo_ani.swf" type="application/x-shockwave-flash"
                            width="1005"></embed>
                    </object>
                </td>
            </tr>
        </table>
        <br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; <span style="font-size: 16pt;
            font-family: Verdana"><span style="color: #ff0033">You Are already Logged Out! Login
                Again....</span><br />
        </span>
        <br />
        <br />
        <strong><span style="font-family: Verdana; text-decoration: underline">Welcome to Administrative
            Login</span></strong>&nbsp;<br />
        <br />
        <table border="1" bordercolor="#006699" style="width: 298px; height: 12px; background-color: #ced5db">
            <tr>
                <td style="width: 106px; height: 21px; text-align: left">
                    <span style="font-size: 10pt; font-family: Verdana">User Name</span></td>
                <td style="width: 3px; height: 21px; text-align: left">
                    <asp:TextBox ID="txtUname" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="10pt"
                        ForeColor="#006699" Width="200px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 106px; text-align: left">
                    <span style="font-size: 10pt; font-family: Verdana">Password</span></td>
                <td style="width: 3px">
                    <asp:TextBox ID="txtpass" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="10pt"
                        ForeColor="#006699" TextMode="Password" Width="200px"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2" style="height: 26px; text-align: center">
                    <asp:Button ID="btnlogin" runat="server" Font-Names="Verdana" Font-Size="10pt" Text="Login"
                        Width="66px" /></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
