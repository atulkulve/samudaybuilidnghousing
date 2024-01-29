<%@ Page Language="VB" AutoEventWireup="false" CodeFile="InterestPaymentReport.aspx.vb" Inherits="mmsoft_InterestPaymentReport" %>

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
                                Font-Size="8pt" ForeColor="#006699" Height="20px" Width="175px">
                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                            </asp:DropDownList></td>
                        <td style="width: 242px">
                        </td>
                        <td style="width: 278px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 134px; height: 1px">
                        </td>
                        <td style="width: 233px; height: 1px">
                        </td>
                        <td style="width: 242px; height: 1px">
                            <asp:ImageButton ID="imbSave" runat="server" ImageUrl="~/softimages/ok.gif" OnClientClick="return ValidateInput();" /></td>
                        <td style="width: 278px; height: 1px">
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <table width="100%">
                    <tr>
                        <td colspan="3" style="height: 21px; text-align: center">
                            <span style="font-size: 8pt; font-family: Verdana"><strong> Interest Pending Details</strong></span></td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <table width="100%">
                                <tr>
                                    <td style="width: 169px">
                                        <span style="font-size: 8pt; font-family: Verdana">Flat Number</span></td>
                                    <td style="width: 383px">
                                        <asp:Label ID="lblFlatNo" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                            Width="250px"></asp:Label></td>
                                    <td style="width: 185px">
                                        <span style="font-size: 8pt; font-family: Verdana">Name</span></td>
                                    <td>
                                        <asp:Label ID="lblname" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                            Width="348px"></asp:Label></td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 169px">
                                        <span style="font-size: 8pt; font-family: Verdana">Address</span></td>
                                    <td style="width: 383px">
                                        <asp:Label ID="lbladdress" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                            Width="342px"></asp:Label></td>
                                    <td style="width: 185px">
                                        <span style="font-size: 8pt; font-family: Verdana">Tel No</span></td>
                                    <td>
                                        <asp:Label ID="lbltelno" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                            Width="342px"></asp:Label></td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="5">
                                        <asp:GridView ID="Grid3" runat="server" AllowPaging="True" CellPadding="4" DataSourceID="SqlDataSource2"
                                            Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" GridLines="None" Height="1px"
                                            PageSize="20" Width="100%" AutoGenerateColumns="False">
                                            <FooterStyle BackColor="#507CD1" CssClass="td_bg_selected3" Font-Bold="True" ForeColor="White" />
                                            <RowStyle BackColor="#EFF3FB" CssClass="td_bg_selected1" />
                                            <EditRowStyle BackColor="#2461BF" />
                                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle BackColor="#2461BF" CssClass="FooterStyle" ForeColor="White" HorizontalAlign="Center" />
                                            <HeaderStyle BackColor="#507CD1" CssClass="td_bg_selected3" Font-Bold="True" ForeColor="White" />
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:BoundField DataField="StageDesc" HeaderText="StageDesc" SortExpression="StageDesc" />
                                                <asp:BoundField DataField="PymtAmount" HeaderText="PymtAmount" SortExpression="PymtAmount" />
                                                <asp:BoundField DataField="IntPending" HeaderText="IntPending" SortExpression="IntPending" />
                                                <asp:BoundField DataField="intDays" HeaderText="intDays" SortExpression="intDays" />
                                                <asp:BoundField DataField="InterestMode" HeaderText="InterestMode" SortExpression="InterestMode" />
                                                <asp:BoundField DataField="InterestAmt" HeaderText="InterestAmt" SortExpression="InterestAmt" />
                                                <asp:BoundField DataField="InterestDate" HeaderText="InterestDate" SortExpression="InterestDate" />
                                                <asp:BoundField DataField="InterestDetails" HeaderText="InterestDetails" SortExpression="InterestDetails" />
                                            </Columns>
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:conMM %>"
                                            SelectCommand="SELECT PymtEntry.PymtEntryId, PymtEntry.PymtId, Pyment.RoomId, salesDetails.FName, salesDetails.LName, Building.BldgName, stage.StageDesc, PymtEntry.PymtDate, PymtEntry.PymtMode, PymtEntry.PymtAmount, PymtEntry.IntPending, PymtEntry.intDays, Pyment.DueDate, Pyment.TotalPayment, Pyment.OutStanding, InterestPayment.InterestId, InterestPayment.InterestMode, InterestPayment.InterestAmt, InterestPayment.InterestDate, InterestPayment.InterestDetails FROM BldgStage INNER JOIN stage ON BldgStage.StageId = stage.StageId INNER JOIN Pyment INNER JOIN PymtEntry ON Pyment.PymtId = PymtEntry.PymtId INNER JOIN salesDetails ON Pyment.RoomId = salesDetails.RoomId ON BldgStage.BldgStageId = Pyment.BldgStageId INNER JOIN Building ON salesDetails.BldgId = Building.BldgId INNER JOIN InterestPayment ON PymtEntry.PymtEntryId = InterestPayment.pymtEntryId WHERE (Pyment.RoomId = @RoomId)">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="RoomId" SessionField="RoomId" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        &nbsp; &nbsp;
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
        </asp:MultiView>&nbsp;</div>
    </form>
</body>
</html>
