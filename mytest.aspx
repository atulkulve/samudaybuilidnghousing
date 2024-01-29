<%@ Page Language="VB" AutoEventWireup="false" CodeFile="mytest.aspx.vb" Inherits="mytest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp;
        <asp:Button ID="Button1" runat="server" Text="Button" />&nbsp;
        <br />
        <asp:CheckBoxList ID="CheckBoxList1" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource1"
            DataTextField="model_name" DataValueField="model_name" Height="27px" Width="175px">
        </asp:CheckBoxList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conMM %>"
            SelectCommand="SELECT [model_name] FROM [brandmodel_view]"></asp:SqlDataSource>
        <br />
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" AutoPostBack="True"
            Width="110px">
            <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
        </asp:DropDownList>&nbsp;
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></div>
    </form>
</body>
</html>
