Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls

Partial Class mmsoft_InterestWayoffComp
    Inherits System.Web.UI.Page
    Dim objMid As New MiddleLayer

    Protected Sub gvInterest_PageIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvInterest.PageIndexChanged
       
    End Sub

    Protected Sub gvInterest_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles gvInterest.PageIndexChanging
        gvInterest.PageIndex = e.NewPageIndex
        GridBind()
    End Sub

    Protected Sub gvUserDetails_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvInterest.SelectedIndexChanged

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            lblerror.Text = ""
            objMid.PopulateList(drpSite, "Siteid", "SiteName", objMid.ExecuteSelectSQL("select * from Site").Tables(0))
            MultiView1.ActiveViewIndex = 0
            Call GridBind()
        End If
    End Sub
    Private Sub GridBind()
        Dim ds As New DataSet

        ds = objMid.ExecuteSelectSQL("select * from vw_Pending_Interest where roomid = " & drpFlatnumber.SelectedValue & "")
        Dim dt As New DataTable
        dt = ds.Tables(0)
        gvInterest.DataSource = dt
        gvInterest.DataBind()
    End Sub

    Protected Sub drpSite_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpSite.SelectedIndexChanged
        objMid.PopulateList(drpBuilding, "BldgId", "BldgName", objMid.ExecuteSelectSQL("select * from Building where siteid = '" & drpSite.SelectedValue & "'").Tables(0))
    End Sub

    Protected Sub drpBuilding_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpBuilding.SelectedIndexChanged
        objMid.PopulateList(drpFlatnumber, "RoomId", "RoomNumber", objMid.ExecuteSelectSQL("select * from Room where Bldgid = '" & drpBuilding.SelectedValue & "' and Booked='Yes'").Tables(0))
    End Sub

    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
        lblerror.Text = ""
        If drpFlatnumber.SelectedIndex = 0 Then
            lblerror.Text = "Select Flat Number"
            Exit Sub
        End If
        lblbuilding.Text = drpBuilding.SelectedItem.Text
        lblRoomno.Text = drpFlatnumber.SelectedItem.Text
        GridBind()
        MultiView1.ActiveViewIndex = 1
    End Sub
    Private Sub clearcontrols()
        gvInterest.DataSource = Nothing
        gvInterest.DataBind()
        MultiView1.ActiveViewIndex = 0
        drpBuilding.ClearSelection()
        drpFlatnumber.ClearSelection()
        drpSite.SelectedIndex = 0
    End Sub

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        'Dim chkSelect As CheckBox
        Dim hiddenID As HtmlInputHidden
        Dim txtInt As TextBox
        Dim Pymtentryid As Integer
        For Each gvRow As GridViewRow In gvInterest.Rows
            If gvRow.RowType = DataControlRowType.DataRow Then
                hiddenID = gvRow.FindControl("HiddenID")
                Pymtentryid = CType(hiddenID.Value, Integer)
                txtInt = gvRow.FindControl("txtInterestNew")
                If (txtInt.Text <> "") Then
                    objMid.ExecuteSqlStmt("update PymtEntry set IntPending=" & txtInt.Text & " where pymtentryid = " & Pymtentryid & "")
                End If
            End If
        Next
        clearcontrols()
        'lblerror.Text = FileUpload1.PostedFile.FileName
    End Sub
End Class
