<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/SFA.master" CodeFile="paymentdetails.aspx.vb" Inherits="paymentdetails" %>

<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls"
    TagPrefix="BDP" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
<script language="javascript" src="jsFiles/PaymentDetails.js" type="text/javascript" ></script> 
<div id="main" style="position:absolute; width:950px; left: 9px; top: 77px; ">

<table cellpadding="0" cellspacing="0" border="0" style="width: 104%">
	<tr>
	<td style="width: 1198px;">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td style="height: 20px"><img src="../softimages/head_c_l.jpg" height="21" style="width: 11px" /></td>
        <td background="../softimages/head_cen_bg.jpg" class="Title21" style="width:397px; height: 20px;">
            <span style="font-size: 11pt; font-family: Verdana">Payment Details for Investment </span></td>
        <td style="height: 20px; width: 845px;"><img src="../softimages/head_c_r.jpg" width="13" height="21" /></td>
      </tr>
    </table>
	</td>
	</tr>
	<tr>
	<td style="height: 30px; width: 1198px;">
	<table  border="0" cellspacing="0" cellpadding="0" style="width: 100%" class="td_bg_1">
    
    
    
        <tr>
                          <td style="width: 3px; height: 6px;"><img src="../softimages/low_curve21.jpg" /></td>
                          <td colspan="3" background="../softimages/low_bor2.gif" style="height: 6px; width: 984px;">
                              
                              </td>
                          <td style="width: 17px; height: 6px;"><img src="../softimages/low_curve3.gif" /></td>
      </tr>
      <tr>
      <td style="width: 3px; height: 26px;" background="../softimages/l_bor1.gif"></td>
          <td colspan="3" style="height: 26px; width: 984px;">
              <table width="100%">
                  <tr>
                      <td style="width: 300px; height: 135px;">
                          <table border="0"  style="font-size: 12pt; width: 680px; height: 50px;
                               text-align: center">
                              <tr style="color: #000000">
                                  <td align="left" style="width: 260px; height: 3px">
                                      <span style="font-size: 8pt; font-family: Verdana"><strong>N<span>ame</span></strong></span><span
                                          style="font-size: 8pt; font-family: Verdana"><span><span style="color: #ff0000"></span>
                                              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
                                          </span></span>
                                  </td>
                                  <td align="left" style="font-size: 12pt; width: 1009px; font-family: Times New Roman;
                                      height: 3px">
                                      <asp:DropDownList ID="drpname" runat="server" AppendDataBoundItems="True" AutoPostBack="True"
                                          DataSourceID="SqlDataSource2" DataTextField="cust_name" DataValueField="cust_name"
                                          Font-Bold="True" Font-Names="Verdana" Font-Size="10pt" ForeColor="#006699" Height="36px"
                                          Width="318px">
                                          <asp:ListItem>-Select Customer-</asp:ListItem>
                                      </asp:DropDownList>
                                      &nbsp;</td>
                              </tr>
                              <tr style="font-size: 12pt; color: #000000; font-family: Times New Roman">
                                  <td align="left" style="width: 260px; height: 7px">
                                      <span style="font-size: 8pt; font-family: Verdana"><strong>Address </strong></span>
                                  </td>
                                  <td align="left" style="font-size: 12pt; width: 1009px; color: #000000; font-family: Times New Roman;
                                      height: 7px">
                                      <asp:TextBox ID="txtaddr" runat="server" AutoPostBack="True" Enabled="False" Font-Bold="True"
                                          Font-Names="Verdana" Font-Size="10pt" ForeColor="#006699" Height="55px" Rows="2"
                                          TextMode="MultiLine" Width="313px"></asp:TextBox>
                                  </td>
                              </tr>
                          </table>
                      </td>
                      <td style="width: 390px; height: 135px;">
                          <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:conMM %>"
                              SelectCommand="SELECT [cust_name] FROM [customer_master] WHERE ([loc_id] = @loc_id)">
                              <SelectParameters>
                                  <asp:ControlParameter ControlID="lblId" Name="loc_id" PropertyName="Text" Type="String" />
                              </SelectParameters>
                          </asp:SqlDataSource>
                          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conMM %>"
                              SelectCommand="SELECT [pi_id], [pay_date], [amount], [chq_no], [chq_date], [chq_bank], [chq_branch] FROM [pay_investor] WHERE ([it_id] = @it_id)">
                              <SelectParameters>
                                  <asp:SessionParameter Name="it_id" SessionField="TransID" Type="String" />
                              </SelectParameters>
                          </asp:SqlDataSource>
                      </td>
                      <td style="width: 442px; height: 135px;">
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 300px; text-align: center;">
                          &nbsp;<br />
                              <asp:GridView ID="transactionGrid" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                  DataKeyNames="it_id" DataSourceID="SqlDataSource3" Font-Names="Verdana" Font-Size="8pt"
                                  ForeColor="#333333" GridLines="None" Height="187px" Width="722px" Visible="False">
                                  <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                  <Columns>
                                      <asp:BoundField DataField="it_id" HeaderText="Transaction Id" ReadOnly="True" SortExpression="it_id" />
                                      <asp:BoundField DataField="agreement_date" HeaderText="Agreement Date" SortExpression="agreement_date" />
                                      <asp:BoundField DataField="scheme_tenure" HeaderText="Scheme Tenure" SortExpression="scheme_tenure" />
                                      <asp:BoundField DataField="due_date" HeaderText="Due Date" SortExpression="due_date" />
                                      <asp:BoundField DataField="down_pay" HeaderText="Down Payment" SortExpression="down_pay" />
                                      <asp:BoundField DataField="installment" HeaderText="Installment" SortExpression="installment" />
                                      <asp:BoundField DataField="net_income" HeaderText="Net Income" SortExpression="net_income" />
                                      <asp:TemplateField HeaderText="Select Transaction">
                                          <ItemTemplate>
                                              <asp:RadioButton ID="rdTrans" runat="server" GroupName="Trans" onClick="checkOne(this);" />
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                  </Columns>
                                  <RowStyle BackColor="#EFF3FB" />
                                  <EditRowStyle BackColor="#2461BF" />
                                  <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                  <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                  <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                  <AlternatingRowStyle BackColor="White" />
                              </asp:GridView>
                              <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:conMM %>"
                                  SelectCommand="SELECT [it_id], [agreement_date], [scheme_tenure], [due_date], [down_pay], [installment], [net_income] FROM [customertrans_view] WHERE ([cust_name] = @cust_name)">
                                  <SelectParameters>
                                      <asp:ControlParameter ControlID="drpname" Name="cust_name" PropertyName="SelectedValue"
                                          Type="String" />
                                  </SelectParameters>
                              </asp:SqlDataSource>
                          &nbsp;
                          <asp:ImageButton ID="imbmore" runat="server" ImageUrl="~/softimages/more.gif" OnClientClick="return ValidateInpute();" Visible="False" /></td>
                      <td style="width: 390px;">
                          <asp:Label ID="lblId" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt"
                              ForeColor="#006699" Visible="False"></asp:Label></td>
                      <td style="width: 442px;">
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 300px; text-align: center;">
                          &nbsp;<asp:GridView ID="paymentGrid" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                  DataKeyNames="pi_id" DataSourceID="SqlDataSource1" Font-Names="Verdana" Font-Size="8pt"
                                  ForeColor="#333333" GridLines="None" Height="121px" Width="722px" Visible="False">
                                  <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                  <Columns>
                                      <asp:BoundField DataField="pi_id" HeaderText="pi_id" InsertVisible="False" ReadOnly="True"
                                          SortExpression="pi_id" Visible="False" />
                                      <asp:BoundField DataField="pay_date" HeaderText="Payment Date" SortExpression="pay_date" />
                                      <asp:BoundField DataField="amount" HeaderText="Amount" SortExpression="amount" />
                                      <asp:BoundField DataField="chq_no" HeaderText="Cheque No" SortExpression="chq_no" />
                                      <asp:BoundField DataField="chq_date" HeaderText="Cheque Date" SortExpression="chq_date" />
                                      <asp:BoundField DataField="chq_bank" HeaderText="Cheque Bank" SortExpression="chq_bank" />
                                      <asp:BoundField DataField="chq_branch" HeaderText="Cheque Branch" SortExpression="chq_branch" />
                                      <asp:TemplateField HeaderText="Select">
                                          <ItemTemplate>
                                              <asp:RadioButton ID="rdSelect" runat="server" GroupName="payDet" onClick="check(this);" />
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                  </Columns>
                                  <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                  <EditRowStyle BackColor="#999999" />
                                  <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                  <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                  <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                  <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                              </asp:GridView>
                          &nbsp;
                          <asp:ImageButton ID="imbview" runat="server" ImageUrl="~/softimages/view.gif" OnClientClick="return ValidateInpute();" Visible="False" /></td>
                      <td style="width: 390px;">
                      </td>
                      <td style="width: 442px;">
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 300px;">
                          <asp:MultiView ID="MultiView1" runat="server">
                              <asp:View ID="View1" runat="server">
                              <table border="0"  style="width: 685px; height: 74px; ">
                                  <tr>
                                      <td style="width: 97px; height: 23px; text-align: left">
                                          <span style="font-size: 8pt; font-family: Verdana"><strong>Cheque Number</strong></span></td>
                                      <td style="width: 51px; height: 23px; text-align: left">
                                          <asp:TextBox ID="txtchno" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="10pt"
                                              ForeColor="#006699" Width="199px"></asp:TextBox></td>
                                  </tr>
                                  <tr>
                                      <td style="width: 97px; height: 6px; text-align: left">
                                          <span style="font-size: 8pt; font-family: Verdana"><strong>Cheque Date</strong></span></td>
                                      <td style="width: 51px; height: 6px; text-align: left">
                                          &nbsp;<cc1:GMDatePicker ID="chqDate" runat="server" DisplayMode="Label" MaxDate="2020-12-31"
                                              MinDate="1950-01-01" YearDropDownRange="80">
                                          </cc1:GMDatePicker>
                                          <span style="font-size: 8pt; font-family: Verdana"><strong></strong></span>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td style="width: 97px; height: 15px; text-align: left">
                                          <span style="font-size: 8pt; font-family: Verdana"><strong>Bank</strong></span></td>
                                      <td style="width: 51px; height: 15px; text-align: left">
                                          <asp:TextBox ID="txtbank" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="10pt"
                                              ForeColor="#006699"></asp:TextBox></td>
                                  </tr>
                                  <tr>
                                      <td style="width: 97px; height: 4px; text-align: left">
                                          <span style="font-size: 8pt; font-family: Verdana"><strong>Branch</strong></span></td>
                                      <td style="width: 51px; height: 4px; text-align: left">
                                          <asp:TextBox ID="txtbranch" runat="server" Font-Bold="True" Font-Names="Verdana"
                                              Font-Size="10pt" ForeColor="#006699"></asp:TextBox></td>
                                  </tr>
                              </table>
                                  <br />
                                  &nbsp;<asp:ImageButton ID="imbsave" runat="server" ImageUrl="../softimages/save.gif"
                                      OnClientClick="return ValidateInpute();" /></asp:View>
                              <asp:View ID="View2" runat="server">
                              </asp:View>
                          </asp:MultiView>&nbsp;
                      </td>
                      <td style="width: 390px;">
                      </td>
                      <td style="width: 442px;">
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 300px">
                      </td>
                      <td style="width: 390px">
                      </td>
                      <td style="width: 442px">
                      </td>
                  </tr>
              </table>
          </td>
          <td background="../softimages/low_bor3.gif" style="width: 17px; height: 26px;"></td>
      </tr>
      
      <tr>
          <td style="height: 16px; width: 3px;"><img src="../softimages/low_curve1.gif" /></td>
          <td colspan="3" background="../softimages/low_bor4.gif" style="height: 16px; width: 984px;"></td>
          <td style="width: 17px; height: 16px;"><img src="../softimages/low_curve4.gif" /></td>
      </tr>
</table>
        </td>
	</tr>
	</table>

 <%--   <form id="form1" runat="server">--%>
    
  <div> 
    
                      <p style="text-align: center">
                          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<span style="font-size: 16pt;
            font-family: Verdana"></span></p>
      
    </div>
  <%--   </form> --%>
 </div>
    
  </asp:Content>
