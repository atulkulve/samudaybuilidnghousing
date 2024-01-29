<%@ Page Language="VB" AutoEventWireup="false" CodeFile="EMIDemandLetter.aspx.vb" Inherits="mmsoft_Letters" %>

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
                <td colspan="6" style="text-align: center; height: 27px;">
                    <span style="font-size: 14pt; font-family: Verdana"><strong>Samuday Gruh Nirmiti Pvt.
                        Ltd.</strong></span></td>
            </tr>
            <tr style="font-size: 12pt">
                <td colspan="6" style="height: 21px; text-align: center">
                    <span style="font-family: Verdana; font-size: 8pt;">CIN : - V45201MH2014PTC251873</span></td>
            </tr>
            <tr style="font-size: 12pt">
                <td colspan="6" style="text-align: center">
                    <hr />
                    <span style="font-family: Verdana"><span style="font-size: 10pt"><span style="font-size: 8pt">
                        F-1, First Floor, Eternity Mall, Teen Haath Naka, Thane - 400604. 022-25814015/16/17.
                        Email Id: samudaygruhnirmiti@gmail.com
                        <br />
                        Website: www.samudaygroup.com</span><br />
                    </span>
                        <hr style="font-size: 12pt" />
                    </span>
                </td>
            </tr>
            <tr style="font-size: 12pt">
                <td colspan="2" style="height: 21px">
                </td>
                <td style="width: 1410px; height: 21px;">
                </td>
                <td style="width: 7565px; text-align: center; height: 21px;">
                    <span style="font-family: Verdana"><strong>EMI Due</strong></span></td>
                <td colspan="2" style="text-align: right; height: 21px;">
                </td>
            </tr>
            <tr style="font-size: 12pt">
                <td colspan="2" style="height: 5px">
                </td>
                <td style="width: 1410px; height: 5px;">
                </td>
                <td style="width: 7565px; height: 5px;">
                </td>
                <td colspan="2" style="text-align: right; height: 5px;">
                    <span style="font-family: Verdana"><span style="font-size: 10pt">Date: - </span>
                        <asp:Label ID="lbldate" runat="server" Font-Names="Verdana" Font-Size="10pt" Text="Label"
                            Width="106px"></asp:Label></span></td>
            </tr>
            <tr style="font-size: 12pt">
                <td colspan="2">
                    <span style="font-size: 10pt; font-family: Verdana">To,</span></td>
                <td style="width: 1410px; font-size: 12pt;">
                </td>
                <td style="width: 7565px; font-size: 12pt;">
                </td>
                <td colspan="2" style="font-size: 12pt">
                </td>
            </tr>
            <tr style="font-size: 12pt">
                <td colspan="3">
                    <asp:Label ID="lblname" runat="server" Font-Names="Verdana" Font-Size="10pt" Text="Label"
                        Width="193px" Font-Bold="True"></asp:Label></td>
                <td style="width: 7565px">
                </td>
                <td colspan="2">
                </td>
            </tr>
            <tr style="font-size: 12pt">
                <td colspan="3">
                    <asp:Label ID="lbladd" runat="server" Font-Names="Verdana" Font-Size="10pt" Text="Label"
                        Width="193px"></asp:Label></td>
                <td style="width: 7565px">
                </td>
                <td colspan="2">
                </td>
            </tr>
            <tr style="font-size: 12pt">
                <td colspan="3" style="font-size: 12pt">
                    <span style="font-size: 10pt; font-family: Verdana">Tel. No.
                        <asp:Label ID="lbltelno" runat="server" Font-Names="Verdana" Font-Size="10pt" Text="Label"
                            Width="115px"></asp:Label></span></td>
                <td style="width: 7565px; font-size: 12pt;">
                </td>
                <td colspan="2" style="font-size: 12pt">
                </td>
            </tr>
            <tr style="font-size: 12pt">
                <td colspan="6" style="text-align: center; height: 18px;">
                    <span style="font-family: Verdana"><span style="font-size: 10pt"><strong>Sub:</strong>
                        Request for Payment on EMI Due.</span></span></td>
            </tr>
            <tr style="font-size: 12pt">
                <td colspan="6" style="height: 21px; text-align: center;">
                    <span style="font-family: Verdana"><span style="font-size: 10pt"><strong>Flat No: -</strong>
                    </span>
                        <asp:Label ID="lblFlatNo" runat="server" Font-Names="Verdana" Font-Size="10pt" Text="Label"></asp:Label><span
                            style="font-size: 10pt">,
                        Wing No: - </span>
                        <asp:Label ID="lblbuilding" runat="server" Font-Names="Verdana" Font-Size="10pt" Text="Label"></asp:Label><span
                            style="font-size: 10pt">,
                        Area: - </span>
                        <asp:Label ID="lblsqft" runat="server" Font-Names="Verdana" Font-Size="10pt" Text="Label"></asp:Label><span
                            style="font-size: 10pt">
                        Sq. Ft.</span></span></td>
            </tr>
            <tr style="font-size: 12pt">
                <td style="width: 51px">
                </td>
                <td style="width: 225px">
                    <span style="font-size: 10pt; font-family: Verdana">Dear Sir/Madam,</span></td>
                <td style="width: 1410px">
                </td>
                <td style="width: 7565px">
                </td>
                <td style="width: 2855px">
                </td>
                <td style="width: 124px">
                </td>
            </tr>
            <tr style="font-size: 12pt">
                <td colspan="1" style="width: 51px; height: 48px;">
                </td>
                <td colspan="4" style="height: 48px"><p style="text-align: justify">
                    <span style="font-size: 10pt; font-family: Verdana">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span style="font-size: 12pt"><span style="font-size: 10pt">We
                            have not received your payment for below installments: -</span></span></span></p>
                </td>
                <td colspan="1" style="font-size: 12pt; height: 48px; width: 124px;">
                </td>
            </tr>
            <tr style="font-size: 12pt">
                <td style="width: 51px; height: 21px;">
                </td>
                <td style="height: 21px; text-align: center;" colspan="4">
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp;
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        DataSourceID="sqlinstallments" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333"
                        GridLines="None" Height="121px" Width="833px">
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:BoundField DataField="installment_name" HeaderText="Installments" SortExpression="installment_name" />
                            <asp:BoundField DataField="installment_date" DataFormatString="{0:dd-MMM-yy}" HeaderText="Installment Date"
                                SortExpression="installment_date" />
                            <asp:BoundField DataField="installamt" HeaderText="Amount" SortExpression="installamt" />
                        </Columns>
                        <RowStyle BackColor="#EFF3FB" />
                        <EditRowStyle BackColor="#2461BF" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="sqlinstallments" runat="server" ConnectionString="<%$ ConnectionStrings:conMM %>"
                        SelectCommand="select Top 1 installment_name,installment_date,installamt  from vw_roominstallments where RoomId = @RoomID order by installment_date">
                        <SelectParameters>
                            <asp:SessionParameter Name="RoomID" SessionField="RoomID" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <span style="font-family: Verdana"><span style="font-size: 10pt"> </span>
                        </span></td>
                <td style="width: 124px; height: 21px;">
                </td>
            </tr>
            <tr style="font-size: 12pt">
                <td style="width: 51px; height: 21px">
                </td>
                <td colspan="4" style="height: 21px">
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="font-size: 10pt"><span style="font-family: Verdana">Please send the above at the earliest.</span></span></td>
                <td style="width: 124px; height: 21px">
                </td>
            </tr>
            <tr style="font-size: 12pt">
                <td style="width: 51px; height: 21px">
                </td>
                <td style="width: 225px; height: 21px">
                </td>
                <td style="width: 1410px; height: 21px">
                </td>
                <td style="width: 7565px; height: 21px">
                </td>
                <td style="width: 2855px; height: 21px">
                </td>
                <td style="width: 124px; height: 21px">
                </td>
            </tr>
            <tr style="font-size: 12pt">
                <td style="width: 51px; height: 21px">
                </td>
                <td style="width: 225px; height: 21px">
                </td>
                <td style="width: 1410px; height: 21px">
                </td>
                <td style="width: 7565px; height: 21px">
                </td>
                <td style="width: 2855px; height: 21px">
                </td>
                <td style="width: 124px; height: 21px">
                </td>
            </tr>
            <tr style="font-size: 12pt">
                <td style="width: 51px; height: 21px">
                </td>
                <td style="width: 225px; height: 21px">
                </td>
                <td style="width: 1410px; height: 21px">
                </td>
                <td style="width: 7565px; height: 21px">
                </td>
                <td style="width: 2855px; height: 21px">
                </td>
                <td style="width: 124px; height: 21px">
                </td>
            </tr>
            <tr style="font-size: 12pt">
                <td style="width: 51px; height: 21px">
                </td>
                <td style="height: 21px" colspan="2">
                    <span style="font-size: 10pt; font-family: Verdana">With Regards, Thanking you</span></td>
                <td style="width: 7565px; height: 21px">
                </td>
                <td style="width: 2855px; height: 21px">
                </td>
                <td style="width: 124px; height: 21px">
                </td>
            </tr>
            <tr style="font-size: 12pt">
                <td style="width: 51px; height: 21px">
                </td>
                <td style="width: 225px; height: 21px">
                </td>
                <td style="width: 1410px; height: 21px">
                </td>
                <td style="width: 7565px; height: 21px">
                </td>
                <td style="width: 2855px; height: 21px; text-align: right">
                    <span style="font-size: 10pt; font-family: Verdana">Your Truely</span></td>
                <td style="width: 124px; height: 21px">
                </td>
            </tr>
            <tr style="font-size: 12pt">
                <td style="width: 51px;">
                </td>
                <td style="width: 225px;">
                </td>
                <td style="width: 1410px;">
                </td>
                <td style="text-align: right;" colspan="2">
                    <span style="font-size: 10pt; font-family: Verdana">FOR SAMUDAY GRUH NIRMITI PVT. LTD..</span></td>
                <td style="width: 124px;">
                </td>
            </tr>
            <tr style="font-size: 12pt">
                <td style="width: 51px; height: 21px">
                </td>
                <td style="width: 225px; height: 21px">
                </td>
                <td style="width: 1410px; height: 21px">
                </td>
                <td style="width: 7565px; height: 21px">
                </td>
                <td style="width: 2855px; height: 21px">
                </td>
                <td style="width: 124px; height: 21px">
                </td>
            </tr>
            <tr style="font-size: 12pt">
                <td style="width: 51px; height: 21px">
                </td>
                <td style="width: 225px; height: 21px">
                </td>
                <td style="width: 1410px; height: 21px">
                </td>
                <td style="width: 7565px; height: 21px">
                </td>
                <td style="width: 2855px; height: 21px">
                </td>
                <td style="width: 124px; height: 21px">
                </td>
            </tr>
            <tr style="font-size: 12pt">
                <td style="width: 51px; height: 21px">
                </td>
                <td style="width: 225px; height: 21px">
                </td>
                <td style="width: 1410px; height: 21px">
                </td>
                <td style="width: 7565px; height: 21px">
                </td>
                <td style="width: 2855px; height: 21px">
                </td>
                <td style="width: 124px; height: 21px">
                </td>
            </tr>
            <tr style="font-size: 12pt">
                <td style="width: 51px; height: 21px">
                </td>
                <td style="width: 225px; height: 21px">
                </td>
                <td style="width: 1410px; height: 21px">
                </td>
                <td colspan="2" style="height: 21px; text-align: right">
                    <span style="font-size: 10pt; font-family: Verdana">AUTHORIED SIGNATURE</span></td>
                <td style="width: 124px; height: 21px">
                </td>
            </tr>
            <tr style="font-size: 12pt">
                <td style="width: 51px; height: 21px">
                </td>
                <td style="width: 225px; height: 21px">
                </td>
                <td style="width: 1410px; height: 21px">
                </td>
                <td style="width: 7565px; height: 21px">
                </td>
                <td style="width: 2855px; height: 21px">
                </td>
                <td style="width: 124px; height: 21px">
                </td>
            </tr>
            <tr style="font-size: 12pt">
                <td style="width: 51px; height: 21px">
                </td>
                <td style="width: 225px; height: 21px">
                </td>
                <td style="width: 1410px; height: 21px">
                </td>
                <td style="width: 7565px; height: 21px">
                </td>
                <td style="width: 2855px; height: 21px">
                </td>
                <td style="width: 124px; height: 21px">
                </td>
            </tr>
            <tr style="font-size: 12pt">
                <td style="width: 51px; height: 21px">
                </td>
                <td style="width: 225px; height: 21px">
                </td>
                <td style="width: 1410px; height: 21px">
                </td>
                <td style="width: 7565px; height: 21px">
                </td>
                <td style="width: 2855px; height: 21px">
                </td>
                <td style="width: 124px; height: 21px">
                </td>
            </tr>
            <tr style="font-size: 12pt">
                <td colspan="6" style="height: 21px">
                    <span style="font-size: 10pt; font-family: Verdana"><strong><hr />
                        Note: If you have already paid the amount then kindly ignore this letter.
                        <hr />
                    </strong></span>
                </td>
            </tr>
            <tr style="font-size: 12pt">
                <td style="width: 51px; height: 21px">
                </td>
                <td style="width: 225px; height: 21px">
                </td>
                <td style="width: 1410px; height: 21px">
                </td>
                <td style="width: 7565px; height: 21px">
                </td>
                <td style="width: 2855px; height: 21px">
                </td>
                <td style="width: 124px; height: 21px">
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
