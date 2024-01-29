<%@ Page Language="VB" AutoEventWireup="false" CodeFile="KaduReport.aspx.vb" Inherits="mmsoft_KaduReport" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table width="100%">
            <tr>
                <td colspan="3" rowspan="1" style="text-align: center">
                    <table border="0" bordercolor="#006699">
                        <tr>
                            <td style="width: 361px; text-align: left">
                                <span style="font-size: 10pt; font-family: Verdana"><span style="font-size: 8pt">Select
                                    Site</span></span></td>
                            <td style="width: 169px; text-align: left">
                                <asp:DropDownList ID="drpsite2" runat="server" AutoPostBack="True" Font-Bold="False"
                                    Font-Names="Verdana" Font-Size="8pt" ForeColor="#006699" Height="20px" Width="175px">
                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                </asp:DropDownList></td>
                            <td style="width: 247px; text-align: left">
                                <span style="font-size: 8pt; font-family: Tahoma">Select Building</span></td>
                            <td style="font-size: 8pt; width: 247px; font-family: Tahoma; text-align: left">
                                <asp:DropDownList ID="drpbuilding2" runat="server" AutoPostBack="True" Font-Bold="False"
                                    Font-Names="Verdana" Font-Size="8pt" ForeColor="#006699" Height="20px" Width="175px">
                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td style="width: 361px; text-align: left">
                                <span style="font-size: 8pt; font-family: Verdana"></span></td>
                            <td style="width: 169px; text-align: left">
                                </td>
                            <td style="width: 247px; text-align: left">
                                <span style="font-size: 8pt; font-family: Tahoma"></span>
                            </td>
                            <td style="font-size: 8pt; width: 247px; font-family: Tahoma; text-align: left">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 416px; height: 1px; text-align: left">
                <asp:GridView ID="gvkadugrid" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                              PageSize="5" Width="97%" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" Font-Names="Verdana" Font-Size="8pt">
                              <FooterStyle CssClass="td_bg_selected3" BackColor="White" ForeColor="#333333" />
                              <Columns>
                                  <asp:TemplateField>
                                      <ItemTemplate>
                                          <input id="HiddenID" runat="server" type="hidden" value='<%# Bind("RoomId") %>' />
                                          <asp:CheckBox ID="chkSelect" runat="server" />
                                      </ItemTemplate>
                                      <ItemStyle Width="25px" />
                                      <HeaderStyle Width="25px" />
                                  </asp:TemplateField>
                                  <asp:BoundField DataField="fname" HeaderText="First Name" />
                                  <asp:BoundField DataField="lname" HeaderText="Last Name" />
                                  <asp:BoundField DataField="telno" HeaderText="Tel Nos." />
                                  <asp:BoundField DataField="Mobno" HeaderText="Mobile Nos." />
                                  <asp:BoundField DataField="KaduAmt" HeaderText="Kadu Amt" SortExpression="KaduAmt">
                                      <ItemStyle HorizontalAlign="Left" />
                                      <HeaderStyle HorizontalAlign="Center" />
                                  </asp:BoundField>
                                  <asp:BoundField HeaderText="Id" Visible="False">
                                      <HeaderStyle HorizontalAlign="Center" />
                                  </asp:BoundField>
                                  <asp:BoundField HeaderText="Action" Visible="False">
                                      <HeaderStyle HorizontalAlign="Center" />
                                  </asp:BoundField>
                                  <%--<asp:HyperLinkField DataNavigateUrlFields="RoomId" DataTextField="RoomId" HeaderText="Room Nos"
                                      SortExpression="RoomId" />--%>
                                      <asp:TemplateField HeaderText="Room Nos" SortExpression="FileUpload">
                                         <ItemTemplate>
                                              <input id="RoomId" runat="server" type="hidden" value='<%# Bind("RoomId") %>' />
                                              <asp:LinkButton ID="lnkRecName" runat="server" Text='<%# container.dataitem("RoomNumber")%>' CommandName="Select" CommandArgument='<%# container.dataitem("RoomId")%>'></asp:LinkButton>
                                                               
                                         </ItemTemplate>
                                         <ItemStyle HorizontalAlign="Center" />
                                      </asp:TemplateField>
                              </Columns>
                              <RowStyle CssClass="td_bg_selected1" BackColor="White" ForeColor="#333333" />
                              <HeaderStyle CssClass="td_bg_selected3" BackColor="#336666" Font-Bold="True" ForeColor="White" />
                              <PagerStyle CssClass="FooterStyle" ForeColor="White" BackColor="#336666" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                          </asp:GridView>
                </td>
                <td colspan="2" rowspan="2" style="text-align: center">
                    <asp:MultiView ID="MultiView1" runat="server">
                        <asp:View ID="View1" runat="server">
                            <span style="font-size: 35px; font-family: Verdana"><span style="color: #cc0000"></span>
                            </span>
                        </asp:View>
                        <asp:View ID="View2" runat="server"><asp:GridView ID="Grid1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                              PageSize="5" Width="97%" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" GridLines="None" Font-Names="Verdana" Font-Size="8pt" CellSpacing="1">
                            <RowStyle CssClass="td_bg_selected1" BackColor="#DEDFDE" ForeColor="Black" />
                            <Columns>
                                <asp:BoundField DataField="RoomNumber" HeaderText="Room Number" />
                                <asp:BoundField DataField="KaduAmt" HeaderText="Kadu Amount" />
                                <asp:BoundField DataField="Kadudate" HeaderText="Kadu Date" />
                            </Columns>
                            <FooterStyle CssClass="td_bg_selected3" BackColor="#C6C3C6" ForeColor="Black" />
                            <PagerStyle CssClass="FooterStyle" ForeColor="Black" BackColor="#C6C3C6" HorizontalAlign="Right" />
                            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle CssClass="td_bg_selected3" BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                        </asp:GridView>
                        </asp:View>
                    </asp:MultiView></td>
            </tr>
            <tr>
                <td style="width: 416px; text-align: left">
                    &nbsp;<br />
                </td>
            </tr>
            <tr>
                <td style="width: 416px; height: 16px">
                    <asp:TextBox ID="txthidden" runat="server" Visible="False"></asp:TextBox></td>
                <td style="width: 254px; height: 16px">
                </td>
                <td style="width: 257px; height: 16px">
                </td>
            </tr>
            <tr>
                <td style="width: 416px">
                    <a href="UserMenu.aspx"><span style="font-size: 8pt; font-family: Verdana"><strong>Back</strong></span></a></td>
                <td style="width: 254px">
                </td>
                <td style="width: 257px">
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
