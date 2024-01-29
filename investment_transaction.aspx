<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/SFA.master" CodeFile="investment_transaction.aspx.vb" Inherits="investment_transaction" %>

<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls"
    TagPrefix="BDP" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
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
function ModeOfPay()
{
    if(document.getElementById('ctl00_ContentPlaceHolder2_drpmode').selectedIndex == 1)
    {
        return true;
    }
    else
    {
       if(validateEmpty(document.getElementById('ctl00_ContentPlaceHolder2_txtchno'),'Enter Cheque Nos','Invalid text in Cheque Nos'))
       {
       if(validateEmpty(document.getElementById('ctl00_ContentPlaceHolder2_txtbank'),'Enter Bank','Invalid text in Bank'))
       {
       if(validateEmpty(document.getElementById('ctl00_ContentPlaceHolder2_txtbranch'),'Enter Branch','Invalid text in Branch'))
       {

            return true;
       }}}
    }
}

function validateInput()
{
    if(validateDropDown(document.getElementById('ctl00_ContentPlaceHolder2_drpname'),'Select Customer Name'))
    {
    if(validateDropDown(document.getElementById('ctl00_ContentPlaceHolder2_drpscheme'),'Select Scheme'))
    {
    if(validateDropDown(document.getElementById('ctl00_ContentPlaceHolder2_drpmodel'),'Select Model'))
    {
    if(validateDropDown(document.getElementById('ctl00_ContentPlaceHolder2_drptenure'),'Select Tenure'))
    {
    if(isNotLetter(document.getElementById('ctl00_ContentPlaceHolder2_txtinstallment'),'Alphabet in Installment'))
    {
    if(isNotLetter(document.getElementById('ctl00_ContentPlaceHolder2_txtnetinc'),'Alphabet in Net Income'))
    {
    if(isNotLetter(document.getElementById('ctl00_ContentPlaceHolder2_txtamt'),'Alphabet in Amount'))
    {
    if(isNotLetter(document.getElementById('ctl00_ContentPlaceHolder2_txtdisc'),'Alphabet in Discount'))
    {
    if(isNotLetter(document.getElementById('ctl00_ContentPlaceHolder2_txtdownpay'),'Alphabet in Down Payment'))
    {
    if(validateDropDown(document.getElementById('ctl00_ContentPlaceHolder2_drpmode'),'Select Mode'))
    {
    if(ModeOfPay() == true)
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
    return false;
}
</script>

<div id="main" style="position:absolute; width:950px; left: 9px; top: 77px; ">

<table cellpadding="0" cellspacing="0" border="0" style="width: 104%">
	<tr>
	<td style="width: 1131px">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td style="height: 20px"><img src="../softimages/head_c_l.jpg" height="21" style="width: 11px" /></td>
        <td background="../softimages/head_cen_bg.jpg" class="Title21" style="width:235px; height: 20px;">
            <span style="font-size: 11pt; font-family: Verdana">Investment Transaction</span></td>
        <td style="height: 20px; width: 845px;"><img src="../softimages/head_c_r.jpg" width="13" height="21" /></td>
      </tr>
    </table>
	</td>
	</tr>
	<tr>
	<td style="height: 30px; width: 1131px;">
	<table  border="0" cellspacing="0" cellpadding="0" style="width: 100%" class="td_bg_1">
    
    
    
        <tr>
                          <td style="width: 3px; height: 5px;"><img src="../softimages/low_curve21.jpg" /></td>
                          <td colspan="3" background="../softimages/low_bor2.gif" style="height: 5px; width: 1px;">
                              
                              </td>
                          <td style="width: 17px; height: 5px;"><img src="../softimages/low_curve3.gif" /></td>
      </tr>
      <tr>
      <td style="width: 3px; height: 1px;" background="../softimages/l_bor1.gif"></td>
          <td colspan="3" style="height: 1px; width: 1px;">
              <table width="100%">
                  <tr>
                      <td style="width: 891px">
                          <table width="100%">
                              <tr>
                                  <td colspan="2" style="color: #ffccff; font-family: Verdana; height: 20px; background-color: #cc6666">
                                      <strong>Personal Details</strong></td>
                              </tr>
                              <tr>
                                  <td style="width: 240px;">
                                      <span style="font-size: 8pt"><span style="font-family: Verdana"><strong>N<span>ame</span></strong></span></span></td>
                                  <td style="width: 169px;">
                                                  <asp:DropDownList ID="drpname" runat="server" AppendDataBoundItems="True" AutoPostBack="True"
                                                      DataSourceID="SqlDataSource1" DataTextField="cust_name" DataValueField="cust_name"
                                                      Font-Bold="False" Font-Names="Verdana" Font-Size="8pt" ForeColor="#006699" Height="20px"
                                                      Width="175px">
                                                      <asp:ListItem>-Select Customer-</asp:ListItem>
                                                  </asp:DropDownList></td>
                              </tr>
                              <tr>
                                  <td style="width: 240px;">
                                      <strong><span style="font-size: 8pt; font-family: Verdana">Address</span></strong></td>
                                  <td style="width: 169px;">
                                                  <asp:TextBox ID="txtaddr" runat="server" AutoPostBack="True" Enabled="False" Font-Bold="True"
                                                      Font-Names="Verdana" Font-Size="8pt" ForeColor="#006699" Height="33px" Rows="2"
                                                      TextMode="MultiLine" Width="227px"></asp:TextBox><strong><span style="font-size: 8pt;
                                                          font-family: Tahoma"></span></strong><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conMM %>"
                                          SelectCommand="SELECT [cust_name] FROM [customer_master] WHERE ([loc_id] = @loc_id)">
                                          <SelectParameters>
                                              <asp:ControlParameter ControlID="lblId" Name="loc_id" PropertyName="Text" Type="String" />
                                          </SelectParameters>
                                      </asp:SqlDataSource>
                                      <span style="font-size: 8pt; font-family: Verdana"><strong></strong></span>
                                  </td>
                              </tr>
                              <tr style="font-weight: bold; font-size: 8pt; font-family: Verdana">
                                  <td colspan="2" style="color: #ffccff; font-family: Verdana; height: 20px; background-color: #cc6666">
                                      Scheme Detail<span style="font-size: 8pt">s</span></td>
                              </tr>
                              <tr style="font-size: 8pt">
                                  <td style="width: 240px;">
                                      <strong><span style="font-family: Tahoma"><span style="font-family: Verdana">S</span>cheme</span></strong></td>
                                  <td style="width: 169px; font-family: Tahoma;">
                                                  <asp:DropDownList ID="drpscheme" runat="server" DataSourceID="SqlDataSource2" DataTextField="scheme_name"
                                                      DataValueField="scheme_name" Font-Bold="False" Font-Names="Verdana" Font-Size="8pt"
                                                      ForeColor="#006699" Width="175px" Height="20px" AppendDataBoundItems="True">
                                                      <asp:ListItem>-Select-</asp:ListItem>
                                                  </asp:DropDownList></td>
                              </tr>
                              <tr>
                                  <td style="width: 240px;">
                                      <span style="font-size: 8pt; font-family: Verdana"><strong>Car Model</strong></span></td>
                                  <td style="width: 169px;">
                                                  <asp:DropDownList ID="drpmodel" runat="server" DataSourceID="SqlDataSource3" DataTextField="model_name"
                                                      DataValueField="model_name" Font-Bold="False" Font-Names="Verdana" Font-Size="8pt"
                                                      ForeColor="#006699" Width="175px" Height="20px" AppendDataBoundItems="True">
                                                      <asp:ListItem>-Select-</asp:ListItem>
                                                  </asp:DropDownList></td>
                              </tr>
                              <tr>
                                  <td style="height: 6px; width: 240px;">
                                      <span style="font-size: 8pt; font-family: Tahoma"><strong>Agreement Date</strong></span></td>
                                  <td style="height: 6px; font-size: 8pt; width: 169px; font-family: Tahoma;">
                                      <cc1:GMDatePicker ID="agreeDate" runat="server" DisplayMode="Label" MaxDate="2020-12-31"
                                          MinDate="1950-01-01" YearDropDownRange="100">
                                      </cc1:GMDatePicker>
                                      <span style="font-family: Verdana">
                                      <strong><span></span></strong></span>
                                  </td>
                              </tr>
                              <tr style="font-weight: bold; font-size: 8pt; font-family: Verdana">
                                  <td style="width: 240px">
                                      <span>Due Date</span></td>
                                  <td style="width: 169px">
                                      <cc1:GMDatePicker ID="dueDate" runat="server" DisplayMode="Label" MaxDate="2020-12-31"
                                          MinDate="1950-01-01" YearDropDownRange="100">
                                      </cc1:GMDatePicker>
                                      <span style="font-family: Verdana"><span style="font-size: 8pt">
                                      <span></span></span>
                                      </span>
                                  </td>
                              </tr>
                              <tr style="font-size: 8pt; font-family: Verdana">
                                  <td style="height: 26px; width: 240px;">
                                      <span><strong>Scheme Tenure</strong></span></td>
                                  <td style="height: 26px; width: 169px;">
                                                  <span style="font-family: Tahoma"><asp:DropDownList ID="drptenure" runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="8pt"
                                                      ForeColor="#006699" Width="76px" Height="20px" AppendDataBoundItems="True">
                                                      <asp:ListItem>-Select-</asp:ListItem>
                                                      <asp:ListItem>6</asp:ListItem>
                                                      <asp:ListItem>12</asp:ListItem>
                                                      <asp:ListItem>24</asp:ListItem>
                                                      <asp:ListItem>36</asp:ListItem>
                                                      <asp:ListItem>60</asp:ListItem>
                                                      <asp:ListItem></asp:ListItem>
                                                  </asp:DropDownList>months</span></td>
                              </tr>
                              <tr style="font-family: Tahoma">
                                  <td style="width: 240px">
                                      <span style="font-size: 8pt; font-family: Verdana"><strong>Installment</strong></span></td>
                                  <td style="width: 169px">
                                                  <asp:TextBox ID="txtinstallment" runat="server" Font-Bold="False" Font-Names="Verdana"
                                                      Font-Size="8pt" ForeColor="#006699" Width="175px" Height="17px"></asp:TextBox></td>
                              </tr>
                              <tr>
                                  <td style="width: 240px;">
                                      <strong><span style="font-size: 8pt; font-family: Verdana">Net Income</span></strong></td>
                                  <td style="width: 169px;">
                                                  <asp:TextBox ID="txtnetinc" runat="server" Font-Bold="False" Font-Names="Verdana"
                                                      Font-Size="8pt" ForeColor="#006699" Height="17px" Width="175px"></asp:TextBox><asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:conMM %>"
                                          SelectCommand="SELECT [scheme_name] FROM [scheme_master] ORDER BY [scheme_id]"></asp:SqlDataSource>
                                      <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:conMM %>"
                                          SelectCommand="SELECT [model_name] FROM [model_master] ORDER BY [model_id]"></asp:SqlDataSource>
                                  </td>
                              </tr>
                              <tr>
                                  <td colspan="2" style="color: #ffccff; font-family: Verdana; height: 18px; background-color: #cc6666">
                                      <strong>Down Payment Details</strong></td>
                              </tr>
                              <tr>
                                  <td style="width: 240px">
                                      <strong><span style="font-size: 8pt; font-family: Verdana">Down Payment</span></strong></td>
                                  <td style="width: 169px">
                                                  <asp:TextBox ID="txtamt" runat="server" Font-Bold="False"  Font-Names="Verdana" Font-Size="8pt"
                                                      ForeColor="#006699" Width="175px" Height="17px" AutoPostBack="True">0</asp:TextBox></td>
                              </tr>
                              <tr>
                                  <td style="width: 240px">
                                      <strong><span style="font-size: 8pt; font-family: Verdana">Discount</span></strong></td>
                                  <td style="width: 169px">
                                                  <asp:TextBox ID="txtdisc" runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="8pt"
                                                      ForeColor="#006699" Width="175px" Height="17px" AutoPostBack="True"></asp:TextBox></td>
                              </tr>
                              <tr>
                                  <td style="width: 240px; height: 13px;">
                                      <strong><span style="font-size: 8pt; font-family: Verdana">Net Down Payment</span></strong></td>
                                  <td style="width: 169px; height: 13px;">
                                                  <asp:TextBox ID="txtdownpay" runat="server" Font-Bold="False" Font-Names="Verdana"
                                                      Font-Size="8pt" ForeColor="#006699" Height="17px" Width="175px" Enabled="False"></asp:TextBox></td>
                              </tr>
                              <tr>
                                  <td style="width: 240px;">
                                      <strong><span style="font-size: 8pt; font-family: Verdana">Payment Mode</span></strong></td>
                                  <td style="width: 169px;">
                                                  <asp:DropDownList ID="drpmode" runat="server" AppendDataBoundItems="True" AutoPostBack="True"
                                                      Font-Bold="False" Font-Names="Verdana" Font-Size="8pt" ForeColor="#006699" Width="175px" Height="20px">
                                                      <asp:ListItem>-Select-</asp:ListItem>
                                                      <asp:ListItem>Cash</asp:ListItem>
                                                      <asp:ListItem>Cheque</asp:ListItem>
                                                  </asp:DropDownList></td>
                              </tr>
                              <tr>
                                  <td style="width: 240px">
                                      <strong><span style="font-size: 8pt; font-family: Verdana">Payment Date</span></strong></td>
                                  <td style="width: 169px">
                                      &nbsp;<cc1:GMDatePicker ID="payDate" runat="server" DisplayMode="Label" MaxDate="2020-12-31"
                                          MinDate="1950-01-01" YearDropDownRange="100">
                                      </cc1:GMDatePicker>
                                  </td>
                              </tr>
                              <tr>
                                  <td colspan="2" style="color: #ffccff; font-family: Verdana; height: 14px; background-color: #cc6666">
                                      <strong>Cheque Details</strong></td>
                              </tr>
                              <tr>
                                  <td style="width: 240px">
                                      <strong><span style="font-size: 8pt; font-family: Verdana">Cheque Number</span></strong></td>
                                  <td style="width: 169px">
                                                      <asp:TextBox ID="txtchno" runat="server" Font-Names="Verdana" Font-Size="8pt" ForeColor="#006699"
                                                          Width="175px" Font-Bold="False" Height="17px"></asp:TextBox></td>
                              </tr>
                              <tr>
                                  <td style="width: 240px">
                                      <strong><span style="font-size: 8pt; font-family: Verdana">Cheque Date</span></strong></td>
                                  <td style="width: 169px">
                                      &nbsp;<cc1:GMDatePicker ID="chqDate" runat="server" DisplayMode="Label" MaxDate="2020-12-31"
                                          MinDate="1950-01-01" YearDropDownRange="100">
                                      </cc1:GMDatePicker>
                                  </td>
                              </tr>
                              <tr>
                                  <td style="width: 240px">
                                      <strong><span style="font-size: 8pt; font-family: Verdana">Bank</span></strong></td>
                                  <td style="width: 169px">
                                                      <asp:TextBox ID="txtbank" runat="server" Font-Names="Verdana" Font-Size="8pt" ForeColor="#006699" Font-Bold="False" Height="17px" Width="175px"></asp:TextBox></td>
                              </tr>
                              <tr>
                                  <td style="width: 240px; height: 27px;">
                                      <strong><span style="font-size: 8pt; font-family: Verdana">Branch</span></strong></td>
                                  <td style="width: 169px; height: 27px;">
                                                      <asp:TextBox ID="txtbranch" runat="server" Font-Names="Verdana" Font-Size="8pt"
                                                          ForeColor="#006699" Font-Bold="False" Height="17px" Width="175px"></asp:TextBox></td>
                              </tr>
                              <tr>
                                  <td style="height: 22px;" colspan="2">
                                      <table width="100%">
                                          <tr>
                                              <td style="width: 113px; height: 20px">
                                              </td>
                                              <td style="width: 180px; height: 20px">
                                                  <asp:ImageButton ID="imbSave" runat="server" ImageUrl="../softimages/save.gif" OnClientClick="return validateInput();" /></td>
                                          </tr>
                                      </table>
                                  </td>
                              </tr>
                          </table>
                      </td>
                      <td style="width: 100849px">
                      </td>
                      <td style="width: 134217727px">
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 891px">
                      </td>
                      <td style="width: 100849px">
                      </td>
                      <td style="width: 134217727px">
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 891px">
                      </td>
                      <td style="width: 100849px">
                      </td>
                      <td style="width: 134217727px">
                      </td>
                  </tr>
              </table>
                                      <asp:Label ID="lblId" runat="server" Font-Names="Verdana" Font-Size="8pt" ForeColor="#006699" Visible="False"></asp:Label></td>
          <td background="../softimages/low_bor3.gif" style="width: 17px; height: 1px;"></td>
      </tr>
      
      <tr>
          <td style="width: 3px;"><img src="../softimages/low_curve1.gif" /></td>
          <td colspan="3" background="../softimages/low_bor4.gif" style="width: 1px;"></td>
          <td style="width: 17px;"><img src="../softimages/low_curve4.gif" /></td>
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
