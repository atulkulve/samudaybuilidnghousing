<%@ Page Language="VB" AutoEventWireup="false" CodeFile="YearlyRecAmt.aspx.vb" Inherits="mmsoft_YearlyRecAmt" %>

<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Defaulters List</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
                <table border="0" width="70%">
                    <tr>
                        <td colspan="4" style="height: 21px">
                            <span style="font-size: 8pt; font-family: Verdana"></span>
                            <cc1:GMDatePicker ID="fromdate" runat="server" DateFormat="dd-MMM-yy" DisplayMode="Label"
                                Font-Names="Verdana" Font-Size="8pt" MaxDate="2020-12-31" MinDate="1950-01-01"
                                YearDropDownRange="100" Visible="False">
                            </cc1:GMDatePicker>
                            <span style="font-size: 8pt; font-family: Verdana"></span>
                            <cc1:GMDatePicker ID="todate" runat="server" DateFormat="dd-MMM-yy" DisplayMode="Label"
                                Font-Names="Verdana" Font-Size="8pt" MaxDate="2020-12-31" MinDate="1950-01-01"
                                YearDropDownRange="100" Visible="False">
                            </cc1:GMDatePicker>
                            <br />
                            <span style="font-family: Verdana">Please click on <strong>Ok</strong> for Yearly Report</span></td>
                    </tr>
                    <tr>
                        <td style="width: 134px">
                            <span style="font-size: 8pt; font-family: Verdana"></span></td>
                        <td style="width: 233px">
                            </td>
                        <td style="width: 242px">
                            <asp:ImageButton ID="imbSave" runat="server" ImageUrl="~/softimages/ok.gif" OnClientClick="return ValidateInput();" /></td>
                        <td style="width: 278px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 134px; height: 21px;">
                        </td>
                        <td style="width: 233px; height: 21px;">
                            <asp:DropDownList ID="drpBuilding" runat="server" AutoPostBack="True" Font-Bold="False"
                                Font-Names="Verdana" Font-Size="8pt" ForeColor="#006699" Height="20px" Visible="False"
                                Width="175px">
                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                            </asp:DropDownList></td>
                        <td style="width: 242px; height: 21px;">
                            <asp:DropDownList ID="drpSite" runat="server" AutoPostBack="True" Font-Bold="False"
                                Font-Names="Verdana" Font-Size="8pt" ForeColor="#006699" Height="20px" Visible="False"
                                Width="175px">
                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                            </asp:DropDownList></td>
                        <td style="width: 278px; height: 21px;">
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <table width="100%">
                    <tr>
                        <td colspan="3" style="height: 21px">
                            <span style="font-size: 8pt; font-family: Verdana"><strong>Yearly Collection Report</strong></span></td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:GridView ID="Grid1" runat="server" CellPadding="4"
                                ForeColor="#333333" GridLines="None" Font-Names="Verdana" Font-Size="8pt" Height="161px">
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <RowStyle BackColor="#EFF3FB" />
                                <EditRowStyle BackColor="#2461BF" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <AlternatingRowStyle BackColor="White" />
                            </asp:GridView>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 125px">
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/mmsoft/SiteMaster.aspx">Back</asp:HyperLink></td>
                        <td style="width: 83px">
                        </td>
                        <td style="width: 240px">
                        </td>
                    </tr>
                </table>
            </asp:View>
        </asp:MultiView>&nbsp;</div>
    </form>
</body>
</html>
