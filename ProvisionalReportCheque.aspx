<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ProvisionalReportCheque.aspx.vb" Inherits="mmsoft_ProvisionalReportReceipt" %>

<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>
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
                        <td style="width: 229px">
                            <span style="font-size: 8pt; font-family: Verdana">Cheque From date</span></td>
                        <td style="width: 233px">
                            <cc1:GMDatePicker ID="fromdate" runat="server" DateFormat="dd-MMM-yy" DisplayMode="Label"
                                Font-Names="Verdana" Font-Size="8pt" MaxDate="2020-12-31" MinDate="1950-01-01"
                                YearDropDownRange="100">
                            </cc1:GMDatePicker>
                        </td>
                        <td style="width: 242px">
                            <span style="font-size: 8pt; font-family: Verdana">Cheque To Date</span></td>
                        <td style="width: 278px">
                            <cc1:GMDatePicker ID="todate" runat="server" DateFormat="dd-MMM-yy" DisplayMode="Label"
                                Font-Names="Verdana" Font-Size="8pt" MaxDate="2020-12-31" MinDate="1950-01-01"
                                YearDropDownRange="100">
                            </cc1:GMDatePicker>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 229px">
                            <span style="font-size: 8pt; font-family: Verdana">Select Status</span></td>
                        <td style="width: 233px">
                            <asp:DropDownList ID="drpStatus" runat="server">
                                <asp:ListItem Value="0">-- Select --</asp:ListItem>
                                <asp:ListItem>Pending</asp:ListItem>
                                <asp:ListItem>Canceled</asp:ListItem>
                                <asp:ListItem>Bounced</asp:ListItem>
                                <asp:ListItem>Honoured</asp:ListItem>
                            </asp:DropDownList></td>
                        <td style="width: 242px">
                        </td>
                        <td style="width: 278px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 229px">
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
                        <td colspan="3" style="height: 21px">
                            <span style="font-size: 8pt; font-family: Verdana"><strong>Provisional Bills Ranging
                                from </strong></span>
                            <asp:Label ID="lblfrmdate" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt"
                                Text="Label"></asp:Label><strong><span style="font-size: 8pt; font-family: Verdana">
                                    to
                                    <asp:Label ID="lbltodate" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt"
                                        Text="Label"></asp:Label>
                                    which are
                                    <asp:Label ID="lblstatus" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt"
                                        Text="Label"></asp:Label></span></strong></td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 171px">
                            <asp:GridView ID="Grd1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                DataSourceID="SqlDataSource1" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333"
                                GridLines="None">
                                <RowStyle BackColor="#EFF3FB" />
                                <Columns>
                                    <asp:BoundField DataField="ReceiptNos" HeaderText="Receipt Nos" SortExpression="ReceiptNos" />
                                    <asp:BoundField DataField="ReceiptDate" HeaderText="Receipt Date" SortExpression="ReceiptDate" />
                                    <asp:BoundField DataField="FName" HeaderText="First Name" SortExpression="FName" />
                                    <asp:BoundField DataField="LName" HeaderText="Last Name" SortExpression="LName" />
                                    <asp:BoundField DataField="telno" HeaderText="Tel No." SortExpression="telno" />
                                    <asp:BoundField DataField="Mobno" HeaderText="Mob no" SortExpression="Mobno" />
                                    <asp:BoundField DataField="RoomNumber" HeaderText="Room Number" SortExpression="RoomNumber" />
                                    <asp:BoundField DataField="BldgName" HeaderText="Building" SortExpression="BldgName" />
                                    <asp:BoundField DataField="ReceiptAmt" HeaderText="Receipt Amt" SortExpression="ReceiptAmt" />
                                    <asp:BoundField DataField="AmtInLetters" HeaderText="Amt In Letters" SortExpression="AmtInLetters" />
                                    <asp:BoundField DataField="ModeOfPayment" HeaderText="Mode Of Payment" SortExpression="ModeOfPayment" />
                                    <asp:BoundField DataField="BankName" HeaderText="Bank" SortExpression="BankName" />
                                    <asp:BoundField DataField="BranchName" HeaderText="Branch" SortExpression="BranchName" />
                                    <asp:BoundField DataField="OtherDetails" HeaderText="Other Details" SortExpression="OtherDetails" />
                                    <asp:BoundField DataField="Chequedate" HeaderText="Cheque Date" SortExpression="Chequedate" />
                                </Columns>
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <EditRowStyle BackColor="#2461BF" />
                                <AlternatingRowStyle BackColor="White" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conMM %>"
                                SelectCommand="SELECT salesDetails.FName, salesDetails.LName, salesDetails.telno, salesDetails.Mobno, Room.RoomNumber, Building.BldgName, ProvBillDetails.ReceiptNos, ProvBillDetails.ReceiptDate, ProvBillDetails.RoomId, ProvBillDetails.ReceiptAmt, ProvBillDetails.AmtInLetters, ProvBillDetails.ModeOfPayment, ProvBillDetails.BankName, ProvBillDetails.BranchName, ProvBillDetails.OtherDetails, ProvBillDetails.Chequedate, ProvBillDetails.Status FROM salesDetails INNER JOIN Room ON salesDetails.RoomId = Room.RoomId INNER JOIN Building ON Room.BldgId = Building.BldgId INNER JOIN ProvBillDetails ON salesDetails.RoomId = ProvBillDetails.RoomId WHERE (ProvBillDetails.Status = @Status) AND (ProvBillDetails.Chequedate BETWEEN @FrmDate AND @Todate) ORDER BY ProvBillDetails.ReceiptNos">
                                <SelectParameters>
                                    <asp:SessionParameter Name="Status" SessionField="Status" />
                                    <asp:SessionParameter Name="FrmDate" SessionField="FrmDate" />
                                    <asp:SessionParameter Name="Todate" SessionField="ToDate" />
                                </SelectParameters>
                            </asp:SqlDataSource>
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
