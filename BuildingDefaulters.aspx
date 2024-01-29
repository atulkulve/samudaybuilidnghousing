<%@ Page Language="VB" AutoEventWireup="false" CodeFile="BuildingDefaulters.aspx.vb" Inherits="mmsoft_BuildingDefaulters" %>

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
                        <td style="width: 134px; height: 21px">
                            <span style="font-size: 8pt; font-family: Verdana">Select Site</span></td>
                        <td style="width: 233px; height: 21px">
                            <asp:DropDownList ID="drpSite" runat="server" AutoPostBack="True" Font-Bold="False"
                                Font-Names="Verdana" Font-Size="8pt" ForeColor="#006699" Height="20px" Width="175px">
                            </asp:DropDownList></td>
                        <td style="width: 242px; height: 21px">
                            <span style="font-size: 8pt; font-family: Verdana">Select Building</span></td>
                        <td style="width: 278px; height: 21px">
                            <asp:DropDownList ID="drpBuilding" runat="server" AutoPostBack="True" Font-Bold="False"
                                Font-Names="Verdana" Font-Size="8pt" ForeColor="#006699" Height="20px" Width="175px">
                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                            </asp:DropDownList></td>
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
                        <td style="width: 134px">
                        </td>
                        <td style="width: 233px">
                        </td>
                        <td style="width: 242px">
                            </td>
                        <td style="width: 278px">
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <table width="100%">
                    <tr>
                        <td colspan="3" style="height: 21px">
                            <span style="font-size: 8pt; font-family: Verdana"><strong>Defaulters for
                                <asp:Label ID="lblbuilding" runat="server" Font-Bold="True" Text="Label"></asp:Label>
                                building</strong></span></td>
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
