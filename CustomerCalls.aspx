<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CustomerCalls.aspx.vb" Inherits="mmsoft_CustomerCalls" %>
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
                                    <td style="table-layout: auto; width: 106px; border-collapse: separate">
                                        <span style="font-family: Verdana"><span style="font-size: 8pt"><strong>Select Customer</strong></span></span></td>
                                    <td style="table-layout: auto; width: 341px; border-collapse: separate">
                                        <asp:DropDownList ID="drpcust" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource2"
                                            DataTextField="cust_name" DataValueField="cust_id" Font-Bold="True" Font-Names="Verdana"
                                            Font-Size="8pt" ForeColor="#006699" Height="20px" Width="180px">
                                            <asp:ListItem>-Select-</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td style="table-layout: auto; width: 97px; border-collapse: separate">
                                    </td>
                                    <td style="width: 58px">
                                        &nbsp;</td>
                                    <td style="width: 100px">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="table-layout: auto; width: 106px; border-collapse: separate; text-align: right">
                                        <asp:ImageButton ID="imbOk" runat="server" ImageUrl="~/softimages/ok.gif" OnClientClick="return validateInput();" /></td>
                                    <td style="table-layout: auto; width: 341px; border-collapse: separate">
                                    </td>
                                    <td style="table-layout: auto; width: 97px; border-collapse: separate">
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:conMM %>"
                                            SelectCommand="SELECT [cust_name], [cust_id] FROM [customer_master] WHERE ([loc_id] = @loc_id)">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="loc_id" SessionField="LocId" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td style="width: 58px">
                                    </td>
                                    <td style="width: 100px">
                                    </td>
                                </tr>
                            </table>
                        </asp:View>
                        <asp:View ID="View2" runat="server">
                            <strong><span style="font-size: 10pt; font-family: Verdana">Total Call List of
                                <asp:Label ID="lblName" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="10pt"></asp:Label></span></strong><center
                                    style="text-align: left">
                                    <br />
                                    <asp:GridView ID="customerGrid" runat="server" AutoGenerateColumns="False" BackColor="White"
                                        BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1"
                                        Font-Names="Verdana" Font-Size="8pt" Height="121px" Width="809px">
                                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                                        <RowStyle BackColor="White" ForeColor="#003399" />
                                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                                        <Columns>
                                            <asp:BoundField DataField="call_date" HeaderText="Call Date" SortExpression="call_date" />
                                            <asp:BoundField DataField="call_details" HeaderText="Details" SortExpression="call_details" />
                                            <asp:BoundField DataField="emp_name" HeaderText="Called By" SortExpression="emp_name" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conMM %>"
                                        SelectCommand="SELECT customer_master.cust_name, customer_master.cust_phno, call_details.call_date, call_details.call_details, customer_master.cust_id, call_details.loc_id, employee_master.emp_name FROM customer_master INNER JOIN call_details ON customer_master.cust_id = call_details.cust_id AND customer_master.loc_id = call_details.loc_id INNER JOIN employee_master ON call_details.emp_id = employee_master.emp_id AND call_details.loc_id = employee_master.loc_id WHERE (customer_master.cust_id = @custId) AND (call_details.loc_id = @loc_id) ORDER BY call_details.call_date">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="custId" SessionField="CustID" />
                                            <asp:SessionParameter Name="loc_id" SessionField="LocId" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </center>
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
    
    </div>
    </form>
</body>
</html>
