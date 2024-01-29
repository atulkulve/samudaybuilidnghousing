Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Imports System.Math

Partial Class mmsoft_UpdatePymtDate
    Inherits System.Web.UI.Page
    Dim objMid As New MiddleLayer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            'If Not Session("TempPaymentDetailsTbl") Is Nothing Then
            '    Session("TempPaymentDetailsTbl") = Nothing
            'End If
            'If Not Session("RoomID") Is Nothing Then
            '    Session("RoomID") = Nothing
            'End If
            'objMid.PopulateList(drpFlatnumber, "RoomId", "RoomNumber", objMid.ExecuteSelectSQL("select * from Room").Tables(0))
            objMid.PopulateList(drpSite, "SiteId", "SiteName", objMid.ExecuteSelectSQL("select * from Site").Tables(0))
            MultiView1.ActiveViewIndex = 1
        End If
    End Sub

    Protected Sub drpSite_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpSite.SelectedIndexChanged
        objMid.PopulateList(drpBuilding, "BldgId", "BldgName", objMid.ExecuteSelectSQL("select * from building where siteid = '" & drpSite.SelectedValue & "'").Tables(0))
    End Sub

    Protected Sub drpBuilding_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpBuilding.SelectedIndexChanged
        objMid.PopulateList(drpFlatnumber, "RoomId", "RoomNumber", objMid.ExecuteSelectSQL("select * from Room where Bldgid = '" & drpBuilding.SelectedValue & "' and Booked='Yes'").Tables(0))
    End Sub

    Protected Sub drpFlatnumber_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpFlatnumber.SelectedIndexChanged
        Dim dsPymt As New DataSet
        dsPymt = objMid.ExecuteSelectSQL("select * from vw_PaymentTable where roomid=" & drpFlatnumber.SelectedValue & "")
        gvwAssignLead.DataSource = dsPymt
        gvwAssignLead.DataBind()
        MultiView1.ActiveViewIndex = 0

    End Sub

    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
        For Each gvr As GridViewRow In gvwAssignLead.Rows
            Dim tempdate2 As GrayMatterSoft.GMDatePicker
            tempdate2 = New GrayMatterSoft.GMDatePicker
            tempdate2 = CType(gvr.FindControl("Pymtdate"), GrayMatterSoft.GMDatePicker)
            Dim txtpymtid As HtmlInputHidden = CType(gvr.FindControl("txthidden"), HtmlInputHidden)
            'tempdate = New GrayMatterSoft.GMDatePicker
            'Dim date1 As Date = paydate.Date
            Dim pymtid As Integer = CType(txtpymtid.Value, Integer)

            'update Pyment set duedate='" & date1 & "' where pymtid =" & CType(txtpymtid.Value, Integer) & ""

            Dim Sql As String = "update pyment set duedate='" & tempdate2.Date & "' where pymtid = " & pymtid
            objMid.ExecuteSqlStmt(Sql)
        Next
        MultiView1.ActiveViewIndex = 1
        drpFlatnumber.Items.Clear()
        drpBuilding.Items.Clear()
        drpSite.SelectedIndex = 0
    End Sub

  
    'Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
    '    Calendar1.Visible = True
    'End Sub

    'Protected Sub Calendar1_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Calendar1.SelectionChanged
    '    TextBox1.Text = Calendar1.SelectedDate
    '    Calendar1.Visible = False
    'End Sub

    Protected Sub imbCancel_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbCancel.Click
        MultiView1.ActiveViewIndex = 1
        drpFlatnumber.Items.Clear()
        drpBuilding.Items.Clear()
        drpSite.SelectedIndex = 0
    End Sub
End Class
