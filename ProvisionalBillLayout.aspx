<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ProvisionalBillLayout.aspx.vb" Inherits="mmsoft_ProvisionalBillLayout" %>

<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table width="1150">
            <tr>
                <td>
                    <table width="500">
                        <tr>
                            <td colspan="4" style="text-align: center">
                                <strong><span style="font-size: 14pt; font-family: Verdana">Samuday Gruh Nirmiti Pvt.
                                    Ltd.</span></strong></td>
                        </tr>
                        <tr>
                            <td colspan="4" style="text-align: center; height: 19px;">
                                <span style="font-size: 8pt; font-family: Verdana">F-1, First Floor, Eternity Mall,
                                    Teen Haath Naka, Thane - 400604.<br />
                                    022-25814015/16/17 Email Id: samudaygruhnirmiti@gmail.com
                                    <br />
                                    Website: www.samudaygroup.com</span></td>
                        </tr>
                        <tr>
                            <td colspan="4" style="text-align: center">
                                <hr />
                                <span style="font-size: 8pt; font-family: Verdana">CIN : - V45201MH2014PTC251873 </span>
                                <hr />
                                &nbsp;&nbsp;<span style="font-family: Verdana"><strong>Provisional Receipt
                                    <hr />
                                </strong></span></td>
                        </tr>
                        <tr>
                            <td colspan="4" style="height: 28px; text-align: left">
                                <span style="font-size: 8pt; font-family: Verdana"><strong>Note: This is a temporary
                                    receipt. Proper receipt will be issued after realization of cheque from our bank.</strong></span></td>
                        </tr>
                        <tr>
                            <td colspan="4" style="text-align: left">
                                <hr />
                            </td>
                        </tr>
                        <tr style="font-family: Times New Roman">
                            <td colspan="2">
                                <span style="font-size: 8pt; font-family: Verdana">Provisional Receipt No. </span></td>
                            <td colspan="1" style="width: 1218px">
                                    <asp:Label ID="lblReceiptNos" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label" Font-Bold="True"></asp:Label></td>
                            <td style="width: 1633px; text-align: right;">
                                <span style="font-size: 8pt; font-family: Verdana">Date :
                                    <asp:Label ID="lblBillDate" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"></asp:Label></span></td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <span style="font-size: 8pt; font-family: Verdana">Members Name : </span>
                                <asp:Label ID="lblMembersName" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                    Width="309px" Font-Bold="True"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <span style="font-size: 8pt; font-family: Verdana">Secondary Name :
                                    <asp:Label ID="Label1" runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="8pt"
                                        Text="Label" Width="309px"></asp:Label></span></td>
                        </tr>
                        <tr>
                            <td colspan="4" style="text-align: left">
                                <span style="font-size: 8pt; font-family: Verdana">Flat No.:
                                    <asp:Label ID="lblRoomNo" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label" Width="41px"></asp:Label>
                                    &nbsp; &nbsp; &nbsp;
                                    Building No.:
                                    <asp:Label ID="lblBuildingName" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label" Width="66px"></asp:Label>
                                    <asp:Label ID="lblnear" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                        Visible="False"></asp:Label></span></td>
                        </tr>
                        <tr>
                            <td style="height: 18px;" colspan="4">
                                <span style="font-size: 8pt; font-family: Verdana">have made the payment by
                                    <asp:Label ID="lblmode" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"></asp:Label>,
                                    particulars as below</span></td>
                        </tr>
                        <tr>
                            <td colspan="4" style="height: 18px">
                                <asp:GridView ID="Gridview1" runat="server" AllowPaging="True" Height="1px" PageSize="20"
                                    Width="100%" Font-Names="Verdana" Font-Size="8pt">
                                    <FooterStyle CssClass="td_bg_selected3" />
                                    <RowStyle CssClass="td_bg_selected1" />
                                    <PagerStyle CssClass="FooterStyle" ForeColor="White" />
                                    <HeaderStyle CssClass="td_bg_selected3" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 74px">
                            </td>
                            <td style="width: 1727px">
                            </td>
                            <td style="width: 1218px">
                            </td>
                            <td style="width: 1633px">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="height: 18px">
                                <span style="font-size: 8pt; font-family: Verdana">Amount In Words :</span></td>
                            <td colspan="2" style="height: 18px">
                                <asp:Label ID="lblamtinwords" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                    Width="269px"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <span style="font-size: 8pt; font-family: Verdana">Cash/Cheque Details:
                                    <asp:Label ID="lblotherdetails" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                        Width="123px"></asp:Label>
                                    Bank :
                                    <asp:Label ID="lblbank" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                        Width="170px"></asp:Label></span></td>
                        </tr>
                        <tr>
                            <td style="height: 13px" colspan="4">
                                <span style="font-size: 8pt; font-family: Verdana">Branch :
                                    <asp:Label ID="lblbranch" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                        Width="123px"></asp:Label></span></td>
                        </tr>
                        <tr>
                            <td colspan="4" style="height: 13px; text-align: left">
                                <span style="font-size: 8pt; font-family: Verdana">Cheque Date:
                                    <asp:Label ID="lblcheqdate" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                        Width="185px"></asp:Label></span></td>
                        </tr>
                        <tr>
                            <td style="width: 74px; height: 13px">
                            </td>
                            <td style="width: 1727px; height: 13px">
                            </td>
                            <td style="width: 1218px; height: 13px">
                            </td>
                            <td style="width: 1633px; height: 13px; text-align: left;">
                                <span style="font-size: 8pt; font-family: Verdana">For Samuday Gruh Nirmiti Pvt. Ltd.</span></td>
                        </tr>
                        <tr>
                            <td colspan="4" style="height: 13px">
                                <span style="font-size: 8pt; font-family: Verdana">Note:</span></td>
                        </tr>
                        <tr>
                            <td colspan="4" style="height: 13px">
                                <span style="font-size: 8pt; font-family: Verdana">Any queries send Email: accounts@samudaygroup.com</span></td>
                        </tr>
                        <tr>
                            <td colspan="4" style="height: 13px">
                                <span style="font-size: 8pt; font-family: Verdana">Website: www.samudaygroup.com</span></td>
                        </tr>
                        <tr>
                            <td style="width: 74px; height: 13px">
                            </td>
                            <td style="width: 1727px; height: 13px">
                            </td>
                            <td style="width: 1218px; height: 13px">
                            </td>
                            <td style="width: 1633px; height: 13px; text-align: right">
                                <span style="font-size: 8pt; font-family: Verdana">Authorized Signature</span></td>
                        </tr>
                        <tr>
                            <td style="width: 74px; height: 13px">
                            </td>
                            <td style="width: 1727px; height: 13px">
                            </td>
                            <td style="width: 1218px; height: 13px">
                            </td>
                            <td style="width: 1633px; height: 13px">
                            </td>
                        </tr>
                    </table>
                </td>
                <td  style="font-size: 12pt; font-family: Times New Roman" width=50>
                </td>
                <td style="font-size: 12pt; font-family: Times New Roman" background="../softimages/background_modified.jpg">
                </td>
                <td style="font-size: 12pt; width: 128738px; font-family: Times New Roman">
                </td>
                <td style="width: 89px; font-size: 12pt; font-family: Times New Roman;">
                <table width="500">
                    <tr>
                        <td colspan="4" style="text-align: center">
                            <strong><span style="font-size: 14pt; font-family: Verdana">Samuday Gruh Nirmiti Pvt.
                                Ltd.</span></strong></td>
                    </tr>
                    <tr>
                        <td colspan="4" style="text-align: center">
                            <span style="font-size: 8pt; font-family: Verdana">F-1, First Floor, Eternity Mall,
                                Teen Haath Naka, Thane - 400604.<br />
                                022-25814015/16/17 Email Id: samudaygruhnirmiti@gmail.com
                                <br />
                                Website: www.samudaygroup.com</span></td>
                    </tr>
                    <tr>
                        <td colspan="4" style="text-align: center">
                            <hr />
                            <span style="font-size: 8pt; font-family: Verdana">CIN : - V45201MH2014PTC251873 </span>
                            <hr />
                            <strong><span style="font-family: Verdana">Provisional Receipt<br />
                                <hr /></span></strong>
                            </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="text-align: left">
                            <strong><span style="font-size: 8pt; font-family: Verdana">Note: This is a temporary
                                receipt. Proper receipt will be issued after realization of cheque from our bank.</span></strong></td>
                    </tr>
                    <tr>
                        <td colspan="4" style="text-align: left">
                            <hr />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 18px">
                            <span style="font-size: 8pt; font-family: Verdana">Provisional Receipt No. </span></td>
                        <td colspan="1" style="height: 18px">
                                <asp:Label ID="lblReceiptNos2" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label" Font-Bold="True"></asp:Label></td>
                        <td style="width: 1633px; text-align: right; height: 18px;">
                            <span style="font-size: 8pt; font-family: Verdana">Date :
                                <asp:Label ID="lblBillDate2" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"></asp:Label></span></td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <span style="font-size: 8pt; font-family: Verdana">Members Name : </span>
                            <asp:Label ID="lblMembersName2" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                Width="328px" Font-Bold="True"></asp:Label></td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <span style="font-size: 8pt; font-family: Verdana">Secondary Name :
                                <asp:Label ID="Label2" runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="8pt"
                                    Text="Label" Width="328px"></asp:Label></span></td>
                    </tr>
                    <tr>
                        <td colspan="4" style="text-align: left">
                            <span style="font-size: 8pt; font-family: Verdana">Flat No.
                                <asp:Label ID="lblRoomNo2" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"></asp:Label>
                                Building No.:
                                <asp:Label ID="lblBuildingNo2" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"></asp:Label>
                                <asp:Label ID="lblnear2" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label" Visible="False"></asp:Label></span></td>
                    </tr>
                    <tr>
                        <td style="height: 18px;" colspan="4">
                            <span style="font-size: 8pt; font-family: Verdana">have made the payment by
                                <asp:Label ID="lblmode2" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"></asp:Label>,
                                particulars as below</span></td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 18px">
                            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" Height="1px" PageSize="20"
                                Width="100%" Font-Names="Verdana" Font-Size="8pt">
                                <FooterStyle CssClass="td_bg_selected3" />
                                <RowStyle CssClass="td_bg_selected1" />
                                <PagerStyle CssClass="FooterStyle" ForeColor="White" />
                                <HeaderStyle CssClass="td_bg_selected3" />
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 74px">
                        </td>
                        <td style="width: 1306px">
                        </td>
                        <td style="width: 976px">
                        </td>
                        <td style="width: 1633px">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <span style="font-size: 8pt; font-family: Verdana">Amount In Words :</span></td>
                        <td colspan="2">
                            <asp:Label ID="lblamtinwords2" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                Width="287px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <span style="font-size: 8pt; font-family: Verdana">Cash/Cheque Details:
                                <asp:Label ID="lblotherdetails2" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                    Width="123px"></asp:Label>
                                Bank :
                                <asp:Label ID="lblbank2" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                    Width="170px"></asp:Label></span></td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 13px">
                            <span style="font-size: 8pt; font-family: Verdana">Branch :
                                <asp:Label ID="lblbranch2" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                    Width="123px"></asp:Label></span></td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 13px">
                            <span style="font-size: 8pt; font-family: Verdana">Cheque Date: </span>
                            <asp:Label ID="lblcheqdate2" runat="server" Font-Names="Verdana" Font-Size="8pt"
                                Text="Label" Width="191px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 74px; height: 13px">
                        </td>
                        <td style="width: 1306px; height: 13px">
                        </td>
                        <td style="width: 976px; height: 13px">
                        </td>
                        <td style="width: 1633px; height: 13px; text-align: right">
                            <span style="font-size: 8pt; font-family: Verdana"><span style="font-size: 8pt; font-family: Verdana">
                                For Samuday Gruh Nirmiti Pvt. Ltd. </span></span></td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 13px">
                            <span style="font-size: 8pt; font-family: Verdana">Note:</span></td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 13px">
                            <span style="font-size: 8pt; font-family: Verdana">Any queries send Email: accounts@samudaygroup.com</span></td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 13px">
                            <span style="font-size: 8pt; font-family: Verdana">Website: www.samudaygroup.com</span></td>
                    </tr>
                    <tr>
                        <td style="width: 74px; height: 13px">
                        </td>
                        <td style="height: 13px; text-align: right;" colspan="3">
                            <span><span style="font-size: 8pt; font-family: Verdana"> </span><span style="font-size: 8pt;
                                font-family: Verdana">Authorized Signature</span></span></td>
                    </tr>
                    <tr>
                        <td style="width: 74px; height: 13px">
                        </td>
                        <td style="width: 1306px; height: 13px">
                        </td>
                        <td style="width: 976px; height: 13px">
                        </td>
                        <td style="width: 1633px; height: 13px">
                            <span style="font-size: 8pt;
                                font-family: Verdana">Member <span style="font-size: 8pt;
                                font-family: Verdana">Acknowledgement</span></span></td>
                    </tr>
                </table>
                </td>
            </tr>
            <tr>
                <td colspan="5" style="font-size: 12pt; font-family: Times New Roman"><hr />
                </td>
            </tr>
            <tr>
                <td>
                    <cc1:GMDatePicker ID="ReceiptDate" runat="server" DisplayMode="Label" Font-Names="Verdana"
                        Font-Size="8pt" MaxDate="2020-12-31" MinDate="1950-01-01" Visible="False" YearDropDownRange="100">
                    </cc1:GMDatePicker>
                </td>
                <td style="font-size: 12pt; font-family: Times New Roman">
                </td>
                <td style="font-size: 12pt; font-family: Times New Roman">
                </td>
                <td style="font-size: 12pt; width: 128738px; font-family: Times New Roman">
                </td>
                <td style="font-size: 12pt; width: 89px; font-family: Times New Roman">
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
