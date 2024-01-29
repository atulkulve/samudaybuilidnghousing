<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/Admin.master" CodeFile="locationemp.aspx.vb" Inherits="locationemp" %>
<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">

<%--<script language="javascript" src="../Js/Sub_CategoryMaster.js" type="text/javascript"></script>--%>
<script language ="javascript" src="jsFiles/MainJSValidate.js" type ="text/javascript" ></script>
<script language="javascript" type ="text/javascript" >
function validateOk()
{
        if(validateDropDown(document.getElementById('ctl00_ContentPlaceHolder2_drpEmployee'),'Select Employee'))
        {
            return true;
        }
    return false;
}
function validateInput()
{
    if(validateEmpty(document.getElementById('ctl00_ContentPlaceHolder2_txtname'),'Enter Name','Invalid text in Name'))
    {
    if(validateEmpty(document.getElementById('ctl00_ContentPlaceHolder2_txtaddr'),'Enter Address','Invalid text in Address'))
    {
    if(validateEmpty(document.getElementById('ctl00_ContentPlaceHolder2_txtphone'),'Enter Phone Nos','Invalid text in Phone Nos'))
    {
    if(isNotLetter(document.getElementById('ctl00_ContentPlaceHolder2_txtphone'),'Alphabet in Phone Nos'))
    {
    if(emailValidator(document.getElementById('ctl00_ContentPlaceHolder2_txtemail'), 'Invalid Email ID'))
    {
    if(validateEmpty(document.getElementById('ctl00_ContentPlaceHolder2_txtdesig'),'Enter Designation','Invalid text in Designation'))
    {
    if(validateEmpty(document.getElementById('ctl00_ContentPlaceHolder2_txtremarks'),'Enter Remarks','Invalid text in Remarks'))
    {
    if(validateDropDown(document.getElementById('ctl00_ContentPlaceHolder2_drploc'),'Select Location'))
    {
        return true;
    }
    }
    }
    }
    }
    }
    }
    }
    return false;
}
</script>
<div id="main" style="position:absolute; width:724px; left: 248px; top: 77px; ">

