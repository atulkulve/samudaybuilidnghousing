<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/SFA.master" CodeFile="enquiry_details.aspx.vb" Inherits="enquiry_details" %>

<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>
<%--
<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls"
    TagPrefix="BDP" %>--%>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
<script language ="javascript" src="jsFiles/MainJSValidate.js" type ="text/javascript" ></script>
<script language="javascript" type ="text/javascript" >
function validateInput()
{
    
    if(validateEmpty(document.getElementById('ctl00_ContentPlaceHolder2_txtname'),'Enter Name','Invalid text in Name'))
    {
    if(isNotLetter(document.getElementById('ctl00_ContentPlaceHolder2_txtstd'),'Alphabet in STD'))
    {
    if(isNotLetter(document.getElementById('ctl00_ContentPlaceHolder2_txtphno'),'Alphabet in Phone Nos'))
    {
    if(validateEmpty(document.getElementById('ctl00_ContentPlaceHolder2_txtaddr'),'Enter Address','Invalid text in Address'))
    {
    if(validateDropDown(document.getElementById('ctl00_ContentPlaceHolder2_drpscheme'),'Select Scheme'))
    {
        return true;
    }
    }
    }
    }
    }
    return false;
}
</script>

<div id="main" style="position:absolute; width:950px; left: 9px; top: 77px; ">

