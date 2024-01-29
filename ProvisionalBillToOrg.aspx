<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/SFA.master" CodeFile="ProvisionalBillToOrg.aspx.vb" Inherits="mmsoft_ProvisionalBillToOrg" %>

<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
<script language ="javascript" src="jsFiles/MainJSValidate.js" type ="text/javascript" ></script>
<script language="javascript" type ="text/javascript" >
function ValidateStage()
{
        if(validateDropDown(document.getElementById('ctl00_ContentPlaceHolder2_drpParticulars'),'Select Particulars'))
        {
        if(isNotLetter(document.getElementById('ctl00_ContentPlaceHolder2_txtDetailAmt'),'Alphabet in Particulars Amount'))
        {
            return true;
        }
        }
    return false;
}
function ValidateInput()
{
	    
	    if(validateDropDown(document.getElementById('ctl00_ContentPlaceHolder2_drpSite'),'Select Site'))
        {
        if(validateDropDown(document.getElementById('ctl00_ContentPlaceHolder2_drpBuilding'),'Select Building'))
        {
        if(validateDropDown(document.getElementById('ctl00_ContentPlaceHolder2_drpFlatNumber'),'Select Flat Number'))
        {
        if(validateDropDown(document.getElementById('ctl00_ContentPlaceHolder2_drpMode'),'Select Mode Of Payment'))
        {
        if(isNotLetter(document.getElementById('ctl00_ContentPlaceHolder2_txtamount'),'Alphabet in Paid Interest'))
        {        
        if(validateEmpty(document.getElementById('ctl00_ContentPlaceHolder2_txtotherdetails'),'Enter Other Details','Invalid Input in Other Details'))
        {
              return true;        
        }      
        }}}
        }}                
        return false;
}

</script>
<div id="main" style="position:absolute; width:952px; left: 11px; top: 79px; ">

