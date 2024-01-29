<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/SFA.master" CodeFile="Payment.aspx.vb" Inherits="mmsoft_Payment" %>
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
function ValidateNo()
{
       checkchedNo(document.getElementById('ctl00_ContentPlaceHolder2_optno'),document.getElementById('ctl00_ContentPlaceHolder2_optyes'));
}
function ValidateYes()
{
       checkchedNo(document.getElementById('ctl00_ContentPlaceHolder2_optyes'),document.getElementById('ctl00_ContentPlaceHolder2_optno'));
}

function checkchedNo(optcontrol1,optcontrol2)
{
	optcontrol1.checked==true;
	optcontrol2.checked = false;
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

	    if(validateDropDown(document.getElementById('ctl00_ContentPlaceHolder2_drpSite'),'Select Site'))
        {
        if(validateDropDown(document.getElementById('ctl00_ContentPlaceHolder2_drpBuilding'),'Select Building'))
        {
        if(validateDropDown(document.getElementById('ctl00_ContentPlaceHolder2_drpFlatnumber'),'Select Flat Number'))
        {
            return true;
              
        }  
         }}     
        return false;
}
function validateAdvance(txtcontrol)
{
	if(txtcontrol.enabled == true)
	{
		alert('Working');
		return true;
	}
	else
	{
		    return false;
	}
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
            <span style="font-size: 10pt; font-family: Verdana">Payment Entry</span></td>
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
                                  <td style="width: 296px; text-align: left; height: 21px;">
                                      <span style="font-size: 8pt; font-family: Verdana">Flat Number</span></td>
                                  <td style="width: 240px; text-align: left; font-size: 8pt; font-family: Tahoma; height: 21px;">
                                      <asp:DropDownList ID="drpFlatnumber" runat="server" AutoPostBack="True" Font-Bold="False"
                                          Font-Names="Verdana" Font-Size="8pt" ForeColor="#006699" Height="20px" Width="175px">
                                          <asp:ListItem Value="0">--Select--</asp:ListItem>
                                      </asp:DropDownList></td>
                                  <td style="width: 258px; text-align: left; font-size: 8pt; font-family: Tahoma; height: 21px;">
                                      <span>Sqft</span></td>
                                  <td style="width: 370px; text-align: left; font-size: 8pt; font-family: Tahoma; height: 21px;">
                                      <asp:Label ID="lblsqft" runat="server" Font-Names="Verdana" Font-Size="8pt"
                                          Width="62px"></asp:Label></td>
                              </tr>
                              <tr style="font-size: 8pt; font-family: Tahoma">
                                  <td style="width: 296px; text-align: left">
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
                                      Party Details</td>
                              </tr>
                              <tr style="font-size: 8pt; font-family: Tahoma">
                                  <td style="width: 296px; text-align: left">
                                      <span style="font-family: Verdana">First Name</span></td>
                                  <td style="width: 240px; text-align: left">
                                      <asp:Label ID="lblFname" runat="server" Font-Size="8pt" Width="170px"></asp:Label></td>
                                  <td style="font-size: 8pt; width: 258px; text-align: left">
                                      <span style="font-family: Verdana">Last Name</span></td>
                                  <td style="font-size: 8pt; width: 370px; text-align: left">
                                      <asp:Label ID="lblLName" runat="server" Font-Names="Verdana" Font-Size="8pt"
                                          Width="151px"></asp:Label></td>
                              </tr>
                              <tr style="font-size: 8pt; font-family: Tahoma">
                                  <td style="width: 296px; height: 13px; text-align: left">
                                      <span style="font-family: Verdana">Secondary First Name</span></td>
                                  <td style="width: 240px; height: 13px; text-align: left">
                                      <asp:Label ID="lblSFName" runat="server" Font-Size="8pt" Width="169px"></asp:Label></td>
                                  <td style="font-size: 8pt; width: 258px; height: 13px; text-align: left">
                                      <span style="font-family: Verdana">Secondary Last Name</span></td>
                                  <td style="font-size: 8pt; width: 370px; height: 13px; text-align: left">
                                      <asp:Label ID="lblSLName" runat="server" Font-Names="Verdana" Font-Size="8pt"
                                          Width="151px"></asp:Label></td>
                              </tr>
                              <tr style="font-size: 8pt; font-family: Tahoma">
                                  <td style="width: 296px; text-align: left">
                                      <span style="font-family: Verdana">Address</span></td>
                                  <td style="width: 240px; text-align: left">
                                      <asp:Label ID="lblAddress" runat="server" Font-Size="8pt" Width="246px"></asp:Label></td>
                                  <td style="font-size: 8pt; width: 258px; text-align: left">
                                      <span style="font-family: Verdana">Email ID</span></td>
                                  <td style="font-size: 8pt; width: 370px; text-align: left">
                                      <asp:Label ID="lblemail" runat="server" Font-Names="Verdana" Font-Size="8pt"
                                          Width="151px"></asp:Label></td>
                              </tr>
                              <tr style="font-size: 8pt; font-family: Tahoma">
                                  <td style="width: 296px; text-align: left">
                                      <span style="font-family: Verdana">Tel No.</span></td>
                                  <td style="width: 240px; text-align: left">
                                      <asp:Label ID="lbltelno" runat="server" Font-Size="8pt" Width="168px"></asp:Label></td>
                                  <td style="font-size: 8pt; width: 258px; text-align: left">
                                      <span style="font-family: Verdana">Mobile No.</span></td>
                                  <td style="font-size: 8pt; width: 370px; text-align: left">
                                      <asp:Label ID="lblphoneno" runat="server" Font-Names="Verdana" Font-Size="8pt"
                                          Width="151px"></asp:Label></td>
                              </tr>
                              <tr style="font-size: 8pt; font-family: Tahoma">
                                  <td id="TD3" class="td_bg_selected3" colspan="4" style="text-align: left">
                                      Payment Made</td>
                              </tr>
                              <tr style="font-size: 8pt; font-family: Tahoma">
                                  <td colspan="4" style="height: 9px; text-align: left">
                                      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                          DataSourceID="SqlDataSource2" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333"
                                          GridLines="None" Height="121px" Width="833px">
                                          <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                          <Columns>
                                              <asp:BoundField DataField="StageDesc" HeaderText="Stage Description" SortExpression="StageDesc" />
                                              
                                              <asp:BoundField DataField="DueDate" 
                                            DataFormatString="{0:dd-MMM-yy}" 
                                            HeaderText="Due Date"                                                    
                                            SortExpression="Due Date"                                                     
                                            HtmlEncode="False">
                                            <ItemStyle Wrap="False"/>
                                            </asp:BoundField> 
                                              <asp:BoundField DataField="TotalPayment" HeaderText="Payment Amount" SortExpression="TotalPayment" />
                                          </Columns>
                                          <RowStyle BackColor="#EFF3FB" />
                                          <EditRowStyle BackColor="#2461BF" />
                                          <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                          <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                          <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                          <AlternatingRowStyle BackColor="White" />
                                      </asp:GridView>
                                      <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:conMM %>"
                                          SelectCommand="SELECT B.SiteId, B.BldgId, B.RoomId, B.SqFt, B.Rate, B.FName, B.LName, B.Add1, B.Add2, B.telno, B.Mobno, B.email, B.saledate, D.StageDesc, A.DueDate, A.TotalPayment, A.OutStanding, A.PymtId, B.SFName, B.SLName FROM Pyment AS A INNER JOIN salesDetails AS B ON A.RoomId = B.RoomId INNER JOIN BldgStage AS C ON A.BldgStageId = C.BldgStageId INNER JOIN stage AS D ON C.StageId = D.StageId WHERE (A.OutStanding = 0) AND (B.RoomId = @RoomID)">
                                          <SelectParameters>
                                              <asp:SessionParameter Name="RoomID" SessionField="RoomID" />
                                          </SelectParameters>
                                      </asp:SqlDataSource>
                                  </td>
                              </tr>
                              <tr style="font-size: 8pt; font-family: Tahoma">
                                  <td class="td_bg_selected3" colspan="4" style="height: 20px; text-align: left">
                                      Pending Payments (Stage Wise)</td>
                              </tr>
                              <tr style="font-size: 8pt; font-family: Tahoma">
                                  <td colspan="4" style="text-align: left">
                                      <asp:GridView ID="Grid1" runat="server" AllowPaging="True" PageSize="20" Width="100%" Height="1px">
                                          <FooterStyle CssClass="td_bg_selected3" />
                                          <RowStyle CssClass="td_bg_selected1" />
                                          <Columns>
                                              <asp:ButtonField Text="Delete">
                                                  <ItemStyle ForeColor="#D5E1F5" Width="25px" />
                                              </asp:ButtonField>
                                          </Columns>
                                          <PagerStyle CssClass="FooterStyle" ForeColor="White" />
                                          <HeaderStyle CssClass="td_bg_selected3" />
                                      </asp:GridView>
                                  </td>
                              </tr>
                              <tr style="font-size: 8pt; font-family: Tahoma">
                                  <td class="td_bg_selected3" colspan="4" style="height: 20px; text-align: left">
                                      Pending Installments (First Stage)
                                      <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/softimages/print-bt.gif"
                                          OnClientClick="return ValidateInput();" /></td>
                              </tr>
                              <tr style="font-size: 8pt; font-family: Tahoma">
                                  <td colspan="4" style="text-align: left">
                                      <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                          DataSourceID="SqlDataSource1" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333"
                                          GridLines="None" Height="121px" Width="833px">
                                          <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                          <Columns>
                                              <asp:BoundField DataField="installment_name" HeaderText="Installments" SortExpression="installment_name" />
                                                 <asp:TemplateField HeaderText="Installment Date">
                                                    <ItemTemplate>
                                                    <asp:Label ID="lblDOB5456" runat="server" Text='<%# Bind("installment_date","{0:dd-MMM-yy}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                 </asp:TemplateField>
                                              <asp:BoundField DataField="installment_value" HeaderText="Amount" SortExpression="installamt" />
                                          </Columns>
                                          <RowStyle BackColor="#EFF3FB" />
                                          <EditRowStyle BackColor="#2461BF" />
                                          <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                          <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                          <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                          <AlternatingRowStyle BackColor="White" />
                                      </asp:GridView>
                                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conMM %>"
                                          SelectCommand="SELECT installment_id, installment_name, RoomId, installment_date, installment_value FROM tbl_roominstallments_details WHERE (RoomId = @RoomID) AND (installment_value > 0) ORDER BY installment_id">
                                          <SelectParameters>
                                              <asp:SessionParameter DefaultValue="0" Name="RoomID" SessionField="RoomID" />
                                          </SelectParameters>
                                      </asp:SqlDataSource>
                                  </td>
                              </tr>
                              <tr style="font-size: 8pt; font-family: Tahoma">
                                  <td style="width: 296px; text-align: left">
                                  </td>
                                  <td style="width: 240px; text-align: left">
                                  </td>
                                  <td style="width: 258px; text-align: left">
                                  </td>
                                  <td style="width: 370px; text-align: left">
                                  </td>
                              </tr>
                              <tr style="font-size: 8pt; font-family: Tahoma">
                                  <td class="td_bg_selected3" colspan="4" style="text-align: left">
                                      <span>Payment Details</span></td>
                              </tr>
                              <tr style="font-size: 8pt; font-family: Tahoma">
                                  <td style="width: 296px; text-align: left">
                                      <span style="font-family: Verdana">Payment Date</span></td>
                                  <td style="width: 240px; text-align: left">
                                      <cc1:GMDatePicker ID="paydate" runat="server" DisplayMode="Label" Font-Names="Verdana"
                                          Font-Size="8pt" MaxDate="2020-12-31" MinDate="1950-01-01" YearDropDownRange="100" DateFormat="d-MMM-yy">
                                      </cc1:GMDatePicker>
                                      
                                  </td>
                                  <td style="width: 258px; text-align: left; font-size: 8pt;">
                                      <span style="font-family: Verdana">
                                      Mode Of Payment</span></td>
                                  <td style="width: 370px; text-align: left; font-size: 8pt;">
                                      <asp:DropDownList ID="drpmode" runat="server" Font-Bold="False" Font-Names="Verdana"
                                                  Font-Size="8pt" ForeColor="#006699" Height="20px" Width="164px">
                                          <asp:ListItem>--Select--</asp:ListItem>
                                          <asp:ListItem>Cheque</asp:ListItem>
                                          <asp:ListItem>Cash</asp:ListItem>
                                          <asp:ListItem Value="3">Loan</asp:ListItem>
                                          <asp:ListItem>RTGS</asp:ListItem>
                                          <asp:ListItem>EDC</asp:ListItem>
                                      </asp:DropDownList></td>
                              </tr>
                              <tr>
                                  <td style="width: 296px; text-align: left;">
                                      <span style="font-size: 8pt; font-family: Verdana">Amount Paid</span></td>
                                  <td style="width: 240px; text-align: left;">
                                      <asp:TextBox ID="txtamount" runat="server" Font-Bold="False" Font-Names="Verdana"
                                          Font-Size="8pt" ForeColor="#006699" Height="15px" Width="144px"></asp:TextBox></td>
                                  <td style="width: 258px; text-align: left;">
                                      <span style="font-size: 8pt; font-family: Verdana">Cash/Cheque Details</span></td>
                                  <td style="width: 370px; text-align: left;">
                                      <asp:TextBox ID="txtcheqdetails" runat="server" Font-Bold="False" Font-Names="Verdana"
                                          Font-Size="8pt" ForeColor="#006699" Height="15px" Width="147px"></asp:TextBox></td>
                              </tr>
                              <tr>
                                  <td style="width: 296px; text-align: left">
                                      <span style="font-size: 8pt; font-family: Verdana">Apply Interest</span></td>
                                  <td style="width: 240px; text-align: left">
                                      <asp:RadioButton ID="optyes" runat="server" Text="Yes" OnClick="ValidateYes()" />&nbsp;
                                      <asp:RadioButton ID="optno" runat="server" Text="No" OnClick="ValidateNo()" /></td>
                                  <td style="width: 258px; text-align: left">
                                      <span style="font-size: 8pt; font-family: Verdana">
                                      Advance Payment</span></td>
                                  <td style="width: 370px; text-align: left">
                                      <asp:TextBox ID="txtadvpay" runat="server" Font-Bold="False" Font-Names="Verdana"
                                          Font-Size="8pt" ForeColor="#006699" Height="15px" Width="145px"></asp:TextBox></td>
                              </tr>
                              <tr>
                                  <td colspan="4" style="height: 1px; text-align: center">
                                      &nbsp;&nbsp;
                                      </td>
                              </tr>
                              <tr>
                                  <td colspan="4" style="text-align: center">
                                      <table width="100%">
                                          <tr>
                                              <td style="width: 314px">
                                              </td>
                                              <td style="text-align: left">
                                                  <asp:ImageButton ID="imbSave" runat="server" ImageUrl="../softimages/save.gif"
                                           OnClientClick="return ValidateInput();"/>
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
                      <td style="width: 277px">
                          </td>
                      <td>
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 828px">
                          &nbsp;<asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt"
                              ForeColor="Red"></asp:Label></td>
                      <td style="width: 277px">
                          </td>
                      <td>
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 828px;">
                          <asp:TextBox ID="txthidden" runat="server" Visible="False"></asp:TextBox></td>
                      <td style="width: 277px;">
                      </td>
                      <td>
                      </td>
                  </tr>
                  <tr>
                      <td style="width: 828px">
                      </td>
                      <td style="width: 277px">
                      </td>
                      <td>
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
