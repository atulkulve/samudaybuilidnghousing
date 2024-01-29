<%@ Page Language="VB" AutoEventWireup="false" CodeFile="admin_login.aspx.vb" Inherits="admin_module" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>User Login</title>
    <link rel="stylesheet" type="text/css" href ="Css/style.css" />
     <link href="Css/popcalendar.css" rel="stylesheet" style="position: relative" type="text/css" />
    <link href="Css/CalendarControl.css" rel="stylesheet" type="text/css" />
</head>
<script language ="javascript" src="jsFiles/MainJSValidate.js" type ="text/javascript" ></script>
<script language="javascript" type ="text/javascript" >
function validateInput()
{
    if(validateEmpty(document.getElementById('txtUname'),'Enter User Name','Invalid text in User Name'))
    {   
    if(validateEmpty(document.getElementById('txtpass'),'Enter Password','Invalid text in Password'))
    {

        return true;
    }
    }    
    
    return false;
}
</script>

<body style="font-size: 12pt">
    <form id="form1" runat="server">
    <div style="text-align: center">
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <span style="font-family: Verdana">
        <strong><span>Welcome to Admin
            Login</span></strong>&nbsp;</span><br />
        <br />
        	<table  border="0" cellspacing="0" cellpadding="0" style="width: 50%" class="td_bg_1">
    
    
    
        <tr>
                          <td style="width: 3px; height: 5px;"><img src="../softimages/low_curve21.jpg" /></td>
                          <td colspan="3" background="../softimages/low_bor2.gif" style="height: 5px; width: 984px;">
                              
                              </td>
                          <td style="width: 17px; height: 5px;"><img src="../softimages/low_curve3.gif" /></td>
      </tr>
      <tr>
      <td style="width: 3px" background="../softimages/l_bor1.gif"></td>
          <td colspan="3" style="width: 984px;">
        <table border="0"  style="width: 354px; height: 7px; ">
            <tr>
                <td style="width: 127px; height: 21px; text-align: left">
                    &nbsp;</td>
                <td style="width: 1px; height: 21px; text-align: left">
                </td>
            </tr>
            <tr>
                <td style="width: 127px; text-align: left">
                    <span style="font-size: 10pt; font-family: Verdana">User Name</span></td>
                <td style="width: 1px; text-align: left">
                    <asp:TextBox ID="txtUname" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="10pt"
                        ForeColor="#006699" Width="200px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 127px; text-align: left">
                    <span style="font-size: 10pt; font-family: Verdana">Password</span></td>
                <td style="width: 1px">
                    <asp:TextBox ID="txtpass" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt"
                        ForeColor="#006699" TextMode="Password" Width="200px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 127px; text-align: left">
                </td>
                <td style="width: 1px">
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height: 26px; text-align: center">
                    &nbsp;<asp:ImageButton ID="imbSave" runat="server" ImageUrl="~/softimages/submit.gif"
                        OnClientClick="return validateInput();" /></td>
            </tr>
            <tr>
                <td colspan="2" style="height: 26px; text-align: center">
                    &nbsp;</td>
            </tr>
        </table>
          </td>
          <td background="../softimages/low_bor3.gif" style="width: 17px"></td>
      </tr>
      
      <tr>
          <td style="height: 16px; width: 3px;"><img src="../softimages/low_curve1.gif" /></td>
          <td colspan="3" background="../softimages/low_bor4.gif" style="height: 16px; width: 984px;"></td>
          <td style="width: 17px; height: 16px;"><img src="../softimages/low_curve4.gif" /></td>
      </tr>
</table>
    
    </div>
        &nbsp;
    </form>
</body>
</html>