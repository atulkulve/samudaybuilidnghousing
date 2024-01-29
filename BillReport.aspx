<%@ Page Language="VB" AutoEventWireup="false" CodeFile="BillReport.aspx.vb" Inherits="mmsoft_BillReport" %>

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
                        <td style="width: 229px">
                            <span style="font-size: 8pt; font-family: Verdana">From Date</span></td>
                        <td style="width: 233px">
                            <cc1:GMDatePicker ID="fromdate" runat="server" DisplayMode="Label" Font-Names="Verdana"
                                Font-Size="8pt" MaxDate="2020-12-31" MinDate="1950-01-01" YearDropDownRange="100" DateFormat="dd-MMM-yy">
                            </cc1:GMDatePicker>
                        </td>
                        <td style="width: 242px">
                            <span style="font-size: 8pt; font-family: Verdana">To Date</span></td>
                        <td style="width: 278px">
                            <cc1:GMDatePicker ID="todate" runat="server" DisplayMode="Label" Font-Names="Verdana"
                                Font-Size="8pt" MaxDate="2020-12-31" MinDate="1950-01-01" YearDropDownRange="100" DateFormat="dd-MMM-yy">
                            </cc1:GMDatePicker>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 229px; height: 22px;">
                        </td>
                        <td style="width: 233px; height: 22px;">
                        </td>
                        <td style="width: 242px; height: 22px;">
                            <asp:ImageButton ID="imbSave" runat="server" ImageUrl="~/softimages/ok.gif" OnClientClick="return ValidateInput();" /></td>
                        <td style="width: 278px; height: 22px;">
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <table width="100%">
                    <tr>
                        <td colspan="3" style="height: 21px">
                            <span style="font-size: 8pt; font-family: Verdana"><strong>Bills Ranging from </strong>
                            </span>
                            <asp:Label ID="lblfrmdate" runat="server" Font-Bold="True" Text="Label" Font-Names="Verdana" Font-Size="8pt"></asp:Label><strong><span
                                style="font-size: 8pt; font-family: Verdana"> to
                                <asp:Label ID="lbltodate" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt"
                                    Text="Label"></asp:Label></span></strong></td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 171px">
                            <asp:GridView ID="Grd1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" Font-Names="Verdana"
                                Font-Size="8pt" ForeColor="#333333" GridLines="None">
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="ReceiptNos" HeaderText="Receipt Nos" SortExpression="ReceiptNos" />
                                   
                                            <asp:BoundField DataField="ReceiptDate" 
                                            DataFormatString="{0:dd-MMM-yy}" 
                                            HeaderText="Receipt Date"                                                    
                                            SortExpression="Receipt Date"                                                     
                                            HtmlEncode="False">
                                            <ItemStyle Wrap="False"/>
                                            </asp:BoundField> 
                                    <asp:BoundField DataField="RoomNumber" HeaderText="Flat Number" SortExpression="RoomNumber" />
                                    <asp:BoundField DataField="BldgName" HeaderText="Building" SortExpression="BldgName" />
                                    <asp:BoundField DataField="FName" HeaderText="First Name" SortExpression="FName" />
                                    <asp:BoundField DataField="LName" HeaderText="Last Name" SortExpression="LName" />
                                    <asp:BoundField DataField="telno" HeaderText="Tel No" SortExpression="telno" />
                                    <asp:BoundField DataField="Mobno" HeaderText="Mob No" SortExpression="Mobno" />
                                    <asp:BoundField DataField="ReceiptAmt" HeaderText="Receipt Amt" SortExpression="ReceiptAmt" />
                                    <asp:BoundField DataField="AmtInLetters" HeaderText="Amt In Letters" SortExpression="AmtInLetters" />
                                    <asp:BoundField DataField="ModeOfPayment" HeaderText="Mode " SortExpression="ModeOfPayment" />
                                    <asp:BoundField DataField="BankName" HeaderText="Bank" SortExpression="BankName" />
                                    <asp:BoundField DataField="BranchName" HeaderText="Branch" SortExpression="BranchName" />
                                    <asp:BoundField DataField="OtherDetails" HeaderText="Other Details" SortExpression="OtherDetails" />
                                    <asp:BoundField DataField="Chequedate" HeaderText="Cheque Date" SortExpression="Chequedate" />
                                    
                                        <asp:BoundField DataField="Chequedate" 
                                        DataFormatString="{0:dd-MMM-yy}" 
                                        HeaderText="Cheque Date"                                                    
                                        SortExpression="Cheque Date"                                                     
                                        HtmlEncode="False">
                                        <ItemStyle Wrap="False"/>
                                        </asp:BoundField> 
                                </Columns>
                                <RowStyle BackColor="#EFF3FB" />
                                <EditRowStyle BackColor="#2461BF" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <AlternatingRowStyle BackColor="White" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conMM %>"
                                SelectCommand="SELECT BillDetails.ReceiptNos, BillDetails.ReceiptDate, BillDetails.RoomId, salesDetails.FName, salesDetails.LName, salesDetails.telno, salesDetails.Mobno, BillDetails.ReceiptAmt, BillDetails.AmtInLetters, BillDetails.ModeOfPayment, BillDetails.BankName, BillDetails.BranchName, BillDetails.OtherDetails, BillDetails.Chequedate, Room.RoomNumber, Building.BldgName FROM BillDetails INNER JOIN salesDetails ON BillDetails.RoomId = salesDetails.RoomId INNER JOIN Room ON salesDetails.RoomId = Room.RoomId INNER JOIN Building ON Room.BldgId = Building.BldgId WHERE (BillDetails.ReceiptDate BETWEEN @FrmDate AND @Todate) ORDER BY BillDetails.ReceiptNos">
                                <SelectParameters>
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
