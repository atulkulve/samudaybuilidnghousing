<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DemandLetter2.aspx.vb" Inherits="mmsoft_DemandLetter2" %>
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
                            <span style="font-size: 8pt; font-family: Verdana">Letter Date</span></td>
                        <td style="width: 278px">
                            <cc1:gmdatepicker id="lblLetterdate" runat="server" dateformat="dd-MMM-yy" displaymode="Label"
                                maxdate="2020-12-31" mindate="1950-01-01" yeardropdownrange="100">
                            </cc1:gmdatepicker>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 134px">
                        </td>
                        <td style="width: 233px">
                        </td>
                        <td style="width: 242px">
                            <asp:ImageButton ID="imbSave" runat="server" ImageUrl="~/softimages/print-bt.gif"
                                OnClientClick="return ValidateInput();" /></td>
                        <td style="width: 278px">
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <table width="100%">
                    <tr>
                        <td colspan="6" style="text-align: center">
                            <span style="font-size: 16pt; font-family: Verdana"><strong>JIDNYASA CO.OP HSG SOCIETY
                                LTD.</strong></span></td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td colspan="6" style="height: 21px; text-align: center">
                            <span style="font-size: 8pt; font-family: Verdana">Registration No. 15520 Date: - 11-06-20004</span></td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td colspan="6" style="text-align: center">
                            <hr />
                            <span style="font-family: Verdana"><span style="font-size: 10pt">Jidnyasa Co-op. Hsg.
                                Society Ltd. A-1/107, 1st Floor, Opp. Khidkaleshwar Mandir, Kalyan Shil-Phata Road,
                                <br />
                                Thane - &nbsp;400612. Tel: <span style="font-size: 8pt">9920465440</span>.</span>
                                <hr style="font-size: 12pt" />
                            </span>
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td colspan="2" style="height: 21px">
                        </td>
                        <td style="width: 1410px; height: 21px">
                        </td>
                        <td style="width: 7565px; height: 21px; text-align: center">
                            <span style="font-family: Verdana"><strong>Demand Letter</strong></span></td>
                        <td colspan="2" style="height: 21px; text-align: right">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td colspan="2" style="height: 5px">
                        </td>
                        <td style="width: 1410px; height: 5px">
                        </td>
                        <td style="width: 7565px; height: 5px">
                        </td>
                        <td colspan="2" style="height: 5px; text-align: right">
                            <span style="font-family: Verdana"><span style="font-size: 10pt">Date: - </span>
                                <asp:Label ID="lbldate" runat="server" Font-Names="Verdana" Font-Size="10pt" Text="Label"
                                    Width="106px"></asp:Label></span></td>
                    </tr>
                    <tr style="font-weight: bold; font-size: 12pt">
                        <td colspan="2">
                            <span style="font-size: 10pt; font-family: Verdana">To,</span></td>
                        <td style="font-weight: bold; font-size: 12pt; width: 1410px">
                        </td>
                        <td style="font-weight: bold; font-size: 12pt; width: 7565px">
                        </td>
                        <td colspan="2" style="font-weight: bold; font-size: 12pt">
                        </td>
                    </tr>
                    <tr style="font-weight: bold; font-size: 12pt">
                        <td colspan="2">
                            <asp:Label ID="lblname" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="10pt"
                                Text="Label" Width="193px"></asp:Label></td>
                        <td style="width: 1410px">
                        </td>
                        <td style="width: 7565px">
                        </td>
                        <td colspan="2">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td colspan="2" style="height: 21px">
                            <asp:Label ID="lbladd" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="10pt"
                                Text="Label" Width="193px"></asp:Label></td>
                        <td style="width: 1410px; height: 21px">
                        </td>
                        <td style="width: 7565px; height: 21px">
                        </td>
                        <td colspan="2" style="height: 21px">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td colspan="2">
                            <span style="font-size: 10pt; font-family: Verdana">Tel. No.
                                <asp:Label ID="lbltelno" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="10pt"
                                    Text="Label" Width="115px"></asp:Label></span></td>
                        <td style="font-size: 12pt; width: 1410px">
                        </td>
                        <td style="font-size: 12pt; width: 7565px">
                        </td>
                        <td colspan="2" style="font-size: 12pt">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td colspan="2">
                            <span style="font-size: 10pt; font-family: Verdana">Mob. No.
                                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="10pt"
                                    Text="Label" Width="115px"></asp:Label></span></td>
                        <td style="font-size: 12pt; width: 1410px">
                        </td>
                        <td style="font-size: 12pt; width: 7565px">
                        </td>
                        <td colspan="2" style="font-size: 12pt">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td colspan="6" style="height: 18px; text-align: center">
                            <span style="font-family: Verdana"><span style="font-size: 10pt">Sub: </span>
                                <asp:Label ID="lblbeginstageid" runat="server" Font-Names="Verdana" Font-Size="10pt"
                                    Text="Label"></asp:Label><span style="font-size: 10pt"> Stage, </span>
                                <asp:Label ID="lblbeginstagename" runat="server" Font-Names="Verdana" Font-Size="10pt"
                                    Text="Label"></asp:Label><span style="font-size: 10pt"> </span><span><span style="font-size: 10pt">
                                        Flat No- </span>
                                        <asp:Label ID="lblFlatNo" runat="server" Font-Names="Verdana" Font-Size="10pt" Text="Label"></asp:Label><span
                                            style="font-size: 10pt"> Wing No - </span>
                                        <asp:Label ID="lblbuilding" runat="server" Font-Names="Verdana" Font-Size="10pt"
                                            Text="Label"></asp:Label><span style="font-size: 10pt"><strong> Area - </strong></span>
                                        <asp:Label ID="lblsqft" runat="server" Font-Names="Verdana" Font-Size="10pt" Text="Label"></asp:Label><span
                                            style="font-size: 10pt"> Sq. Ft.</span></span></span></td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td colspan="6" style="height: 21px; text-align: center">
                            <span><span><span style="font-size: 10pt; font-family: Verdana"><strong>&nbsp;</strong></span></span></span></td>
                    </tr>
                    <tr style="font-weight: bold; font-size: 10pt; font-family: Verdana">
                        <td style="width: 70px">
                        </td>
                        <td style="width: 225px">
                            <span>Dear Sir/Madam,</span></td>
                        <td style="width: 1410px">
                        </td>
                        <td style="width: 7565px">
                        </td>
                        <td style="width: 2855px">
                        </td>
                        <td style="width: 284px">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td colspan="1" style="width: 70px; height: 27px">
                        </td>
                        <td colspan="4" style="height: 27px">
                            <p style="text-align: justify">
                                <span><span style="font-size: 10pt; font-family: Verdana">&nbsp; &nbsp; &nbsp; &nbsp;
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; We are glad to inform you that
                                    we have completed the construction of the </span>
                                    <asp:Label ID="lblBldgName" runat="server" Font-Names="Verdana" Font-Size="10pt"
                                        Text="Label"></asp:Label><span style="font-size: 10pt; font-family: Verdana"> Building
                                            upto the </span>
                                    <asp:Label ID="lblCompletedStage" runat="server" Font-Names="Verdana" Font-Size="10pt"
                                        Text="Label"></asp:Label><span style="font-size: 10pt; font-family: Verdana">. And have
                                            now started the construction of the </span>
                                    <asp:Label ID="lblbeginstage" runat="server" Font-Names="Verdana" Font-Size="10pt"
                                        Text="Label"></asp:Label>
                                    <span style="font-family: Verdana"><span style="font-size: 10pt">and
                                        <asp:Label ID="lblbrickstage" runat="server" Font-Names="Verdana" Font-Size="10pt" Text="Label"></asp:Label>
                                        <span> of Building
                                        </span></span></span>
                                    <asp:Label ID="lblBldgName2" runat="server" Font-Names="Verdana" Font-Size="10pt"
                                        Text="Label"></asp:Label><span style="font-size: 10pt; font-family: Verdana">. The amount
                                            to be paid as per </span><span style="font-size: 10pt; font-family: Verdana">the schedule
                                                is Rs. </span>
                                    <asp:Label ID="lblScheduleAmt" runat="server" Font-Bold="True" Font-Names="Verdana"
                                        Font-Size="10pt" Text="Label"></asp:Label><span style="font-family: Verdana"><span
                                            style="font-size: 10pt"><strong> /-</strong>. But till now you have paid Rs. </span>
                                        </span>
                                    <asp:Label ID="lblPaidAmt" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="10pt"
                                        Text="Label"></asp:Label><span style="font-family: Verdana"><span style="font-size: 10pt">
                                            <strong>/-. </strong></span></span></span>
                            </p>
                            <p>
                                <span style="font-size: 10pt; font-family: Verdana">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Hence, you are requested to kindly
                                    pay the balance amount of Rs.</span><asp:Label ID="lblBalAmt" runat="server" Font-Bold="True"
                                        Font-Names="Verdana" Font-Size="10pt" Text="Label"></asp:Label><span style="font-size: 10pt;
                                            font-family: Verdana"> /-<strong>. </strong>as per schedule plus interest of Rs.<asp:Label
                                                ID="lblinterest" runat="server" Font-Bold="True" Font-Size="10pt" Text="Label"></asp:Label>,
                                            within 7 days of receipt of this letter so that your contribution shall enable us
                                            to construct the
                                            <asp:Label ID="lblBldgName3" runat="server" Font-Bold="False" Font-Size="10pt" Text="Label"></asp:Label>
                                            Building as per schedule.Therefore you are requested to kindly co-operate. Thanking
                                            you in anticipation.</span></p>
                        </td>
                        <td colspan="1" style="font-size: 12pt; height: 27px">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="width: 70px; height: 21px">
                        </td>
                        <td style="width: 225px; height: 21px">
                        </td>
                        <td style="width: 1410px; height: 21px">
                        </td>
                        <td style="width: 7565px; height: 21px">
                        </td>
                        <td style="width: 2855px; height: 21px">
                        </td>
                        <td style="width: 284px; height: 21px">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="width: 70px; height: 21px">
                        </td>
                        <td style="width: 225px; height: 21px">
                        </td>
                        <td style="width: 1410px; height: 21px">
                        </td>
                        <td style="width: 7565px; height: 21px">
                        </td>
                        <td style="width: 2855px; height: 21px">
                        </td>
                        <td style="width: 284px; height: 21px">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="width: 70px; height: 21px">
                        </td>
                        <td colspan="2" style="height: 21px">
                            <span style="font-size: 10pt; font-family: Verdana">With Regards, Thanking you.</span></td>
                        <td style="width: 7565px; height: 21px">
                        </td>
                        <td style="width: 2855px; height: 21px">
                        </td>
                        <td style="width: 284px; height: 21px">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="width: 70px; height: 21px">
                        </td>
                        <td style="width: 225px; height: 21px">
                        </td>
                        <td style="width: 1410px; height: 21px">
                        </td>
                        <td style="width: 7565px; height: 21px">
                        </td>
                        <td style="width: 2855px; height: 21px; text-align: right">
                            <span style="font-size: 10pt; font-family: Verdana">Your Truely</span></td>
                        <td style="width: 284px; height: 21px">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="width: 70px">
                        </td>
                        <td style="width: 225px">
                        </td>
                        <td style="width: 1410px">
                        </td>
                        <td colspan="2" style="text-align: right">
                            <span style="font-size: 10pt; font-family: Verdana">FOR JIDNYASA CO-OP HSG SOCIETY LTD.</span></td>
                        <td style="width: 284px">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="width: 70px; height: 21px">
                        </td>
                        <td style="width: 225px; height: 21px">
                        </td>
                        <td style="width: 1410px; height: 21px">
                        </td>
                        <td style="width: 7565px; height: 21px">
                        </td>
                        <td style="width: 2855px; height: 21px">
                        </td>
                        <td style="width: 284px; height: 21px">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="width: 70px; height: 21px">
                        </td>
                        <td style="width: 225px; height: 21px">
                        </td>
                        <td style="width: 1410px; height: 21px">
                        </td>
                        <td style="width: 7565px; height: 21px">
                        </td>
                        <td style="width: 2855px; height: 21px">
                        </td>
                        <td style="width: 284px; height: 21px">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="width: 70px; height: 21px">
                        </td>
                        <td style="width: 225px; height: 21px">
                        </td>
                        <td style="width: 1410px; height: 21px">
                        </td>
                        <td style="width: 7565px; height: 21px">
                        </td>
                        <td style="width: 2855px; height: 21px">
                        </td>
                        <td style="width: 284px; height: 21px">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="width: 70px; height: 21px">
                        </td>
                        <td style="width: 225px; height: 21px">
                        </td>
                        <td style="width: 1410px; height: 21px">
                        </td>
                        <td colspan="2" style="height: 21px; text-align: right">
                            <span style="font-size: 10pt; font-family: Verdana">PROJECT CO-ORDINATOR/CHAIRMAN</span></td>
                        <td style="width: 284px; height: 21px">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="width: 70px; height: 21px">
                        </td>
                        <td style="width: 225px; height: 21px">
                        </td>
                        <td style="width: 1410px; height: 21px">
                        </td>
                        <td style="width: 7565px; height: 21px">
                        </td>
                        <td style="width: 2855px; height: 21px">
                        </td>
                        <td style="width: 284px; height: 21px">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="width: 70px; height: 21px">
                        </td>
                        <td style="width: 225px; height: 21px">
                        </td>
                        <td style="width: 1410px; height: 21px">
                        </td>
                        <td style="width: 7565px; height: 21px">
                        </td>
                        <td style="width: 2855px; height: 21px">
                        </td>
                        <td style="width: 284px; height: 21px">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="width: 70px; height: 21px">
                        </td>
                        <td style="width: 225px; height: 21px">
                        </td>
                        <td style="width: 1410px; height: 21px">
                        </td>
                        <td style="width: 7565px; height: 21px">
                        </td>
                        <td style="width: 2855px; height: 21px">
                        </td>
                        <td style="width: 284px; height: 21px">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td colspan="6" style="height: 21px">
                            <span style="font-size: 10pt; font-family: Verdana"><strong>
                                <hr />
                                Note 1: Interest has been strictly enforced on outstanding amount as on 1<sup>st</sup>
                                Sept 10 with 21% p.a.<br />
                                Note 2: Please confirm the Amount Paid, if any discrepancy inform
                                office within
                                15 days or your account will be considered confirmed.
                                <br />
                                <hr />
                            </strong></span>
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="width: 70px; height: 21px">
                        </td>
                        <td style="width: 225px; height: 21px">
                        </td>
                        <td style="width: 1410px; height: 21px">
                        </td>
                        <td style="width: 7565px; height: 21px">
                        </td>
                        <td style="width: 2855px; height: 21px">
                        </td>
                        <td style="width: 284px; height: 21px">
                        </td>
                    </tr>
                </table>
            </asp:View>
        </asp:MultiView></div>
    </form>
</body>
</html>
