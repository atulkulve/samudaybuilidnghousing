<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/SFA.master" CodeFile="SalesDetailedEntry.aspx.vb" Inherits="mmsoft_SalesDetailedEntry" %>
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
        if(validateDropDown(document.getElementById('ctl00_ContentPlaceHolder2_drpgender'),'Select Gender'))
        {            
            return true;        
        }      
        }}}
        }}
        }}}}}}}}
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
            <span style="font-size: 10pt; font-family: Verdana">Sales Entry Master</span></td>
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
                      <td style="width: 719px">
                          <table border="0" bordercolor="#006699">
                              <tr>
                                  <td style="width: 361px; text-align: left;">
                                      <span style="font-size: 10pt; font-family: Verdana"><span style="font-size: 8pt">Select
                                          Site</span></span></td>
                                  <td style="text-align: left; width: 169px;"><asp:DropDownList ID="drpSite" runat="server" Font-Bold="False" Font-Names="Verdana"
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
                                  <td style="width: 361px; text-align: left">
                                      <span style="font-size: 8pt; font-family: Verdana">Flat Number</span></td>
                                  <td style="width: 169px; text-align: left">
                                              <asp:DropDownList ID="drpFlatNumber" runat="server" Font-Bold="False" Font-Names="Verdana"
                                                  Font-Size="8pt" ForeColor="#006699" Height="20px" Width="175px" AutoPostBack="True">
                                                  <asp:ListItem Value="0">--Select--</asp:ListItem>
                                              </asp:DropDownList></td>
                                  <td style="width: 247px; text-align: left">
                                      <span style="font-size: 8pt; font-family: Verdana">
                                      Total Sqft</span></td>
                                  <td style="width: 247px; text-align: left; font-size: 8pt; font-family: Verdana;">
                                      <asp:Label ID="lblsqft" runat="server" Font-Names="Verdana" Font-Size="8pt" Width="62px"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td style="width: 361px; text-align: left">
                                      <span style="font-size: 8pt; font-family: Verdana">Rate Per Sqft</span></td>
                                  <td style="width: 169px; text-align: left">
                                      <asp:TextBox ID="txtRateOfInterest" runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="8pt"
                                          ForeColor="#006699" Height="15px" Width="168px"></asp:TextBox></td>
                                  <td style="width: 247px; text-align: left">
                                      </td>
                                  <td style="width: 247px; text-align: left"></td>
                              </tr>
                              <tr>
                                  <td style="width: 361px; text-align: left">
                                  </td>
                                  <td style="width: 169px; text-align: left">
                                  </td>
                                  <td style="width: 247px; text-align: left">
                                  </td>
                                  <td style="width: 247px; text-align: left">
                                  <asp:DropDownList ID="drpinstallments" runat="server" Font-Bold="False" Font-Names="Verdana"
                                                  Font-Size="8pt" ForeColor="#006699" Height="20px" Width="175px" AutoPostBack="True" Visible="False">
                                      <asp:ListItem Value="0">--Select--</asp:ListItem>
                                      <asp:ListItem>8</asp:ListItem>
                                      <asp:ListItem>12</asp:ListItem>
                                      <asp:ListItem>36</asp:ListItem>
                                  </asp:DropDownList></td>
                              </tr>
                              <tr>
                                  <td colspan="4" style="text-align: left">
                                      <table width="100%">
                                          <tr>
                                              <td style="width: 232px">
                                                  <span style="font-size: 8pt; font-family: Verdana">First Name</span></td>
                                              <td style="width: 196px">
                                                  <asp:TextBox ID="txtFName" runat="server" Font-Bold="False" Font-Names="Verdana"
                                                      Font-Size="8pt" ForeColor="#006699" Height="15px" Width="168px"></asp:TextBox></td>
                                              <td style="width: 169px">
                                                  <span style="font-size: 8pt; font-family: Verdana">Last Name</span></td>
                                              <td style="width: 217px">
                                                  <asp:TextBox ID="txtLName" runat="server" Font-Bold="False" Font-Names="Verdana"
                                                      Font-Size="8pt" ForeColor="#006699" Height="15px" Width="168px"></asp:TextBox></td>
                                          </tr>
                                          <tr>
                                              <td style="width: 232px">
                                                  <span style="font-size: 8pt; font-family: Verdana">Secondary First Name</span></td>
                                              <td style="width: 196px">
                                                  <asp:TextBox ID="txtSFName" runat="server" Font-Bold="False" Font-Names="Verdana"
                                                      Font-Size="8pt" ForeColor="#006699" Height="15px" Width="168px"></asp:TextBox></td>
                                              <td style="width: 169px">
                                                  <span style="font-size: 8pt; font-family: Verdana">Secondary Last Name</span></td>
                                              <td style="width: 217px; font-size: 8pt; font-family: Tahoma;">
                                                  <asp:TextBox ID="txtSLName" runat="server" Font-Bold="False" Font-Names="Verdana"
                                                      Font-Size="8pt" ForeColor="#006699" Height="15px" Width="168px"></asp:TextBox></td>
                                          </tr>
                                          <tr style="font-size: 8pt; font-family: Tahoma">
                                              <td style="width: 232px">
                                                  <span>Address1</span></td>
                                              <td style="width: 196px">
                                                  <asp:TextBox ID="txtadd1" runat="server" Font-Bold="False" Font-Names="Verdana"
                                                      Font-Size="8pt" ForeColor="#006699" Height="15px" Width="168px"></asp:TextBox></td>
                                              <td style="width: 169px">
                                                  <span style="font-size: 8pt; font-family: Verdana">Address2</span></td>
                                              <td style="width: 217px">
                                                  <asp:TextBox ID="txtadd2" runat="server" Font-Bold="False" Font-Names="Verdana"
                                                      Font-Size="8pt" ForeColor="#006699" Height="15px" Width="168px"></asp:TextBox></td>
                                          </tr>
                                          <tr>
                                              <td style="width: 232px">
                                                  <span style="font-size: 8pt; font-family: Verdana">Tel No.</span></td>
                                              <td style="width: 196px">
                                                  <asp:TextBox ID="txttelno" runat="server" Font-Bold="False" Font-Names="Verdana"
                                                      Font-Size="8pt" ForeColor="#006699" Height="15px" Width="168px"></asp:TextBox></td>
                                              <td style="width: 169px">
                                                  <span style="font-size: 8pt; font-family: Verdana">Mob No.</span></td>
                                              <td style="width: 217px">
                                                  <asp:TextBox ID="txtmobno" runat="server" Font-Bold="False" Font-Names="Verdana"
                                                      Font-Size="8pt" ForeColor="#006699" Height="15px" Width="168px"></asp:TextBox></td>
                                          </tr>
                                          <tr>
                                              <td style="width: 232px">
                                                  <span style="font-size: 8pt; font-family: Verdana">Email ID</span></td>
                                              <td style="width: 196px">
                                                  <asp:TextBox ID="txtemail" runat="server" Font-Bold="False" Font-Names="Verdana"
                                                      Font-Size="8pt" ForeColor="#006699" Height="15px" Width="168px"></asp:TextBox></td>
                                              <td style="width: 169px">
                                                  <span style="font-size: 8pt; font-family: Verdana">Date Of Sale</span></td>
                                              <td style="width: 217px">
                                                  <cc1:GMDatePicker ID="SaleDate" runat="server" DisplayMode="Label" Font-Names="Verdana"
                                                      Font-Size="8pt" MaxDate="2020-12-31" MinDate="1950-01-01" YearDropDownRange="100" DateFormat="dd-MMM-yy">
                                                  </cc1:GMDatePicker>
                                              </td>
                                          </tr>
                                          <tr>
                                              <td style="width: 232px">
                                                  <span style="font-size: 8pt; font-family: Verdana">Date of Birth</span></td>
                                              <td style="width: 196px"><cc1:GMDatePicker ID="birthdate" runat="server" DisplayMode="Label" Font-Names="Verdana"
                                                      Font-Size="8pt" MaxDate="2020-12-31" MinDate="1950-01-01" YearDropDownRange="100" DateFormat="dd-MMM-yy">
                                              </cc1:GMDatePicker>
                                              </td>
                                              <td style="width: 169px">
                                                  <span style="font-size: 8pt; font-family: Verdana">Bank Name</span></td>
                                              <td style="width: 217px">
                                                  <asp:TextBox ID="txtbank" runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="8pt"
                                                      ForeColor="#006699" Height="15px" Width="168px"></asp:TextBox></td>
                                          </tr>
                                          <tr>
                                              <td style="width: 232px; height: 20px">
                                                  <span style="font-size: 8pt; font-family: Verdana">Gender</span></td>
                                              <td style="width: 196px; height: 20px">
                                                  <asp:DropDownList ID="drpgender" runat="server" Font-Bold="False" Font-Names="Verdana"
                                                  Font-Size="8pt" ForeColor="#006699" Height="20px" Width="175px" AutoPostBack="True">
                                                      <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                      <asp:ListItem>Male</asp:ListItem>
                                                      <asp:ListItem>Female</asp:ListItem>
                                                  </asp:DropDownList></td>
                                              <td style="width: 169px; height: 20px">
                                                  Channel Partner</td>
                                              <td style="width: 217px; height: 20px">
                                                  <asp:DropDownList ID="drpcp" runat="server" AutoPostBack="True" Font-Bold="False"
                                                      Font-Names="Verdana" Font-Size="8pt" ForeColor="#006699" Height="20px" Width="175px">
                                                      <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                  </asp:DropDownList></td>
                                          </tr>
                                          <tr>
                                              <td style="width: 232px; height: 20px">
                                              </td>
                                              <td style="width: 196px; height: 20px">
                                              </td>
                                              <td style="width: 169px; height: 20px">
                                                  Sales Channel Partner</td>
                                              <td style="width: 217px; height: 20px">
                                                  <asp:DropDownList ID="drpscp" runat="server" AutoPostBack="True" Font-Bold="False"
                                                      Font-Names="Verdana" Font-Size="8pt" ForeColor="#006699" Height="20px" Width="175px">
                                                      <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                  </asp:DropDownList></td>
                                          </tr>
                                      </table>
                                  </td>
                              </tr>
                              <tr>
                                  <td colspan="4" style="text-align: center">
                                      &nbsp;&nbsp;
                                      <table width="100%">
                                          <tr>
                                              <td style="width: 213px">
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
                      </td>
                      <td style="width: 254px">
                          &nbsp;</td>
                      <td style="width: 242px">
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 719px; height: 20px;">
                          &nbsp;<asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt"
                              ForeColor="Red"></asp:Label></td>
                      <td style="width: 254px; height: 20px;">
                          </td>
                      <td style="width: 242px; height: 20px;">
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 719px; height: 16px">
                          <asp:TextBox ID="txthidden" runat="server" Visible="False"></asp:TextBox></td>
                      <td style="width: 254px; height: 16px">
                      </td>
                      <td style="width: 242px; height: 16px">
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 719px">
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

