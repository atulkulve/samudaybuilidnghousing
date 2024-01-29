<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/SFA.master" CodeFile="PaymentInterest.aspx.vb" Inherits="mmsoft_PaymentInterest" %>

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
        if(validateDropDown(document.getElementById('ctl00_ContentPlaceHolder2_drpMode'),'Select Mode Of Payment'))
        {
        if(isNotLetter(document.getElementById('ctl00_ContentPlaceHolder2_txtamount'),'Alphabet in Paid Interest'))
        {        
        if(validateEmpty(document.getElementById('ctl00_ContentPlaceHolder2_txtotherdetails'),'Enter Other Details','Invalid Input in Other Details'))
        {
              return true;        
        }      
        }}}
        }}
                
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
            <span style="font-size: 10pt; font-family: Verdana">Payment Of Interest</span></td>
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
                      <td style="width: 841px">
                          <table border="0" bordercolor="#006699">
                              <tr>
                                  <td style="width: 211px; text-align: left;">
                                      <span style="font-size: 10pt; font-family: Verdana"><span style="font-size: 8pt">Select
                                          Site</span></span></td>
                                  <td style="text-align: left; width: 217px;"><asp:DropDownList ID="drpSite" runat="server" Font-Bold="False" Font-Names="Verdana"
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
                                  <td style="width: 211px; text-align: left">
                                      <span style="font-size: 8pt; font-family: Verdana">Flat Number</span></td>
                                  <td style="width: 217px; text-align: left">
                                              <asp:DropDownList ID="drpFlatNumber" runat="server" Font-Bold="False" Font-Names="Verdana"
                                                  Font-Size="8pt" ForeColor="#006699" Height="20px" Width="175px" AutoPostBack="True">
                                                  <asp:ListItem Value="0">--Select--</asp:ListItem>
                                              </asp:DropDownList></td>
                                  <td style="width: 247px; text-align: left">
                                      <span style="font-size: 8pt; font-family: Verdana">
                                      </span></td>
                                  <td style="width: 247px; text-align: left; font-size: 8pt; font-family: Verdana;">
                                      </td>
                              </tr>
                              <tr>
                                  <td colspan="4" style="height: 3px; text-align: left">
                                  </td>
                              </tr>
                              <tr>
                                  <td colspan="4" style="height: 4px; text-align: left">
                                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conMM %>"
                                          SelectCommand="SELECT DISTINCT PymtEntry.PymtEntryId, PymtEntry.PymtId, Pyment.TotalPayment, stage.StageDesc, salesDetails.FName, salesDetails.LName, salesDetails.SFName, PymtEntry.IntPending, PymtEntry.intDays, PymtEntry.PymtAmount, PymtEntry.PymtDate, Pyment.DueDate, Pyment.RoomId FROM PymtEntry INNER JOIN Pyment ON PymtEntry.PymtId = Pyment.PymtId INNER JOIN salesDetails ON Pyment.RoomId = salesDetails.RoomId INNER JOIN BldgStage ON Pyment.BldgStageId = BldgStage.BldgStageId INNER JOIN stage ON BldgStage.StageId = stage.StageId WHERE (PymtEntry.IntPending > 0) AND (Pyment.RoomId = @RoomId)">
                                          <SelectParameters>
                                              <asp:SessionParameter Name="RoomId" SessionField="NewRoomId" />
                                          </SelectParameters>
                                      </asp:SqlDataSource>
                                      <asp:MultiView ID="MultiView1" runat="server">
                                          <asp:View ID="View1" runat="server">
                                          </asp:View>
                                          <asp:View ID="View2" runat="server">
                                      <table width="100%">
                                          <tr>
                                              <td style="width: 117px">
                                                  <span style="font-size: 8pt; font-family: Verdana">First Name</span></td>
                                              <td style="width: 270px">
                                                  <asp:Label ID="lblFName" runat="server" Font-Names="Verdana" Font-Size="8pt" Width="62px"></asp:Label></td>
                                              <td style="width: 181px">
                                                  <span style="font-size: 8pt; font-family: Verdana">Last Name</span></td>
                                              <td style="width: 217px">
                                                  <asp:Label ID="lblLName" runat="server" Font-Names="Verdana" Font-Size="8pt" Width="62px"></asp:Label></td>
                                          </tr>
                                          <tr style="font-size: 8pt; font-family: Tahoma">
                                              <td style="width: 117px">
                                                  <span>Address</span></td>
                                              <td style="width: 270px">
                                                  <asp:Label ID="lblAddress" runat="server" Font-Names="Verdana" Font-Size="8pt" Width="231px"></asp:Label></td>
                                              <td style="width: 181px">
                                                  <span style="font-size: 8pt; font-family: Verdana">Tel No.</span></td>
                                              <td style="width: 217px">
                                                  <asp:Label ID="lbltelno" runat="server" Font-Names="Verdana" Font-Size="8pt" Width="62px"></asp:Label></td>
                                          </tr>
                                      </table>
                                      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                          DataSourceID="SqlDataSource1" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333"
                                          GridLines="None" Width="836px">
                                          <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                          <Columns>
                                              <asp:BoundField DataField="StageDesc" HeaderText="Stage Description" SortExpression="StageDesc" />
                                              <asp:BoundField DataField="TotalPayment" HeaderText="Schedule Payment" SortExpression="TotalPayment" />
                                              <asp:BoundField DataField="PymtAmount" HeaderText="Paid Amount" SortExpression="PymtAmount" />
                                              
                                              
                                                    <asp:BoundField DataField="PymtDate" 
                                                    DataFormatString="{0:dd-MMM-yy}" 
                                                    HeaderText="Payment Date"                                                    
                                                    SortExpression="Payment Date"                                                     
                                                    HtmlEncode="False">
                                                    <ItemStyle Wrap="False"/>
                                                    </asp:BoundField>

                                                    <asp:BoundField DataField="DueDate" 
                                                    DataFormatString="{0:dd-MMM-yy}" 
                                                    HeaderText="Due Date"                                                    
                                                    SortExpression="Due Date"                                                     
                                                    HtmlEncode="False">
                                                    <ItemStyle Wrap="False"/>
                                                    </asp:BoundField>
                                              <asp:BoundField DataField="intDays" HeaderText="Interest Days" SortExpression="intDays" />
                                              <asp:BoundField DataField="IntPending" HeaderText="Interest Pending" SortExpression="IntPending" />
                                          </Columns>
                                          <RowStyle BackColor="#EFF3FB" />
                                          <EditRowStyle BackColor="#2461BF" />
                                          <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                          <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                          <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                          <AlternatingRowStyle BackColor="White" />
                                      </asp:GridView>
                                              <span style="font-size: 8pt; font-family: Verdana">Sum Of Interest Pending is </span>
                                      <asp:Label ID="lblPendingInterest" runat="server" Font-Names="Verdana" Font-Size="8pt" Text="Label"></asp:Label></asp:View>
                                      </asp:MultiView></td>
                              </tr>
                              <tr>
                                  <td colspan="4" style="height: 4px; text-align: left">
                                      <span style="font-size: 8pt; font-family: Verdana"> </span>
                                      </td>
                              </tr>
                              <tr>
                                  <td style="width: 211px; height: 4px; text-align: left">
                                      <span style="font-size: 8pt; font-family: Verdana">Date Of Payment</span></td>
                                  <td style="width: 217px; height: 4px; text-align: left">
                                      <cc1:GMDatePicker ID="PaidDate" runat="server" DisplayMode="Label" Font-Names="Verdana"
                                          Font-Size="8pt" MaxDate="2020-12-31" MinDate="1950-01-01" YearDropDownRange="100" DateFormat="dd-MMM-yy">
                                      </cc1:GMDatePicker>
                                  </td>
                                  <td style="width: 247px; height: 4px; text-align: left">
                                      <span style="font-size: 8pt; font-family: Verdana">Mode Of Payment</span></td>
                                  <td style="width: 247px; height: 4px; text-align: left">
                                      <asp:DropDownList ID="drpMode" runat="server" Font-Bold="False" Font-Names="Verdana"
                                                  Font-Size="8pt" ForeColor="#006699" Height="20px" Width="175px">
                                          <asp:ListItem Value="0">--Select--</asp:ListItem>
                                          <asp:ListItem Value="1">Cheque</asp:ListItem>
                                          <asp:ListItem Value="2">Cash</asp:ListItem>
                                          <asp:ListItem Value="3">Loan</asp:ListItem>
                                      </asp:DropDownList></td>
                              </tr>
                              <tr>
                                  <td style="width: 211px; height: 4px; text-align: left">
                                      <span style="font-size: 8pt; font-family: Verdana">Paid Interest</span></td>
                                  <td style="width: 217px; height: 4px; text-align: left">
                                      <asp:TextBox ID="txtamount" runat="server" Font-Bold="False" Font-Names="Verdana"
                                          Font-Size="8pt" ForeColor="#006699" Height="15px" Width="168px"></asp:TextBox></td>
                                  <td style="width: 247px; height: 4px; text-align: left">
                                      <span style="font-size: 8pt; font-family: Verdana">Other Details</span></td>
                                  <td style="width: 247px; height: 4px; text-align: left">
                                      <asp:TextBox ID="txtotherdetails" runat="server" Font-Bold="False" Font-Names="Verdana"
                                          Font-Size="8pt" ForeColor="#006699" Height="15px" Width="168px"></asp:TextBox></td>
                              </tr>
                              <tr>
                                  <td colspan="4" style="text-align: left">
                                  </td>
                              </tr>
                              <tr>
                                  <td colspan="4" style="text-align: center">
                                      &nbsp;&nbsp;
                                      <table width="100%">
                                          <tr>
                                              <td style="width: 327px; height: 24px;">
                                              </td>
                                              <td style="text-align: left; height: 24px;">
                                                  <asp:ImageButton ID="imbSave" runat="server" ImageUrl="../softimages/save.gif"
                                          OnClientClick="return ValidateInput();" />
                                                  <asp:ImageButton ID="imbCancel" runat="server" ImageUrl="~/softimages/Cancel_btn.gif"
                                           /></td>
                                              <td style="width: 50px; text-align: left; height: 24px;">
                                              </td>
                                          </tr>
                                      </table>
                                  </td>
                              </tr>
                          </table>
                      </td>
                      <td style="width: 254px">
                          &nbsp;</td>
                      <td style="width: 422px">
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 841px; height: 20px;">
                          &nbsp;<asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt"
                              ForeColor="Red"></asp:Label></td>
                      <td style="width: 254px; height: 20px;">
                          </td>
                      <td style="width: 422px; height: 20px;">
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 841px; height: 16px">
                          <asp:TextBox ID="txthidden" runat="server" Visible="False"></asp:TextBox></td>
                      <td style="width: 254px; height: 16px">
                      </td>
                      <td style="width: 422px; height: 16px">
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 841px">
                      </td>
                      <td style="width: 254px">
                      </td>
                      <td style="width: 422px">
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

