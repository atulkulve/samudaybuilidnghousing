<%@ Page Language="VB" AutoEventWireup="false" CodeFile="PaymentDetailsReportTransact.aspx.vb" Inherits="mmsoft_PaymentDetailsReportTransact" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
                <table border="0" width="70%">
                    <tr>
                        <td style="width: 179px; height: 21px">
                            <span style="font-size: 8pt; font-family: Verdana">Select Site</span></td>
                        <td style="width: 233px; height: 21px">
                            <asp:DropDownList ID="drpSite" runat="server" AutoPostBack="True" Font-Bold="False"
                                Font-Names="Verdana" Font-Size="8pt" ForeColor="#006699" Height="20px" Width="175px">
                                <asp:ListItem Value="0">--Select--</asp:ListItem>
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
                        <td style="width: 179px">
                            <span style="font-size: 8pt; font-family: Verdana">Flat Number</span></td>
                        <td style="width: 233px">
                            <asp:DropDownList ID="drpFlatnumber" runat="server" Font-Bold="False"
                                Font-Names="Verdana" Font-Size="8pt" ForeColor="#006699" Height="20px" Width="175px" AutoPostBack="True">
                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                            </asp:DropDownList></td>
                        <td style="width: 242px">
                            <span style="font-size: 8pt; font-family: Verdana">Sq.Ft.</span></td>
                        <td style="width: 278px">
                            <asp:Label ID="lblsqft" runat="server" Font-Names="Verdana" Font-Size="8pt" Width="62px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 179px; height: 1px;">
                        </td>
                        <td style="width: 233px; height: 1px;">
                        </td>
                        <td style="width: 242px; height: 1px;">
                                <asp:ImageButton ID="imbSave" runat="server" ImageUrl="~/softimages/ok.gif" OnClientClick="return ValidateInput();" /></td>
                        <td style="width: 278px; height: 1px;">
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <table width="100%">
                    <tr>
                        <td colspan="3" style="height: 21px; text-align: center;">
                            <span style="font-size: 8pt; font-family: Verdana"><strong>Payment Due Details</strong></span></td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <table width="100%">
                                <tr>
                                    <td style="width: 169px">
                                        <span style="font-size: 8pt; font-family: Verdana">Name</span></td>
                                    <td style="width: 383px">
                                        <asp:Label ID="lblname" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                            Width="348px"></asp:Label></td>
                                    <td style="width: 185px">
                                        <span style="font-size: 8pt; font-family: Verdana">Address</span></td>
                                    <td>
                                        <asp:Label ID="lbladdress" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                            Width="342px"></asp:Label></td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 169px; height: 21px;">
                                        <span style="font-size: 8pt; font-family: Verdana">Tel No</span></td>
                                    <td style="width: 383px; height: 21px;">
                                        <asp:Label ID="lbltelno" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                            Width="342px"></asp:Label></td>
                                    <td style="width: 185px; height: 21px;">
                                        <span style="font-size: 8pt; font-family: Verdana">Area/Sq.Ft.</span></td>
                                    <td style="height: 21px">
                                        <asp:Label ID="lblsqft2" runat="server" Font-Names="Verdana" Font-Size="8pt" Width="62px"></asp:Label></td>
                                    <td style="height: 21px">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 169px">
                                        <span style="font-size: 8pt; font-family: Verdana">Flat Number</span></td>
                                    <td style="width: 383px">
                                        <asp:Label ID="lblFlatNo" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                            Width="250px"></asp:Label></td>
                                    <td style="width: 185px">
                                        <span style="font-size: 8pt; font-family: Verdana">Wing No</span></td>
                                    <td>
                                        <asp:Label ID="lblwingno" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                            Width="150px"></asp:Label></td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 169px">
                                        <span style="font-size: 8pt; font-family: Verdana">Rate</span></td>
                                    <td style="width: 383px">
                                        <asp:Label ID="lblrate" runat="server" Font-Names="Verdana" Font-Size="8pt" Width="109px"></asp:Label></td>
                                    <td style="width: 185px">
                                        <span style="font-size: 8pt; font-family: Verdana">Remarks</span></td>
                                    <td>
                                        <asp:Label ID="lblremarks" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                            Width="150px"></asp:Label></td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="5">
                            <asp:GridView ID="Grid1" runat="server" AllowPaging="True" CellPadding="4" Font-Names="Verdana"
                                Font-Size="8pt" ForeColor="#333333" GridLines="None" Height="1px" PageSize="20"
                                Width="100%">
                                <FooterStyle BackColor="#507CD1" CssClass="td_bg_selected3" Font-Bold="True" ForeColor="White" />
                                <RowStyle BackColor="#EFF3FB" CssClass="td_bg_selected1" />
                                <EditRowStyle BackColor="#2461BF" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle BackColor="#2461BF" CssClass="FooterStyle" ForeColor="White" HorizontalAlign="Center" />
                                <HeaderStyle BackColor="#507CD1" CssClass="td_bg_selected3" Font-Bold="True" ForeColor="White" />
                                <AlternatingRowStyle BackColor="White" />
                            </asp:GridView>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <table width="100%">
                                <tr>
                                    <td colspan="4" style="height: 18px">
                                        <span style="font-size: 8pt; font-family: Verdana"><strong>Total : -</strong> </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 88px">
                                        <span style="font-size: 8pt; font-family: Verdana">Scheduled Amount</span></td>
                                    <td style="width: 69px">
                                        <asp:Label ID="lblScheduleAmt" runat="server" Font-Names="Verdana" Font-Size="8pt"
                                            Width="90px"></asp:Label></td>
                                    <td style="width: 92px">
                                        <span style="font-size: 8pt; font-family: Verdana">Paid Amount</span></td>
                                    <td style="width: 69px">
                                        <asp:Label ID="lblPaidamt" runat="server" Font-Names="Verdana" Font-Size="8pt"
                                            Width="90px"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="width: 88px">
                                        <span style="font-size: 8pt; font-family: Verdana">OutStanding Amount</span></td>
                                    <td style="width: 69px">
                                        <asp:Label ID="lbloutstandingamt" runat="server" Font-Names="Verdana" Font-Size="8pt"
                                            Width="90px"></asp:Label></td>
                                    <td style="width: 92px">
                                        <span style="font-size: 8pt; font-family: Verdana">Total Aggrement Amount</span></td>
                                    <td style="width: 69px">
                                        <asp:Label ID="lblAggrementAmt" runat="server" Font-Names="Verdana" Font-Size="8pt" Width="90px"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="width: 88px; height: 65px;">
                                        <span style="font-size: 8pt; font-family: Verdana">Pending Interest Amount</span></td>
                                    <td style="width: 69px; height: 65px;">
                                        <asp:Label ID="lblPendingInterest" runat="server" Font-Names="Verdana" Font-Size="8pt"
                                            Text="Label" Width="90px"></asp:Label></td>
                                    <td style="width: 92px; height: 65px;">
                                        <span style="font-size: 8pt; font-family: Verdana"></span></td>
                                    <td style="width: 69px; height: 65px;">
                                        <asp:GridView ID="gvInterest" runat="server" AutoGenerateColumns="False" Font-Names="Verdana"
                                            Font-Size="7pt" Height="92px" Width="79%" Visible="False">
                                            <FooterStyle CssClass="td_bg_selected3" />
                                            <Columns>
                                               <asp:BoundField DataField="Kadudate" 
                                            DataFormatString="{0:dd-MMM-yy}" 
                                            HeaderText="Cadu Date"                                                    
                                            SortExpression="Due Date"                                                     
                                            HtmlEncode="False">
                                            <ItemStyle Wrap="False"/>
                                            </asp:BoundField> 
                                                <asp:TemplateField HeaderText="Cadu Amount" SortExpression="User_Name">
                                                    <ItemStyle HorizontalAlign="Right" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblUser67" runat="server" Text='<%# Bind("kaduamt") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <RowStyle CssClass="td_bg_selected1" />
                                            <PagerStyle CssClass="FooterStyle" />
                                            <HeaderStyle CssClass="td_bg_selected3" />
                                        </asp:GridView>
                                    </td>
                                </tr>
                            </table>
                                        <asp:Label ID="lblKaduamt" runat="server" Font-Names="Verdana" Font-Size="8pt" Width="90px" Visible="False"></asp:Label></td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <span style="font-size: 8pt; font-family: Verdana">Other Outstanding Amounts</span></td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:GridView ID="gvTransact" runat="server" AutoGenerateColumns="False" BackColor="White"
                                BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" Font-Names="Verdana"
                                Font-Size="8pt" ForeColor="Black" GridLines="Vertical" Width="100%">
                                <FooterStyle BackColor="#CCCC99" CssClass="td_bg_selected3" />
                                <Columns>                                    
                                    <asp:TemplateField HeaderText="Particulars" SortExpression="User_Name">
                                        <ItemStyle HorizontalAlign="Right" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblUser2" runat="server" Text='<%# Bind("ParticularsName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>                                  
                                    <asp:TemplateField HeaderText="Amt" SortExpression="User_Name">
                                        <ItemStyle HorizontalAlign="Right" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblUser3" runat="server" Text='<%# Bind("Transact_Amt") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <RowStyle BackColor="#F7F7DE" CssClass="td_bg_selected1" />
                                <HeaderStyle BackColor="#6B696B" CssClass="td_bg_selected3" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#F7F7DE" CssClass="FooterStyle" ForeColor="Black" HorizontalAlign="Right" />
                                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                <AlternatingRowStyle BackColor="White" />
                            </asp:GridView>
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
        </asp:MultiView></div>
    </form>
</body>
</html>
