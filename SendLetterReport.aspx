<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SendLetterReport.aspx.vb" Inherits="mmsoft_SendLetterReport" %>

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
                            <asp:DropDownList ID="drpBuilding" runat="server" Font-Bold="False" Font-Names="Verdana"
                                Font-Size="8pt" ForeColor="#006699" Height="20px" Width="175px">
                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td style="width: 134px; height: 21px">
                            <span style="font-size: 8pt; font-family: Verdana">Select Letter</span></td>
                        <td style="width: 233px; height: 21px">
                            <asp:DropDownList ID="drpLetter" runat="server" Font-Bold="False" Font-Names="Verdana"
                                Font-Size="8pt" ForeColor="#006699" Height="20px" Width="175px">
                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                <asp:ListItem Value="1">1st</asp:ListItem>
                                <asp:ListItem Value="2">2nd</asp:ListItem>
                                <asp:ListItem Value="3">3rd</asp:ListItem>
                            </asp:DropDownList></td>
                        <td style="width: 242px; height: 21px">
                        </td>
                        <td style="width: 278px; height: 21px">
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
                            <span style="font-size: 8pt; font-family: Verdana"><strong>Customer Of </strong></span>
                            <asp:Label ID="lblBldg" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt"
                                Text="Label"></asp:Label><span style="font-size: 8pt; font-family: Verdana"><strong>
                                    Building for </strong></span>
                            <asp:Label ID="lblSite" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt"
                                Text="Label"></asp:Label>
                            <strong><span style="font-size: 8pt; font-family: Verdana">Letter</span></strong></td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                DataSourceID="SqlDataSource2" Font-Names="verdana" Font-Size="8pt" ForeColor="#333333"
                                GridLines="None">
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="RoomNumber" HeaderText="Flat Number" SortExpression="RoomNumber" />
                                    <asp:BoundField DataField="FName" HeaderText="First Name" SortExpression="FName" />
                                    <asp:BoundField DataField="LName" HeaderText="Last Name" SortExpression="LName" />
                                   
                                            <asp:BoundField DataField="letterDate" 
                                            DataFormatString="{0:dd-MMM-yy}" 
                                            HeaderText="Letter Date"                                                    
                                            SortExpression="Letter Date"                                                     
                                            HtmlEncode="False">
                                            <ItemStyle Wrap="False"/>
                                            </asp:BoundField> 
                                    <asp:BoundField DataField="OutStanding" HeaderText="Out Standing" SortExpression="OutStanding" />
                                    <asp:BoundField DataField="Interest" HeaderText="Interest" SortExpression="Interest" />
                                    <asp:BoundField DataField="OSWithPending" HeaderText="OS With Pending" SortExpression="OSWithPending" />
                                    <asp:BoundField DataField="Add1" HeaderText="Add1" SortExpression="Add1" />
                                    <asp:BoundField DataField="Add2" HeaderText="Add2" SortExpression="Add2" />
                                    <asp:BoundField DataField="telno" HeaderText="Tel No" SortExpression="telno" />
                                    <asp:BoundField DataField="Mobno" HeaderText="Mob No" SortExpression="Mobno" />
                                    <asp:BoundField DataField="Bank" HeaderText="Bank" SortExpression="Bank" />
                                </Columns>
                                <RowStyle BackColor="#EFF3FB" />
                                <EditRowStyle BackColor="#2461BF" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <AlternatingRowStyle BackColor="White" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:conMM %>"
                                SelectCommand="SELECT LettersHistory.LetterID, LettersHistory.RoomId, salesDetails.FName, salesDetails.LName, salesDetails.Add1, salesDetails.Add2, salesDetails.telno, salesDetails.Mobno, salesDetails.Bank, LettersHistory.letterDate, LettersHistory.SerialNo, LettersHistory.CharSerial, salesDetails.BldgId, Room.RoomNumber, LettersHistory.OutStanding, LettersHistory.Interest, LettersHistory.OSWithPending FROM LettersHistory INNER JOIN salesDetails ON LettersHistory.RoomId = salesDetails.RoomId INNER JOIN Room ON salesDetails.RoomId = Room.RoomId WHERE (salesDetails.BldgId = @BuildId) AND (LettersHistory.CharSerial = @CharSerial) ORDER BY Room.RoomNumber">
                                <SelectParameters>
                                    <asp:SessionParameter Name="BuildId" SessionField="BuildId" />
                                    <asp:SessionParameter Name="CharSerial" SessionField="CharSerial" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/mmsoft/SiteMaster.aspx">Back</asp:HyperLink>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 125px">
                        </td>
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
