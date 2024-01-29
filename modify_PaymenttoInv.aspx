<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/SFA.master" CodeFile="modify_PaymenttoInv.aspx.vb" Inherits="modify_PaymenttoInv" %>

<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls"
    TagPrefix="BDP" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
<script language ="javascript" src="jsFiles/MainJSValidate.js" type ="text/javascript" ></script>
<script language="javascript" type ="text/javascript" >
function validateOk()
{
    if(validateDropDown(document.getElementById('ctl00_ContentPlaceHolder2_drpCustomer'),'Select Customer'))
    {
        if(validateDropDown(document.getElementById('ctl00_ContentPlaceHolder2_drpInvestment'),'Select Investment ID'))
        {
        return true;
        }
    }
    return false;
}
function ValidateInput()
{
        if(validateEmpty(document.getElementById('ctl00_ContentPlaceHolder2_txttenure'),'Enter Tenure','Invalid Input in Tenure'))
        {
	    if(isNotLetter(document.getElementById('ctl00_ContentPlaceHolder2_txttenure'),'Only Numbers in Tenure'))
        {
            return true;
        }
        }
        return false;
}
function validatetenure()
{
	    if(isNotLetter(document.getElementById('ctl00_ContentPlaceHolder2_txttenure'),'Only Numbers in Tenure'))
	    {
            return true;
        }
        return false;
}
</script>

<div id="main" style="position:absolute; width:950px; left: 9px; top: 77px; ">

