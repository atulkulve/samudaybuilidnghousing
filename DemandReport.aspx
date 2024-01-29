<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DemandReport.aspx.vb" Inherits="mmsoft_DemandReport" %>
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
                        <td style="width: 229px; height: 21px">
                            <span style="font-size: 8pt; font-family: Verdana">Select Site</span></td>
                        <td style="width: 233px; height: 21px">
                            <asp:DropDownList ID="drpSite" runat="server" AutoPostBack="True" Font-Bold="False"
                                Font-Names="Verdana" Font-Size="8pt" ForeColor="#006699" Height="20px" Width="175px">
                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                            </asp:DropDownList></td>
                        <td style="width: 242px; height: 21px">
                            <span style="font-size: 8pt; font-family: Verdana">Select Building</span></td>
                        <td style="width: 278px; height: 21px">
                            <asp:DropDownList ID="drpBuilding" runat="server" Font-Bold="False" Font-Names="Verdana"
                                Font-Size="8pt" ForeColor="#006699" Height="20px" Width="175px">
                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                            </asp:DropDownList></td>
                    </tr>
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
                            <span style="font-size: 8pt; font-family: Verdana"><strong>Demand letters for </strong>
                            </span>
                            <asp:Label ID="lblbldgname" runat="server" Font-Bold="True" Text="Label" Font-Names="Verdana" Font-Size="8pt"></asp:Label><span
                                style="font-size: 8pt; font-family: Verdana"> <strong>Building</strong></span></td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 171px">
                            <asp:GridView ID="GrddemandLetter" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                DataKeyNames="DemandId" DataSourceID="SqlDataSource1" Font-Names="Verdana"
                                Font-Size="8pt" ForeColor="#333333" GridLines="None">
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="RoomNumber" HeaderText="Flat Number" SortExpression="RoomNumber" />
                                    <asp:BoundField DataField="FName" HeaderText="First Name" SortExpression="FName" />
                                    <asp:BoundField DataField="LName" HeaderText="Last Name" SortExpression="LName" />
                                    <asp:BoundField DataField="ScheduleAmt" HeaderText="Schedule Amt" SortExpression="ScheduleAmt" />
                                    <asp:BoundField DataField="PaidAmt" HeaderText="Paid Amt" SortExpression="PaidAmt" />
                                    <asp:BoundField DataField="BalAmt" HeaderText="Bal Amt" SortExpression="BalAmt" />
                                    
                                            <asp:BoundField DataField="DemandDate" 
                                            DataFormatString="{0:dd-MMM-yy}" 
                                            HeaderText="Letter Date"                                                    
                                            SortExpression="Demand Date"                                                     
                                            HtmlEncode="False">
                                            <ItemStyle Wrap="False"/>
                                            </asp:BoundField> 
                                    <asp:BoundField DataField="Add1" HeaderText="Add1" SortExpression="Add1" />
                                    <asp:BoundField DataField="Add2" HeaderText="Add2" SortExpression="Add2" />
                                    <asp:BoundField DataField="Mobno" HeaderText="Mob No" SortExpression="Mobno" />
                                    <asp:BoundField DataField="telno" HeaderText="Tel No" SortExpression="telno" />
                                    <asp:BoundField DataField="Bank" HeaderText="Bank" SortExpression="Bank" />
                                </Columns>
                                <RowStyle BackColor="#EFF3FB" />
                                <EditRowStyle BackColor="#2461BF" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <AlternatingRowStyle BackColor="White" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conMM %>"
                                SelectCommand="SELECT DemandLetter.DemandId, DemandLetter.DemandDate, Building.BldgId, Building.BldgName, DemandLetter.RoomId, Room.RoomNumber, DemandLetter.ScheduleAmt, DemandLetter.PaidAmt, DemandLetter.BalAmt, salesDetails.FName, salesDetails.LName, salesDetails.Add1, salesDetails.Add2, salesDetails.Mobno, salesDetails.telno, salesDetails.Bank FROM Room INNER JOIN Building ON Room.BldgId = Building.BldgId INNER JOIN DemandLetter ON Room.RoomId = DemandLetter.RoomId INNER JOIN salesDetails ON Room.RoomId = salesDetails.RoomId WHERE (Building.BldgId = @Bldid) AND (DemandLetter.DemandDate BETWEEN @FromDate AND @ToDate) ORDER BY Room.RoomNumber">
                                <SelectParameters>
                                    <asp:SessionParameter Name="Bldid" SessionField="Bldid" />
                                    <asp:SessionParameter Name="FromDate" SessionField="FrmDate" />
                                    <asp:SessionParameter Name="ToDate" SessionField="ToDate" />
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
