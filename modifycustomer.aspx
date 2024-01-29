<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/SFA.master" CodeFile="modifycustomer.aspx.vb" Inherits="modifycustomer" %>


<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>

<%--<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls"
    TagPrefix="BDP" %>--%>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
<script language ="javascript" src="jsFiles/MainJSValidate.js" type ="text/javascript" ></script>
<script language="javascript" type ="text/javascript" >
function validateOk()
{
        if(validateDropDown(document.getElementById('ctl00_ContentPlaceHolder2_drpcust'),'Select Customer'))
        {
            return true;
        }
    return false;
}
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
        <td style="height: 20px; width: 12px;"><img src="../softimages/head_c_l.jpg" height="21" style="width: 11px" /></td>
        <td background="../softimages/head_cen_bg.jpg" class="Title21" style="width:235px; height: 20px;">
            <span style="font-size: 11pt; font-family: Verdana">Modify Customer Details</span></td>
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
                          <td colspan="3" background="../softimages/low_bor2.gif" style="height: 5px; width: 950px;">
                              
                              </td>
                          <td style="width: 17px; height: 5px;"><img src="../softimages/low_curve3.gif" /></td>
      </tr>
      <tr>
      <td style="width: 3px" background="../softimages/l_bor1.gif"></td>
          <td colspan="3" style="height: 1px; width: 950px;">
              <table border="0" cellpadding="0" cellspacing="0" width="100%">
                  <tr>
                      <td style="height: 1px; width: 2903px;" colspan="2">
                          <asp:MultiView ID="MultiView1" runat="server">
                              <asp:View ID="View1" runat="server">
                                  <table width="100%">
                                      <tr>
                                          <td style="width: 178px;">
                                              <strong><span style="font-size: 8pt">Select Customer</span></strong></td>
                                          <td>
                                              <asp:DropDownList ID="drpcust" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource1"
                                                  DataTextField="cust_name" DataValueField="cust_id" Font-Bold="True" ForeColor="#006699"
                                                  Width="180px" Height="20px" Font-Names="Verdana" Font-Size="8pt">
                                                  <asp:ListItem>-Select-</asp:ListItem>
                                              </asp:DropDownList></td>
                                          <td style="width: 479px;">
                                          </td>
                                      </tr>
                                      <tr>
                                          <td colspan="3">
                                              <table>
                                                  <tr>
                                                      <td style="width: 175px; height: 22px;">
                                                      </td>
                                                      <td style="width: 364px; height: 22px;">
                                                          <asp:ImageButton ID="imbEdit" runat="server" ImageUrl="../softimages/edit_bt.gif"
                                                              OnClientClick="return validateOk();" /></td>
                                                      <td style="width: 403px; height: 22px;">
                                                      </td>
                                                  </tr>
                                              </table>
                                          </td>
                                      </tr>
                                  </table>
                              </asp:View>
                              <asp:View ID="View2" runat="server">
                                  <table width ="100%">
                                      <tr>
                                          <td style="width: 2579px; height: 367px;">
                                              &nbsp;<table width="100%">
                                                  <tr>
                                                      <td colspan="4" style="color: #ffccff; font-family: Verdana; height: 14px; background-color: #cc6666">
                                                          <strong>Personal Details</strong></td>
                                                  </tr>
                                                  <tr>
                                                      <td style="width: 134217727px">
                                                          <span style="font-size: 8pt"><span style="font-family: Verdana"><strong>Name</strong><span><span style="color: #ff0000">*</span></span></span></span></td>
                                                      <td style="width: 134217727px">
                                                          <asp:TextBox ID="txtname" runat="server" Font-Bold="False" Font-Names="Verdana"
                                                              Font-Size="8pt" ForeColor="#006699" Height="17px" Width="175px"></asp:TextBox></td>
                                                      <td style="width: 108652448px">
                                                          <strong><span style="font-size: 8pt; font-family: Verdana">Date of Birth<span style="color: #ff0000">*</span></span></strong></td>
                                                      <td style="width: 217px">
                                                          &nbsp;<cc1:GMDatePicker ID="custDOB" runat="server" DisplayMode="Label" Font-Names="Verdana" Font-Size="8pt" MaxDate="2020-12-31" MinDate="1950-01-01" YearDropDownRange="80">
                                                          </cc1:GMDatePicker>
                                                      </td>
                                                  </tr>
                                                  <tr style="font-weight: bold">
                                                      <td style="width: 134217727px">
                                                          <span style="font-size: 8pt"><span style="font-family: Verdana">Address 1<span><span style="color: #000000">*</span></span></span></span></td>
                                                      <td style="width: 134217727px">
                                                          <asp:TextBox ID="txtadd1" runat="server" Font-Bold="False" Font-Names="Verdana" ForeColor="#006699"
                                                              Height="27px" Rows="2" TextMode="MultiLine" Width="227px" Font-Size="8pt"></asp:TextBox></td>
                                                      <td style="width: 108652448px">
                                                          <span style="font-size: 8pt; font-family: Verdana">Anniversary Date</span></td>
                                                      <td style="width: 217px">
                                                          <cc1:GMDatePicker ID="anvDate" runat="server" DisplayMode="Label" Font-Names="Verdana" Font-Size="8pt" MaxDate="2020-12-31" MinDate="1950-01-01" YearDropDownRange="80">
                                                          </cc1:GMDatePicker>
                                                      </td>
                                                  </tr>
                                                  <tr>
                                                      <td style="width: 134217727px; height: 20px">
                                                          <span style="font-size: 8pt; font-family: Verdana"><strong>Address 2</strong></span></td>
                                                      <td style="width: 134217727px; height: 20px">
                                                          <asp:TextBox ID="txtadd2" runat="server" Font-Bold="False" Font-Names="Verdana" ForeColor="#006699"
                                                              Height="27px" Rows="2" TextMode="MultiLine" Width="227px" Font-Size="8pt"></asp:TextBox></td>
                                                      <td style="width: 108652448px; height: 20px">
                                                          <span style="font-size: 8pt; font-family: Verdana"><strong>E-Mail Address*</strong></span></td>
                                                      <td style="font-size: 8pt; height: 20px; width: 217px;">
                                                          <asp:TextBox ID="txtemail" runat="server" Font-Bold="False" Font-Names="Verdana"
                                                              Font-Size="8pt" ForeColor="#006699" Height="17px" Width="175px"></asp:TextBox></td>
                                                  </tr>
                                                  <tr style="font-size: 8pt">
                                                      <td style="width: 134217727px; height: 20px">
                                                          <span style="font-family: Verdana"><strong>Address 3</strong></span></td>
                                                      <td style="width: 134217727px; height: 20px">
                                                          <asp:TextBox ID="txtadd3" runat="server" Font-Bold="False" Font-Names="Verdana" ForeColor="#006699"
                                                              Height="27px" Rows="2" TextMode="MultiLine" Width="227px" Font-Size="8pt"></asp:TextBox></td>
                                                      <td style="width: 108652448px; height: 20px">
                                                          <strong><span style="font-size: 8pt; font-family: Verdana">Fax</span></strong></td>
                                                      <td style="height: 20px; width: 217px;">
                                                          <asp:TextBox ID="txtfax" runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="8pt"
                                                              ForeColor="#006699" Height="17px" Width="175px"></asp:TextBox></td>
                                                  </tr>
                                                  <tr>
                                                      <td style="width: 134217727px; height: 28px">
                                                      </td>
                                                      <td style="width: 134217727px; height: 28px">
                                                          <span style="font-size: 8pt"><span style="font-family: Verdana"><strong>Phone Number(with
                                                              STD code)<span><span><span style="color: #000000">*</span></span></span></strong></span></span></td>
                                                      <td style="font-weight: bold; width: 108652448px; color: #000000; height: 28px">
                                                          <asp:TextBox
                                                                  ID="txtstd" runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="8pt"
                                                                  ForeColor="#006699" Height="19px" Width="49px"></asp:TextBox></td>
                                                      <td style="font-weight: bold; color: #000000; height: 28px; width: 217px;">
                                                          <asp:TextBox ID="txtphno" runat="server" Font-Bold="False" ForeColor="#006699" Height="17px"
                                                              Width="175px" Font-Size="8pt"></asp:TextBox></td>
                                                  </tr>
                                                  <tr style="font-weight: bold; color: #000000">
                                                      <td colspan="4" style="color: #ffccff; font-family: Verdana; height: 14px; background-color: #cc6666">
                                                          <span style="font-size: 8pt">Family Details</span></td>
                                                  </tr>
                                                  <tr style="font-weight: bold; font-size: 8pt">
                                                      <td style="width: 134217727px; height: 20px">
                                                          <span style="font-family: Verdana">Spouse Name</span></td>
                                                      <td style="width: 134217727px; height: 20px">
                                                          <asp:TextBox ID="txtspouse" runat="server" Font-Bold="False" ForeColor="#006699" Height="17px" Width="175px" Font-Size="8pt"></asp:TextBox></td>
                                                      <td style="width: 108652448px; height: 20px">
                                                          <strong><span style="font-size: 8pt; font-family: Verdana">Spouse Birthdate</span></strong></td>
                                                      <td style="height: 20px; width: 217px;">
                                                          <cc1:GMDatePicker ID="spouseDOB" runat="server" DisplayMode="Label" Font-Names="Verdana" Font-Size="8pt" MaxDate="2020-12-31" MinDate="1950-01-01" YearDropDownRange="80">
                                                          </cc1:GMDatePicker>
                                                      </td>
                                                  </tr>
                                                  <tr style="font-size: 8pt; font-family: Verdana">
                                                      <td style="width: 134217727px; height: 20px">
                                                          <strong>Son Name </strong>
                                                      </td>
                                                      <td style="width: 134217727px; height: 20px">
                                                          <asp:TextBox ID="txtson" runat="server" Font-Bold="False" ForeColor="#006699" Height="17px" Width="175px" Font-Size="8pt"></asp:TextBox></td>
                                                      <td style="width: 108652448px; height: 20px">
                                                          <span style="font-size: 8pt; font-family: Verdana"><strong>
                                                              Son's Birthdate&nbsp;</strong></span></td>
                                                      <td style="height: 20px; width: 217px;">
                                                          <cc1:GMDatePicker ID="sonDOB" runat="server" DisplayMode="Label" Font-Names="Verdana" Font-Size="8pt" MaxDate="2020-12-31" MinDate="1950-01-01" YearDropDownRange="80">
                                                          </cc1:GMDatePicker>
                                                      </td>
                                                  </tr>
                                                  <tr style="color: #ff0000">
                                                      <td style="width: 134217727px; height: 46px">
                                                          <span style="font-size: 8pt; font-family: Verdana"><strong>Daughter
                                                              Name</strong></span></td>
                                                      <td style="width: 134217727px; height: 46px">
                                                          <asp:TextBox ID="txtdaughter" runat="server" Font-Bold="False" ForeColor="#006699"
                                                              Height="17px" Width="175px" Font-Size="8pt"></asp:TextBox></td>
                                                      <td style="width: 108652448px; height: 46px">
                                                          <strong><span style="font-size: 8pt; font-family: Verdana">Daughter's
                                                              Birthdate</span></strong></td>
                                                      <td style="height: 46px; width: 217px;">
                                                          <cc1:GMDatePicker ID="daughterDOB" runat="server" DisplayMode="Label" Font-Names="Verdana" Font-Size="8pt" MaxDate="2020-12-31" MinDate="1950-01-01" YearDropDownRange="80">
                                                          </cc1:GMDatePicker>
                                                      </td>
                                                  </tr>
                                                  <tr style="font-weight: bold; font-size: 8pt; font-family: Verdana">
                                                      <td colspan="4" style="color: #ffccff; font-family: Verdana; background-color: #cc6666">
                                                          Nominee Details</td>
                                                  </tr>
                                                  <tr style="font-size: 8pt">
                                                      <td style="width: 134217727px">
                                                          <span style="color: black; font-family: Verdana"><strong>Nominee</strong></span></td>
                                                      <td style="width: 134217727px; color: #ff0000">
                                                          <asp:TextBox ID="txtnominee" runat="server" Font-Bold="False" ForeColor="#006699"
                                                              Height="17px" Width="175px" Font-Size="8pt"></asp:TextBox></td>
                                                      <td style="width: 108652448px; color: #ff0000">
                                                          <span style="font-size: 8pt"><span style="font-family: Verdana"><span
                                                              style="color: #ff0000;"><span><span style="color: black"><strong>Date Of Birth</strong></span>*</span></span></span></span></td>
                                                      <td style="width: 217px">
                                                          <cc1:GMDatePicker ID="nomDOB" runat="server" Font-Names="Verdana" Font-Size="8pt">
                                                          </cc1:GMDatePicker>
                                                      </td>
                                                  </tr>
                                                  <tr>
                                                      <td style="width: 134217727px">
                                                          <span style="font-size: 8pt"><strong><span style="font-family: Verdana">Address<span
                                                              style="color: #000000">*</span></span></strong></span></td>
                                                      <td style="font-size: 8pt; width: 134217727px; font-family: Tahoma">
                                                          <asp:TextBox ID="txtNadd" runat="server" Font-Bold="False" Font-Names="Verdana" ForeColor="#006699"
                                                              Height="27px" Rows="2" TextMode="MultiLine" Width="227px" Font-Size="8pt"></asp:TextBox></td>
                                                      <td style="font-size: 8pt; width: 108652448px; font-family: Tahoma">
                                                          <span style="color: #ff0000; font-family: Verdana"><strong><span style="color: #000000">
                                                              Relation</span></strong></span></td>
                                                      <td style="width: 217px">
                                                          <asp:TextBox ID="txtNrel" runat="server" Font-Bold="False" ForeColor="#006699" Height="17px"
                                                              Width="175px" Font-Size="8pt"></asp:TextBox></td>
                                                  </tr>
                                                  <tr>
                                                      <td style="width: 134217727px">
                                                      </td>
                                                      <td style="width: 134217727px">
                                                          <span style="font-family: Verdana"><span style="font-size: 8pt"><strong>Phone Number(with STD code)<span><span>*</span></span></strong></span></span></td>
                                                      <td style="width: 108652448px">
                                                          <asp:TextBox ID="txtNstd"
                                                              runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="8pt" ForeColor="#006699"
                                                              Height="19px" Width="49px"></asp:TextBox></td>
                                                      <td style="width: 217px">
                                                          <asp:TextBox ID="txtNphno" runat="server" Font-Bold="False" ForeColor="#006699" Height="17px" Width="175px" Font-Size="8pt"></asp:TextBox></td>
                                                  </tr>
                                                  <tr>
                                                      <td colspan="4" style="color: #ffccff; font-family: Verdana; height: 14px; background-color: #cc6666">
                                                          Reference Details</td>
                                                  </tr>
                                                  <tr>
                                                      <td style="width: 134217727px">
                                                          <strong><span style="font-size: 8pt; font-family: Verdana">Reference Name</span></strong></td>
                                                      <td style="width: 134217727px">
                                                          <asp:TextBox ID="txtref" runat="server" Font-Bold="False" ForeColor="#006699" Height="17px" Width="175px" Font-Size="8pt"></asp:TextBox></td>
                                                      <td style="width: 108652448px">
                                                          <span
                                                              style="font-family: Verdana"><span style="font-size: 8pt"><strong><span style="color: #000000">Address</span></strong><span
                                                                  style="color: #ff0000"><span>*</span></span></span></span><span><span></span></span></td>
                                                      <td style="width: 217px">
                                                          <asp:TextBox ID="txtrefadd" runat="server" Font-Bold="False" Font-Names="Verdana"
                                                              ForeColor="#006699" Height="27px" Rows="2" TextMode="MultiLine" Width="227px" Font-Size="8pt"></asp:TextBox></td>
                                                  </tr>
                                                  <tr>
                                                      <td style="width: 134217727px; height: 29px">
                                                      </td>
                                                      <td style="width: 134217727px; height: 29px">
                                                          <span style="font-family: Verdana"><span style="font-size: 8pt"><strong>Phone Number(with
                                                              STD code)</strong><span style="color: #ff0000">*</span><span
                                                              style="color: #ff0000"><span><span></span></span></span></span></span></td>
                                                      <td style="width: 108652448px; height: 29px">
                                                          <asp:TextBox ID="txtrefstd"
                                                                  runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="8pt" ForeColor="#006699"
                                                                  Height="19px" Width="49px"></asp:TextBox></td>
                                                      <td style="height: 29px; width: 217px;">
                                                          <asp:TextBox ID="txtrefphno" runat="server" Font-Bold="False" ForeColor="#006699"
                                                              Height="17px" Width="175px" Font-Size="8pt"></asp:TextBox></td>
                                                  </tr>
                                                  <tr>
                                                      <td style="width: 134217727px; height: 20px;">
                                                          &nbsp;
                                                      </td>
                                                      <td style="width: 134217727px; height: 20px;">
                                                          &nbsp;
                                                      </td>
                                                      <td style="width: 108652448px; height: 20px;">
                                                          &nbsp;
                                                      </td>
                                                      <td style="width: 217px; height: 20px;">
                                                          &nbsp;</td>
                                                  </tr>
                                                  <tr>
                                                      <td colspan="4">
                                              <table>
                                                  <tr>
                                                      <td style="width: 505px; height: 24px;">
                                                      </td>
                                                      <td style="width: 671px; height: 24px;" colspan="2">
                                                          &nbsp;<asp:ImageButton ID="imbSave" runat="server" ImageUrl="../softimages/save.gif" OnClientClick="return validateInput();" /></td>
                                                  </tr>
                                             
                                              </table>
                                                      </td>
                                                  </tr>
                                                  <tr>
                                                      <td style="width: 134217727px; height: 20px;">
                                                      </td>
                                                      <td style="width: 134217727px; height: 20px;">
                                                      </td>
                                                      <td style="width: 108652448px; height: 20px;">
                                                      </td>
                                                      <td style="height: 20px; width: 217px;">
                                                      </td>
                                                  </tr>
                                              </table>
                                          </td>
                                          <td style="height: 367px;">
                                          </td>
                                      </tr>
                                  </table>
                              </asp:View>
                          </asp:MultiView>
                                              <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conMM %>"
                                                  SelectCommand="SELECT [cust_name], [cust_id] FROM [customer_master] WHERE ([loc_id] = @loc_id)">
                                                  <SelectParameters>
                                                      <asp:SessionParameter Name="loc_id" SessionField="LocId" Type="String" />
                                                  </SelectParameters>
                                              </asp:SqlDataSource>
                                          </td>
                      <td style="width: 178px; height: 1px">
                      </td>
                  </tr>
                  <tr>
                      <td colspan="2" style="width: 2903px">
                      </td>
                      <td style="width: 178px;">
                      </td>
                  </tr>
              </table>
          </td>
          <td background="../softimages/low_bor3.gif" style="width: 17px"></td>
      </tr>
      
      <tr>
          <td style="height: 15px; width: 3px;"><img src="../softimages/low_curve1.gif" /></td>
          <td colspan="3" background="../softimages/low_bor4.gif" style="height: 15px; width: 950px;"></td>
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
    
  </asp:Content>
