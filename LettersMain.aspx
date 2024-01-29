<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/SFA.master" CodeFile="LettersMain.aspx.vb" Inherits="mmsoft_LettersMain" %>
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
            <span style="font-size: 10pt; font-family: Verdana">Letters To Investors</span></td>
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
                                  <td style="width: 293px; text-align: left">
                                      <span style="font-size: 10pt; font-family: Verdana"><span style="font-size: 8pt">Site
                                          Name</span></span></td>
                                  <td style="text-align: left; width: 240px;"><asp:DropDownList ID="drpSite" runat="server" Font-Bold="False" Font-Names="Verdana"
                                                  Font-Size="8pt" ForeColor="#006699" Height="20px" Width="175px" AutoPostBack="True">
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
                                  <td style="width: 293px; text-align: left">
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
                              <tr style="font-size: 8pt; font-family: Tahoma">
                                  <td style="width: 293px; text-align: left">
                                      <span></span></td>
                                  <td style="width: 240px; text-align: left">
                                      </td>
                                  <td style="width: 258px; text-align: left">
                                  </td>
                                  <td style="width: 370px; text-align: left">
                                  </td>
                              </tr>
                              <tr style="font-size: 8pt; font-family: Tahoma">
                                  <td class="td_bg_selected3" colspan="4" style="text-align: left">
                                      <span>Letter Details</span></td>
                              </tr>
                              <tr>
                                  <td colspan="4" style="text-align: left">
                                      <asp:Label ID="lblletterMsg" runat="server" Font-Bold="True" Font-Names="Verdana"
                                          Font-Size="8pt" ForeColor="Red" Width="791px"></asp:Label></td>
                              </tr>
                              <tr>
                                  <td colspan="3" style="height: 22px; text-align: left">
                                  </td>
                                  <td style="width: 370px; height: 22px; text-align: left">
                                      <asp:ImageButton ID="imbProceed" runat="server" ImageUrl="~/softimages/proceed-arrow.gif"
                                           /></td>
                              </tr>
                              <tr>
                                  <td colspan="4" style="height: 1px; text-align: left">
                                      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" Font-Names="Verdana"
                                          Font-Size="8pt" ForeColor="#333333" GridLines="None">
                                          <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                          <Columns>
                                            
                                                <asp:BoundField DataField="letterDate" 
                                                DataFormatString="{0:dd-MMM-yy}" 
                                                HeaderText="Letter Date"                                                    
                                                SortExpression="letterDate"                                                     
                                                HtmlEncode="False">
                                                <ItemStyle Wrap="False"/>
                                                </asp:BoundField>
                                              <asp:BoundField DataField="SerialNo" HeaderText="Serial No" SortExpression="SerialNo" />
                                              <asp:BoundField DataField="CharSerial" HeaderText="Char Serial" SortExpression="CharSerial" />
                                              <asp:BoundField DataField="OutStanding" HeaderText="Out Standing" SortExpression="OutStanding" />
                                              <asp:BoundField DataField="Interest" HeaderText="Interest" SortExpression="Interest" />
                                              <asp:BoundField DataField="OSWithPending" HeaderText="OS With Pending Int" SortExpression="OSWithPending" />
                                          </Columns>
                                          <RowStyle BackColor="#EFF3FB" />
                                          <EditRowStyle BackColor="#2461BF" />
                                          <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                          <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                          <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                          <AlternatingRowStyle BackColor="White" />
                                      </asp:GridView>
                                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conMM %>"
                                          SelectCommand="SELECT LettersHistory.LetterID, LettersHistory.RoomId, LettersHistory.letterDate, Room.RoomNumber, Building.BldgId, Building.BldgName, LettersHistory.SerialNo, LettersHistory.CharSerial, LettersHistory.OutStanding, LettersHistory.Interest, LettersHistory.OSWithPending FROM Building INNER JOIN Room ON Building.BldgId = Room.BldgId INNER JOIN LettersHistory ON Room.RoomId = LettersHistory.RoomId WHERE (LettersHistory.RoomId = @RoomID)">
                                          <SelectParameters>
                                              <asp:SessionParameter Name="RoomID" SessionField="RoomID" />
                                          </SelectParameters>
                                      </asp:SqlDataSource>
                                      </td>
                              </tr>
                              <tr>
                                  <td colspan="4" style="text-align: center">
                                      &nbsp;&nbsp;
                                      <table width="100%">
                                          <tr>
                                              <td style="width: 314px; text-align: left;">
                                                  &nbsp;<cc1:GMDatePicker ID="LetterDate" runat="server" DateFormat="dd-MMM-yy">
                                                  </cc1:GMDatePicker>
                                              </td>
                                              <td style="text-align: left">
                                                  <asp:ImageButton ID="imbSave" runat="server" ImageUrl="~/softimages/print-bt.gif"
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
                      <td style="width: 828px">
                          &nbsp;<asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt"
                              ForeColor="Red"></asp:Label></td>
                      <td style="width: 254px">
                          </td>
                      <td style="width: 242px">
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 828px; height: 16px">
                          <asp:TextBox ID="txthidden" runat="server" Visible="False"></asp:TextBox></td>
                      <td style="width: 254px; height: 16px">
                      </td>
                      <td style="width: 242px; height: 16px">
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 828px">
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