<table cellpadding="0" cellspacing="0" border="0" style="width: 104%">
	<tr>
	<td style="width: 1198px">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td style="height: 20px"><img src="../softimages/head_c_l.jpg" height="21" style="width: 11px" /></td>
        <td background="../softimages/head_cen_bg.jpg" class="Title21" style="width:235px; height: 20px;">
            <span style="font-size: 11pt; font-family: Verdana">Enquiry Details</span></td>
        <td style="height: 20px; width: 845px;"><img src="../softimages/head_c_r.jpg" width="13" height="21" /></td>
      </tr>
    </table>
	</td>
	</tr>
	<tr>
	<td style="width: 1198px;">
	<table  border="0" cellspacing="0" cellpadding="0" style="width: 100%" class="td_bg_1">
    
    
    
        <tr>
                          <td style="width: 3px; height: 5px;"><img src="../softimages/low_curve21.jpg" /></td>
                          <td colspan="3" background="../softimages/low_bor2.gif" style="height: 5px; width: 917px;">
                              
                              </td>
                          <td style="width: 17px; height: 5px;"><img src="../softimages/low_curve3.gif" /></td>
      </tr>
      <tr>
      <td style="width: 3px" background="../softimages/l_bor1.gif"></td>
          <td colspan="3" style="height: 1px; width: 917px;"><table>
              <tr>
                  <td style="width: 2040px; text-align: right;">
                      <asp:Label Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#006699" ID="lblId" runat="server" Visible="False" /></td>
                  <td style="width: 726px; font-size: 10pt; color: #000000;">
                  </td>
              </tr>
              <tr style="font-size: 10pt; color: #000000;">
                  <td style="width: 2040px;" >
                      <table border="0" style="width: 680px; height: 199px">
                          <tbody>
                              <tr>
                                  <td style="width: 211px; height: 4px; text-align: left">
                                      <span style="font-family: Verdana; font-size: 8pt;"><strong>Name</strong></span></td>
                                  <td style="font-weight: bold; font-size: 8pt; font-family: Verdana; height: 4px;
                                      text-align: left">
                                      <asp:TextBox ID="txtname" runat="server" Font-Bold="True" Font-Names="Verdana" ForeColor="#006699"
                                          Height="22px" Width="279px"></asp:TextBox></td>
                              </tr>
                              <tr style="font-weight: bold; font-size: 8pt; font-family: Verdana">
                                  <td style="width: 211px; height: 8px; text-align: left">
                                      <span>Phone Number</span></td>
                                  <td style="font-family: Tahoma; height: 8px; text-align: left">
                                      <asp:TextBox ID="txtstd" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="10pt"
                                          ForeColor="#006699" Height="22px" Width="49px"></asp:TextBox><span style="font-size: 10pt;
                                              font-family: Verdana"><strong> </strong></span>
                                      <asp:TextBox ID="txtphno" runat="server" Font-Bold="True" Font-Names="Verdana" ForeColor="#006699"
                                          Height="22px" Width="221px"></asp:TextBox></td>
                              </tr>
                              <tr style="font-weight: bold; font-size: 10pt; font-family: Verdana">
                                  <td style="width: 211px; text-align: left; height: 25px;">
                                      <span style="font-size: 8pt; font-family: Tahoma">Address</span></td>
                                  <td style="font-size: 8pt; font-family: Tahoma; text-align: left; height: 25px;">
                                      <asp:TextBox ID="txtaddr" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="10pt"
                                          ForeColor="#006699" Height="56px" Rows="2" TextMode="MultiLine" Width="282px"></asp:TextBox></td>
                              </tr>
                              <tr style="font-weight: bold; font-size: 8pt; font-family: Tahoma">
                                  <td style="width: 211px; height: 13px; text-align: left">
                                      <span>Enquiry Date</span></td>
                                  <td style="height: 13px; text-align: left">
                                      <cc1:GMDatePicker ID="enqDate" runat="server" DisplayMode="Label" MaxDate="2020-12-31"
                                          MinDate="1950-01-01" YearDropDownRange="80">
                                      </cc1:GMDatePicker>
                                  </td>
                              </tr>
                              <tr>
                                  <td style="width: 211px; height: 13px; text-align: left">
                                      <span style="font-size: 8pt; font-family: Verdana"><strong>Scheme</strong></span></td>
                                  <td style="font-size: 8pt; font-family: Tahoma; height: 13px; text-align: left">
                                      <asp:DropDownList ID="drpscheme" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource2"
                                          DataTextField="scheme_name" DataValueField="scheme_name" Font-Bold="True" ForeColor="#006699"
                                          Width="178px">
                                          <asp:ListItem>-Select-</asp:ListItem>
                                      </asp:DropDownList></td>
                              </tr>
                              <tr>
                                  <td style="width: 211px; text-align: left">
                                      <span style="font-size: 8pt; font-family: Verdana"><strong>Customer Choice</strong></span></td>
                                  <td style="text-align: left">
                                      <asp:CheckBoxList ID="chkmodel" runat="server" DataSourceID="SqlDataSource1" DataTextField="model_name"
                                          DataValueField="model_name" Font-Bold="True" Font-Names="Verdana" Font-Size="10pt"
                                          ForeColor="#006699" RepeatColumns="2" Width="169px">
                                      </asp:CheckBoxList>&nbsp;
                                  </td>
                              </tr>
                              <tr>
                                  <td colspan="2" style="text-align: left">
                                      <table width="100%">
                                          <tr>
                                              <td style="width: 72px; height: 20px">
                                              </td>
                                              <td style="width: 190px; height: 20px">
                                      <asp:ImageButton ID="imbSave" runat="server" ImageUrl="../softimages/save.gif" OnClientClick="return validateInput();" /></td>
                                          </tr>
                                      </table>
                                  </td>
                              </tr>
                          </tbody>
                      </table>
                  </td>
                  <td style="width: 726px;">
                  </td>
              </tr>
              <tr>
                  <td style="width: 2040px">
                      <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:conMM %>"
                          SelectCommand="SELECT [scheme_name] FROM [scheme_master] ORDER BY [scheme_id]"></asp:SqlDataSource>
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conMM %>"
                          SelectCommand="SELECT [model_name] FROM [brandmodel_view]"></asp:SqlDataSource>
                  </td>
                  <td style="width: 726px">
                  </td>
              </tr>
          </table>
          </td>
          <td background="../softimages/low_bor3.gif" style="width: 17px"></td>
      </tr>
      
      <tr>
          <td style="height: 16px; width: 3px;"><img src="../softimages/low_curve1.gif" /></td>
          <td colspan="3" background="../softimages/low_bor4.gif" style="height: 16px; width: 917px;"></td>
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
