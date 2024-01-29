<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/SFA.master" CodeFile="modifyemp.aspx.vb" Inherits="modifyemp" %>

<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>

<%--<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls"
    TagPrefix="BDP" %>
--%>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
<script language ="javascript" src="jsFiles/MainJSValidate.js" type ="text/javascript" ></script>
<script language="javascript" type ="text/javascript" >
function validateOk()
{
        if(validateDropDown(document.getElementById('ctl00_ContentPlaceHolder2_drpemp'),'Select Employee'))
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

<div id="main" style="position:absolute; width:950px; left: 9px; top: 77px; ">

<table cellpadding="0" cellspacing="0" border="0" style="width: 104%">
	<tr>
	<td style="width: 1198px">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td style="height: 20px"><img src="../softimages/head_c_l.jpg" height="21" style="width: 11px" /></td>
        <td background="../softimages/head_cen_bg.jpg" class="Title21" style="width:235px; height: 20px;">
            <span style="font-size: 11pt; font-family: Verdana">Modify Employee Master</span></td>
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
      <td style="width: 3px" background="../softimages/l_bor1.gif"></td>
          <td colspan="3" style="height: 1px; width: 984px;"><asp:MultiView ID="MultiView1" runat="server">
              <asp:View ID="View1" runat="server">
                  <table style="height: 25px; width: 468px;" border="0">
                      <tr >
                          <td style="width: 183px; text-align: left">
                              <span style="font-size: 10pt; font-family: Verdana"><strong>Select Employee Name</strong></span></td>
                          <td style="text-align: left">
                              <asp:DropDownList ID="drpemp" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource1"
                                  DataTextField="emp_name" DataValueField="emp_name" Font-Bold="True" ForeColor="#006699"
                                  Width="178px">
                                  <asp:ListItem>-Select-</asp:ListItem>
                              </asp:DropDownList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conMM %>"
                                  SelectCommand="SELECT [emp_name], [emp_id] FROM [employee_master] WHERE ([loc_id] = @loc_id)">
                                  <SelectParameters>
                                      <asp:SessionParameter Name="loc_id" SessionField="LocID" Type="String" />
                                  </SelectParameters>
                              </asp:SqlDataSource>
                              &nbsp;</td>
                      </tr>
                      <tr>
                          <td colspan="2" style="height: 48px; text-align: left">
                              <table>
                                  <tr>
                                      <td style="width: 226px; height: 20px">
                                      </td>
                                      <td style="width: 357px; height: 20px">
                                          &nbsp;<asp:ImageButton ID="imbEdit" runat="server" ImageUrl="../softimages/edit_bt.gif"
                                              OnClientClick="return validateOk();" /></td>
                                  </tr>
                              </table>
                          </td>
                      </tr>
                  </table>
              </asp:View>
              <asp:View ID="View2" runat="server">
                  <table border="0" style="width: 463px; height: 5px; text-align: left">
                      <tr>
                          <td style="width: 271px; height: 9px">
                              <span style="font-size: 10pt; font-family: Verdana"><strong>Name</strong></span></td>
                          <td colspan="3" style="width: 350px; height: 9px">
                              <asp:TextBox ID="txtname" runat="server" Font-Bold="True" ForeColor="#006699" Height="17px"
                                  Width="278px"></asp:TextBox>
                          </td>
                      </tr>
                      <tr>
                          <td style="width: 271px; height: 9px">
                              <span style="font-size: 10pt; font-family: Verdana"><strong>Date Of Birth</strong></span></td>
                          <td colspan="3" style="width: 350px; height: 9px">
                              <cc1:GMDatePicker ID="empDOB" runat="server">
                              </cc1:GMDatePicker>
                              <strong><span style="font-size: 10pt; font-family: Verdana"></span></strong>
                          </td>
                      </tr>
                      <tr style="font-weight: bold; font-size: 10pt; font-family: Verdana">
                          <td style="width: 271px; height: 6px; text-align: left">
                              <span>Address</span></td>
                          <td colspan="3" style="width: 350px; height: 6px">
                              <asp:TextBox ID="txtaddr" runat="server" Columns="3" Font-Bold="True" Font-Names="Verdana"
                                  Font-Size="10pt" ForeColor="#006699" Height="49px" Rows="3" TextMode="MultiLine"
                                  Width="231px"></asp:TextBox></td>
                      </tr>
                      <tr>
                          <td style="width: 271px; height: 5px">
                              <span style="font-size: 10pt; font-family: Verdana"><strong>Phone Number</strong></span></td>
                          <td colspan="3" style="width: 350px; height: 5px">
                              <asp:TextBox ID="txtphone" runat="server" Font-Bold="True" ForeColor="#006699" Width="231px"></asp:TextBox></td>
                      </tr>
                      <tr>
                          <td style="width: 271px; height: 7px">
                              <span style="font-size: 8pt; font-family: Tahoma"><strong>Email</strong></span></td>
                          <td colspan="3" style="font-size: 8pt; width: 350px; font-family: Tahoma; height: 7px">
                              <asp:TextBox ID="txtemail" runat="server" Font-Bold="True" ForeColor="#006699" Width="231px"></asp:TextBox></td>
                      </tr>
                      <tr style="font-size: 8pt; font-family: Tahoma">
                          <td style="width: 271px; height: 7px">
                              <span style="font-size: 10pt; font-family: Verdana"><strong>Designation</strong></span></td>
                          <td colspan="3" style="width: 350px; height: 7px">
                              <asp:TextBox ID="txtdesig" runat="server" Font-Bold="True" ForeColor="#006699" Width="231px"></asp:TextBox>
                          </td>
                      </tr>
                      <tr>
                          <td style="width: 271px; height: 7px">
                              <span style="font-size: 10pt; font-family: Verdana"><strong>Remarks</strong></span></td>
                          <td colspan="3" style="width: 350px; height: 7px">
                              <asp:TextBox ID="txtremarks" runat="server" Font-Bold="True" Font-Names="Verdana"
                                  Font-Size="10pt" ForeColor="#006699" Height="39px" TextMode="MultiLine" Width="231px"></asp:TextBox></td>
                      </tr>
                      <tr>
                          <td colspan="4" style="height: 48px">
                              <table>
                                  <tr>
                                      <td style="width: 135px; height: 20px">
                                      </td>
                                      <td style="width: 357px; height: 20px">
                                          &nbsp;<asp:ImageButton ID="imbSave" runat="server" ImageUrl="../softimages/save.gif" OnClientClick="return validateInput();" /></td>
                                  </tr>
                              </table>
                          </td>
                      </tr>
                  </table>
              </asp:View>
          </asp:MultiView></td>
          <td background="../softimages/low_bor3.gif" style="width: 17px"></td>
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