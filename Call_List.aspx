<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Call_List.aspx.vb" Inherits="mmsoft_Call_List" %>
<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <center style="text-align: left">
            <span style="font-size: 10pt; font-family: Verdana"><strong></strong></span>&nbsp;</center>
        <center style="text-align: left">
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
                            <td style="width: 106px">
                            </td>
                            <td style="width: 341px">
                            </td>
                            <td style="width: 97px">
                            </td>
                            <td style="width: 58px">
                            </td>
                            <td style="width: 100px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 106px; table-layout: auto; border-collapse: separate;">
                                <span style="font-family: Verdana"><span style="font-size: 8pt"><strong>Select Call
                                    Date</strong></span></span></td>
                            <td style="table-layout: auto; width: 341px; border-collapse: separate">
                                <cc1:gmdatepicker id="callDate" runat="server" displaymode="Label" maxdate="2020-12-31"
                                    mindate="1950-01-01" yeardropdownrange="100">
                                      </cc1:gmdatepicker>
                            </td>
                            <td style="table-layout: auto; width: 97px; border-collapse: separate">
                            </td>
                            <td style="width: 58px">
                                &nbsp;</td>
                            <td style="width: 100px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 106px; table-layout: auto; border-collapse: separate; text-align: right;">
                                <asp:ImageButton ID="imbOk" runat="server" ImageUrl="~/softimages/ok.gif" OnClientClick="return validateInput();" /></td>
                            <td style="table-layout: auto; width: 341px; border-collapse: separate">
                            </td>
                            <td style="table-layout: auto; width: 97px; border-collapse: separate">
                            </td>
                            <td style="width: 58px">
                            </td>
                            <td style="width: 100px">
                            </td>
                        </tr>
                    </table>
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <strong><span style="font-size: 10pt; font-family: Verdana">Call List as on
                        <asp:Label ID="lbldate" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="10pt"></asp:Label></span></strong><center
                        style="text-align: left">
                        <br />
                        <asp:GridView ID="calllistgrid" runat="server" AutoGenerateColumns="False" BackColor="White"
                            BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1"
                            Font-Names="Verdana" Font-Size="8pt" Height="121px" Width="809px">
                            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                            <RowStyle BackColor="White" ForeColor="#003399" />
                            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                            <Columns>
                                <asp:BoundField DataField="cust_name" HeaderText="Customer" SortExpression="cust_name" />
                                <asp:BoundField DataField="cust_dob" HeaderText="Dt. of Birth" SortExpression="cust_dob" />
                                <asp:BoundField DataField="cust_email" HeaderText="Email" SortExpression="cust_email" />
                                <asp:BoundField DataField="cust_phno" HeaderText="Phone" SortExpression="cust_phno" />
                                <asp:BoundField DataField="emp_name" HeaderText="Called By" SortExpression="emp_name" />
                                <asp:BoundField DataField="call_date" HeaderText="Last Call Date" SortExpression="call_date" />
                                <asp:BoundField DataField="call_details" HeaderText="Call Details" SortExpression="call_details" />
                            </Columns>
                        </asp:GridView>
                    </center>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conMM %>"
                        SelectCommand="SELECT customer_master.cust_name, customer_master.cust_dob, customer_master.cust_email, customer_master.cust_phno, call_details.call_date, call_details.call_details, call_details.call_nextdate, employee_master.emp_name, call_details.loc_id FROM call_details INNER JOIN customer_master ON call_details.cust_id = customer_master.cust_id INNER JOIN employee_master ON call_details.emp_id = employee_master.emp_id WHERE (call_details.call_nextdate = @CallDate) AND (call_details.loc_id = @loc_id)">
                        <SelectParameters>
                            <asp:SessionParameter Name="CallDate" SessionField="CallDate" />
                            <asp:SessionParameter Name="loc_id" SessionField="LocId" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <a href="UserMenu.aspx"><span style="font-size: 8pt; font-family: Verdana"><strong>Back</strong></span></a>&nbsp;
                </asp:View>
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
            &nbsp;</center>
        <center style="text-align: left">
            &nbsp;</center>
    
    </div>
    </form>
</body>
</html>
