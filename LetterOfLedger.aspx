<%@ Page Language="VB" AutoEventWireup="false" CodeFile="LetterOfLedger.aspx.vb" Inherits="mmsoft_LetterOfLedger" %>
<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
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
                            <span style="font-size: 8pt; font-family: Verdana">Date of Print</span></td>
                        <td style="width: 233px">
                            <cc1:GMDatePicker ID="Printdate" runat="server" DateFormat="dd-MMM-yy" DisplayMode="Label"
                                Font-Names="Verdana" Font-Size="8pt" MaxDate="2020-12-31" MinDate="1950-01-01"
                                YearDropDownRange="100">
                            </cc1:GMDatePicker>
                        </td>
                        <td style="width: 242px">
                        </td>
                        <td style="width: 278px">
                        </td>
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
                            <span style="font-size: 14pt; font-family: Verdana"><strong>JIDNYASA CO.OP HSG SOCIETY
                                LTD.</strong></span></td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 21px; text-align: center">
                            <span style="font-size: 8pt; font-family: Verdana">Jidnyasa Co-op. Hsg. Society Ltd.
                                A-1/107, 1st Floor, Opp. Khidkaleshwar Mandir, Kalyan Shil-Phata Road, Thane - 400612.<br />
                                Tel No. 9920465440</span></td>
                    </tr>
                    <tr>
                        <td colspan="3" style="text-align: center">
                            <span style="font-size: 8pt; font-family: Verdana">
                                <span style="font-size: 12pt; font-family: Times New Roman">&nbsp;</span>Registration
                                No. 15520 Date: - 11-06-2004</span>
                            <hr style="font-size: 12pt; font-family: Times New Roman" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="text-align: right">
                            <asp:Label ID="lbldate" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt"
                                Text="Label"></asp:Label></td>
                    </tr>
                    <tr>
                        <td colspan="3" style="text-align: left">
                            <table width="100%">
                                <tr>
                                    <td style="width: 105px">
                                        <table border="1" width="100%">
                                            <tr>
                                                <td colspan="3" rowspan="3">
                                                    <strong><span style="font-size: 10pt; font-family: Verdana">To,<br />
                                        <asp:Label ID="lblname" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                            Width="348px" Font-Bold="True"></asp:Label><br />
                                        <asp:Label ID="lbladdress" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                            Width="350px" Font-Bold="True"></asp:Label><br />
                                        <asp:Label ID="lbltelno" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                            Width="350px" Font-Bold="True"></asp:Label></span></strong></td>
                                            </tr>
                                            <tr>
                                            </tr>
                                            <tr>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="width: 66px">
                                    </td>
                                    <td style="width: 100px">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <table width="100%">
                                <tr>
                                    <td style="width: 169px;">
                                        <span style="font-size: 8pt; font-family: Verdana">Sqft</span></td>
                                    <td style="width: 383px;">
                                        <asp:Label ID="lblsqft2" runat="server" Font-Names="Verdana" Font-Size="8pt" Width="62px"></asp:Label></td>
                                    <td style="width: 185px;">
                                        <span style="font-size: 8pt; font-family: Verdana">Building - Room No.</span></td>
                                    <td>
                                        <asp:Label ID="lblwingno" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                            Width="53px"></asp:Label>
                                        -
                                        <asp:Label ID="lblFlatNo" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                            Width="76px"></asp:Label></td>
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
                                    <td colspan="5" style="height: 1px">
                                        <asp:GridView ID="Grid1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                            CellPadding="4" DataSourceID="SqlDataSource1" Font-Names="Verdana" Font-Size="8pt"
                                            ForeColor="#333333" GridLines="None" Height="1px" PageSize="50" Width="100%">
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
                                                    <asp:Label ID="lblKaduAmt" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                                        Width="90px"></asp:Label></td>
                                            </tr>
                                        </table>
                                    </td>
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
                        <td colspan="3">
                            <strong><span style="font-size: 10pt; font-family: Verdana">Note 1: Please confirm the
                                Amount Paid, if any discrepancy inform office within 15 days or your account will
                                be considered confirmed.&nbsp;</span></strong></td>
                    </tr>
                </table>
            </asp:View>
        </asp:MultiView></div>
    </form>
</body>
</html>
