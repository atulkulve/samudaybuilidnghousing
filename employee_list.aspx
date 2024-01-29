<%@ Page Language="VB" AutoEventWireup="false" CodeFile="employee_list.aspx.vb" Inherits="employee_list" %>

 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="/aspnet_client/System_Web/2_0_50727/CrystalReportWebFormViewer3/css/default.css"
        rel="stylesheet" type="text/css" />
    <link href="/aspnet_client/System_Web/2_0_50727/CrystalReportWebFormViewer3/css/default.css"
        rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div><center style="text-align: left">
        &nbsp;&nbsp;<center style="text-align: left">
            <span style="font-size: 10pt; font-family: Verdana"><strong>Employee List</strong></span></center>
        <center style="text-align: left">
            <br />
            <asp:GridView ID="EmployeeList" runat="server" AutoGenerateColumns="False" BackColor="White"
                BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="emp_id"
                DataSourceID="SqlDataSource1" Font-Names="Verdana" Font-Size="8pt" Height="121px"
                Width="809px">
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <Columns>
                    <asp:BoundField DataField="emp_name" HeaderText="Name" SortExpression="emp_name" />
                    <asp:BoundField DataField="emp_dob" HeaderText="Dt. Birth" SortExpression="emp_dob" />
                    <asp:BoundField DataField="emp_addr" HeaderText="Address" SortExpression="emp_addr" />
                    <asp:BoundField DataField="emp_phone" HeaderText="Phone" SortExpression="emp_phone" />
                    <asp:BoundField DataField="emp_email" HeaderText="Email" SortExpression="emp_email" />
                    <asp:BoundField DataField="emp_designation" HeaderText="Designation" SortExpression="emp_designation" />
                    <asp:BoundField DataField="remarks" HeaderText="Remarks" SortExpression="remarks" />
                </Columns>
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conMM %>"
                SelectCommand="SELECT [emp_name], [emp_dob], [emp_addr], [emp_phone], [emp_email], [emp_id], [emp_designation], [remarks], [loc_id] FROM [employee_master] WHERE ([loc_id] = @loc_id)">
                <SelectParameters>
                    <asp:SessionParameter Name="loc_id" SessionField="LocId" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </center>
        <a href="UserMenu.aspx"><span style="font-size: 8pt; font-family: Verdana"><strong>
            Back</strong></span></a>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br />
    </center>
    </div>
    </form>
</body>
</html>