<table cellpadding="0" cellspacing="0" border="0" style="width: 104%">
	<tr>
	<td style="width: 1363px;">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td style="height: 20px"><img src="../softimages/head_c_l.jpg" height="21" style="width: 11px" /></td>
        <td background="../softimages/head_cen_bg.jpg" class="Title21" style="width:308px; height: 20px;">
            <span style="font-size: 11pt; font-family: Verdana">Employee Master</span></td>
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
      <td style="width: 3px; height: 18px;" background="../softimages/l_bor1.gif"></td>
          <td colspan="3" style="width: 878px; height: 18px;">
              <table width="100%">
                  <tr>
                      <td style="width: 360px">
                          <asp:Menu ID="mnuMenu" runat="server" BackColor="#FFC080" BorderColor="#000040" BorderStyle="Double"
                              Font-Bold="True" Font-Names="Verdana" ForeColor="Blue" Orientation="Horizontal"
                              StaticSubMenuIndent="5px" Width="224px">
                              <StaticMenuItemStyle CssClass="td_bg_sel3" />
                              <DynamicMenuStyle BorderColor="Black" />
                              <StaticSelectedStyle CssClass="td_bg_selected11" />
                              <Items>
                                  <asp:MenuItem Text="Add New" Value="0"></asp:MenuItem>
                                  <asp:MenuItem Text="Modify Details" Value="1"></asp:MenuItem>
                              </Items>
                              <StaticHoverStyle CssClass="td_bg_sel3" />
                          </asp:Menu>
                      </td>
                      <td>
                      </td>
                      <td style="width: 288px">
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 360px; height: 1px;">
                          <asp:MultiView ID="MultiView1" runat="server">
                              <asp:View ID="View1" runat="server">
                          <table border="0" style="width: 425px; height: 1px; text-align: left">
                              <tr>
                                  <td style="width: 216px;">
                                      <span style="font-size: 8pt; font-family: Verdana"><strong>Name</strong></span></td>
                                  <td colspan="3">
                                      <asp:TextBox ID="txtname" runat="server" Font-Bold="True" ForeColor="#006699" Height="17px"
                                          Width="231px"></asp:TextBox>
                                  </td>
                              </tr>
                              <tr>
                                  <td style="width: 216px; height: 31px;">
                                      <span style="font-size: 8pt; font-family: Verdana"><strong>Date Of Birth</strong></span></td>
                                  <td colspan="3" style="height: 31px">
                                      <strong><span style="font-size: 10pt; font-family: Verdana">
                                          <cc1:gmdatepicker id="empDOB" runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="8pt">
                                      </cc1:gmdatepicker>
                                          <span style="font-size: 8pt"></span>
                                      </span></strong>
                                  </td>
                              </tr>
                              <tr style="font-weight: bold; font-size: 8pt; font-family: Verdana">
                                  <td style="width: 216px; height: 6px; text-align: left">
                                      <span>Address</span></td>
                                  <td colspan="3" style="height: 6px">
                                      <asp:TextBox ID="txtaddr" runat="server" Columns="3" Font-Bold="True" Font-Names="Verdana"
                                          Font-Size="10pt" ForeColor="#006699" Height="49px" Rows="3" TextMode="MultiLine"
                                          Width="231px"></asp:TextBox><span style="color: #0000ff; text-decoration: underline">
                                          </span>
                                  </td>
                              </tr>
                              <tr style="font-weight: bold; font-size: 8pt; font-family: Verdana">
                                  <td style="width: 216px; height: 6px; text-align: left">
                                      Phone No</td>
                                  <td colspan="3" style="height: 6px">
                                      <asp:TextBox ID="txtphone" runat="server" Font-Bold="True" ForeColor="#006699" Width="231px"></asp:TextBox></td>
                              </tr>
                              <tr style="font-family: Verdana">
                                  <td style="width: 216px; height: 7px">
                                      <span style="font-size: 8pt;"><strong>Email</strong></span></td>
                                  <td colspan="3" style="font-size: 8pt; font-family: Tahoma; height: 7px">
                                      <asp:TextBox ID="txtemail" runat="server" Font-Bold="True" ForeColor="#006699" Width="231px"></asp:TextBox></td>
                              </tr>
                              <tr style="font-size: 8pt; font-family: Tahoma">
                                  <td style="width: 216px; height: 7px">
                                      <span style="font-family: Verdana"><strong>Designation</strong></span></td>
                                  <td colspan="3" style="height: 7px">
                                      <asp:TextBox ID="txtdesig" runat="server" Font-Bold="True" ForeColor="#006699" Width="231px"></asp:TextBox><span
                                          style="color: #0000ff; text-decoration: underline"> </span>
                                  </td>
                              </tr>
                              <tr style="font-size: 12pt; font-family: Times New Roman">
                                  <td style="width: 216px; height: 5px">
                                      <strong><span style="font-size: 8pt; font-family: Verdana">Remarks</span></strong></td>
                                  <td colspan="3" style="height: 5px">
                                      <asp:TextBox ID="txtremarks" runat="server" Font-Bold="True" Font-Names="Verdana"
                                          Font-Size="10pt" ForeColor="#006699" Height="46px" TextMode="MultiLine" Width="231px"></asp:TextBox></td>
                              </tr>
                              <tr style="font-size: 12pt; font-family: Times New Roman">
                                  <td style="width: 216px; height: 7px">
                                      <span style="font-size: 8pt; font-family: Verdana"><strong>Location</strong></span></td>
                                  <td colspan="3" style="height: 7px">
                                      <asp:DropDownList ID="drploc" runat="server" Font-Bold="False" ForeColor="#006699" Width="231px" Font-Names="Verdana" Font-Size="8pt">
                                      </asp:DropDownList></td>
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
                                              <td style="width: 202px; height: 24px">
                                              </td>
                                              <td style="width: 454px; height: 24px; text-align: left">
                                                  &nbsp;<asp:ImageButton ID="imbSave" runat="server" ImageUrl="../softimages/save.gif"
                                                      OnClientClick="return validateInput();" /></td>
                                          </tr>
                                      </table>
                                      <a href="admin_module.htm"></a>
                                  </td>
                              </tr>
                          </table>
                              </asp:View>
                              <asp:View ID="View2" runat="server">
                                  <table border="0" bordercolor="#006699" width="100%">
                                      <tr>
                                          <td style="width: 145px; height: 20px; text-align: left">
                                              <strong><span style="font-size: 8pt; font-family: Verdana">Select Employee</span></strong></td>
                                          <td style="width: 117px; height: 20px; text-align: left">
                                              <asp:DropDownList ID="drpEmployee" runat="server" Font-Bold="False" Font-Names="Verdana"
                                                  Font-Size="8pt" ForeColor="#006699" Height="20px" Width="175px">
                                              </asp:DropDownList></td>
                                      </tr>
                                      <tr>
                                          <td colspan="2" style="height: 8px; text-align: center">
                                              &nbsp;<asp:ImageButton ID="imbedit" runat="server" ImageUrl="~/softimages/edit_bt.gif"
                                                  OnClientClick="return validateOk();" /></td>
                                      </tr>
                                  </table>
                              </asp:View>
                          </asp:MultiView>
                          <asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt"
                              ForeColor="Red"></asp:Label></td>
                      <td style="height: 1px">
                      </td>
                      <td style="width: 288px; height: 1px;">
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 360px">
                          <asp:TextBox ID="txthidden" runat="server" Visible="False"></asp:TextBox></td>
                      <td>
                      </td>
                      <td style="width: 288px">
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 360px">
                      </td>
                      <td>
                      </td>
                      <td style="width: 288px">
                      </td>
                  </tr>
              </table>
          </td>
          <td background="../softimages/low_bor3.gif" style="width: 17px; height: 18px;"></td>
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
