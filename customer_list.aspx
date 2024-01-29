<%@ Page Language="VB" AutoEventWireup="false" CodeFile="customer_list.aspx.vb" Inherits="customer_list" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="/aspnet_client/System_Web/2_0_50727/CrystalReportWebFormViewer3/css/default.css"
        rel="stylesheet" type="text/css" />
    <link href="/aspnet_client/System_Web/2_0_50727/CrystalReportWebFormViewer3/css/default.css"
        rel="stylesheet" type="text/css" />
    <link href="/aspnet_client/System_Web/2_0_50727/CrystalReportWebFormViewer3/css/default.css"
        rel="stylesheet" type="text/css" />
   
</head>
<body style="text-align: left">
 <form id="form1" runat="server"><center style="text-align: left">
     &nbsp;
   </center>
     <center style="text-align: left">
         <span style="font-size: 10pt; font-family: Verdana"><strong>Customer List</strong></span></center>
     <center style="text-align: left">
     <br />
     <asp:GridView ID="paymentGrid" runat="server" AutoGenerateColumns="False" CellPadding="3"
         DataSourceID="SqlDataSource1" Font-Names="Verdana" Font-Size="8pt" Height="121px" Width="809px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
         <FooterStyle BackColor="White" ForeColor="#000066" />
         <Columns>
             <asp:BoundField DataField="cust_name" HeaderText="Name" SortExpression="cust_name" />
             <asp:BoundField DataField="cust_dob" HeaderText="Dt. of Birth" SortExpression="cust_dob" />
             <asp:BoundField DataField="cust_add1" HeaderText="Address" SortExpression="cust_add1" />
             <asp:BoundField DataField="cust_email" HeaderText="Email" SortExpression="cust_email" />
             <asp:BoundField DataField="cust_phno" HeaderText="Phone" SortExpression="cust_phno" />
             <asp:BoundField DataField="cust_fax" HeaderText="Fax" SortExpression="cust_fax" />
         </Columns>
         <RowStyle ForeColor="#000066" />
         <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
         <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
         <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
     </asp:GridView>
     </center>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conMM %>"
         SelectCommand="SELECT [cust_name], [cust_dob], [cust_add1], [cust_email], [cust_fax], [cust_phno] FROM [customer_master] WHERE ([loc_id] = @loc_id)">
         <SelectParameters>
             <asp:SessionParameter Name="loc_id" SessionField="LocId" Type="String" />
         </SelectParameters>
     </asp:SqlDataSource>
     <a href="UserMenu.aspx"><span style="font-size: 8pt; font-family: Verdana">
         <strong>
         Back</strong></span></a>&nbsp;
 </form>
</body>
</html>
