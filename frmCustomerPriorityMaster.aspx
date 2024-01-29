<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/SFA.master" CodeFile="frmCustomerPriorityMaster.aspx.vb" Inherits="Forms_frmCustomerPriorityMaster" %>


<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">

<div id="main" style="position:absolute; width:950px; left: 25px; top: 75px; ">

     <table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
	<td>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><img src="softimages/head_c_l.jpg" height="21" style="width: 11px" /></td>
        <td background="softimages/head_cen_bg.jpg" class="Title21" style="width:124px;">
            <span style="font-size: 11pt; font-family: Verdana">
            Bank Master</span></td>
        <td width="841"><img src="softimages/head_c_r.jpg" width="13" height="21" /></td>
      </tr>
    </table>
	</td>
	</tr>
	<tr>
	<td style="height: 30px">
	<table  border="0" cellspacing="0" cellpadding="0" style="width: 100%" class="td_bg_1">
    
    
    
        <tr>
                          <td style="height: 14px; width: 8px;"><img src="softimages/low_curve21.jpg" style="width: 16px; height: 14px" /></td>
                          <td colspan="3" background="softimages/low_bor2.gif" style="height: 14px">
                              
                              </td>
                          <td style="height: 14px; width: 23px;"><img src="softimages/low_curve3.gif" style="height: 11px" /></td>
      </tr>
      <tr>
      <td style="width: 8px; height: 125px"></td>
          <td colspan="3" style="height: 125px">
              <table border="0" cellpadding="0" cellspacing="0">
                  <tr>
                      <td style="width: 136px; color: #ff6666; height: 19px">
                          <span style="font-size: 12px; font-family: Verdana">Bank Name</span></td>
                      <td style="width: 432px; height: 19px">
                          <input id="Text1" style="font-family: Verdana; background-color: #ffcc99" type="text" /></td>
                      <td style="width: 339px; height: 19px">
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 136px; height: 19px">
                      </td>
                      <td style="width: 432px; height: 19px">
                      </td>
                      <td style="width: 339px; height: 19px">
                      </td>
                  </tr>
                  <tr>
                      <td colspan="2">
                          <table>
                              <tr>
                                  <td style="width: 107px">
                                  </td>
                                  <td style="width: 454px">
                                      &nbsp;<asp:ImageButton ID="imbSave" runat="server" ImageUrl="~/softimages/save.gif" OnClientClick="return ValidateInpute();" /></td>
                              </tr>
                          </table>
                      </td>
                      <td style="width: 339px">
                      </td>
                  </tr>
              </table>
          </td>
          <td style="width: 23px; height: 125px"></td>
      </tr>
      <tr>
      <td style="width: 8px; height: 18px;">
          <asp:Image ID="Image1" runat="server" ImageUrl="~/softimages/low_curve1.gif" Height="19px" Width="17px" /></td><td background="softimages/low_bor4.gif" style="height: 18px" colspan="3"></td><td style="width: 23px; height: 18px">
          <asp:Image ID="Image2" runat="server" Height="18px" ImageUrl="~/softimages/low_curve4.gif"
              Width="21px" /></td>
      </tr>
</table>
        </td>
	</tr>
	</table>
        </div>
    
  </asp:Content>
