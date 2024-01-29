<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/SFA.master" CodeFile="TransactionACPayment.aspx.vb" Inherits="mmsoft_TransactionACPayment" %>

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
	    
	    if(validateDropDown(document.getElementById('ctl00_ContentPlaceHolder2_drpFlatNumber'),'Select Flat Number'))
        {
        if(validateDropDown(document.getElementById('ctl00_ContentPlaceHolder2_drpPaymentType'),'Select Payment Type'))
        {
        if(isNotLetter(document.getElementById('ctl00_ContentPlaceHolder2_txtTransactPayamt'),'Alphabet in Payment Amount'))
        {        
        
              return true;        
        }      
        }
        }               
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
            <span style="font-size: 10pt; font-family: Verdana">Transaction Payment</span></td>
        <td style="height: 20px; width: 845px;"><img src="../softimages/head_c_r.jpg" width="13" height="21" /></td>
      </tr>
    </table>
	</td>
	</tr>
	<tr>
	<td style="height: 30px; width: 1363px;">
	
	<table  border="0" cellspacing="0" cellpadding="0" style="width: 100%" class="td_bg_1">
    
    
    
        <tr>
                          <td style="width: 3px; height: 5px;"><img src="../softimages/low_curve21.jpg" /></td>
                          <td colspan="3" background="../softimages/low_bor2.gif" style="height: 5px; width: 878px;">
                              
                              </td>
                          <td style="width: 17px; height: 5px;"><img src="../softimages/low_curve3.gif" /></td>
      </tr>
      <tr>
      <td style="width: 3px;" background="../softimages/l_bor1.gif"></td>
          <td colspan="3" style="width: 878px;">
              <table width="100%">
                  <tr>
                      <td style="width: 2283px; height: 20px;">
                      </td>
                      <td style="width: 412px; height: 20px;">
                          &nbsp;</td>
                      <td style="width: 422px; height: 20px;">
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 2283px; height: 20px">
                          <table>
                              <tr>
                                  <td style="width: 154px">
                                      <span style="font-size: 8pt; font-family: Verdana">Site Name</span></td>
                                  <td>
                                      <asp:DropDownList ID="drpSite" runat="server" AutoPostBack="True" Font-Bold="False"
                                          Font-Names="Verdana" Font-Size="8pt" ForeColor="#006699" Height="20px" Width="175px">
                                          <asp:ListItem Value="0">--Select--</asp:ListItem>
                                      </asp:DropDownList></td>
                                  <td style="width: 181px">
                                      <span style="font-size: 8pt; font-family: Verdana">Select Building</span></td>
                                  <td style="width: 181px">
                                      <asp:DropDownList ID="drpBuilding" runat="server" AutoPostBack="True" Font-Bold="False"
                                          Font-Names="Verdana" Font-Size="8pt" ForeColor="#006699" Height="20px" Width="175px">
                                          <asp:ListItem Value="0">--Select--</asp:ListItem>
                                      </asp:DropDownList></td>
                              </tr>
                              <tr>
                                  <td style="width: 154px">
                                      <span style="font-size: 8pt; font-family: Verdana">Select Flat Nos</span></td>
                                  <td>
                                      <asp:DropDownList ID="drpFlatnumber" runat="server" AutoPostBack="True" Font-Bold="False"
                                          Font-Names="Verdana" Font-Size="8pt" ForeColor="#006699" Height="20px" Width="175px">
                                          <asp:ListItem Value="0">--Select--</asp:ListItem>
                                      </asp:DropDownList></td>
                                  <td style="width: 181px">
                                      <span style="font-size: 8pt; font-family: Verdana"></span></td>
                                  <td style="width: 181px">
                                      </td>
                              </tr>
                              <tr>
                                  <td style="width: 154px">
                                      <span style="font-size: 8pt; font-family: Verdana">First Name</span></td>
                                  <td>
                                      <asp:Label ID="lblFname" runat="server" Font-Size="8pt" Width="170px"></asp:Label></td>
                                  <td style="width: 181px; font-family: Verdana;">
                                      <span style="font-size: 8pt;">Last Name</span></td>
                                  <td style="width: 181px">
                                      <asp:Label ID="lblLName" runat="server" Font-Names="Verdana" Font-Size="8pt" Width="151px"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 154px">
                                      <span style="font-size: 8pt; font-family: Verdana">Secondary First Name</span></td>
                                  <td>
                                      <asp:Label ID="lblSFName" runat="server" Font-Size="8pt" Width="169px"></asp:Label></td>
                                  <td style="width: 181px">
                                      <span style="font-size: 8pt; font-family: Verdana">Secondary Last Name</span></td>
                                  <td style="width: 181px">
                                      <asp:Label ID="lblSLName" runat="server" Font-Names="Verdana" Font-Size="8pt" Width="151px"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 154px">
                                      <span style="font-size: 8pt; font-family: Verdana">Address</span></td>
                                  <td>
                                      <asp:Label ID="lblAddress" runat="server" Font-Size="8pt" Width="246px"></asp:Label></td>
                                  <td style="width: 181px">
                                      <span style="font-size: 8pt; font-family: Verdana">Email Id</span></td>
                                  <td style="width: 181px">
                                      <asp:Label ID="lblemail" runat="server" Font-Names="Verdana" Font-Size="8pt" Width="151px"></asp:Label></td>
                              </tr><tr>
                                  <td style="width: 154px">
                                  </td>
                                  <td style="text-align: left">
                                  </td>
                                  <td style="width: 181px">
                                  </td>
                                  <td style="width: 181px">
                                  </td>
                              </tr>
                          </table>
                      </td>
                      <td style="width: 412px; height: 20px">
                      </td>
                      <td style="width: 422px; height: 20px">
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 2283px; height: 173px;">
                          <asp:GridView ID="gvInterest" runat="server" AutoGenerateColumns="False" BackColor="White"
                              BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" Font-Names="Verdana"
                              Font-Size="8pt" ForeColor="Black" GridLines="Vertical" Width="106%">
                              <FooterStyle BackColor="#CCCC99" CssClass="td_bg_selected3" />
                              <Columns>
                                  <asp:TemplateField>
                                      <ItemTemplate>
                                          <asp:CheckBox ID="chkSelect" runat="server" />
                                          <input id="txtpartiIdgrid" runat="server" type="hidden" value='<%# Bind("ParticularsId") %>' />
                                          <input id="txtpartigrid" runat="server" type="hidden" value='<%# Bind("ParticularsName") %>' />
                                           <input id="txtamtgrid" runat="server" type="hidden" value='<%# Bind("Transact_Amt") %>' />
                                      </ItemTemplate>
                                      <ItemStyle HorizontalAlign="Center" Width="25px" />
                                      <HeaderStyle Width="25px" />
                                  </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Particulars" SortExpression="User_Name">
                                      <ItemStyle HorizontalAlign="Right" />
                                      <HeaderStyle HorizontalAlign="Center" />
                                      <ItemTemplate>
                                          <asp:Label ID="lblUser2" runat="server" Text='<%# Bind("ParticularsName") %>'></asp:Label>
                                      </ItemTemplate>
                                  </asp:TemplateField>                                 
                                  <asp:TemplateField HeaderText="Transact Amt" SortExpression="User_Name">
                                      <ItemStyle HorizontalAlign="Right" />
                                      <HeaderStyle HorizontalAlign="Center" />
                                      <ItemTemplate>
                                          <asp:Label ID="lblUser3" runat="server" Text='<%# Bind("Transact_Amt") %>'></asp:Label>
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
                      <td style="width: 412px; height: 173px;">
                      </td>
                      <td style="width: 422px; height: 173px;">
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 2283px; height: 22px;">
                          <asp:ImageButton ID="imbEdit" runat="server" ImageUrl="~/softimages/edit_bt.gif"  /></td>
                      <td style="width: 412px; height: 22px;">
                      </td>
                      <td style="width: 422px; height: 22px;">
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 2283px">
                          <table>
                              <tr>
                                  <td style="width: 154px">
                                      <span style="font-size: 8pt; font-family: Verdana">Particulars</span></td>
                                  <td>
                                      <asp:DropDownList ID="drpParticulars" runat="server" AutoPostBack="True" Font-Bold="False"
                                          Font-Names="Verdana" Font-Size="8pt" ForeColor="#006699" Height="20px" Width="175px" Enabled="False">
                                          <asp:ListItem Value="0">--Select--</asp:ListItem>
                                      </asp:DropDownList></td>
                                  <td style="width: 181px">
                                      <span style="font-size: 8pt; font-family: Verdana">Transaction Amount</span></td>
                                  <td style="width: 181px">
                                      &nbsp;<asp:TextBox ID="txtTransactAmt" runat="server" Enabled="False"></asp:TextBox></td>
                              </tr>
                              <tr>
                                  <td style="width: 154px">
                                      <span style="font-size: 8pt; font-family: Verdana"></span></td>
                                  <td>
                                      </td>
                                  <td style="width: 181px">
                                  </td>
                                  <td style="width: 181px">
                                  </td>
                              </tr>
                              <tr>
                                  <td style="width: 154px">
                                  </td>
                                  <td>
                                  </td>
                                  <td style="width: 181px">
                                  </td>
                                  <td style="width: 181px">
                                  </td>
                              </tr>
                              <tr>
                                  <td style="width: 154px">
                                      <span style="font-size: 8pt; font-family: Verdana">Transaction Amount</span></td>
                                  <td>
                                      <asp:TextBox ID="txtTransactPayamt" runat="server"></asp:TextBox></td>
                                  <td style="width: 181px">
                                      <span style="font-size: 8pt; font-family: Verdana">Date</span></td>
                                  <td style="width: 181px">
                                      <cc1:GMDatePicker ID="TransactdatePay" runat="server" DateFormat="d-MMM-yy" DisplayMode="Label"
                                          Font-Names="Verdana" Font-Size="8pt" MaxDate="2020-12-31" MinDate="1950-01-01"
                                          YearDropDownRange="100">
                                      </cc1:GMDatePicker>
                                  </td>
                              </tr>
                              <tr>
                                  <td style="width: 154px">
                                      <span style="font-size: 8pt; font-family: Verdana">Remarks</span></td>
                                  <td>
                                      <asp:TextBox ID="txtRemarks" runat="server"></asp:TextBox></td>
                                  <td style="width: 181px">
                                      <span style="font-size: 8pt; font-family: Verdana">Payment Type</span></td>
                                  <td style="width: 181px">
                                      <asp:DropDownList ID="drpPaymentType" runat="server" AutoPostBack="True" Font-Bold="False"
                                          Font-Names="Verdana" Font-Size="8pt" ForeColor="#006699" Height="20px" Width="175px">
                                          <asp:ListItem Value="0">--Select--</asp:ListItem>
                                          <asp:ListItem>Cash</asp:ListItem>
                                          <asp:ListItem>Cheque</asp:ListItem>
                                      </asp:DropDownList></td>
                              </tr>
                              <tr>
                                  <td style="width: 154px">
                                      <span style="font-size: 8pt; font-family: Verdana"></span>
                                  </td>
                                  <td>
                                  </td>
                                  <td style="width: 181px">
                                  </td>
                                  <td style="width: 181px">
                                  </td>
                              </tr>
                              <tr>
                                  <td style="width: 154px">
                                  </td>
                                  <td style="text-align: right">
                                      <asp:ImageButton ID="imbSave" runat="server" ImageUrl="~/softimages/save.gif"
                                          OnClientClick="return ValidateInput();" /><asp:ImageButton ID="imbCancel" runat="server"
                                              ImageUrl="~/softimages/Cancel_btn.gif" /></td>
                                  <td style="width: 181px">
                                  </td>
                                  <td style="width: 181px">
                                  </td>
                              </tr>
                          </table>
                      </td>
                      <td style="width: 412px">
                      </td>
                      <td style="width: 422px">
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 2283px">
                      </td>
                      <td style="width: 412px">
                      </td>
                      <td style="width: 422px">
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 2283px; height: 20px;">
                          &nbsp;<asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt"
                              ForeColor="Red"></asp:Label></td>
                      <td style="width: 412px; height: 20px;">
                          </td>
                      <td style="width: 422px; height: 20px;">
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 2283px; height: 16px">
                          <asp:TextBox ID="txthidden" runat="server" Visible="False"></asp:TextBox></td>
                      <td style="width: 412px; height: 16px">
                      </td>
                      <td style="width: 422px; height: 16px">
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 2283px">
                      </td>
                      <td style="width: 412px">
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