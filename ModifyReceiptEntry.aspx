<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/SFA.master" CodeFile="ModifyReceiptEntry.aspx.vb" Inherits="mmsoft_ModifyReceiptEntry" %>

<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
<script language="javascript" src="jsFiles/PaymentDetails.js" type="text/javascript" ></script> 
<script language ="javascript" src="jsFiles/MainJSValidate.js" type ="text/javascript" ></script>
<script language="javascript" type ="text/javascript" >

function validateInput()
{
    if(validateDropDown(document.getElementById('ctl00_ContentPlaceHolder2_drpaccounthead'),'Select Account Head'))
    {
    if(isNotLetter(document.getElementById('ctl00_ContentPlaceHolder2_txtamount'),'Alphabet in Amount'))
    {
    if(validateEmpty(document.getElementById('ctl00_ContentPlaceHolder2_txtnarration'),'Enter Narration','Invalid text in Narration'))
    {
    
        return true;
    }
    }
    }
    return false;
}
</script>

<div id="main" style="position:absolute; width:950px; left: 9px; top: 77px; ">

<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
	<td style="width: 991px">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td style="height: 21px"><img src="../softimages/head_c_l.jpg" height="21" style="width: 11px" /></td>
        <td background="../softimages/head_cen_bg.jpg" class="Title21" style="width:158px; height: 21px;">
            <span style="font-size: 11pt; font-family: Verdana">Receipt Entry</span></td>
        <td width="841" style="height: 21px"><img src="../softimages/head_c_r.jpg" width="13" height="21" /></td>
      </tr>
    </table>
	</td>
	</tr>
	<tr>
	<td style="height: 30px; width: 991px;">
	<table  border="0" cellspacing="0" cellpadding="0" style="width: 100%" class="td_bg_1">
    
    
    
        <tr>
                          <td style="width: 3px; height: 5px;"><img src="../softimages/low_curve21.jpg" /></td>
                          <td colspan="3" background="../softimages/low_bor2.gif" style="height: 5px">
                              
                              </td>
                          <td style="width: 17px; height: 5px;"><img src="../softimages/low_curve3.gif" /></td>
      </tr>
      <tr>
      <td style="width: 3px" background="../softimages/l_bor1.gif"></td>
          <td colspan="3" style="height: 1px">
              <table border="0" cellpadding="0" cellspacing="0" width="100%">
                  <tr>
                      <td colspan="2" style="width: 270px; height: 1px">
                          <table width="100%">
                              <tr>
                                  <td style="width: 1448px; height: 5px;">
                                      <strong><span style="font-size: 8pt; font-family: Verdana">Select Dates to View Entries</span></strong></td>
                                  <td style="width: 276px; height: 5px;">
                                      <cc1:GMDatePicker ID="fromdate" runat="server">
                                      </cc1:GMDatePicker>
                                  </td>
                                  <td style="width: 525px; height: 5px;">
                                      <cc1:GMDatePicker ID="todate" runat="server">
                                      </cc1:GMDatePicker>
                                  </td>
                              </tr>
                              <tr>
                                  <td style="width: 1448px; height: 22px;">
                                  </td>
                                  <td style="width: 276px; height: 22px;">
                                      <asp:ImageButton ID="imbOk" runat="server" ImageUrl="~/softimages/ok.gif" OnClientClick="return validateInpute();" /></td>
                                  <td style="width: 525px; height: 22px;">
                                  </td>
                              </tr>
                              <tr>
                                  <td style="height: 217px; text-align: center;" colspan="3">
                                      &nbsp;
                          <asp:MultiView ID="MultiView1" runat="server">
                              <asp:View ID="View1" runat="server">
                                      <asp:GridView ID="PaymentGrid" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                          DataKeyNames="trans_id" DataSourceID="SqlDataSource2" Font-Names="Verdana" Font-Size="8pt"
                                          ForeColor="#333333" GridLines="None" Height="187px" Width="722px">
                                          <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                          <Columns>
                                              <asp:BoundField DataField="trans_id" HeaderText="Transaction Id" SortExpression="trans_id" />
                                              <asp:BoundField DataField="trans_date" HeaderText="Transaction Date" SortExpression="trans_date" />
                                              <asp:BoundField DataField="accounthead_name" HeaderText="Account Head" SortExpression="accounthead_name" />
                                              <asp:BoundField DataField="trans_amount" HeaderText="Transaction Amount" SortExpression="trans_amount" />
                                              <asp:BoundField DataField="trans_narration" HeaderText="Narration" SortExpression="trans_narration" />
                                              <asp:TemplateField HeaderText="Select Transaction">
                                                  <ItemTemplate>
                                                      <asp:RadioButton ID="rdTrans" runat="server" GroupName="Trans" onClick="check(this);" />
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
                                      <asp:ImageButton ID="imbview" runat="server" ImageUrl="~/softimages/view.gif" OnClientClick="return ValidateInpute();" /></asp:View>
                              <asp:View ID="View2" runat="server">
                          <table style="height: 1px; width: 425px; text-align: left;" border="0">
                              <tr>
                                  <td style="width: 216px; height: 38px;">
                                      <span style="font-size: 8pt; font-family: Verdana"><strong>Transction Date</strong></span></td>
                                  <td colspan="3" style="height: 38px">
                                      <cc1:GMDatePicker ID="trans_date" runat="server">
                                      </cc1:GMDatePicker>
                                      <strong><span style="font-size: 10pt; font-family: Verdana"></span></strong>
                                  </td>
                              </tr>
                              <tr>
                                  <td style="width: 216px">
                                      <strong><span style="font-size: 8pt; font-family: Verdana">Account Head</span></strong></td>
                                  <td colspan="3">
                                      <asp:DropDownList ID="drpaccounthead" runat="server" Font-Bold="False" Font-Names="Verdana"
                                          Font-Size="8pt" ForeColor="#006699" Height="20px" Width="175px">
                                      </asp:DropDownList></td>
                              </tr>
                              <tr>
                                  <td style="width: 216px">
                                      <strong><span style="font-size: 8pt; font-family: Verdana">Amount</span></strong></td>
                                  <td colspan="3">
                                      <asp:TextBox ID="txtamount" runat="server" Font-Bold="True" ForeColor="#006699" Width="231px"></asp:TextBox></td>
                              </tr>
                              <tr>
                                  <td style="width: 216px">
                                      <strong><span style="font-size: 8pt; font-family: Verdana">Narration</span></strong></td>
                                  <td colspan="3">
                                      <asp:TextBox ID="txtnarration" runat="server" Columns="3" Font-Bold="True" Font-Names="Verdana"
                                          Font-Size="10pt" ForeColor="#006699" Height="44px" Rows="3" TextMode="MultiLine"
                                          Width="231px"></asp:TextBox></td>
                              </tr>
                              <tr style="font-size: 12pt; font-family: Times New Roman">
                                  <td style="width: 216px; height: 7px">
                                  </td>
                                  <td colspan="3" style="height: 7px">
                                  </td>
                              </tr>
                              <tr>
                                  <td center="" colspan="4" style="text-align: right" text-align:>
                                      <table>
                                          <tr>
                                              <td style="height: 24px; width: 204px;">
                                              </td>
                                              <td style="width: 454px; height: 24px; text-align: left">
                                                  <asp:ImageButton ID="imbSave" runat="server" ImageUrl="../softimages/save.gif" OnClientClick="return validateInput();" />
                                                  <asp:ImageButton ID="imbCancel" runat="server" ImageUrl="~/softimages/Cancel.gif" OnClientClick="return validateInput();" /></td>
                                          </tr>
                                      </table>
                                      <a href="admin_module.htm"></a>
                                  </td>
                              </tr>
                          </table>
                                  
                              </asp:View>
