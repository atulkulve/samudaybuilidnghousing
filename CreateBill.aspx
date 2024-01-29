<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/SFA.master" CodeFile="CreateBill.aspx.vb" Inherits="mmsoft_CreateBill" %>

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
            <span style="font-size: 10pt; font-family: Verdana">Create Bill</span></td>
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
                      <td style="width: 841px">
                          <table border="0" bordercolor="#006699">
                              <tr>
                                  <td style="width: 161px; text-align: left;">
                                      <span style="font-size: 10pt; font-family: Verdana"><span style="font-size: 8pt">Select
                                          Site</span></span></td>
                                  <td style="text-align: left; width: 337px;"><asp:DropDownList ID="drpSite" runat="server" Font-Bold="False" Font-Names="Verdana"
                                                  Font-Size="8pt" ForeColor="#006699" Height="20px" Width="175px" AutoPostBack="True">
                                      <asp:ListItem Value="0">--Select--</asp:ListItem>
                                  </asp:DropDownList></td>
                                  <td style="width: 247px; text-align: left">
                                      <span style="font-size: 8pt; font-family: Verdana">Select Building</span></td>
                                  <td style="width: 247px; text-align: left; font-size: 8pt; font-family: Tahoma;">
                                      <asp:DropDownList ID="drpBuilding" runat="server" Font-Bold="False" Font-Names="Verdana"
                                                  Font-Size="8pt" ForeColor="#006699" Height="20px" Width="175px" AutoPostBack="True">
                                          <asp:ListItem Value="0">--Select--</asp:ListItem>
                                      </asp:DropDownList></td>
                              </tr>
                              <tr>
                                  <td style="width: 161px; text-align: left">
                                      <span style="font-size: 8pt; font-family: Verdana">Flat Number</span></td>
                                  <td style="width: 337px; text-align: left">
                                              <asp:DropDownList ID="drpFlatNumber" runat="server" Font-Bold="False" Font-Names="Verdana"
                                                  Font-Size="8pt" ForeColor="#006699" Height="20px" Width="175px" AutoPostBack="True">
                                                  <asp:ListItem Value="0">--Select--</asp:ListItem>
                                              </asp:DropDownList></td>
                                  <td style="width: 247px; text-align: left">
                                      <span style="font-size: 8pt; font-family: Verdana">
                                      </span></td>
                                  <td style="width: 247px; text-align: left; font-size: 8pt; font-family: Verdana;">
                                      </td>
                              </tr>
                              <tr>
                                  <td colspan="4" style="height: 3px; text-align: left">
                                  </td>
                              </tr>
                              <tr>
                                  <td colspan="4" style="height: 4px; text-align: left">
                                      <asp:MultiView ID="MultiView1" runat="server">
                                          <asp:View ID="View1" runat="server">
                                          </asp:View>
                                          <asp:View ID="View2" runat="server">
                                      <table width="100%">
                                          <tr>
                                              <td style="width: 117px">
                                                  <span style="font-size: 8pt; font-family: Verdana">First Name</span></td>
                                              <td style="width: 270px">
                                                  <asp:Label ID="lblFName" runat="server" Font-Names="Verdana" Font-Size="8pt" Width="62px"></asp:Label></td>
                                              <td style="width: 181px">
                                                  <span style="font-size: 8pt; font-family: Verdana">Last Name</span></td>
                                              <td style="width: 217px">
                                                  <asp:Label ID="lblLName" runat="server" Font-Names="Verdana" Font-Size="8pt" Width="62px"></asp:Label></td>
                                          </tr>
                                          <tr style="font-size: 8pt; font-family: Tahoma">
                                              <td style="width: 117px">
                                                  <span>Address</span></td>
                                              <td style="width: 270px">
                                                  <asp:Label ID="lblAddress" runat="server" Font-Names="Verdana" Font-Size="8pt" Width="231px"></asp:Label></td>
                                              <td style="width: 181px">
                                                  <span style="font-size: 8pt; font-family: Verdana">Tel No.</span></td>
                                              <td style="width: 217px">
                                                  <asp:Label ID="lbltelno" runat="server" Font-Names="Verdana" Font-Size="8pt" Width="62px"></asp:Label></td>
                                          </tr>
                                          <tr style="font-size: 8pt; font-family: Tahoma">
                                              <td style="width: 117px; height: 3px">
                                                  <span style="font-family: Verdana">Receipt No.</span></td>
                                              <td style="width: 270px; height: 3px">
                                                  <asp:Label ID="lblReceiptNo" runat="server" Font-Names="Verdana" Font-Size="8pt"
                                                      Width="62px"></asp:Label></td>
                                              <td style="font-size: 8pt; width: 181px; height: 3px">
                                                  <span style="font-family: Verdana">Receipt Date</span></td>
                                              <td style="font-size: 8pt; width: 217px; height: 3px">
                                      <cc1:GMDatePicker ID="ReceiptDate" runat="server" DisplayMode="Label" Font-Names="Verdana"
                                          Font-Size="8pt" MaxDate="2020-12-31" MinDate="1950-01-01" YearDropDownRange="100" DateFormat="dd-MMM-yy">
                                      </cc1:GMDatePicker>
                                              </td>
                                          </tr>
                                          <tr style="font-size: 8pt; font-family: Tahoma">
                                              <td style="width: 117px; height: 20px">
                                                  <span style="font-family: Verdana">Receipt Amount</span></td>
                                              <td style="width: 270px; height: 20px">
                                                  <asp:TextBox ID="txtamount" runat="server" Font-Bold="False" Font-Names="Verdana"
                                                      Font-Size="8pt" ForeColor="#006699" Height="15px" Width="168px"></asp:TextBox></td>
                                              <td style="font-size: 8pt; width: 181px; height: 20px">
                                                  <span style="font-family: Verdana">Amount In Words</span></td>
                                              <td style="font-size: 8pt; width: 217px; height: 20px">
                                                  <asp:TextBox ID="txtAmtInWords" runat="server" Font-Bold="False" Font-Names="Verdana"
                                                      Font-Size="8pt" ForeColor="#006699" Height="15px" Width="168px"></asp:TextBox></td>
                                          </tr>
                                          <tr style="font-size: 8pt; font-family: Tahoma">
                                              <td style="width: 117px; height: 20px">
                                                  <span style="font-family: Verdana">Mode Of Payment</span></td>
                                              <td style="width: 270px; height: 20px">
                                      <asp:DropDownList ID="drpMode" runat="server" Font-Bold="False" Font-Names="Verdana"
                                                  Font-Size="8pt" ForeColor="#006699" Height="20px" Width="175px" AutoPostBack="True">
                                          <asp:ListItem Value="0">--Select--</asp:ListItem>
                                          <asp:ListItem Value="1">Cheque</asp:ListItem>
                                          <asp:ListItem Value="2">Cash</asp:ListItem>
                                          <asp:ListItem Value="3">Loan</asp:ListItem>
                                          <asp:ListItem>RTGS</asp:ListItem>
                                          <asp:ListItem>EDC</asp:ListItem>
                                      </asp:DropDownList></td>
                                              <td style="font-size: 8pt; width: 181px; height: 20px">
                                                  <span style="font-family: Verdana">Other Details</span></td>
                                              <td style="font-size: 8pt; width: 217px; height: 20px">
                                      <asp:TextBox ID="txtotherdetails" runat="server" Font-Bold="False" Font-Names="Verdana"
                                          Font-Size="8pt" ForeColor="#006699" Height="15px" Width="168px"></asp:TextBox></td>
                                          </tr>
                                          <tr style="font-size: 8pt; font-family: Tahoma">
                                              <td style="width: 117px; height: 20px">
                                                  <span style="font-family: Verdana">Bank</span></td>
                                              <td style="width: 270px; height: 20px">
                                                  <asp:TextBox ID="txtBank" runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="8pt"
                                                      ForeColor="#006699" Height="15px" Width="168px"></asp:TextBox></td>
                                              <td style="font-size: 8pt; width: 181px; height: 20px">
                                                  <span style="font-family: Verdana">Branch</span></td>
                                              <td style="font-size: 8pt; width: 217px; height: 20px">
                                                  <asp:TextBox ID="txtBranch" runat="server" Font-Bold="False" Font-Names="Verdana"
                                                      Font-Size="8pt" ForeColor="#006699" Height="15px" Width="168px"></asp:TextBox></td>
                                          </tr>
                                          <tr style="font-size: 8pt; font-family: Tahoma">
                                              <td style="width: 117px; height: 20px">
                                                  <span style="font-family: Verdana">Cheque Date</span></td>
                                              <td style="width: 270px; height: 20px"><cc1:GMDatePicker ID="cheqdate" runat="server" DisplayMode="Label" Font-Names="Verdana"
                                          Font-Size="8pt" MaxDate="2020-12-31" MinDate="1950-01-01" YearDropDownRange="100" DateFormat="dd-MMM-yy">
                                              </cc1:GMDatePicker>
                                              </td>
                                              <td style="font-size: 8pt; width: 181px; height: 20px">
                                              </td>
                                              <td style="font-size: 8pt; width: 217px; height: 20px">
                                              </td>
                                          </tr>
                                          <tr style="font-size: 8pt; font-family: Tahoma">
                                              <td class="td_bg_selected3" colspan="4" style="height: 20px">
                                                  Add Particulars</td>
                                          </tr>
                                          <tr style="font-size: 8pt; font-family: Tahoma">
                                              <td style="width: 117px; height: 20px">
                                                  <span style="font-family: Verdana">Particulars</span></td>
                                              <td style="width: 270px; height: 20px">
                                                  <asp:DropDownList ID="drpParticulars" runat="server" Font-Bold="False" Font-Names="Verdana"
                                                      Font-Size="8pt" ForeColor="#006699" Height="20px" Width="252px">
                                                  </asp:DropDownList></td>
                                              <td style="font-size: 8pt; width: 181px; height: 20px">
                                                  <span style="font-family: Verdana">Amount</span></td>
                                              <td style="font-size: 8pt; width: 217px; height: 20px">
                                                  <asp:TextBox ID="txtDetailAmt" runat="server" Font-Bold="False" Font-Names="Verdana"
                                                      Font-Size="8pt" ForeColor="#006699" Height="15px" Width="168px"></asp:TextBox></td>
                                          </tr>
                                          <tr style="font-size: 8pt; font-family: Tahoma">
                                              <td style="width: 117px; height: 20px">
                                              </td>
                                              <td style="width: 270px; height: 20px">
                                              </td>
                                              <td style="font-size: 8pt; width: 181px; height: 20px">
                                                  <asp:ImageButton ID="imbAddNew" runat="server" ImageUrl="~/softimages/add.gif" OnClientClick="return ValidateStage();" /></td>
                                              <td style="font-size: 8pt; width: 217px; height: 20px">
                                              </td>
                                          </tr>
                                          <tr style="font-size: 8pt; font-family: Tahoma">
                                              <td colspan="4" style="height: 20px">
                                                  <asp:GridView ID="Grid1" runat="server" AllowPaging="True" Height="1px" PageSize="20"
                                                      Width="100%">
                                                      <FooterStyle CssClass="td_bg_selected3" />
                                                      <RowStyle CssClass="td_bg_selected1" />
                                                      <PagerStyle CssClass="FooterStyle" ForeColor="White" />
                                                      <HeaderStyle CssClass="td_bg_selected3" />
                                                  </asp:GridView>
                                              </td>
                                          </tr>
                                          <tr style="font-size: 8pt; font-family: Tahoma">
                                              <td style="width: 117px; height: 20px">
                                              </td>
                                              <td style="width: 270px; height: 20px">
                                              </td>
                                              <td style="font-size: 8pt; width: 181px; height: 20px">
                                              </td>
                                              <td style="font-size: 8pt; width: 217px; height: 20px">
                                              </td>
                                          </tr>
                                          <tr style="font-size: 8pt; font-family: Tahoma">
                                              <td colspan="4" style="height: 20px">
                                      <table width="100%">
                                          <tr>
                                              <td style="width: 327px; height: 24px;">
                                              </td>
                                              <td style="text-align: left; height: 24px;">
                                                  <asp:ImageButton ID="imbSave" runat="server" ImageUrl="~/softimages/print-bt.gif"
                                          OnClientClick="return ValidateInput();" />
                                                  <asp:ImageButton ID="imbCancel" runat="server" ImageUrl="~/softimages/Cancel_btn.gif"
                                           /></td>
                                              <td style="width: 50px; text-align: left; height: 24px;">
                                              </td>
                                          </tr>
                                      </table>
                                              </td>
                                          </tr>
                                      </table>
                                      </asp:View>
                                      </asp:MultiView></td>
                              </tr>
                              <tr>
                                  <td colspan="4" style="height: 4px; text-align: left">
                                      <span style="font-size: 8pt; font-family: Verdana"> </span>
                                      </td>
                              </tr>
                              <tr>
                                  <td colspan="4" style="text-align: left">
                                  </td>
                              </tr>
                              <tr>
                                  <td colspan="4" style="text-align: center">
                                      &nbsp;&nbsp;
                                  </td>
                              </tr>
                          </table>
                      </td>
                      <td style="width: 254px">
                          &nbsp;</td>
                      <td style="width: 422px">
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 841px; height: 20px;">
                          &nbsp;<asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt"
                              ForeColor="Red"></asp:Label></td>
                      <td style="width: 254px; height: 20px;">
                          </td>
                      <td style="width: 422px; height: 20px;">
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 841px; height: 16px">
                          <asp:TextBox ID="txthidden" runat="server" Visible="False"></asp:TextBox></td>
                      <td style="width: 254px; height: 16px">
                      </td>
                      <td style="width: 422px; height: 16px">
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 841px">
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

