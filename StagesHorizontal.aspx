<%@ Page Language="VB" AutoEventWireup="false" CodeFile="StagesHorizontal.aspx.vb" Inherits="mmsoft_StagesHorizontal" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
                <table width="100%">
                    <tr>
                        <td style="width: 64px">
                            <span style="font-size: 8pt; font-family: Verdana">Select Site</span></td>
                        <td style="width: 72px">
                            <asp:DropDownList ID="drpsite" runat="server" AutoPostBack="True">
                            </asp:DropDownList></td>
                        <td style="width: 107px">
                            <span style="font-size: 8pt; font-family: Verdana">Select Building</span></td>
                        <td style="width: 107px">
                            <asp:DropDownList ID="drpbuilding" runat="server">
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td style="width: 64px">
                        </td>
                        <td style="width: 72px">
                        </td>
                        <td style="width: 107px">
                            <asp:ImageButton ID="imbSave" runat="server" ImageUrl="~/softimages/ok.gif" OnClientClick="return ValidateInput();" /></td>
                        <td style="width: 107px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 64px">
                        </td>
                        <td style="width: 72px">
                        </td>
                        <td style="width: 107px">
                        </td>
                        <td style="width: 107px">
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <table width="100%">
                    <tr>
                        <td colspan="3">
                            <asp:Label ID="lblbuilding" runat="server"></asp:Label><br />
                            <asp:GridView ID="GridView1" runat="server" BackColor="White"
                                BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4"
                                Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" GridLines="Horizontal">
                                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                            </asp:GridView>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 46px">
                        </td>
                        <td style="width: 72px">
                        </td>
                        <td style="width: 107px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 46px">
                        </td>
                        <td style="width: 72px">
                        </td>
                        <td style="width: 107px">
                        </td>
                    </tr>
                </table>
            </asp:View>
        </asp:MultiView>
    </form>
</body>
</html>
