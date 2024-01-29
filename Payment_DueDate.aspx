<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Payment_DueDate.aspx.vb" Inherits="mmsoft_Payment_DueDate" %>
<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>

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
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="height: 21px">
                    <asp:MultiView ID="MultiView1" runat="server">
                        <asp:View ID="View1" runat="server">
                            <table width="100%">
                                <tr>
                                    <td style="width: 211px">
                                    </td>
                                    <td style="width: 202px">
                                    </td>
                                    <td style="width: 122px">
                                    </td>
                                    <td style="width: 3px">
                                    </td>
                                    <td style="width: 100px">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="table-layout: auto; width: 211px; border-collapse: separate; height: 26px;">
                                        <span style="font-family: Verdana"><span style="font-size: 8pt"><strong>Select Date
                                            Range</strong></span></span></td>
                                    <td style="table-layout: auto; width: 202px; border-collapse: separate; height: 26px;">
                                        <strong><span style="font-size: 8pt; font-family: Verdana">From &nbsp; &nbsp;
                                        </span></strong>
                                    </td>
                                    <td style="table-layout: auto; width: 122px; border-collapse: separate; height: 26px;">
                                        <strong><span style="font-size: 8pt; font-family: Verdana">
                                            To &nbsp;</span></strong></td>
                                    <td style="width: 3px; height: 26px;">
                                        &nbsp;</td>
                                    <td style="width: 100px; height: 26px;">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="table-layout: auto; width: 211px; border-collapse: separate; text-align: left">
                                        </td>
                                    <td style="table-layout: auto; width: 202px; border-collapse: separate">
                                    <cc1:GMDatePicker
                                            ID="FromDate" runat="server" DisplayMode="Label" MaxDate="2020-12-31" MinDate="1950-01-01"
                                            YearDropDownRange="100">
                                        </cc1:GMDatePicker>
                                    </td>
                                    <td style="table-layout: auto; width: 122px; border-collapse: separate">
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:conMM %>"
                                            SelectCommand="SELECT [cust_name], [cust_id] FROM [customer_master] WHERE ([loc_id] = @loc_id)">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="loc_id" SessionField="LocId" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    <cc1:GMDatePicker ID="ToDate" runat="server" DisplayMode="Label" MaxDate="2020-12-31"
                                                MinDate="1950-01-01" YearDropDownRange="100">
                                            </cc1:GMDatePicker>
                                    </td>
                                    <td style="width: 3px">
                                    </td>
                                    <td style="width: 100px; text-align: right;">
                                        <asp:ImageButton ID="imbOk" runat="server" ImageUrl="~/softimages/ok.gif" OnClientClick="return validateInput();" /></td>
                                </tr>
                            </table>
                        </asp:View>
                        <asp:View ID="View2" runat="server">
                            <strong><span style="font-size: 10pt; font-family: Verdana">Payment List from
                                <asp:Label ID="lblfrom" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="10pt"></asp:Label>
                                to
                                <asp:Label ID="lblTo" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="10pt"></asp:Label></span></strong><center
                                    style="text-align: left">
                                    &nbsp;
                                    <asp:GridView ID="paymentduelist" runat="server" AutoGenerateColumns="False" BackColor="White"
                                        BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="pi_id"
                                        DataSourceID="SqlDataSource1" Font-Names="Verdana" Font-Size="8pt" Height="121px"
                                        Width="809px">
                                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                                        <Columns>
                                            <asp:BoundField DataField="cust_name" HeaderText="Customer" SortExpression="cust_name" />
                                            <asp:BoundField DataField="pay_date" HeaderText="Due Date" SortExpression="pay_date" />
                                            <asp:BoundField DataField="amount" HeaderText="Amount" SortExpression="amount" />
                                            <asp:BoundField DataField="chq_no" HeaderText="Ch.No." SortExpression="chq_no" />
                                            <asp:BoundField DataField="chq_date" HeaderText="Ch. Date" SortExpression="chq_date" />
                                            <asp:BoundField DataField="chq_bank" HeaderText="Bank" SortExpression="chq_bank" />
                                            <asp:BoundField DataField="chq_branch" HeaderText="Branch" SortExpression="chq_branch" />
                                        </Columns>
                                        <RowStyle BackColor="White" ForeColor="#003399" />
                                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conMM %>"
                                        SelectCommand="SELECT pay_investor.pi_id, pay_investor.it_id, invest_trans.cust_id, customer_master.cust_name, pay_investor.pay_date, pay_investor.amount, pay_investor.chq_no, pay_investor.chq_date, pay_investor.chq_bank, pay_investor.chq_branch, customer_master.loc_id FROM invest_trans INNER JOIN pay_investor ON invest_trans.it_id = pay_investor.it_id INNER JOIN customer_master ON invest_trans.cust_id = customer_master.cust_id WHERE (pay_investor.pay_date BETWEEN @FromDate AND @ToDate) AND (customer_master.loc_id = @loc_id)">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="FromDate" SessionField="FromDate" />
                                            <asp:SessionParameter Name="ToDate" SessionField="ToDate" />
                                            <asp:SessionParameter DefaultValue="" Name="loc_id" SessionField="LocId" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </center>
                            <a href="UserMenu.aspx"><span style="font-size: 8pt; font-family: Verdana"><strong>Back</strong></span></a></asp:View>
                    </asp:MultiView></td>
                <td style="height: 21px">
                </td>
                <td style="height: 21px">
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