<table cellpadding="0" cellspacing="0" border="0" style="width: 104%">
	<tr>
	<td style="width: 1198px;">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td style="height: 20px"><img src="../softimages/head_c_l.jpg" height="21" style="width: 11px" /></td>
        <td background="../softimages/head_cen_bg.jpg" class="Title21" style="width:456px; height: 20px;">
            <span style="font-size: 11pt; font-family: Verdana">Modify Payment To Investors Transaction</span></td>
        <td style="height: 20px; width: 845px;"><img src="../softimages/head_c_r.jpg" width="13" height="21" /></td>
      </tr>
    </table>
	</td>
	</tr>
	<tr>
	<td style="height: 30px; width: 1198px;">
	<table  border="0" cellspacing="0" cellpadding="0" style="width: 100%" class="td_bg_1">
    
    
    
        <tr>
                          <td style="width: 3px; height: 5px;"><img src="../softimages/low_curve21.jpg" /></td>
                          <td colspan="3" background="../softimages/low_bor2.gif" style="height: 5px; width: 984px;">
                              
                              </td>
                          <td style="width: 17px; height: 5px;"><img src="../softimages/low_curve3.gif" /></td>
      </tr>
      <tr>
      <td style="width: 3px;" background="../softimages/l_bor1.gif"></td>
          <td colspan="3" style="width: 984px;">
              <table width="100%">
                  <tr>
                      <td style="width: 530px">
                          <asp:MultiView ID="MultiView1" runat="server">
                              <asp:View ID="View1" runat="server">
                                  <table width="100%">
                                      <tr>
                                          <td style="width: 178px">
                                              <strong><span style="font-size: 8pt; font-family: Verdana">Select Customer</span></strong></td>
                                          <td>
                                              <asp:DropDownList ID="drpCustomer" runat="server" AppendDataBoundItems="True" AutoPostBack="True"
                                                  Font-Bold="False" Font-Names="Verdana" Font-Size="8pt" ForeColor="#006699" Height="20px"
                                                  Width="175px">
                                                  <asp:ListItem>-Select Customer-</asp:ListItem>
                                              </asp:DropDownList></td>
                                      </tr>
                                      <tr>
                                          <td style="width: 178px">
                                              <strong><span style="font-size: 8pt; font-family: Verdana">Select Investment</span></strong></td>
                                          <td>
                                              <asp:DropDownList ID="drpInvestment" runat="server" AppendDataBoundItems="True" Font-Bold="False" Font-Names="Verdana"
                                                  Font-Size="8pt" ForeColor="#006699" Height="20px" Width="175px">
                                                  <asp:ListItem>-- Select --</asp:ListItem>
                                              </asp:DropDownList></td>
                                      </tr>
                                      <tr>
                                          <td colspan="2">
                                              <table width="100%">
                                                  <tr>
                                                      <td style="width: 161px">
                                                      </td>
                                                      <td>
                                                          <asp:ImageButton ID="imbOk" runat="server" ImageUrl="~/softimages/edit_bt.gif" OnClientClick="return validateOk();" /></td>
                                                  </tr>
                                              </table>
                                              <asp:Label ID="lblEdit" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt"
                                                  ForeColor="Red" Text="Label" Visible="False"></asp:Label></td>
                                      </tr>
                                  </table>
                              </asp:View>
                              <asp:View ID="View2" runat="server">
                                  <table style="font-family: Verdana" width="100%">
                                      <tr>
                                          <td style="width: 175px">
                                              <strong><span style="font-size: 8pt">Investment ID</span></strong></td>
                                          <td>
                                              <asp:Label ID="lblInvId" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                                  Width="184px"></asp:Label></td>
                                      </tr>
                                      <tr style="font-family: Verdana">
                                          <td style="width: 175px; height: 20px">
                                              <strong><span style="font-size: 8pt">Customer Name</span></strong></td>
                                          <td style="height: 20px">
                                              <asp:Label ID="lblCustName" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                                  Width="184px"></asp:Label></td>
                                      </tr>
                                      <tr style="font-family: Verdana">
                                          <td style="width: 175px">
                                              <strong><span style="font-size: 8pt">Scheme Details</span></strong></td>
                                          <td>
                                              <asp:Label ID="lblScheme" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"
                                                  Width="184px"></asp:Label></td>
                                      </tr>
                                      <tr style="font-family: Verdana">
                                          <td style="width: 175px">
                                              <strong><span style="font-size: 8pt">Aggrement Details</span></strong></td>
                                          <td>
                                              <cc1:GMDatePicker ID="agreeDate" runat="server" DisplayMode="Label" Font-Names="Verdana"
                                                  Font-Size="Smaller" MaxDate="2020-12-31" MinDate="1950-01-01" YearDropDownRange="80">
                                              </cc1:GMDatePicker>
                                          </td>
                                      </tr>
                                      <tr style="font-family: Verdana">
                                          <td style="width: 175px">
                                              <span style="font-size: 8pt"><strong>Tenure</strong></span></td>
                                          <td style="font-family: Verdana">
                                              <span style="font-size: 8pt"><strong>
                                                  <asp:TextBox ID="txttenure" runat="server" Font-Bold="False" Font-Names="Verdana"
                                                      Font-Size="8pt" ForeColor="#006699" Height="17px" Width="50px" AutoPostBack="True"></asp:TextBox>Months</strong></span></td>
                                      </tr>
                                      <tr style="font-family: Verdana">
                                          <td style="width: 175px">
                                              <span style="font-size: 8pt"><strong>Due Date</strong></span></td>
                                          <td>
                                              <cc1:GMDatePicker ID="dueDate" runat="server" DisplayMode="Label" Font-Names="Verdana"
                                                  Font-Size="Smaller" MaxDate="2020-12-31" MinDate="1950-01-01" YearDropDownRange="80">
                                              </cc1:GMDatePicker>
                                          </td>
                                      </tr>
                                      <tr style="font-family: Verdana">
                                          <td style="width: 175px; height: 27px;">
                                              <span style="font-size: 8pt"><strong>Amount</strong></span></td>
                                          <td style="height: 27px">
                                              <asp:TextBox ID="txtamt" runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="8pt"
                                                  ForeColor="#006699" Height="17px" Width="175px"></asp:TextBox></td>
                                      </tr>
                                      <tr style="font-family: Verdana">
                                          <td style="width: 175px; height: 27px">
                                              <strong><span style="font-size: 8pt">Installment Amount</span></strong></td>
                                          <td style="height: 27px">
                                              <asp:TextBox ID="txtinstamt" runat="server" Font-Bold="False" Font-Names="Verdana"
                                                  Font-Size="8pt" ForeColor="#006699" Height="17px" Width="175px"></asp:TextBox></td>
                                      </tr>
                                      <tr style="font-family: Verdana">
                                          <td colspan="2">
                                              <table width="100%">
                                                  <tr>
                                                      <td style="width: 147px">
                                                      </td>
                                                      <td>
                                                          <asp:ImageButton ID="imbSave" runat="server" ImageUrl="~/softimages/save.gif" OnClientClick="return ValidateInput();" /></td>
                                                  </tr>
                                              </table>
                                              <asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt"
                                                  ForeColor="Red" Text="Label" Visible="False"></asp:Label></td>
                                      </tr>
                                  </table>
                              </asp:View>
                          </asp:MultiView></td>
                      <td style="width: 196px">
                      </td>
                      <td style="width: 287px">
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 530px">
                      </td>
                      <td style="width: 196px">
                      </td>
                      <td style="width: 287px">
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 530px">
                      </td>
                      <td style="width: 196px">
                      </td>
                      <td style="width: 287px">
                      </td>
                  </tr>
              </table>
          </td>
          <td background="../softimages/low_bor3.gif" style="width: 17px;"></td>
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
  
 </div>
    
  </asp:Content>
