<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls"
    TagPrefix="BDP" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <strong><span style="font-family: Verdana; text-decoration: underline"></span></strong>
        <span style="font-size: 16pt; font-family: Verdana">&nbsp;<asp:TextBox ID="TextBox1" runat="server" Width="209px"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Button" />
            <asp:Label ID="Label1" runat="server" Font-Size="8pt" Width="108px"></asp:Label>&nbsp;&nbsp;<br />
            <br />
            <asp:RadioButton ID="RadioButton1" runat="server" GroupName="a" />
            <asp:RadioButton ID="RadioButton3" runat="server" /><br />
            <asp:RadioButton ID="RadioButton2" runat="server" GroupName="a" /><br />
            <BDP:BasicDatePicker ID="mydate" runat="server">
            </BDP:BasicDatePicker>
            &nbsp;&nbsp;&nbsp;<br />
            <br />
            <br />
            <br />
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1"
                DataTextField="emp_id" DataValueField="emp_id">
            </asp:DropDownList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conMM %>"
                SelectCommand="SELECT [emp_id] FROM [call_details]"></asp:SqlDataSource>
            <br />
            <br />
            <table border="0" style="width: 680px; height: 15px">
                <tr>
                    <td style="width: 55px; height: 28px; text-align: left">
                        <span style="font-size: 8pt; font-family: Verdana"><strong>Select Customer</strong></span></td>
                    <td style="width: 176px; height: 28px; text-align: left">
                        <asp:DropDownList ID="drpcust" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource1"
                            DataTextField="cust_name" DataValueField="cust_id" Font-Bold="True" ForeColor="#006699"
                            Height="17px" Width="175px">
                            <asp:ListItem>-Select-</asp:ListItem>
                        </asp:DropDownList>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 55px; text-align: left">
                        <span style="font-size: 8pt; font-family: Tahoma">Customer ID</span></td>
                    <td style="width: 176px; text-align: left">
                        <asp:TextBox ID="TextBox2" runat="server" Enabled="False" Font-Bold="True" ForeColor="#006699"
                            Height="17px" Width="175px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: left">
                        <table>
                            <tr>
                                <td colspan="2" style="width: 275px; height: 24px">
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                </td>
                                <td style="width: 696px; height: 24px">
                                    &nbsp;<asp:ImageButton ID="imbEdit" runat="server" ImageUrl="~/softimages/edit_bt.gif"
                                        OnClientClick="return ValidateInpute();" /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </span></div>
    </form>
</body>
</html>
