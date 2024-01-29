<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/SFA.master" CodeFile="Home.aspx.vb" Inherits="mmsoft_Home" %>
<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
<script language ="javascript" src="jsFiles/MainJSValidate.js" type ="text/javascript" ></script>
<script language="javascript" type ="text/javascript" >
function validateOk()
{drpBuilding
        if(validateDropDown(document.getElementById('ctl00_ContentPlaceHolder2_drpFlatTypeName'),'Select FlatType'))
        {
            return true;
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
        if(validateEmpty(document.getElementById('ctl00_ContentPlaceHolder2_txtRateOfInterest'),'Enter Rate Per Sqft','Invalid Input in Rate Per Sqft'))
        {
        if(validateEmpty(document.getElementById('ctl00_ContentPlaceHolder2_txtFName'),'Enter First Name','Invalid Input in First Name'))
        {
        if(validateEmpty(document.getElementById('ctl00_ContentPlaceHolder2_txtLName'),'Enter Last Name','Invalid Input in Last Name'))
        {
        if(validateEmpty(document.getElementById('ctl00_ContentPlaceHolder2_txtSFName'),'Enter Secondary First Name','Invalid Input in Secondary Last Name'))
        {
        if(validateEmpty(document.getElementById('ctl00_ContentPlaceHolder2_txtSLName'),'Enter Secondary Last Name','Invalid Input in Secondary Last Name'))
        {
        if(validateEmpty(document.getElementById('ctl00_ContentPlaceHolder2_txtadd1'),'Enter Address1','Invalid Input in Address1'))
        {
        if(validateEmpty(document.getElementById('ctl00_ContentPlaceHolder2_txtadd2'),'Enter Address2','Invalid Input in Address2'))
        {
        if(isNotLetter(document.getElementById('ctl00_ContentPlaceHolder2_txttelno'),'Alphabet in Telephone Nos.'))
        {
        if(isNotLetter(document.getElementById('ctl00_ContentPlaceHolder2_txtmobno'),'Alphabet in Mobile Nos.'))
        {
        if(validateEmpty(document.getElementById('ctl00_ContentPlaceHolder2_txtemail'),'Enter Email','Invalid Input in Email ID'))
        {
        if(validateEmpty(document.getElementById('ctl00_ContentPlaceHolder2_txtbank'),'Enter Address1','Invalid Input in Address1'))
        {            
            return true;        
        }      
        }}}
        }}
        }}}}}}}}
        
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
            <span style="font-size: 10pt; font-family: Verdana">Home</span></td>
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
              <br />
              <br />
              <br />
              <br />
              <br />
              <br />
              <br />
              <br />
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

