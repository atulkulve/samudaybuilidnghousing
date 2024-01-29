<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CustFlatDetails.aspx.vb" Inherits="mmsoft_CustFlatDetails" %>

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
                            <span style="font-size: 8pt; font-family: Verdana"><strong>Customer Details Of </strong>
                            </span>
                            <asp:Label ID="lblBldg" runat="server" Font-Bold="True" Text="Label"></asp:Label><span
                                style="font-size: 8pt; font-family: Verdana"><strong> Building of Site </strong>
                            </span>
                            <asp:Label ID="lblSite" runat="server" Font-Bold="True" Text="Label"></asp:Label></td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 134px">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                DataSourceID="SqlDataSource1" Font-Names="verdana" Font-Size="Smaller" ForeColor="#333333"
                                GridLines="None">
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="RoomNumber" HeaderText="RoomNumber" SortExpression="RoomNumber" />
                                    <asp:BoundField DataField="FName" HeaderText="First Name" SortExpression="FName" />
                                    <asp:BoundField DataField="LName" HeaderText="Last Name" SortExpression="LName" />
                                    <asp:BoundField DataField="Add1" HeaderText="Add-1" SortExpression="Add1" />
                                    <asp:BoundField DataField="Add2" HeaderText="Add-2" SortExpression="Add2" />
                                    <asp:BoundField DataField="telno" HeaderText="Tel no" SortExpression="telno" />
                                    <asp:BoundField DataField="Mobno" HeaderText="Mobile no" SortExpression="Mobno" />
                                    <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                                    <asp:BoundField DataField="saledate" 
                                        DataFormatString="{0:dd-MMM-yy}" 
                                        HeaderText="Sale Date"                                                    
                                        SortExpression="Sale Date"                                                     
                                        HtmlEncode="False">
                                        <ItemStyle Wrap="False"/>
                                        </asp:BoundField> 
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
                                SelectCommand="SELECT salesDetails.FName, salesDetails.LName, salesDetails.Add1, salesDetails.Add2, salesDetails.telno, salesDetails.Mobno, salesDetails.email, salesDetails.saledate, salesDetails.Bank, salesDetails.BldgId, Building.BldgName, Room.RoomId, Room.RoomNumber FROM salesDetails INNER JOIN Building ON salesDetails.BldgId = Building.BldgId INNER JOIN Room ON salesDetails.RoomId = Room.RoomId WHERE (salesDetails.BldgId = @blgID) ORDER BY Room.RoomNumber, salesDetails.FName">
                                <SelectParameters>
                                    <asp:SessionParameter Name="blgID" SessionField="blgID" />
                                </SelectParameters>
                            </asp:SqlDataSource>
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
        </asp:MultiView></div>
    </form>
</body>
</html>
