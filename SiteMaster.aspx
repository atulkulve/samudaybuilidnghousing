<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/SFA.master" CodeFile="SiteMaster.aspx.vb" Inherits="mmsoft_SiteMaster" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
<script language ="javascript" src="jsFiles/MainJSValidate.js" type ="text/javascript" ></script>
<script language="javascript" type ="text/javascript" >
function validateOk()
{
        if(validateDropDown(document.getElementById('ctl00_ContentPlaceHolder2_drpSiteName'),'Select Site'))
        {
            return true;
        }
    return false;
}
function ValidateInput()
{

	    if(validateEmpty(document.getElementById('ctl00_ContentPlaceHolder2_txtSiteName'),'Enter Site','Invalid Input in Site'))
        {
        if(validateEmpty(document.getElementById('ctl00_ContentPlaceHolder2_txtadd1'),'Enter Address1','Invalid Input in Address1'))
        {
        if(validateEmpty(document.getElementById('ctl00_ContentPlaceHolder2_txtadd2'),'Enter Address2','Invalid Input in Address2'))
        {
        if(isNotLetter(document.getElementById('ctl00_ContentPlaceHolder2_txttelno'),'Alphabet in Telephone Nos.'))
        {            
            return true;        
        }      
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
            <span style="font-size: 10pt; font-family: Verdana">Site Master</span></td>
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
                      <td style="width: 317px">
                          <asp:Menu ID="mnuMenu" runat="server" BackColor="#FFC080" BorderColor="#000040" BorderStyle="Double"
                              Font-Bold="False" Font-Names="Verdana" ForeColor="Blue" Orientation="Horizontal"
                              StaticSubMenuIndent="5px" Width="224px" Font-Size="Smaller">
                              <StaticMenuItemStyle CssClass="td_bg_sel3" />
                              <DynamicMenuStyle BorderColor="Black" />
                              <StaticSelectedStyle CssClass="td_bg_selected11" />
                              <Items>
                                  <asp:MenuItem Text="Add New" Value="0"></asp:MenuItem>
                                  <asp:MenuItem Text="Modify Details" Value="1"></asp:MenuItem>
                              </Items>
                              <StaticHoverStyle CssClass="td_bg_sel3" />
                          </asp:Menu>
                          &nbsp;</td>
                      <td style="width: 254px">
                          &nbsp;</td>
                      <td style="width: 242px">
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 317px">
                          <asp:MultiView ID="MultiView1" runat="server">
                              <asp:View ID="View1" runat="server">
                          <table border="0" bordercolor="#006699">
                              <tr>
                                  <td style="width: 143px; text-align: left">
                                      <span style="font-size: 10pt; font-family: Verdana"><span style="font-size: 8pt">Site
                                          Name</span></span></td>
                                  <td style="text-align: left; width: 211px;">
                                      <asp:TextBox ID="txtSiteName" runat="server" Font-Bold="False" ForeColor="#006699" Height="15px"
                                          Width="200px" Font-Names="Verdana" Font-Size="8pt"></asp:TextBox></td>
                              </tr>
                              <tr>
                                  <td style="width: 143px; text-align: left">
                                      <span style="font-size: 8pt; font-family: Verdana">Address 1</span></td>
                                  <td style="width: 211px; text-align: left">
                                      <asp:TextBox ID="txtadd1" runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="8pt"
                                          ForeColor="#006699" Height="15px" Width="200px"></asp:TextBox></td>
                              </tr>
                              <tr>
                                  <td style="width: 143px; text-align: left">
                                      <span style="font-size: 8pt; font-family: Verdana">Address 2</span></td>
                                  <td style="width: 211px; text-align: left">
                                      <asp:TextBox ID="txtadd2" runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="8pt"
                                          ForeColor="#006699" Height="15px" Width="200px"></asp:TextBox></td>
                              </tr>
                              <tr>
                                  <td style="width: 143px; text-align: left">
                                      <span style="font-size: 8pt; font-family: Verdana">TelePhone Nos.</span></td>
                                  <td style="width: 211px; text-align: left">
                                      <asp:TextBox ID="txttelno" runat="server" Font-Bold="False" Font-Names="Verdana"
                                          Font-Size="8pt" ForeColor="#006699" Height="15px" Width="200px"></asp:TextBox></td>
                              </tr>
                              <tr>
                                  <td colspan="2" style="height: 1px; text-align: center">
                                  </td>
                              </tr>
                              <tr>
                                  <td colspan="2" style="text-align: center">
                                      &nbsp;&nbsp;
                                      <table width="100%">
                                          <tr>
                                              <td style="width: 69px">
                                              </td>
                                              <td style="text-align: left">
                                                  <asp:ImageButton ID="imbSave" runat="server" ImageUrl="../softimages/save.gif"
                                          OnClientClick="return ValidateInput();" />
                                                  <asp:ImageButton ID="imbCancel" runat="server" ImageUrl="~/softimages/Cancel_btn.gif"
                                           /></td>
                                              <td style="width: 50px; text-align: left">
                                              </td>
                                          </tr>
                                      </table>
                                  </td>
                              </tr>
                          </table>
                              </asp:View>
                              <asp:View ID="View2" runat="server">
                                  <table border="0" bordercolor="#006699">
                                      <tr>
                                          <td style="width: 439px; height: 20px; text-align: left">
                                              <span style="font-size: 8pt; font-family: Verdana">Select Site</span></td>
                                          <td style="width: 117px; height: 20px; text-align: left">
                                              <asp:DropDownList ID="drpSiteName" runat="server" Font-Bold="False" Font-Names="Verdana"
                                                  Font-Size="8pt" ForeColor="#006699" Height="20px" Width="175px">
                                              </asp:DropDownList></td>
                                      </tr>
                                      <tr>
                                          <td colspan="2" style="height: 8px; text-align: center">
                                              &nbsp;<asp:ImageButton ID="imbedit" runat="server" ImageUrl="~/softimages/edit_bt.gif"
                                                  OnClientClick="return validateOk();" />
                                              <asp:ImageButton ID="imbEditCancel" runat="server" ImageUrl="~/softimages/Cancel_btn.gif"
                                           /></td>
                                      </tr>
                                  </table>
                              </asp:View>
                          </asp:MultiView>
                          <asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt"
                              ForeColor="Red"></asp:Label></td>
                      <td style="width: 254px">
                          </td>
                      <td style="width: 242px">
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 317px; height: 16px">
                          <asp:TextBox ID="txthidden" runat="server" Visible="False"></asp:TextBox></td>
                      <td style="width: 254px; height: 16px">
                      </td>
                      <td style="width: 242px; height: 16px">
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 317px">
                      </td>
                      <td style="width: 254px">
                      </td>
                      <td style="width: 242px">
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
