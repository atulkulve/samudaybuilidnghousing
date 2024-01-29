<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/SFA.master" CodeFile="calldetails.aspx.vb" Inherits="calldetails" %>

<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>

<%--<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls"
    TagPrefix="BDP" %>
--%>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
<script language ="javascript" src="jsFiles/MainJSValidate.js" type ="text/javascript" ></script>
<script language="javascript" type ="text/javascript" >
function validateInput()
{
    
    if(validateDropDown(document.getElementById('ctl00_ContentPlaceHolder2_drpcust'),'Select Customer'))
    {
    if(validateDropDown(document.getElementById('ctl00_ContentPlaceHolder2_drpemp'),'Select Employee'))
    {
    if(validateEmpty(document.getElementById('ctl00_ContentPlaceHolder2_txtdetails'),'Enter Details','Invalid text in Details'))
    {

        return true;
    }
    }
    }
    
    return false;
}
</script>

<div id="main" style="position:absolute; width:950px; left: 9px; top: 77px; ">

<table cellpadding="0" cellspacing="0" border="0" style="width: 104%">
	<tr>
	<td style="width: 979px">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td style="height: 20px"><img src="../softimages/head_c_l.jpg" height="21" style="width: 11px" /></td>
        <td background="../softimages/head_cen_bg.jpg" class="Title21" style="width:235px; height: 20px;">
            <span style="font-size: 11pt; font-family: Verdana">Call Register</span></td>
        <td style="height: 20px; width: 845px;"><img src="../softimages/head_c_r.jpg" width="13" height="21" /></td>
      </tr>
    </table>
	</td>
	</tr>
	<tr>
	<td style="width: 979px;">
	<table  border="0" cellspacing="0" cellpadding="0" style="width: 100%" class="td_bg_1">
    
    
    
        <tr>
                          <td style="width: 3px; height: 5px;"><img src="../softimages/low_curve21.jpg" /></td>
                          <td colspan="3" background="../softimages/low_bor2.gif" style="height: 5px; width: 984px;">
                              
                              </td>
                          <td style="width: 17px; height: 5px;"><img src="../softimages/low_curve3.gif" /></td>
      </tr>
      <tr>
      <td style="width: 3px" background="../softimages/l_bor1.gif"></td>
          <td colspan="3" style="width: 984px;"><table>
              <tr style="font-weight: bold; font-size: 8pt" >
                  <td style="width: 567px;">
                      <table border="0" style="width: 587px; height: 127px">
                          <tbody>
                              <tr>
                                  <td style="width: 176px; text-align: left">
                                      <span><span style="font-family: Verdana"><span style="font-size: 8pt">C<span><span><span>ustomer Nam</span>e</span></span></span></span></span></td>
                                  <td style="font-size: 8pt; width: 350px; text-align: left">
                                      <span style="font-size: 10pt; font-family: Verdana"><asp:DropDownList ID="drpcust" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource2"
                                          DataTextField="cust_name" DataValueField="cust_name" Font-Bold="True" ForeColor="#006699"
                                          Width="178px">
                                          <asp:ListItem>-Select-</asp:ListItem>
                                      </asp:DropDownList></span></td>
                              </tr>
                              <tr style="font-weight: bold; font-size: 10pt; font-family: Verdana">
                                  <td style="width: 176px; text-align: left">
                                      <span style="font-size: 8pt;">Call Date</span></td>
                                  <td style="font-size: 8pt; width: 350px; font-family: Tahoma; text-align: left">
                                      <cc1:GMDatePicker ID="callDate" runat="server" DisplayMode="Label" MaxDate="2020-12-31"
                                          MinDate="1950-01-01" YearDropDownRange="100">
                                      </cc1:GMDatePicker>
                                  </td>
                              </tr>
                              <tr style="font-size: 10pt">
                                  <td style="width: 176px; text-align: left">
                                      <span style="font-family: Verdana">Called By</span></td>
                                  <td style="width: 350px; text-align: left">
                                      <asp:DropDownList ID="drpemp" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource1"
                                          DataTextField="emp_name" DataValueField="emp_name" Font-Bold="True" ForeColor="#006699"
                                          Width="178px">
                                          <asp:ListItem>-Select-</asp:ListItem>
                                      </asp:DropDownList></td>
                              </tr>
                              <tr>
                                  <td style="width: 176px; text-align: left">
                                      <span style="font-size: 8pt; font-family: Verdana">Call Details</span></td>
                                  <td style="width: 350px; text-align: left">
                                      <asp:TextBox ID="txtdetails" runat="server" Font-Bold="True" Font-Names="Verdana"
                                          Font-Size="10pt" ForeColor="#006699" Height="53px" Rows="3" TextMode="MultiLine"
                                          Width="186px"></asp:TextBox></td>
                              </tr>
                              <tr>
                                  <td style="width: 176px; text-align: left">
                                      <span style="font-size: 8pt; font-family: Verdana">Next Call Date</span></td>
                                  <td style="width: 350px; text-align: left">
                                      <cc1:GMDatePicker ID="nextcallDate" runat="server" DisplayMode="Label" MaxDate="2020-12-31"
                                          MinDate="1950-01-01" YearDropDownRange="100">
                                      </cc1:GMDatePicker>
                                  </td>
                              </tr>
                              <tr>
                                  <td colspan="2">
                                      <table>
                                          <tbody>
                                              <tr>
                                                  <td style="width: 163px">
                                                  </td>
                                                  <td style="width: 390px">
                                                      &nbsp;<asp:ImageButton ID="imbSave" runat="server" ImageUrl="../softimages/save.gif" OnClientClick="return validateInput();" /></td>
                                              </tr>
                                          </tbody>
                                      </table>
                                  </td>
                              </tr>
                          </tbody>
                      </table>
                  </td>
                  <td style="width: 170px;">
                  </td>
              </tr>
              <tr>
                  <td style="width: 567px">
                      <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:conMM %>"
                          SelectCommand="SELECT [cust_name] FROM [customer_master] WHERE ([loc_id] = @loc_id) ORDER BY [cust_id]">
                          <SelectParameters>
                              <asp:ControlParameter ControlID="lblId" Name="loc_id" PropertyName="Text" Type="String" />
                          </SelectParameters>
                      </asp:SqlDataSource>
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conMM %>"
                          SelectCommand="SELECT [emp_name], [emp_id] FROM [employee_master] WHERE ([loc_id] = @loc_id)">
                          <SelectParameters>
                              <asp:SessionParameter Name="loc_id" SessionField="LocID" Type="String" />
                          </SelectParameters>
                      </asp:SqlDataSource>
                      &nbsp;
                      <asp:Label Font-Names="Verdana" Font-Size="8pt" Font-Underline="False" ForeColor="#006699" ID="lblId" runat="server" Visible="False" /><asp:LinkButton Font-Names="Verdana" Font-Size="10pt" Height="11px" ID="LinkButton1" runat="server" Visible="False" Width="59px">Logout</asp:LinkButton>
                  </td>
                  <td style="width: 170px">
                  </td>
              </tr>
          </table>
          </td>
          <td background="../softimages/low_bor3.gif" style="width: 17px"></td>
      </tr>
      
      <tr>
          <td style="height: 3px; width: 3px;"><img src="../softimages/low_curve1.gif" /></td>
          <td colspan="3" background="../softimages/low_bor4.gif" style="height: 3px; width: 984px;"></td>
          <td style="width: 17px; height: 3px;"><img src="../softimages/low_curve4.gif" /></td>
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
