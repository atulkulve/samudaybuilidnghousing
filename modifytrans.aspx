<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/SFA.master" CodeFile="modifytrans.aspx.vb" Inherits="modifytrans" %>

<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>

<%@ Register Assembly="BasicFrame.WebControls.BasicDatePicker" Namespace="BasicFrame.WebControls"
    TagPrefix="BDP" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
<script language ="javascript" src="jsFiles/MainJSValidate.js" type ="text/javascript" ></script>
<script language="javascript" type ="text/javascript" >
function validateOk()
{
        if(validateDropDown(document.getElementById('ctl00_ContentPlaceHolder2_drpname'),'Select Customer Name'))
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
    if(validateDropDown(document.getElementById('ctl00_ContentPlaceHolder2_drpscheme'),'Select Scheme'))
    {
    if(validateDropDown(document.getElementById('ctl00_ContentPlaceHolder2_drpmodel'),'Select Model'))
    {
    if(isNotLetter(document.getElementById('ctl00_ContentPlaceHolder2_txttenure'),'Alphabet in Tenure'))
    {
    if(isNotLetter(document.getElementById('ctl00_ContentPlaceHolder2_txtdownpay'),'Alphabet in Down Payment'))
    {
    if(isNotLetter(document.getElementById('ctl00_ContentPlaceHolder2_txtinstallment'),'Alphabet in Installment'))
    {
    if(isNotLetter(document.getElementById('ctl00_ContentPlaceHolder2_txtdisc'),'Alphabet in Discount'))
    {
    if(isNotLetter(document.getElementById('ctl00_ContentPlaceHolder2_txtnetinc'),'Alphabet in Net Income'))
    {
    if(isNotLetter(document.getElementById('ctl00_ContentPlaceHolder2_txtamt'),'Alphabet in Amount'))
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
        <td background="../softimages/head_cen_bg.jpg" class="Title21" style="width:314px; height: 20px;">
            <span style="font-size: 11pt; font-family: Verdana">Modify Investment Transaction</span></td>
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
          <td colspan="3" style="height: 1px; width: 984px;">
              <table border="0" cellpadding="0" cellspacing="0" class="td_bg_1" style="width: 100%">
                  <tr>
                      <td colspan="3" style="width: 1px; height: 1px"><asp:MultiView ID="MultiView1" runat="server">
                          <asp:View ID="View1" runat="server">
                              &nbsp;<table style="width: 680px; height: 50px; font-size: 12pt; text-align: center;" border="0">
                                  <tr style="color: #000000;">
                                      <td style="width: 361px; height: 3px" align="left">
                                          <span style="font-size: 8pt; font-family: Verdana;"><strong >N<span>ame</span></strong></span><span style="font-size: 8pt; font-family: Verdana;"><span ><span style="color: #ff0000"></span>
                                                  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
                                              </span></span>
                                      </td>
                                      <td style="font-size: 12pt; width: 1009px; font-family: Times New Roman; height: 3px;" align="left">
                                          <asp:DropDownList AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="cust_name" DataValueField="cust_name" Font-Bold="True" Font-Names="Verdana" Font-Size="10pt" ForeColor="#006699" Height="20px" ID="drpname" runat="server" Width="200px">
                                              <asp:ListItem>-Select Customer-</asp:ListItem>
                                          </asp:DropDownList></td>
                                  </tr>
                                  <tr style="font-size: 12pt; color: #000000; font-family: Times New Roman">
                                      <td align="left" style="width: 361px; height: 7px">
                                          <span style="font-size: 8pt; font-family: Verdana"><strong>Transaction Numbe</strong>r</span></td>
                                      <td align="left" style="font-size: 12pt; width: 1009px; color: #000000; font-family: Times New Roman;
                                          height: 7px">
                                          <asp:DropDownList ID="drptrans" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4"
                                              DataTextField="it_id" DataValueField="it_id" Font-Bold="True" Font-Names="Verdana"
                                              Font-Size="10pt" ForeColor="#006699" Height="20px" Width="200px">
                                          </asp:DropDownList></td>
                                  </tr>
                                  <tr style="font-size: 12pt; color: #000000; font-family: Times New Roman">
                                      <td align="left" style="width: 361px; height: 14px">
                                          <span style="font-size: 8pt; font-family: Verdana"><strong>Address </strong></span>
                                      </td>
                                      <td align="left" style="font-size: 12pt; width: 1009px; color: #000000; font-family: Times New Roman;
                                          height: 14px">
                                          <asp:TextBox ID="txtaddr" runat="server" AutoPostBack="True" Enabled="False" Font-Bold="True"
                                              Font-Names="Verdana" Font-Size="10pt" ForeColor="#006699" Height="50px" Rows="2"
                                              TextMode="MultiLine" Width="275px"></asp:TextBox></td>
                                  </tr>
                                  <tr style="font-size: 12pt; color: #000000; font-family: Times New Roman">
                                      <td align="left" colspan="2" style="height: 7px">
                                          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<asp:ImageButton
                                              ID="imbEdit" runat="server" ImageUrl="../softimages/edit_bt.gif" OnClientClick="return validateOk();" /></td>
                                  </tr>
                              </table>
                              &nbsp;
                              <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conMM %>"
                                  SelectCommand="SELECT [cust_name] FROM [customer_master] WHERE ([loc_id] = @loc_id)">
                                  <SelectParameters>
                                      <asp:ControlParameter ControlID="lblId" Name="loc_id" PropertyName="Text" Type="String" />
                                  </SelectParameters>
                              </asp:SqlDataSource>
                              <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:conMM %>"
                                  SelectCommand="SELECT [it_id] FROM [customertrans_view] WHERE ([cust_name] = @cust_name)">
                                  <SelectParameters>
                                      <asp:ControlParameter ControlID="drpname" Name="cust_name" PropertyName="SelectedValue"
                                          Type="String" />
                                  </SelectParameters>
                              </asp:SqlDataSource>
                          </asp:View>
                          <asp:View ID="View2" runat="server">
                              &nbsp;<table>
                                  <tr>
                                      <td style="width: 318px; height: 20px; text-align: right">
                                          <asp:Label ID="lblId" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt"
                                              ForeColor="#006699" Visible="False"></asp:Label></td>
                                      <td style="width: 445px; height: 20px">
                                      </td>
                                      <td style="width: 4348px; height: 20px">
                                      </td>
                                  </tr>
                                  <tr>
                                      <td style="width: 318px">
                                          <table border="0" style="width: 681px; height: 74px">
                                              <tr>
                                                  <td colspan="4" style="text-align: left">
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td style="width: 135px; height: 29px; text-align: left">
                                                      <span style="font-size: 8pt; font-family: Verdana"><strong>Scheme</strong></span></td>
                                                  <td style="font-size: 12pt; width: 104px; font-family: Times New Roman; height: 29px;
                                                      text-align: left">
                                                      <asp:DropDownList ID="drpscheme" runat="server" AppendDataBoundItems="True" Font-Bold="False"
                                                          Font-Names="Verdana" Font-Size="8pt" ForeColor="#006699" Height="20px" Width="175px">
                                                          <asp:ListItem>-Select-</asp:ListItem>
                                                      </asp:DropDownList></td>
                                                  <td style="font-size: 12pt; width: 115px; font-family: Times New Roman; height: 29px;
                                                      text-align: left">
                                                      <span style="font-size: 8pt; font-family: Verdana"><strong>Car Model</strong></span></td>
                                                  <td style="font-size: 12pt; width: 5px; font-family: Times New Roman; height: 29px;
                                                      text-align: left">
                                                      <asp:DropDownList ID="drpmodel" runat="server" AppendDataBoundItems="True" Font-Bold="False"
                                                          Font-Names="Verdana" Font-Size="8pt" ForeColor="#006699" Height="20px" Width="175px">
                                                          <asp:ListItem>-Select-</asp:ListItem>
                                                      </asp:DropDownList></td>
                                              </tr>
                                              <tr>
                                                  <td style="width: 135px; height: 28px; text-align: left">
                                                      <span style="font-size: 8pt; font-family: Verdana"><strong>Agreement Date</strong></span></td>
                                                  <td style="width: 104px; height: 28px; text-align: left">
                                                      &nbsp;<cc1:GMDatePicker ID="agreeDate" runat="server" DisplayMode="Label" MaxDate="2020-12-31"
                                                          MinDate="1950-01-01" YearDropDownRange="80">
                                                      </cc1:GMDatePicker>
                                                      <strong><span style="font-size: 8pt; font-family: Verdana"></span></strong>
                                                  </td>
                                                  <td style="font-weight: bold; font-size: 8pt; width: 115px; font-family: Verdana;
                                                      height: 28px; text-align: left">
                                                      <span>Scheme Tenure</span></td>
                                                  <td style="width: 5px; height: 28px; text-align: left">
                                                      <asp:TextBox ID="txttenure" runat="server" Font-Bold="False" Font-Names="Verdana"
                                                          Font-Size="8pt" ForeColor="#006699" Width="63px"></asp:TextBox><span style="font-size: 8pt;
                                                              font-family: Verdana"><strong>months</strong></span></td>
                                              </tr>
                                              <tr>
                                                  <td style="width: 135px; text-align: left">
                                                      <strong><span style="font-size: 8pt; font-family: Verdana">Due Date</span></strong></td>
                                                  <td style="width: 104px; text-align: left">
                                                      &nbsp;<cc1:GMDatePicker ID="dueDate" runat="server" DisplayMode="Label" MaxDate="2020-12-31"
                                                          MinDate="1950-01-01" YearDropDownRange="80">
                                                      </cc1:GMDatePicker>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td style="width: 135px; height: 28px; text-align: left">
                                                      <strong><span style="font-size: 8pt; font-family: Verdana">Down Payment</span></strong></td>
                                                  <td style="width: 104px; height: 28px; text-align: left">
                                                      <asp:TextBox ID="txtdownpay" runat="server" Font-Bold="False" Font-Names="Verdana"
                                                          Font-Size="8pt" ForeColor="#006699" Height="17px" Width="175px"></asp:TextBox></td>
                                                  <td style="width: 115px; height: 28px; text-align: left">
                                                      <strong><span style="font-size: 8pt; font-family: Verdana">Installment</span></strong></td>
                                                  <td style="width: 5px; height: 28px; text-align: left">
                                                      <asp:TextBox ID="txtinstallment" runat="server" Font-Bold="False" Font-Names="Verdana"
                                                          Font-Size="8pt" ForeColor="#006699" Height="17px" Width="175px"></asp:TextBox></td>
                                              </tr>
                                              <tr>
                                                  <td style="width: 135px; text-align: left">
                                                      <strong><span style="font-size: 8pt; font-family: Verdana">Net Income</span></strong></td>
                                                  <td style="width: 104px; text-align: left">
                                                      <asp:TextBox ID="txtnetinc" runat="server" Font-Bold="False" Font-Names="Verdana"
                                                          Font-Size="8pt" ForeColor="#006699" Height="17px" Width="175px"></asp:TextBox></td>
                                                  <td style="width: 115px; text-align: left">
                                                      <strong><span style="font-size: 8pt; font-family: Verdana">Discount</span></strong></td>
                                                  <td style="width: 5px; text-align: left">
                                                      <asp:TextBox ID="txtdisc" runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="8pt"
                                                          ForeColor="#006699" Height="17px" Width="175px"></asp:TextBox></td>
                                              </tr>
                                          </table>
                                      </td>
                                      <td style="width: 445px">
                                      </td>
                                      <td style="width: 4348px">
                                      </td>
                                  </tr>
                                  <tr>
                                      <td style="width: 318px">
                                          <table border="0" style="width: 685px; height: 74px; text-align: center">
                                              <tr>
                                                  <td style="width: 98px; height: 28px; text-align: left">
                                                      <span style="font-size: 8pt; font-family: Verdana"><strong>Amount</strong></span></td>
                                                  <td style="width: 85px; height: 28px; text-align: left">
                                                      <asp:TextBox ID="txtamt" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="10pt"
                                                          ForeColor="#006699" Height="17px" Width="175px"></asp:TextBox></td>
                                              </tr>
                                              <tr>
                                                  <td style="width: 98px; height: 4px; text-align: left">
                                                      <span style="font-size: 8pt; font-family: Verdana"><strong>Payment Mode</strong></span></td>
                                                  <td style="width: 85px; height: 4px; text-align: left">
                                                      <asp:DropDownList ID="drpmode" runat="server" AppendDataBoundItems="True" AutoPostBack="True"
                                                          Font-Bold="False" Font-Names="Verdana" Font-Size="8pt" ForeColor="#006699" Height="20px"
                                                          Width="175px">
                                                          <asp:ListItem>-Select-</asp:ListItem>
                                                          <asp:ListItem>Cash</asp:ListItem>
                                                          <asp:ListItem>Cheque</asp:ListItem>
                                                      </asp:DropDownList></td>
                                              </tr>
                                              <tr>
                                                  <td style="width: 98px; text-align: left">
                                                      <span style="font-size: 8pt; font-family: Verdana"><strong>Payment Date</strong></span></td>
                                                  <td style="width: 85px; text-align: left">
                                                      &nbsp;<cc1:GMDatePicker ID="payDate" runat="server" DisplayMode="Label" MaxDate="2020-12-31"
                                                          MinDate="1950-01-01" YearDropDownRange="80">
                                                      </cc1:GMDatePicker>
                                                  </td>
                                              </tr>
                                          </table>
                                      </td>
                                      <td style="width: 445px">
                                      </td>
                                      <td style="width: 4348px">
                                      </td>
                                  </tr>
                                  <tr>
                                      <td style="width: 318px; height: 158px">
                                          <table border="0" style="width: 685px; height: 74px">
                                              <tr>
                                                  <td style="width: 11px; text-align: left">
                                                      <span style="font-size: 8pt; font-family: Verdana"><strong>Cheque Number</strong></span></td>
                                                  <td style="width: 85px; text-align: left">
                                                      <asp:TextBox ID="txtchno" runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="8pt"
                                                          ForeColor="#006699" Height="17px" Width="175px"></asp:TextBox></td>
                                              </tr>
                                              <tr>
                                                  <td style="width: 11px; height: 6px; text-align: left">
                                                      <span style="font-size: 8pt; font-family: Verdana"><strong>Cheque Date</strong></span></td>
                                                  <td style="width: 85px; height: 6px; text-align: left">
                                                      &nbsp;<cc1:GMDatePicker ID="chqDate" runat="server" DisplayMode="Label" MaxDate="2020-12-31"
                                                          MinDate="1950-01-01" YearDropDownRange="80">
                                                      </cc1:GMDatePicker>
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td style="width: 11px; text-align: left">
                                                      <span style="font-size: 8pt; font-family: Verdana"><strong>Bank</strong></span></td>
                                                  <td style="width: 85px; text-align: left">
                                                      <asp:TextBox ID="txtbank" runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="8pt"
                                                          ForeColor="#006699" Height="17px" Width="175px"></asp:TextBox></td>
                                              </tr>
                                              <tr>
                                                  <td style="width: 11px; height: 4px; text-align: left">
                                                      <span style="font-size: 8pt; font-family: Verdana"><strong>Branch</strong></span></td>
                                                  <td style="width: 85px; height: 4px; text-align: left">
                                                      <asp:TextBox ID="txtbranch" runat="server" Font-Bold="False" Font-Names="Verdana"
                                                          Font-Size="8pt" ForeColor="#006699" Height="17px" Width="175px"></asp:TextBox></td>
                                              </tr>
                                          </table>
                                      </td>
                                      <td style="width: 445px; height: 158px">
                                      </td>
                                      <td style="width: 4348px; height: 158px">
                                      </td>
                                  </tr>
                                  <tr>
                                      <td style="width: 318px">
                                          <table border="0" width="100%">
                                              <tr>
                                                  <td style="width: 1187px; height: 20px">
                                                  </td>
                                                  <td style="width: 2743px; height: 20px">
                                                      &nbsp;<asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../softimages/save.gif"
                                                          OnClientClick="return validateInput();" /></td>
                                                  <td style="height: 20px; width: 238px;">
                                                  </td>
                                              </tr>
                                          </table>
                                      </td>
                                      <td style="width: 445px">
                                      </td>
                                      <td style="width: 4348px">
                                      </td>
                                  </tr>
                              </table>
                              <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:JIDNYASADATAConnectionString %>"
                                  ProviderName="<%$ ConnectionStrings:JIDNYASADATAConnectionString.ProviderName %>"
                                  SelectCommand="SELECT [scheme_name] FROM [scheme_master] ORDER BY [scheme_id]"></asp:SqlDataSource>
                              <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:conMM %>"
                                  SelectCommand="SELECT [model_name] FROM [model_master] ORDER BY [model_id]"></asp:SqlDataSource>
                              <br />
                              <br />
                          </asp:View>
                      </asp:MultiView></td>
                  </tr>
              </table>
          </td>
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
