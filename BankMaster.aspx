<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/Admin.master" CodeFile="BankMaster.aspx.vb" Inherits="BankMaster" %>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
<script language ="javascript" src="jsFiles/MainJSValidate.js" type ="text/javascript" ></script>
<script language="javascript" type ="text/javascript" >
function validateOk()
{
        if(validateDropDown(document.getElementById('ctl00_ContentPlaceHolder2_drpbank'),'Select Bank'))
        {
            return true;
        }
    return false;
}
function ValidateInput()
{

	    if(validateEmpty(document.getElementById('ctl00_ContentPlaceHolder2_txtbank'),'Enter Bank','Invalid Input in Bank'))
        {
            return true;        
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
        <td background="../softimages/head_cen_bg.jpg" class="Title21" style="width:212px; height: 20px;">
            <span style="font-size: 11pt; font-family: Verdana">Bank Master</span></td>
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
                      <td style="width: 302px;">
                          <asp:Menu ID="mnuMenu" runat="server" Orientation="Horizontal" Width="224px" BackColor="#FFC080" BorderColor="#000040" ForeColor="Blue" BorderStyle="Double" Font-Bold="True" Font-Names="Verdana" StaticSubMenuIndent="5px">
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
                      <td style="width: 242px;">
                      </td>
                      <td>
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 302px">
                          <asp:MultiView ID="MultiView1" runat="server">
                              <asp:View ID="View1" runat="server">
                                  <table border="0" bordercolor="#006699">
                                      <tr>
                                          <td style="width: 174px; height: 23px; text-align: left">
                                              <strong><span style="font-size: 8pt; font-family: Verdana">Bank Name</span></strong></td>
                                          <td style="height: 23px; text-align: left">
                                              <asp:TextBox ID="txtbank" runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="8pt"
                                                  ForeColor="#006699" Height="17px" Width="205px"></asp:TextBox></td>
                                      </tr>
                                      <tr>
                                          <td colspan="2" style="height: 9px; text-align: center">
                                              &nbsp;<asp:ImageButton ID="imbSave" runat="server" ImageUrl="../softimages/save.gif" OnClientClick="return ValidateInput();" /></td>
                                      </tr>
                                  </table>
                              </asp:View>
                              <asp:View ID="View2" runat="server">
                                  <table border="0" bordercolor="#006699">
                                      <tr>
                                          <td style="width: 439px; height: 20px; text-align: left">
                                              <strong><span style="font-size: 8pt; font-family: Verdana">Select Bank</span></strong></td>
                                          <td style="height: 20px; text-align: left; width: 117px;">
                                              <asp:DropDownList ID="drpbank" runat="server" Font-Bold="False" Font-Names="Verdana"
                                                  Font-Size="8pt" ForeColor="#006699" Height="20px" Width="175px">
                                              </asp:DropDownList></td>
                                      </tr>
                                      <tr>
                                          <td colspan="2" style="height: 8px; text-align: center">
                                              &nbsp;<asp:ImageButton ID="imbedit" runat="server" ImageUrl="~/softimages/edit_bt.gif" OnClientClick="return validateOk();" /></td>
                                      </tr>
                                  </table>
                              </asp:View>
                          </asp:MultiView>
                          <asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt"
                              ForeColor="Red"></asp:Label></td>
                      <td style="width: 242px">
                          <asp:Label ID="lblId" runat="server" Font-Names="Verdana" Font-Size="8pt" Font-Underline="False"
                              ForeColor="#006699" Visible="False"></asp:Label><asp:LoginStatus ID="LoginStatus1"
                                  runat="server" Font-Names="Verdana" Font-Size="8pt" LogoutAction="Redirect" LogoutPageUrl="~/admin_login.aspx"
                                  Visible="False" />
                          &nbsp;
                          <asp:TextBox ID="txthidden" runat="server" Visible="False"></asp:TextBox></td>
                      <td>
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 302px">
                      </td>
                      <td style="width: 242px">
                      </td>
                      <td>
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 302px">
                      </td>
                      <td style="width: 242px">
                      </td>
                      <td>
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
