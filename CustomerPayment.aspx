<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CustomerPayment.aspx.vb" Inherits="mmsoft_CustomerPayment" %>

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
                        <td style="width: 134px; height: 21px">
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
                        <td style="width: 134px">
                            <span style="font-size: 8pt; font-family: Verdana">Flat Number</span></td>
                        <td style="width: 233px">
                            <asp:DropDownList ID="drpFlatnumber" runat="server" Font-Bold="False" Font-Names="Verdana"
                                Font-Size="8pt" ForeColor="#006699" Height="20px" Width="175px" AutoPostBack="True">
                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                            </asp:DropDownList></td>
                        <td style="width: 242px">
                            <span style="font-size: 8pt; font-family: Verdana">Sq.Ft.</span></td>
                        <td style="width: 278px">
                            <asp:Label ID="lblsqft" runat="server" Font-Names="Verdana" Font-Size="8pt" Width="62px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 134px">
                        </td>
                        <td style="width: 233px">
                        </td>
                        <td style="width: 242px">
                            <asp:ImageButton ID="imbSave" runat="server" ImageUrl="~/softimages/ok.gif" OnClientClick="return ValidateInput();" /></td>
                        <td style="width: 278px">
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <table width="100%">
                    <tr>
                        <td colspan="3" style="height: 21px; text-align: center">
                            <span style="font-size: 8pt; font-family: Verdana"><strong>Payment Details</strong></span></td>
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
                                    <td style="width: 169px">
                                        <span style="font-size: 8pt; font-family: Verdana">Tel No</span></td>
                                    <td style="width: 383px">
                                        <asp:Label ID="lbltelno" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                            Width="342px"></asp:Label></td>
                                    <td style="width: 185px">
                                        <span style="font-size: 8pt; font-family: Verdana">Area/Sq.Ft.</span></td>
                                    <td>
                                        <asp:Label ID="lblsqft2" runat="server" Font-Names="Verdana" Font-Size="8pt" Width="62px"></asp:Label></td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 169px; height: 28px;">
                                        <span style="font-size: 8pt; font-family: Verdana">Flat Number</span></td>
                                    <td style="width: 383px; height: 28px;">
                                        <asp:Label ID="lblFlatNo" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                            Width="250px"></asp:Label></td>
                                    <td style="width: 185px; height: 28px;">
                                        <span style="font-size: 8pt; font-family: Verdana">Wing No</span></td>
                                    <td style="height: 28px">
                                        <asp:Label ID="lblwingno" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                            Width="150px"></asp:Label></td>
                                    <td style="height: 28px">
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
                                    <td colspan="5" style="height: 1px">
                                        <asp:GridView ID="Grid1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                            CellPadding="4" DataSourceID="SqlDataSource1" Font-Names="Verdana" Font-Size="8pt"
                                            ForeColor="#333333" GridLines="None" Height="1px" PageSize="20" Width="100%">
                                            <FooterStyle BackColor="#507CD1" CssClass="td_bg_selected3" Font-Bold="True" ForeColor="White" />
                                            <Columns>
                                                <asp:BoundField DataField="StageDesc" HeaderText="Stage" SortExpression="StageDesc" />
                                                <asp:BoundField DataField="TotalPayment" HeaderText="Schedule Payment" SortExpression="TotalPayment" />
                                               
                                                        <asp:BoundField DataField="PymtDate" 
                                                        DataFormatString="{0:dd-MMM-yy}" 
                                                        HeaderText="Payment Date"                                                    
                                                        SortExpression="Payment Date"                                                     
                                                        HtmlEncode="False">
                                                        <ItemStyle Wrap="False"/>
                                                        </asp:BoundField> 
                                                <asp:BoundField DataField="PymtMode" HeaderText="Mode Of Payment" SortExpression="PymtMode" />
                                                <asp:BoundField DataField="PymtAmount" HeaderText="Payment Amt" SortExpression="PymtAmount" />
                                                <asp:BoundField DataField="ChqDet" HeaderText="Other Details" SortExpression="ChqDet" />
                                                <asp:BoundField DataField="IntPending" HeaderText="Pending Interest" SortExpression="IntPending" />
                                                <asp:BoundField DataField="intDays" HeaderText="Interest Days" SortExpression="intDays" />
                                            </Columns>
                                            <RowStyle BackColor="#EFF3FB" CssClass="td_bg_selected1" />
                                            <EditRowStyle BackColor="#2461BF" />
                                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle BackColor="#2461BF" CssClass="FooterStyle" ForeColor="White" HorizontalAlign="Center" />
                                            <HeaderStyle BackColor="#507CD1" CssClass="td_bg_selected3" Font-Bold="True" ForeColor="White" />
                                            <AlternatingRowStyle BackColor="White" />
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conMM %>"
                                            SelectCommand="SELECT PymtEntry.PymtEntryId, PymtEntry.PymtId, PymtEntry.PymtDate, PymtEntry.PymtMode, PymtEntry.PymtAmount, PymtEntry.ChqDet, PymtEntry.IntPending, PymtEntry.intDays, Pyment.RoomId, Pyment.DueDate, Pyment.TotalPayment, Pyment.OutStanding, Pyment.BldgStageId, stage.StageId, stage.StageDesc FROM BldgStage INNER JOIN Pyment ON BldgStage.BldgStageId = Pyment.BldgStageId INNER JOIN stage ON BldgStage.StageId = stage.StageId INNER JOIN PymtEntry ON Pyment.PymtId = PymtEntry.PymtId WHERE (Pyment.RoomId = @RoomIid) ORDER BY stage.StageId">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="RoomIid" SessionField="RoomIid" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="5">
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
                                                    <asp:Label ID="lblPaidamt" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
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
                                                    <asp:Label ID="lblAggrementAmt" runat="server" Font-Names="Verdana" Font-Size="8pt"
                                                        Text="Label" Width="90px"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td style="width: 88px">
                                                    <span style="font-size: 8pt; font-family: Verdana">Pending Interest Amount</span></td>
                                                <td style="width: 69px">
                                                    <asp:Label ID="lblPendingInterest" runat="server" Font-Names="Verdana" Font-Size="8pt"
                                                        Text="Label" Width="90px"></asp:Label></td>
                                                <td style="width: 92px">
                                                    <span style="font-size: 8pt; font-family: Verdana">CADU Amount</span></td>
                                                <td style="width: 69px">
                                                    <asp:GridView ID="gvInterest" runat="server" AutoGenerateColumns="False" Font-Names="Verdana"
                                                        Font-Size="7pt" Height="92px" Width="79%">
                                                        <FooterStyle CssClass="td_bg_selected3" />
                                                        <Columns>
                                                            <asp:BoundField DataField="Kadudate" DataFormatString="{0:dd-MMM-yy}" HeaderText="Cadu Date"
                                                                HtmlEncode="False" SortExpression="Due Date">
                                                                <ItemStyle Wrap="False" />
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
                                                    <asp:Label ID="lblKaduAmt" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                                        Width="90px" Visible="False"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td colspan="5">
                                        <table width="100%">
                                            <tr>
                                                <td colspan="4">
                                                    <span style="font-size: 8pt; font-family: Verdana"><strong>Advance Details -</strong>
                                                        <asp:Label ID="lbladvance" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                                            Width="90px" Font-Bold="True"></asp:Label></span></td>
                                            </tr>
                                            <tr>
                                                <td style="width: 88px">
                                                    <span style="font-size: 8pt; font-family: Verdana">Payment Date</span></td>
                                                <td style="width: 69px">
                                                    <asp:Label ID="lblPaydate" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                                        Width="90px"></asp:Label></td>
                                                <td style="width: 92px">
                                                    <span style="font-size: 8pt; font-family: Verdana">Payment Amount</span></td>
                                                <td style="width: 69px">
                                                    <asp:Label ID="lblpayamt" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                                        Width="90px"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td style="width: 88px">
                                                    <span style="font-size: 8pt; font-family: Verdana">Payment Mode</span></td>
                                                <td style="width: 69px">
                                                    <asp:Label ID="lblpaymode" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                                        Width="90px"></asp:Label></td>
                                                <td style="width: 92px">
                                                    <span style="font-size: 8pt; font-family: Verdana">Cheque Date</span></td>
                                                <td style="width: 69px">
                                                    <asp:Label ID="lblchqdet" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                                        Width="90px"></asp:Label></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
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
