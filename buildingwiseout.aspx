<%@ Page Language="VB" AutoEventWireup="false" CodeFile="buildingwiseout.aspx.vb" Inherits="mmsoft_buildingwiseout" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <span style="font-size: 14pt; font-family: Verdana"><strong>Building wise Outstanding
            Report</strong></span><br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
            DataSourceID="SqlDataSource1" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333"
            GridLines="None">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:BoundField DataField="BldgName" HeaderText="Building Name" SortExpression="BldgName" />
                <asp:BoundField DataField="TotalOutstanding" HeaderText="Total Outstanding" ReadOnly="True"
                    SortExpression="TotalOutstanding" />
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conMM %>"
            SelectCommand="SELECT SUM(Pyment.OutStanding) AS TotalOutstanding, Building.BldgName FROM Building INNER JOIN Room ON Building.BldgId = Room.BldgId INNER JOIN Pyment ON Room.RoomId = Pyment.RoomId GROUP BY Building.BldgName ORDER BY Building.BldgName">
        </asp:SqlDataSource>
        <br />
    
    </div>
    </form>
</body>
</html>
