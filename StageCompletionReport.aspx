<%@ Page Language="VB" AutoEventWireup="false" CodeFile="StageCompletionReport.aspx.vb" Inherits="mmsoft_StageCompletionReport" %>

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
                        <td style="width: 229px; height: 21px">
                            <span style="font-size: 8pt; font-family: Verdana">Select Site</span></td>
                        <td style="width: 233px; height: 21px">
                            <asp:DropDownList ID="drpSite" runat="server" AutoPostBack="True" Font-Bold="False"
                                Font-Names="Verdana" Font-Size="8pt" ForeColor="#006699" Height="20px" Width="175px">
                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                            </asp:DropDownList></td>
                        <td style="width: 242px; height: 21px">
                            <span style="font-size: 8pt; font-family: Verdana">Select Building</span></td>
                        <td style="width: 278px; height: 21px">
                            <asp:DropDownList ID="drpBuilding" runat="server" Font-Bold="False" Font-Names="Verdana"
                                Font-Size="8pt" ForeColor="#006699" Height="20px" Width="175px">
                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td style="width: 229px">
                        </td>
                        <td style="width: 233px">
                        </td>
                        <td style="width: 242px">
                            <asp:ImageButton ID="imbSave" runat="server" ImageUrl="~/softimages/ok.gif" OnClientClick="return ValidateInput();" /></td>
                        <td style="width: 278px">
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <table width="100%">
                    <tr>
                        <td colspan="3" style="height: 21px">
                            <span style="font-size: 8pt; font-family: Verdana"><strong>Stages Completed Of </strong></span>
                            <asp:Label ID="lblFlatNo" runat="server" Font-Bold="True" Text="Label" Font-Names="Verdana" Font-Size="8pt"></asp:Label><span
                                style="font-size: 8pt; font-family: Verdana"> <strong>Building</strong></span></td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                DataKeyNames="BldgStageId" DataSourceID="SqlDataSource1" ForeColor="#333333"
                                GridLines="None" Font-Names="Verdana" Font-Size="8pt">
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="BldgName" HeaderText="Building Name" SortExpression="BldgName" />
                                    <asp:BoundField DataField="StageDesc" HeaderText="Stage Description" SortExpression="StageDesc" />
                                    <asp:BoundField DataField="CompletePercentage" HeaderText="Percentage" SortExpression="CompletePercentage" />
                                    
                                            <asp:BoundField DataField="CompletionDate" 
                                            DataFormatString="{0:dd-MMM-yy}" 
                                            HeaderText="Completion Date"                                                    
                                            SortExpression="Completion Date"                                                     
                                            HtmlEncode="False">
                                            <ItemStyle Wrap="False"/>
                                            </asp:BoundField> 
                                    <asp:CheckBoxField DataField="CompletionFlag" HeaderText="CompletionFlag" SortExpression="CompletionFlag" />
                                </Columns>
                                <RowStyle BackColor="#EFF3FB" />
                                <EditRowStyle BackColor="#2461BF" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <AlternatingRowStyle BackColor="White" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conMM %>"
                                SelectCommand="SELECT BldgStage.BldgStageId, BldgStage.BldgId, Building.BldgName, BldgStage.StageId, stage.StageDesc, BldgStage.CompletePercentage, BldgStage.CompletionDate, BldgStage.CompletionFlag FROM BldgStage INNER JOIN Building ON BldgStage.BldgId = Building.BldgId INNER JOIN stage ON BldgStage.StageId = stage.StageId WHERE (BldgStage.BldgId = @BldgId)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="BldgId" SessionField="BldgId" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 125px">
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/mmsoft/SiteMaster.aspx">Back</asp:HyperLink></td>
                        <td style="width: 83px">
                        </td>
                        <td style="width: 240px">
                        </td>
                    </tr>
                </table>
            </asp:View>
        </asp:MultiView></div>
    </form>
</body>
</html>