<asp:View ID="View3" runat="server">
                                  </asp:View>
                          </asp:MultiView></td>
                              </tr>
                          </table>
                          </td>
                      <td style="width: 339px; height: 1px">
                          <asp:TextBox ID="txtfromdate" runat="server" Font-Bold="True" ForeColor="#006699" Width="231px" Visible="False"></asp:TextBox>
                          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conMM %>"
                              SelectCommand="SELECT [loc_name] FROM [location_master] ORDER BY [loc_id]"></asp:SqlDataSource>
                                      <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:conMM %>"
                                          SelectCommand="SELECT transaction_account.trans_id, transaction_account.trans_date, transaction_account.accounthead_id, accounthead_master.accounthead_name, transaction_account.trans_amount, transaction_account.trans_narration, transaction_account.other_account, transaction_account.tr_type FROM accounthead_master INNER JOIN transaction_account ON accounthead_master.accounthead_id = transaction_account.accounthead_id WHERE (transaction_account.trans_date BETWEEN @fromdate AND @todate) AND (transaction_account.tr_type = 'R')">
                                          <SelectParameters>
                                              <asp:ControlParameter ControlID="txtfromdate" Name="fromdate" PropertyName="Text" />
                                              <asp:ControlParameter ControlID="txttodate" Name="todate" PropertyName="Text" />
                                          </SelectParameters>
                                      </asp:SqlDataSource>
                          <asp:TextBox ID="txttodate" runat="server" Font-Bold="True" ForeColor="#006699"
                              Width="231px" Visible="False"></asp:TextBox></td>
                  </tr>
                  <tr>
                      <td style="height: 1px; width: 270px;" colspan="2">
                      </td>
                      <td style="width: 339px; height: 1px">
                      </td>
                  </tr>
                  <tr>
                      <td colspan="2" style="width: 270px">
                      </td>
                      <td style="width: 339px;">
                      </td>
                  </tr>
              </table>
          </td>
          <td background="../softimages/low_bor3.gif" style="width: 17px"></td>
      </tr>
      
      <tr>
          <td style="height: 16px; width: 3px;"><img src="../softimages/low_curve1.gif" /></td>
          <td colspan="3" background="../softimages/low_bor4.gif" style="height: 16px"></td>
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



