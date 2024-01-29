<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DuplicateReceiptLayout.aspx.vb" Inherits="mmsoft_DuplicateReceiptLayout" %>

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
                            <td colspan="3" style="text-align: center">
                                <strong><span style="font-size: 14pt; font-family: Verdana">JIDNYASA CO.OP HSG SOCIETY
                                    LTD.</span></strong></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="text-align: center">
                                <span style="font-size: 8pt; font-family: Verdana">Jidnyasa Co-op. Hsg. Society Ltd.
                                    A-1/107, 1st Floor, Opp. Khidkaleshwar Mandir, Kalyan Shil-Phata Road, Thane - 400612.<br />
                                    Tel No. 9920465440</span></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="text-align: center">
                                <hr />
                                <span style="font-size: 8pt; font-family: Verdana">Registration No. 15520 Date: - 11-06-2004</span>
                                <hr />
                                &nbsp;&nbsp;<span style="font-family: Verdana">Duplicate Copy</span></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <span style="font-size: 8pt; font-family: Verdana">Receipt No.
                                    <asp:Label ID="lblReceiptNos" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label" Font-Bold="True"></asp:Label></span></td>
                            <td style="width: 1633px; text-align: right;">
                                <span style="font-size: 8pt; font-family: Verdana">Date :
                                    <asp:Label ID="lblBillDate" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"></asp:Label></span></td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <span style="font-size: 8pt; font-family: Verdana">Members Name : </span>
                                <asp:Label ID="lblMembersName" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                    Width="309px" Font-Bold="True"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <span style="font-size: 8pt; font-family: Verdana">Secondary Name :
                                    <asp:Label ID="Label1" runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="8pt"
                                        Text="Label" Width="309px"></asp:Label></span></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="text-align: left">
                                <span style="font-size: 8pt; font-family: Verdana">Flat/Shop No.
                                    <asp:Label ID="lblRoomNo" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label" Width="41px"></asp:Label>
                                    &nbsp; &nbsp; &nbsp;
                                    Building Name :
                                    <asp:Label ID="lblBuildingName" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label" Width="66px"></asp:Label>
                                    <asp:Label ID="lblnear" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label" Width="58px"></asp:Label></span></td>
                        </tr>
                        <tr>
                            <td style="height: 18px;" colspan="3">
                                <span style="font-size: 8pt; font-family: Verdana">have made the payment by
                                    <asp:Label ID="lblmode" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"></asp:Label>,
                                    particulars as below</span></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="height: 18px">
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
                            <td style="width: 829px">
                            </td>
                            <td style="width: 1633px">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="height: 18px">
                                <span style="font-size: 8pt; font-family: Verdana">Amount In Words :</span></td>
                            <td style="width: 1633px; height: 18px;">
                                <asp:Label ID="lblamtinwords" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                    Width="269px"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <span style="font-size: 8pt; font-family: Verdana">Cash/Cheque Details:
                                    <asp:Label ID="lblotherdetails" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                        Width="123px"></asp:Label>
                                    Bank :
                                    <asp:Label ID="lblbank" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                        Width="170px"></asp:Label></span></td>
                        </tr>
                        <tr>
                            <td style="height: 13px" colspan="3">
                                <span style="font-size: 8pt; font-family: Verdana">Branch :
                                    <asp:Label ID="lblbranch" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                        Width="123px"></asp:Label></span></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="height: 13px; text-align: left">
                                <span style="font-size: 8pt; font-family: Verdana">Cheque Date:
                                    <asp:Label ID="lblcheqdate" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                        Width="185px"></asp:Label></span></td>
                        </tr>
                        <tr>
                            <td style="width: 74px; height: 13px">
                            </td>
                            <td style="width: 829px; height: 13px">
                            </td>
                            <td style="width: 1633px; height: 13px; text-align: right;">
                                <span style="font-size: 8pt; font-family: Verdana">For Jidnyasa Co-op Hsg Soc Ltd.</span></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="height: 13px">
                                <span style="font-size: 8pt; font-family: Verdana">Note:</span></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="height: 13px">
                                <span style="font-size: 8pt; font-family: Verdana">Any queries send Email: jidnyasasociety@yahoo.in</span></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="height: 13px">
                                <span style="font-size: 8pt; font-family: Verdana">Website: www.projectjidnyasa.com</span></td>
                        </tr>
                        <tr>
                            <td style="width: 74px; height: 13px">
                            </td>
                            <td style="width: 829px; height: 13px">
                            </td>
                            <td style="width: 1633px; height: 13px; text-align: right">
                                <span style="font-size: 8pt; font-family: Verdana">Secretary/Chairman/Clerk</span></td>
                        </tr>
                        <tr>
                            <td style="width: 74px; height: 13px">
                            </td>
                            <td style="width: 829px; height: 13px">
                            </td>
                            <td style="width: 1633px; height: 13px">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="height: 13px"><hr />
                                <span style="font-size: 8pt; font-family: Verdana">Note : Payment subject to realization of
                                    Cheque</span></td>
                        </tr>
                    </table>
                </td>
                <td  style="font-size: 12pt; font-family: Times New Roman" width=50>
                </td>
                <td style="font-size: 12pt; font-family: Times New Roman" background="../softimages/background_modified.jpg">
                </td>
                <td style="font-size: 12pt; width: 106717px; font-family: Times New Roman" width=100>
                </td>
                <td style="width: 89px; font-size: 12pt; font-family: Times New Roman;">
                <table width="500">
                    <tr>
                        <td colspan="3" style="text-align: center">
                            <strong><span style="font-size: 14pt; font-family: Verdana">JIDNYASA CO.OP HSG SOCIETY
                                LTD.</span></strong></td>
                    </tr>
                    <tr>
                        <td colspan="3" style="text-align: center">
                            <span style="font-size: 8pt; font-family: Verdana">Jidnyasa Co-op. Hsg. Society Ltd.
                                A-1/107, 1st Floor, Opp. Khidkaleshwar Mandir, Kalyan Shil-Phata Road, Thane - 400612.<br />
                                Tel No. 9920465440</span></td>
                    </tr>
                    <tr>
                        <td colspan="3" style="text-align: center">
                            <hr />
                            <span style="font-size: 8pt; font-family: Verdana">Registration No. 15520 Date: - 11-06-2004</span>
                            <hr />
                            <span style="font-family: Verdana">Duplicate Copy</span>
                            &nbsp;&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 18px">
                            <span style="font-size: 8pt; font-family: Verdana">Receipt No.
                                <asp:Label ID="lblReceiptNos2" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label" Font-Bold="True"></asp:Label></span></td>
                        <td style="width: 1633px; text-align: right; height: 18px;">
                            <span style="font-size: 8pt; font-family: Verdana">Date :
                                <asp:Label ID="lblBillDate2" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"></asp:Label></span></td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <span style="font-size: 8pt; font-family: Verdana">Members Name : </span>
                            <asp:Label ID="lblMembersName2" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                Width="328px" Font-Bold="True"></asp:Label></td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <span style="font-size: 8pt; font-family: Verdana">Secondary Name :
                                <asp:Label ID="Label2" runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="8pt"
                                    Text="Label" Width="328px"></asp:Label></span></td>
                    </tr>
                    <tr>
                        <td colspan="3" style="text-align: left">
                            <span style="font-size: 8pt; font-family: Verdana">Flat/Shop No.
                                <asp:Label ID="lblRoomNo2" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"></asp:Label>
                                Building Name :
                                <asp:Label ID="lblBuildingNo2" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"></asp:Label>
                                <asp:Label ID="lblnear2" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"></asp:Label></span></td>
                    </tr>
                    <tr>
                        <td style="height: 18px;" colspan="3">
                            <span style="font-size: 8pt; font-family: Verdana">have made the payment by
                                <asp:Label ID="lblmode2" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"></asp:Label>,
                                particulars as below</span></td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 18px">
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
                        <td style="width: 976px">
                        </td>
                        <td style="width: 1633px">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <span style="font-size: 8pt; font-family: Verdana">Amount In Words :</span></td>
                        <td style="width: 1633px">
                            <asp:Label ID="lblamtinwords2" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                Width="287px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <span style="font-size: 8pt; font-family: Verdana">Cash/Cheque Details:
                                <asp:Label ID="lblotherdetails2" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                    Width="123px"></asp:Label>
                                Bank :
                                <asp:Label ID="lblbank2" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                    Width="170px"></asp:Label></span></td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 13px">
                            <span style="font-size: 8pt; font-family: Verdana">Branch :
                                <asp:Label ID="lblbranch2" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                    Width="123px"></asp:Label></span></td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 13px">
                            <span style="font-size: 8pt; font-family: Verdana">Cheque Date: </span>
                            <asp:Label ID="lblcheqdate2" runat="server" Font-Names="Verdana" Font-Size="8pt"
                                Text="Label" Width="191px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 74px; height: 13px">
                        </td>
                        <td style="width: 976px; height: 13px">
                        </td>
                        <td style="width: 1633px; height: 13px; text-align: right">
                            <span style="font-size: 8pt; font-family: Verdana">For Jidnyasa Co-op Hsg Soc Ltd.</span></td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 13px">
                            <span style="font-size: 8pt; font-family: Verdana">Note:</span></td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 13px">
                            <span style="font-size: 8pt; font-family: Verdana">Any queries send Email: jidnyasasociety@yahoo.in</span></td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 13px">
                            <span style="font-size: 8pt; font-family: Verdana">Website: www.projectjidnyasa.com</span></td>
                    </tr>
                    <tr>
                        <td style="width: 74px; height: 13px">
                        </td>
                        <td style="height: 13px; text-align: right;" colspan="2">
                            <span><span style="font-size: 8pt; font-family: Verdana"> </span><span style="font-size: 8pt;
                                font-family: Verdana">Secretary/Clerk</span></span></td>
                    </tr>
                    <tr>
                        <td style="width: 74px; height: 13px">
                        </td>
                        <td style="width: 976px; height: 13px">
                        </td>
                        <td style="width: 1633px; height: 13px">
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
                            &nbsp; &nbsp; &nbsp;<span style="font-size: 8pt;
                                font-family: Verdana">Member <span style="font-size: 8pt;
                                font-family: Verdana">Acknowledgement</span></span></td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 13px">
                            <hr />
                            <span style="font-size: 8pt; font-family: Verdana">Note :Payment subject to realization of
                                Cheque</span></td>
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
                <td style="font-size: 12pt; width: 106717px; font-family: Times New Roman">
                </td>
                <td style="font-size: 12pt; width: 89px; font-family: Times New Roman">
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
