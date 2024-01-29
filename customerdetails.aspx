<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/SFA.master" CodeFile="customerdetails.aspx.vb" Inherits="customerdetails" %>

<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>
<%--
<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls"
    TagPrefix="BDP" %>--%>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
<script language ="javascript" src="jsFiles/MainJSValidate.js" type ="text/javascript" ></script>
<script language="javascript" type ="text/javascript" >

function validateInput()
{
    if(validateEmpty(document.getElementById('ctl00_ContentPlaceHolder2_txtname'),'Enter Customer Name','Invalid text in Customer Name'))
    {
    if(validateEmpty(document.getElementById('ctl00_ContentPlaceHolder2_txtadd1'),'Enter Address 1','Invalid text in Address 1'))
    {
    if(validateEmpty(document.getElementById('ctl00_ContentPlaceHolder2_txtadd2'),'Enter Address 2','Invalid text in Address 2'))
    {
    if(validateEmpty(document.getElementById('ctl00_ContentPlaceHolder2_txtadd3'),'Enter Address 3','Invalid text in Address 3'))
    {
    if(emailValidator(document.getElementById('ctl00_ContentPlaceHolder2_txtemail'), 'Invalid Email ID'))
    {
    if(isNotLetter(document.getElementById('ctl00_ContentPlaceHolder2_txtstd'),'Alphabet in Phone Nos'))
    {
    if(isNotLetter(document.getElementById('ctl00_ContentPlaceHolder2_txtphno'),'Alphabet in Phone Nos'))
    {
    if(isNotLetter(document.getElementById('ctl00_ContentPlaceHolder2_txtfax'),'Alphabet in Fax'))
    {
    if(validateEmpty(document.getElementById('ctl00_ContentPlaceHolder2_txtspouse'),'Enter Spouse Name','Invalid text in Spouse Name'))
    {
    if(validateEmpty(document.getElementById('ctl00_ContentPlaceHolder2_txtson'),'Enter Son Name','Invalid text in Son Name'))
    {
    if(validateEmpty(document.getElementById('ctl00_ContentPlaceHolder2_txtdaughter'),'Enter Daughter Name','Invalid text in Daughter Name'))
    {
    if(validateEmpty(document.getElementById('ctl00_ContentPlaceHolder2_txtnominee'),'Enter Nominee','Invalid text in Nominee'))
    {
    if(validateEmpty(document.getElementById('ctl00_ContentPlaceHolder2_txtNadd'),'Enter Nominee Address','Invalid text in Nominee Address'))
    {
    if(validateEmpty(document.getElementById('ctl00_ContentPlaceHolder2_txtNrel'),'Enter Relation with Nominee','Invalid text in Relation with Nominee'))
    {
    if(isNotLetter(document.getElementById('ctl00_ContentPlaceHolder2_txtNstd'),'Alphabet in Nominee STD'))
    {
    if(isNotLetter(document.getElementById('ctl00_ContentPlaceHolder2_txtNphno'),'Alphabet in Nominee Phone Nos'))
    {
    if(validateEmpty(document.getElementById('ctl00_ContentPlaceHolder2_txtref'),'Enter Reference Name','Invalid text in Reference Name'))
    {
    if(validateEmpty(document.getElementById('ctl00_ContentPlaceHolder2_txtrefadd'),'Enter Reference Address','Invalid text in Reference Address'))
    {
    if(isNotLetter(document.getElementById('ctl00_ContentPlaceHolder2_txtrefstd'),'Alphabet in Reference STD'))
    {
    if(isNotLetter(document.getElementById('ctl00_ContentPlaceHolder2_txtrefphno'),'Alphabet in Reference Phone Nos'))
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
    }
    }
    }
    }
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
<div id="main" style="position:absolute; width:950px; left: 9px; top: 77px; ">

<table cellpadding="0" cellspacing="0" border="0" style="width: 104%">
	<tr>
	<td style="width: 1198px">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td style="height: 21px"><img src="../softimages/head_c_l.jpg" height="21" style="width: 11px" /></td>
        <td background="../softimages/head_cen_bg.jpg" class="Title21" style="width:235px; height: 21px;">
            <span style="font-size: 11pt; font-family: Verdana">Customer Details</span></td>
        <td style="height: 21px; width: 845px;"><img src="../softimages/head_c_r.jpg" width="13" height="21" /></td>
      </tr>
    </table>
	</td>
	</tr>
	<tr>
	<td style="height: 30px; width: 1198px;">
	<table  border="0" cellspacing="0" cellpadding="0" style="width: 100%" class="td_bg_1">
    
    
    
        <tr>
                          <td style="width: 3px; height: 5px;"><img src="../softimages/low_curve21.jpg" /></td>
                          <td colspan="3" background="../softimages/low_bor2.gif" style="height: 5px; width: 732px;">
                              
                              </td>
                          <td style="width: 17px; height: 5px;"><img src="../softimages/low_curve3.gif" /></td>
      </tr>
      <tr>
      <td style="width: 3px" background="../softimages/l_bor1.gif"></td>
          <td colspan="3" style="height: 1px; width: 732px;">
              <table border="0" cellpadding="0" cellspacing="0" width="100%">
                  <tr>
                      <td style="height: 1px;" colspan="2">
                          <table width="100%">
                              <tr>
                                  <td colspan="4" style="color: #ffccff; font-family: Verdana; height: 14px; background-color: #cc6666">
                                      <strong>Personal Details</strong></td>
                              </tr>
                              <tr>
                                  <td style="width: 134217727px">
                                      <span style="font-size: 8pt"><span style="font-family: Verdana"><strong>Name</strong><span><span
                                          style="color: #ff0000">*</span></span></span></span></td>
                                  <td>
                                      <asp:TextBox ID="txtname" runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="8pt"
                                          ForeColor="#006699" Height="17px" Width="175px"></asp:TextBox></td>
                                  <td style="width: 134217727px">
                                      <strong><span style="font-size: 8pt; font-family: Verdana">Date of Birth<span style="color: #ff0000">*</span></span></strong></td>
                                  <td style="width: 347px">
                                      &nbsp;<cc1:GMDatePicker ID="custDOB" runat="server" DisplayMode="Label" Font-Bold="False"
                                          Font-Names="Verdana" Font-Size="8pt" MaxDate="2020-12-31" MinDate="1950-01-01"
                                          YearDropDownRange="100">
                                      </cc1:GMDatePicker>
                                  </td>
                              </tr>
                              <tr style="font-weight: bold">
                                  <td style="width: 134217727px">
                                      <span><span style="font-family: Verdana"><span style="font-size: 8pt">Address
                                                      1<span><span
                                          style="color: #000000">*</span></span></span></span></span></td>
                                  <td>
                                      <asp:TextBox ID="txtadd1" runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="8pt"
                                          ForeColor="#006699" Height="27px" Rows="2" TextMode="MultiLine" Width="227px"></asp:TextBox></td>
                                  <td style="width: 134217727px">
                                      <span style="font-size: 8pt; font-family: Verdana">Anniversary Date</span></td>
                                  <td style="font-size: 8pt; width: 347px">
                                      <cc1:GMDatePicker ID="anvDate" runat="server" DisplayMode="Label" Font-Names="Verdana"
                                          Font-Size="8pt" MaxDate="2020-12-31" MinDate="1950-01-01" YearDropDownRange="100">
                                      </cc1:GMDatePicker>
                                      <span style="font-family: Verdana"></span>
                                  </td>
                              </tr>
                              <tr style="font-size: 8pt; font-family: Verdana">
                                  <td style="width: 134217727px;">
                                      <span><strong>Address 2</strong></span></td>
                                  <td>
                                      <asp:TextBox ID="txtadd2" runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="8pt"
                                          ForeColor="#006699" Height="27px" Rows="2" TextMode="MultiLine" Width="227px"></asp:TextBox></td>
                                  <td style="font-size: 8pt; width: 134217727px;">
                                      <span style="font-family: Verdana"><strong>E-Mail Address*</strong></span></td>
                                  <td style="font-size: 8pt; width: 347px;">
                                      <asp:TextBox ID="txtemail" runat="server" Font-Bold="False" Font-Names="Verdana"
                                          Font-Size="8pt" ForeColor="#006699" Height="17px" Width="175px"></asp:TextBox></td>
                              </tr>
                              <tr style="font-size: 8pt">
                                  <td style="width: 134217727px; height: 20px">
                                      <span style="font-family: Verdana"><strong>Address 3</strong></span></td>
                                  <td style="height: 20px">
                                      <asp:TextBox ID="txtadd3" runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="8pt"
                                          ForeColor="#006699" Height="27px" Rows="2" TextMode="MultiLine" Width="227px"></asp:TextBox></td>
                                  <td style="width: 134217727px; height: 20px; font-size: 8pt;">
                                      <strong><span style="font-family: Verdana">Fax</span></strong></td>
                                  <td style="width: 347px; font-family: Verdana; height: 20px; font-size: 8pt;">
                                      <asp:TextBox ID="txtfax" runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="8pt"
                                          ForeColor="#006699" Height="17px" Width="175px"></asp:TextBox></td>
                              </tr>
                              <tr style="font-size: 8pt; font-family: Verdana">
                                  <td style="width: 134217727px; height: 28px">
                                  </td>
                                  <td style="height: 28px; font-size: 8pt;">
                                      <span><span><span style="font-family: Tahoma"><strong>Phone Number(with STD code)</strong><span><span><span
                                          style="color: #000000">*</span></span></span></span></span></span></td>
                                  <td style="font-weight: bold; width: 134217727px; color: #000000; font-family: Tahoma;
                                      height: 28px; font-size: 8pt;">
                                      <asp:TextBox ID="txtstd" runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="8pt"
                                          ForeColor="#006699" Height="19px" Width="49px"></asp:TextBox></td>
                                  <td style="font-weight: bold; width: 347px; color: #000000; font-family: Tahoma;
                                      height: 28px">
                                      <asp:TextBox ID="txtphno" runat="server" Font-Bold="False" Font-Size="8pt" ForeColor="#006699"
                                          Height="17px" Width="175px"></asp:TextBox></td>
                              </tr>
                              <tr style="font-weight: bold; color: #000000; font-family: Tahoma">
                                  <td colspan="4" style="color: #ffccff; font-family: Verdana; height: 14px; background-color: #cc6666">
                                      <span style="font-size: 8pt">Family Details</span></td>
                              </tr>
                              <tr style="font-weight: bold; font-size: 8pt">
                                  <td style="width: 134217727px;">
                                      <span style="font-family: Verdana">Spouse Name</span></td>
                                  <td style="font-family: Tahoma;">
                                      <asp:TextBox ID="txtspouse" runat="server" Font-Bold="False" Font-Size="8pt" ForeColor="#006699"
                                          Height="17px" Width="175px"></asp:TextBox></td>
                                  <td style="font-size: 8pt; width: 134217727px; font-family: Tahoma;">
                                      <span style="font-family: Verdana">Spouse Birthdate</span></td>
                                  <td style="font-size: 8pt; width: 347px;">
                                      <cc1:GMDatePicker ID="spouseDOB" runat="server" DisplayMode="Label" Font-Names="Verdana"
                                          Font-Size="8pt" MaxDate="2020-12-31" MinDate="1950-01-01" YearDropDownRange="100">
                                      </cc1:GMDatePicker>
                                      <span style="color: #ff0000; font-family: Verdana"></span>
                                  </td>
                              </tr>
                              <tr style="font-size: 8pt; color: #ff0000; font-family: Verdana">
                                  <td style="width: 134217727px;">
                                      <strong>Son Name</strong></td>
                                  <td>
                                      <asp:TextBox ID="txtson" runat="server" Font-Bold="False" Font-Size="8pt" ForeColor="#006699"
                                          Height="17px" Width="175px"></asp:TextBox></td>
                                  <td style="font-size: 8pt; width: 134217727px; font-family: Verdana;">
                                      <span><strong>Son's Birthdate</strong>&nbsp;</span></td>
                                  <td style="width: 347px;">
                                      <cc1:GMDatePicker ID="sonDOB" runat="server" DisplayMode="Label" Font-Names="Verdana"
                                          Font-Size="8pt" MaxDate="2020-12-31" MinDate="1950-01-01" YearDropDownRange="100">
                                      </cc1:GMDatePicker>
                                      <span style="font-size: 8pt; font-family: Tahoma"></span>
                                  </td>
                              </tr>
                              <tr style="font-weight: bold; font-size: 8pt; color: #ff0000; font-family: Tahoma">
                                  <td style="width: 134217727px;">
                                      <span style="font-family: Verdana">Daughter Name</span></td>
                                  <td style="font-family: Verdana;">
                                      <asp:TextBox ID="txtdaughter" runat="server" Font-Bold="False" Font-Size="8pt" ForeColor="#006699"
                                          Height="17px" Width="175px"></asp:TextBox></td>
                                  <td style="width: 134217727px; font-family: Verdana;">
                                      <span style="font-size: 8pt">Daughter's Birthdate</span></td>
                                  <td style="width: 347px;">
                                      <cc1:GMDatePicker ID="daughterDOB" runat="server" DisplayMode="Label" Font-Names="Verdana"
                                          Font-Size="8pt" MaxDate="2020-12-31" MinDate="1950-01-01" YearDropDownRange="100">
                                      </cc1:GMDatePicker>
                                      <span style="font-size: 8pt; font-family: Verdana"></span>
                                  </td>
                              </tr>
                              <tr style="font-weight: bold; font-size: 8pt; font-family: Verdana">
                                  <td colspan="4" style="color: #ffccff; font-family: Verdana; height: 14px; background-color: #cc6666">
                                      Nominee Details</td>
                              </tr>
                              <tr style="font-size: 8pt; color: #000000">
                                  <td style="width: 134217727px">
                                      <span style="font-family: Verdana"><strong>Nominee</strong></span></td>
                                  <td style="color: #ff0000">
                                      <asp:TextBox ID="txtnominee" runat="server" Font-Bold="False" Font-Size="8pt" ForeColor="#006699"
                                          Height="17px" Width="175px"></asp:TextBox></td>
                                  <td style="width: 134217727px; color: #ff0000">
                                      <span><span style="font-family: Verdana"><span style="color: #ff0000"><span><span
                                          style="color: black"><strong>Date Of Birth</strong></span>*</span></span></span></span></td>
                                  <td style="width: 347px">
                                      <cc1:GMDatePicker ID="nomDOB" runat="server" DisplayMode="Label" Font-Names="Verdana"
                                          Font-Size="8pt" MaxDate="2020-12-31" MinDate="1950-01-01" YearDropDownRange="80">
                                      </cc1:GMDatePicker>
                                  </td>
                              </tr>
                              <tr>
                                  <td style="width: 134217727px">
                                      <span><span><span style="font-size: 8pt"><span style="font-family: Verdana"><strong>
                                          Address<span style="color: #000000">*</span></strong></span></span></span></span></td>
                                  <td style="font-size: 8pt; font-family: Tahoma">
                                      <asp:TextBox ID="txtNadd" runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="8pt"
                                          ForeColor="#006699" Height="27px" Rows="2" TextMode="MultiLine" Width="227px"></asp:TextBox></td>
                                  <td style="font-size: 8pt; width: 134217727px; font-family: Tahoma">
                                      <span style="color: #ff0000; font-family: Verdana"><strong><span style="color: #000000">
                                          Relation</span></strong></span></td>
                                  <td style="width: 347px">
                                      <asp:TextBox ID="txtNrel" runat="server" Font-Bold="False" Font-Size="8pt" ForeColor="#006699"
                                          Height="17px" Width="175px"></asp:TextBox></td>
                              </tr>
                              <tr>
                                  <td style="width: 134217727px">
                                  </td>
                                  <td>
                                      <span style="font-family: Verdana"><span style="font-size: 8pt"><strong>Phone Number(with
                                          STD code)<span><span>*</span></span></strong></span></span></td>
                                  <td style="width: 134217727px">
                                      <asp:TextBox ID="txtNstd" runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="8pt"
                                          ForeColor="#006699" Height="19px" Width="49px"></asp:TextBox></td>
                                  <td style="width: 347px">
                                      <asp:TextBox ID="txtNphno" runat="server" Font-Bold="False" Font-Size="8pt" ForeColor="#006699"
                                          Height="17px" Width="175px"></asp:TextBox></td>
                              </tr>
                              <tr>
                                  <td colspan="4" style="color: #ffccff; font-family: Verdana; height: 14px; background-color: #cc6666">
                                      <strong>Reference Details</strong></td>
                              </tr>
                              <tr>
                                  <td style="width: 134217727px">
                                      <strong><span style="font-size: 8pt; font-family: Verdana">Reference Name</span></strong></td>
                                  <td>
                                      <asp:TextBox ID="txtref" runat="server" Font-Bold="False" Font-Size="8pt" ForeColor="#006699"
                                          Height="17px" Width="175px"></asp:TextBox></td>
                                  <td style="width: 134217727px">
                                      <span style="font-family: Verdana"><span style="font-size: 8pt"><strong><span style="color: #000000">
                                          Address</span></strong><span style="color: #ff0000"><span>*</span></span></span></span><span><span></span></span></td>
                                  <td style="width: 347px">
                                      <asp:TextBox ID="txtrefadd" runat="server" Font-Bold="False" Font-Names="Verdana"
                                          Font-Size="8pt" ForeColor="#006699" Height="27px" Rows="2" TextMode="MultiLine"
                                          Width="227px"></asp:TextBox></td>
                              </tr>
                              <tr>
                                  <td style="width: 134217727px;">
                                  </td>
                                  <td>
                                      <span style="font-family: Verdana"><span style="font-size: 8pt"><strong>Phone Number(with
                                          STD code)</strong><span style="color: #ff0000">*</span><span style="color: #ff0000"><span><span></span></span></span></span></span></td>
                                  <td style="width: 134217727px;">
                                      <asp:TextBox ID="txtrefstd" runat="server" Font-Bold="False" Font-Names="Verdana"
                                          Font-Size="8pt" ForeColor="#006699" Height="19px" Width="49px"></asp:TextBox></td>
                                  <td style="width: 347px;">
                                      <asp:TextBox ID="txtrefphno" runat="server" Font-Bold="False" Font-Size="8pt" ForeColor="#006699"
                                          Height="17px" Width="175px"></asp:TextBox></td>
                              </tr>
                              <tr>
                                  <td style="width: 134217727px">
                                      &nbsp;
                                  </td>
                                  <td>
                                      &nbsp;
                                  </td>
                                  <td style="width: 134217727px">
                                      &nbsp;
                                  </td>
                                  <td style="width: 347px">
                                      &nbsp;</td>
                              </tr>
                              <tr>
                                  <td colspan="4">
                                      <table>
                                          <tr>
                                              <td style="width: 422px">
                                              </td>
                                              <td colspan="2" style="width: 671px">
                                                  &nbsp;<asp:ImageButton ID="imbSave" runat="server" ImageUrl="../softimages/save.gif" OnClientClick="return validateInput();" /></td>
                                          </tr>
                                      </table>
                                  </td>
                              </tr>
                              <tr>
                                  <td style="width: 134217727px; height: 20px">
                                  </td>
                                  <td style="height: 20px">
                                  </td>
                                  <td style="width: 134217727px; height: 20px">
                                  </td>
                                  <td style="width: 347px; height: 20px">
                                  </td>
                              </tr>
                          </table>
                      </td>
                      <td style="height: 1px">
                      </td>
                  </tr>
                  <tr>
                      <td colspan="2" style="height: 36px">
                      </td>
                      <td style="height: 36px;">
                                      <asp:Label Font-Names="Verdana" Font-Size="8pt" ForeColor="#006699" ID="lblId" runat="server" Visible="False"></asp:Label><asp:LinkButton Font-Names="Verdana" Font-Size="8pt" Height="11px" ID="lnkLogout" runat="server" Width="59px" Visible="False">Logout</asp:LinkButton></td>
                  </tr>
              </table>
          </td>
          <td background="../softimages/low_bor3.gif" style="width: 17px"></td>
      </tr>
      
      <tr>
          <td style="height: 16px; width: 3px;"><img src="../softimages/low_curve1.gif" /></td>
          <td colspan="3" background="../softimages/low_bor4.gif" style="height: 16px; width: 732px;"></td>
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