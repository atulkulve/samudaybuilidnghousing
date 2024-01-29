Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Imports System.Math

Partial Class mmsoft_DeleteRoom
    Inherits System.Web.UI.Page
    Dim ObjMid As New MiddleLayer

    Protected Sub btnDelete_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnDelete.Click

        ObjMid.ExecuteSqlStmt("Exec sp_DeleteRoom " & drpFlatnumber.SelectedValue & "")
        Response.Redirect("DeleteRoom.aspx")


    End Sub
    'Private Sub Bind()
    '    'Dim Search As Search = FindControl("Search1")
    '    Dim ds As New DataSet

    '    ds = ObjMid.ExecuteSelectSQL("Select Roomid,FName,LName from SalesDetails")

    '    'Create changes in the view by Hemlata sharma
    '    'Dated 17 04 2007
    '    'for select the proper value from databese
    '    'Search1.tabName = "vw_type_details_account"
    '    'dv = Search1.getview()
    '    'If dv.Count = 0 Then
    '    '    'ShowMessage("No Records Found!!", DisplayMessage.MessageType.Information)
    '    'End If
    '    'If (Not ViewState("SortExpression") Is Nothing) Then
    '    '    dv.Sort = CType(ViewState("SortExpression"), String)
    '    'gvwView.DataSource = dv
    '    'gvwView.DataBind()
    '    'Else

    '    'End If
    '    Dim dv As New DataView
    '    dv = ds.Tables(0).DefaultView

    '    gvwView.DataSource = dv
    '    dv.Sort = "pymtId desc"
    '    gvwView.DataBind()

    'End Sub

    Protected Sub drpSite_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpSite.SelectedIndexChanged
        ObjMid.PopulateList(drpBuilding, "BldgId", "BldgName", ObjMid.ExecuteSelectSQL("select * from building where siteid = '" & drpSite.SelectedValue & "'").Tables(0))
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ObjMid.PopulateList(drpSite, "SiteId", "SiteName", ObjMid.ExecuteSelectSQL("select * from Site").Tables(0))
        End If

    End Sub
    Protected Sub drpBuilding_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpBuilding.SelectedIndexChanged
        ObjMid.PopulateList(drpFlatnumber, "RoomId", "RoomNumber", ObjMid.ExecuteSelectSQL("select * from Room where Bldgid = " & drpBuilding.SelectedValue & " And Booked='Yes'").Tables(0))
    End Sub

End Class
