<%@ Page Language="VB" AutoEventWireup="false" CodeFile="InterestWayoffComp.aspx.vb" Inherits="mmsoft_InterestWayoffComp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
                <table border="0" width="70%">
                    <tr>
                        <td style="width: 134px; height: 21px">
                            <span style="font-size: 8pt; font-family: Verdana">Select Site</span></td>
                        <td style="font-size: 12pt; width: 233px; font-family: Times New Roman; height: 21px">
                            <asp:DropDownList ID="drpSite" runat="server" AutoPostBack="True" Font-Bold="False"
                                Font-Names="Verdana" Font-Size="8pt" ForeColor="#006699" Height="20px" Width="175px">
                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                            </asp:DropDownList></td>
                        <td style="font-size: 12pt; width: 242px; font-family: Times New Roman; height: 21px">
                            <span style="font-size: 8pt; font-family: Verdana">Select Building</span></td>
                        <td style="font-size: 12pt; width: 278px; font-family: Times New Roman; height: 21px">
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
                            <span style="font-size: 8pt; font-family: Verdana"></span>
                        </td>
                        <td style="width: 278px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 134px">
                            <span style="font-size: 8pt; font-family: Verdana"></span>
                        </td>
                        <td style="width: 233px">
                        </td>
                        <td style="width: 242px">
                        </td>
                        <td style="width: 278px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 134px">
                        </td>
                        <td style="width: 233px">
                        </td>
                        <td style="width: 242px">
                            <asp:ImageButton ID="imbSave" runat="server" ImageUrl="~/softimages/ok.gif" OnClientClick="return ValidateInput();" /></td>
                        <td style="width: 278px">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:Label ID="lblerror" runat="server" Font-Names="Verdana" Font-Size="Smaller"
                                ForeColor="Red"></asp:Label></td>
                        <td style="width: 278px">
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <table width="100%">
                    <tr>
                        <td style="width: 141px;">
                            <span style="font-size: 8pt; font-family: Verdana">Payment entry settlement of interest
                                for
                                <asp:Label ID="lblbuilding" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"></asp:Label>
                                building and Room No.
                                <asp:Label ID="lblRoomno" runat="server" Text="Label"></asp:Label></span></td>
                        <td style="width: 111px;">
                        </td>
                        <td style="width: 87px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 141px; height: 170px;">
    <asp:GridView ID="gvInterest" runat="server" AutoGenerateColumns="False"
                     Width="33%" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" Font-Names="Verdana" Font-Size="8pt">
          <FooterStyle CssClass="td_bg_selected3" BackColor="#CCCC99" />
          <Columns>
                <asp:TemplateField>
                  <ItemTemplate>
                   <%--<asp:CheckBox ID="chkSelect" runat="server" /><input id="hdnDetailsId" runat="server" type="hidden" value='<%# Bind("pymtentryid") %>' />--%>
                        <input id="HiddenID" runat="server" type="hidden" value='<%# Bind("pymtentryid") %>' />
                                                 
                  </ItemTemplate>
                  <ItemStyle HorizontalAlign="Center" Width="25px" />
                      <HeaderStyle Width="25px" />
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Stage Desc" SortExpression="User_Name">
                  <ItemStyle HorizontalAlign="Right" />
                  <HeaderStyle HorizontalAlign="Center" />
                  <ItemTemplate>
                  
                      <asp:Label ID="lblUser2" runat="server" Text='<%# Bind("StageDesc") %>'></asp:Label>
                  </ItemTemplate>
              </asp:TemplateField>
              
              <asp:TemplateField HeaderText="Paid Amt" SortExpression="User_Name">
                  <ItemStyle HorizontalAlign="Right" />
                  <HeaderStyle HorizontalAlign="Center" />
                  <ItemTemplate>
                  
                      <asp:Label ID="lblUser67" runat="server" Text='<%# Bind("PymtAmount") %>'></asp:Label>
                  </ItemTemplate>
              </asp:TemplateField>
              
              <asp:TemplateField HeaderText="Interest Days" SortExpression="User_Name">
                  <ItemStyle HorizontalAlign="Right" />
                  <HeaderStyle HorizontalAlign="Center" />
                  <ItemTemplate>
                  
                      <asp:Label ID="lblUser3" runat="server" Text='<%# Bind("IntDays") %>'></asp:Label>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Interest Amt" SortExpression="User_Name">
                  <ItemStyle HorizontalAlign="Right" />
                  <HeaderStyle HorizontalAlign="Center" />
                  <ItemTemplate>
                      <asp:Label ID="lblUser4" runat="server" Text='<%# Bind("IntPending") %>'></asp:Label>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Interest Settlement">
                  <ItemStyle Width="40%" HorizontalAlign="Right" />
                  <ItemTemplate>
                      <asp:TextBox ID="txtInterestNew" runat="server" onkeyup="return CheckSum1();"  CssClass="textField_2" Width="143px" style="text-align:right "></asp:TextBox>
                  </ItemTemplate>
                  <HeaderStyle HorizontalAlign="Center" />
              </asp:TemplateField>
   </Columns>
          <RowStyle CssClass="td_bg_selected1" BackColor="#F7F7DE" />
          <HeaderStyle CssClass="td_bg_selected3" BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
          <PagerStyle CssClass="FooterStyle" ForeColor="Black" BackColor="#F7F7DE" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
      </asp:GridView>
                        </td>
                        <td style="width: 111px; height: 170px;">
                        </td>
                        <td style="width: 87px; height: 170px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 141px; height: 27px">
                        </td>
                        <td style="width: 111px; height: 27px">
                        </td>
                        <td style="width: 87px; height: 27px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 141px"><asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/softimages/Save_asign.gif" OnClientClick="return ValidateInput();" /></td>
                        <td style="width: 111px">
                        </td>
                        <td style="width: 87px">
                        </td>

                    </tr>
                </table>
                <br />
                <br />
                &nbsp;</asp:View>
        </asp:MultiView><br /><br />
        &nbsp;</div>
    </form>
</body>
</html>
