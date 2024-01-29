<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/SFA.master" CodeFile="UpdatePymtDate.aspx.vb" Inherits="mmsoft_UpdatePymtDate" %>

<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>


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
function ValidateStage()
{

	    if(validateDropDown(document.getElementById('ctl00_ContentPlaceHolder2_drpStage'),'Select Stage'))
        {
        if(validateEmpty(document.getElementById('ctl00_ContentPlaceHolder2_txtPercentage'),'Enter Percentage','Invalid Input in Percentage'))
        {
            return true;
        }
        }        
        
        return false;
}
function ValidateInput()
{

	    if(validateDropDown(document.getElementById('ctl00_ContentPlaceHolder2_drpSelectSite'),'Select Stage'))
        {
        if(validateEmpty(document.getElementById('ctl00_ContentPlaceHolder2_txtBuilding'),'Enter Building','Invalid Input in Building'))
        {
         return true;        
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
            <span style="font-size: 10pt; font-family: Verdana">Change Due Date</span></td>
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
                      <td style="width: 828px">
                          <table border="0" bordercolor="#006699">
                              <tr>
                                  <td style="width: 296px; text-align: left">
                                      <span style="font-size: 10pt; font-family: Verdana"><span style="font-size: 8pt">Site
                                          Name</span></span></td>
                                  <td style="text-align: left; width: 240px;">
                                      <asp:DropDownList ID="drpSite" runat="server" AutoPostBack="True" Font-Bold="False"
                                          Font-Names="Verdana" Font-Size="8pt" ForeColor="#006699" Height="20px" Width="175px">
                                          <asp:ListItem Value="0">--Select--</asp:ListItem>
                                      </asp:DropDownList></td>
                                  <td style="width: 258px; text-align: left">
                                      <span style="font-size: 8pt; font-family: Verdana">Select Building</span></td>
                                  <td style="width: 370px; text-align: left">
                                      <asp:DropDownList ID="drpBuilding" runat="server" AutoPostBack="True" Font-Bold="False"
                                          Font-Names="Verdana" Font-Size="8pt" ForeColor="#006699" Height="20px" Width="175px">
                                          <asp:ListItem Value="0">--Select--</asp:ListItem>
                                      </asp:DropDownList></td>
                              </tr>
                              <tr>
                                  <td style="width: 296px; text-align: left">
                                      <span style="font-size: 8pt; font-family: Verdana">Flat Number</span></td>
                                  <td style="width: 240px; text-align: left; font-size: 8pt; font-family: Tahoma;">
                                      <asp:DropDownList ID="drpFlatnumber" runat="server" AutoPostBack="True" Font-Bold="False"
                                          Font-Names="Verdana" Font-Size="8pt" ForeColor="#006699" Height="20px" Width="175px">
                                          <asp:ListItem Value="0">--Select--</asp:ListItem>
                                      </asp:DropDownList></td>
                                  <td style="width: 258px; text-align: left; font-size: 8pt; font-family: Tahoma;">
                                      <span></span></td>
                                  <td style="width: 370px; text-align: left; font-size: 8pt; font-family: Tahoma;">
                                      </td>
                              </tr>
                              <tr>
                                  <td style="width: 296px; text-align: left">
                                  </td>
                                  <td style="font-size: 8pt; width: 240px; font-family: Tahoma; text-align: left">
                                      </td>
                                  <td style="font-size: 8pt; width: 258px; font-family: Tahoma; text-align: left">
                                      &nbsp;</td>
                                  <td style="font-size: 8pt; width: 370px; font-family: Tahoma; text-align: left">
                                      &nbsp;</td>
                              </tr>
                              <tr style="font-size: 8pt; font-family: Tahoma">
                                  <td id="TD3" class="td_bg_selected3" colspan="4" style="text-align: left">
                                      Payment Details</td>
                              </tr>
                              <tr style="font-size: 8pt; font-family: Tahoma">
                                  <td colspan="4" style="height: 9px; text-align: left">
                                      <asp:MultiView ID="MultiView1" runat="server">
                                          <asp:View ID="View1" runat="server">
                                      <asp:GridView ID="gvwAssignLead" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                          Width="100%" PageSize="20">
                                          <FooterStyle CssClass="td_bg_selected3" />
                                          <Columns>
                                              <asp:TemplateField>
                                                  <ItemStyle HorizontalAlign="Center" Width="0px" />
                                               
                                                  <ItemTemplate>
                                                      
                                                      <input id="txthidden" runat="server" type="hidden" value='<%# Bind("pymtid") %>' />
                                                      
                                                  </ItemTemplate>
                                              </asp:TemplateField>
                                              
                                              <asp:BoundField DataField="StageDesc" HeaderText="Stage Description" SortExpression="lead_First_Name">
                                                  <ItemStyle HorizontalAlign="Left" />
                                                  <HeaderStyle HorizontalAlign="Left" />
                                              </asp:BoundField>
                                              <asp:BoundField DataField="OutStanding" HeaderText="OutStanding" SortExpression="lead_Last_Name">
                                                  <ItemStyle HorizontalAlign="Left" />
                                                  <HeaderStyle HorizontalAlign="Left" />
                                              </asp:BoundField>
                                              <asp:BoundField DataField="interest" HeaderText="Interest" SortExpression="lead_Company">
                                                  <ItemStyle HorizontalAlign="Left" />
                                                  <HeaderStyle HorizontalAlign="Left" />
                                              </asp:BoundField>
                                              <asp:BoundField DataField="TotalOutstanding" HeaderText="Total Outstanding" SortExpression="lead_Source_Name">
                                                  <ItemStyle HorizontalAlign="Left" />
                                                  <HeaderStyle HorizontalAlign="Left" />
                                              </asp:BoundField>
                                              <asp:TemplateField HeaderText="Due Date" SortExpression="User_Name">
                                                  <ItemStyle HorizontalAlign="Left" />
                                                  <ItemTemplate>
                                                      <cc1:GMDatePicker ID="Pymtdate" runat="server" DisplayMode="Label" Font-Names="Verdana"
                                                              Font-Size="8pt" MaxDate="2020-12-31" MinDate="1950-01-01" DateFormat="dd-MMM-yy" YearDropDownRange="100" InitialText='<%# Bind("DueDate") %>'>
                                                          </cc1:GMDatePicker>
                                                          <%--<asp:TextBox ID="TextBox1" runat="server" Text ='<%# Bind("DueDate") %>'></asp:TextBox>&nbsp;
                                      <asp:Button ID="Button1" runat="server" Text="+" />
                                      <asp:Calendar ID="Calendar1" runat="server" SelectionMode="DayWeekMonth" Visible="False">
                                      </asp:Calendar>--%>
                                                  </ItemTemplate>
                                                  <HeaderStyle HorizontalAlign="Left" />
                                              </asp:TemplateField>
                                              
                                          </Columns>
                                          <RowStyle CssClass="td_bg_selected_2" />
                                          <PagerStyle CssClass="FooterStyle" ForeColor="White" HorizontalAlign="Center" />
                                          <HeaderStyle CssClass="td_bg_selected_1" ForeColor="White" />
                                      </asp:GridView>
                                                  <asp:ImageButton ID="imbSave" runat="server" ImageUrl="../softimages/save.gif"
                                          OnClientClick="return ValidateInput();" /><asp:ImageButton ID="imbCancel" runat="server" ImageUrl="~/softimages/Cancel_btn.gif"
                                           /></asp:View>
                                          <asp:View ID="View2" runat="server">
                                          </asp:View>
                                      </asp:MultiView></td>
                              </tr>
                              <tr style="font-size: 8pt; font-family: Tahoma">
                                  <td colspan="4" style="text-align: left">
                                      </td>
                              </tr>
                              <tr style="font-size: 8pt; font-family: Tahoma">
                                  <td style="width: 296px; text-align: left; height: 20px;">
                                  </td>
                                  <td style="width: 240px; text-align: left; height: 20px;">
                                  </td>
                                  <td style="width: 258px; text-align: left; height: 20px;">
                                  </td>
                                  <td style="width: 370px; text-align: left; height: 20px;">
                                  </td>
                              </tr>
                          </table>
                      </td>
                      <td style="width: 277px">
                          </td>
                      <td style="width: 242px">
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 828px">
                          &nbsp;<asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt"
                              ForeColor="Red"></asp:Label></td>
                      <td style="width: 277px">
                          </td>
                      <td style="width: 242px">
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 828px; height: 16px">
                          <asp:TextBox ID="txthidden" runat="server" Visible="False"></asp:TextBox></td>
                      <td style="width: 277px; height: 16px">
                      </td>
                      <td style="width: 242px; height: 16px">
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 828px">
                      </td>
                      <td style="width: 277px">
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
                          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<span style="font-size: 16pt;
            font-family: Verdana"></span></p>
      
    </div>
  <%--   </form> --%>
 </div>
                <br />
               
   
  </asp:Content>