<table cellpadding="0" cellspacing="0" border="0" style="width: 104%">
	<tr>
	<td style="width: 1363px;">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td style="height: 20px"><img src="../softimages/head_c_l.jpg" height="21" style="width: 11px" /></td>
        <td background="../softimages/head_cen_bg.jpg" class="Title21" style="width:220px; height: 20px;">
            <span style="font-size: 10pt; font-family: Verdana">Provisional To Original Bill</span></td>
        <td style="height: 20px; width: 845px;"><img src="../softimages/head_c_r.jpg" width="13" height="21" /></td>
      </tr>
    </table>
	</td>
	</tr>
	<tr>
	<td style="height: 30px; width: 1363px;">
	
	<table  border="0" cellspacing="0" cellpadding="0" style="width: 100%" class="td_bg_1">
    
    
    
        <tr>
                          <td style="width: 3px;"><img src="../softimages/low_curve21.jpg" /></td>
                          <td colspan="3" background="../softimages/low_bor2.gif" style="width: 878px;">
                              
                              </td>
                          <td style="width: 17px;"><img src="../softimages/low_curve3.gif" /></td>
      </tr>
      <tr>
      <td style="width: 3px;" background="../softimages/l_bor1.gif"></td>
          <td colspan="3" style="width: 878px;">
              <table width="100%">
                  <tr>
                      <td style="width: 1114px">
                      </td>
                      <td style="width: 254px">
                          &nbsp;</td>
                      <td style="width: 422px">
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 1114px">
                          <asp:GridView ID="gvInterest" runat="server" AutoGenerateColumns="False" BackColor="White"
                              BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" Font-Names="Verdana"
                              Font-Size="8pt" ForeColor="Black" GridLines="Vertical" Width="106%">
                              <FooterStyle BackColor="#CCCC99" CssClass="td_bg_selected3" />
                              <Columns>
                                  <asp:TemplateField>
                                      <ItemTemplate>
                                          <asp:CheckBox ID="chkSelect" runat="server" /><input id="hdnDetailsId" runat="server" type="hidden" value='<%# Bind("ReceiptNos") %>' />
                                          <input id="HiddenID" runat="server" type="hidden" value='<%# Bind("ReceiptNos") %>' />
                                      </ItemTemplate>
                                      <ItemStyle HorizontalAlign="Center" Width="25px" />
                                      <HeaderStyle Width="25px" />
                                  </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Receipt No." SortExpression="User_Name">
                                      <ItemStyle HorizontalAlign="Right" />
                                      <HeaderStyle HorizontalAlign="Center" />
                                      <ItemTemplate>
                                          <asp:Label ID="lblUser2" runat="server" Text='<%# Bind("ReceiptNos") %>'></asp:Label>
                                      </ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Receipt Date" SortExpression="User_Name">
                                      <ItemStyle HorizontalAlign="Right" />
                                      <HeaderStyle HorizontalAlign="Center" />
                                      <ItemTemplate>
                                          <asp:Label ID="lblUser67" runat="server" Text='<%# Bind("ReceiptDate") %>'></asp:Label>
                                      </ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Receipt Amt" SortExpression="User_Name">
                                      <ItemStyle HorizontalAlign="Right" />
                                      <HeaderStyle HorizontalAlign="Center" />
                                      <ItemTemplate>
                                          <asp:Label ID="lblUser3" runat="server" Text='<%# Bind("ReceiptAmt") %>'></asp:Label>
                                      </ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField HeaderText="First Name" SortExpression="User_Name">
                                      <ItemStyle HorizontalAlign="Right" />
                                      <HeaderStyle HorizontalAlign="Center" />
                                      <ItemTemplate>
                                          <asp:Label ID="lblUser4" runat="server" Text='<%# Bind("FName") %>'></asp:Label>
                                      </ItemTemplate>
                                  </asp:TemplateField>     
                                  <asp:TemplateField HeaderText="Last Name" SortExpression="User_Name">
                                      <ItemStyle HorizontalAlign="Right" />
                                      <HeaderStyle HorizontalAlign="Center" />
                                      <ItemTemplate>
                                          <asp:Label ID="lblUser6" runat="server" Text='<%# Bind("LName") %>'></asp:Label>
                                      </ItemTemplate>
                                  </asp:TemplateField>       
                                  <asp:TemplateField HeaderText="Cheque Date" SortExpression="User_Name">
                                      <ItemStyle HorizontalAlign="Right" />
                                      <HeaderStyle HorizontalAlign="Center" />
                                      <ItemTemplate>
                                          <asp:Label ID="lblUser7" runat="server" Text='<%# Bind("Chequedate") %>'></asp:Label>
                                      </ItemTemplate>
                                  </asp:TemplateField>                          
                              </Columns>
                              <RowStyle BackColor="#F7F7DE" CssClass="td_bg_selected1" />
                              <HeaderStyle BackColor="#6B696B" CssClass="td_bg_selected3" Font-Bold="True" ForeColor="White" />
                              <PagerStyle BackColor="#F7F7DE" CssClass="FooterStyle" ForeColor="Black" HorizontalAlign="Right" />
                              <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                              <AlternatingRowStyle BackColor="White" />
                          </asp:GridView>
                      </td>
                      <td style="width: 254px">
                      </td>
                      <td style="width: 422px">
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 1114px">
                          <asp:ImageButton ID="imbSave" runat="server" ImageUrl="~/softimages/ok.gif" OnClientClick="return ValidateInput();" /></td>
                      <td style="width: 254px">
                      </td>
                      <td style="width: 422px">
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 1114px">
                          <table>
                              <tr>
                                  <td style="width: 168px">
                                      <span style="font-size: 8pt; font-family: Verdana">Receipt No.</span></td>
                                  <td style="width: 193px">
                                      <asp:Label ID="lblReceiptNo" runat="server" Font-Names="Verdana" Font-Size="8pt"
                                          Text="Label"></asp:Label></td>
                                  <td style="width: 181px">
                                      <span style="font-size: 8pt; font-family: Verdana">Receipt Date</span></td>
                                  <td style="width: 181px">
                                      <asp:Label ID="lblReceiptDate" runat="server" Font-Names="Verdana" Font-Size="8pt"
                                          Text="Label"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 168px">
                                      <span style="font-size: 8pt; font-family: Verdana">Receipt Amount</span></td>
                                  <td style="width: 193px">
                                      <asp:Label ID="lblReceiptamt" runat="server" Font-Names="Verdana" Font-Size="8pt"
                                          Text="Label"></asp:Label></td>
                                  <td style="width: 181px">
                                      <span style="font-size: 8pt; font-family: Verdana">Mode of payment</span></td>
                                  <td style="width: 181px">
                                      <asp:Label ID="lblModeOfPay" runat="server" Font-Names="Verdana" Font-Size="8pt"
                                          Text="Label"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 168px">
                                      <span style="font-size: 8pt; font-family: Verdana">First Name</span></td>
                                  <td style="width: 193px">
                                      <asp:Label ID="lblFname" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"></asp:Label></td>
                                  <td style="width: 181px">
                                      <span style="font-size: 8pt; font-family: Verdana">Last Name</span></td>
                                  <td style="width: 181px">
                                      <asp:Label ID="lblLName" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 168px">
                                      <span style="font-size: 8pt; font-family: Verdana">Bank</span></td>
                                  <td style="width: 193px">
                                      <asp:Label ID="lblBank" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"></asp:Label></td>
                                  <td style="width: 181px">
                                      Branch</td>
                                  <td style="width: 181px">
                                      <asp:Label ID="lblBranch" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 168px">
                                      <span style="font-size: 8pt; font-family: Verdana">Other Details</span></td>
                                  <td style="width: 193px">
                                      <asp:Label ID="lblOtherDetails" runat="server" Font-Names="Verdana" Font-Size="8pt"
                                          Text="Label"></asp:Label></td>
                                  <td style="width: 181px">
                                      <span style="font-size: 8pt; font-family: Verdana">Cheque Date</span></td>
                                  <td style="width: 181px">
                                      <asp:Label ID="lblChequeDate" runat="server" Font-Names="Verdana" Font-Size="8pt"
                                          Text="Label"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 168px">
                                      <span style="font-size: 8pt; font-family: Verdana">Status</span></td>
                                  <td style="width: 193px">
                                      <asp:DropDownList ID="drpStatus" runat="server">
                                          <asp:ListItem Value="0">-- Select --</asp:ListItem>
                                          <asp:ListItem>Pending</asp:ListItem>
                                          <asp:ListItem>Canceled</asp:ListItem>
                                          <asp:ListItem>Bounced</asp:ListItem>
                                          <asp:ListItem>Honoured</asp:ListItem>
                                      </asp:DropDownList></td>
                                  <td style="width: 181px">
                                      <span style="font-size: 8pt; font-family: Verdana">Original Receipt No.</span></td>
                                  <td style="width: 181px">
                                      <asp:Label ID="lblAmtInLetter" runat="server" Font-Names="Verdana" Font-Size="8pt"
                                          Text="Label"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 168px">
                                      <span style="font-size: 8pt; font-family: Verdana">Original Receipt No.</span></td>
                                  <td style="width: 193px">
                                      <asp:Label ID="lblNewReceiptNo" runat="server" Font-Names="Verdana" Font-Size="8pt"
                                          Text="Label"></asp:Label></td>
                                  <td style="width: 181px">
                                  </td>
                                  <td style="width: 181px">
                                  </td>
                              </tr>
                              <tr>
                                  <td style="width: 168px">
                                  </td>
                                  <td style="width: 193px; text-align: right">
                                      <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/softimages/print-bt.gif"
                                          OnClientClick="return ValidateInput();" /><asp:ImageButton ID="imbCancel" runat="server"
                                              ImageUrl="~/softimages/Cancel_btn.gif" /></td>
                                  <td style="width: 181px">
                                  </td>
                                  <td style="width: 181px">
                                  </td>
                              </tr>
                          </table>
                      </td>
                      <td style="width: 254px">
                      </td>
                      <td style="width: 422px">
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 1114px">
                      </td>
                      <td style="width: 254px">
                      </td>
                      <td style="width: 422px">
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 1114px; height: 20px;">
                          &nbsp;<asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt"
                              ForeColor="Red"></asp:Label></td>
                      <td style="width: 254px; height: 20px;">
                          </td>
                      <td style="width: 422px; height: 20px;">
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 1114px; height: 16px">
                          <asp:TextBox ID="txthidden" runat="server" Visible="False"></asp:TextBox></td>
                      <td style="width: 254px; height: 16px">
                      </td>
                      <td style="width: 422px; height: 16px">
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 1114px">
                      </td>
                      <td style="width: 254px">
                      </td>
                      <td style="width: 422px">
                      </td>
                  </tr>
              </table>
          </td>
          <td background="../softimages/low_bor3.gif" style="width: 17px;"></td>
      </tr>
      
      <tr>
          <td style="height: 15px; width: 3px;"><img src="../softimages/low_curve1.gif" /></td>
          <td colspan="3" background="../softimages/low_bor4.gif" style="height: 15px; width: 878px;"></td>
          <td style="width: 17px; height: 15px;"><img src="../softimages/low_curve4.gif" /></td>
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
                <br />
               
   
  </asp:Content>