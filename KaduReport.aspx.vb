Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls

Partial Class mmsoft_KaduReport
    Inherits System.Web.UI.Page
    Dim ObjMid As New MiddleLayer
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            'objMid.PopulateList(drpSite, "SiteId", "SiteName", objMid.ExecuteSelectSQL("select * from Site").Tables(0))
            objMid.PopulateList(drpsite2, "SiteId", "SiteName", objMid.ExecuteSelectSQL("select * from Site").Tables(0))
            MultiView1.ActiveViewIndex = 0
            'mnuMenu.Items(0).Selected = True
            'mnuMenu.Items(1).Enabled = True
            'mnuMenu.Items(0).Enabled = False
        End If
    End Sub

    

    Private Sub GridBind()
        Dim ds As New DataSet
        Dim sql As String
        sql = "select * from vw_KaduRoom_Details where bldgid = " & drpbuilding2.SelectedValue & ""
        ds = objMid.ExecuteSelectSQL(sql)
        Dim dt As New DataTable
        dt = ds.Tables(0)
        gvkadugrid.DataSource = dt
        gvkadugrid.DataBind()
    End Sub

    Protected Sub drpbuilding2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpbuilding2.SelectedIndexChanged
        Call GridBind()
    End Sub

    Protected Sub gvkadugrid_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvkadugrid.RowCommand
        Dim linkbt As New LinkButton
        Dim str As String = e.CommandArgument

        Dim ds As New DataSet
        txthidden.Text = str
        MultiView1.ActiveViewIndex = 1
        txthidden.Text = str
        Call grid2()
    End Sub
    Public Sub grid2()
        Dim ds As New DataSet
        Dim sql As String
        sql = "select * from vw_KaduRoom_Indetails where roomid = " & Val(txthidden.Text) & ""
        ds = ObjMid.ExecuteSelectSQL(sql)
        Dim dt As New DataTable
        dt = ds.Tables(0)
        Grid1.DataSource = dt
        Grid1.DataBind()
    End Sub
    Protected Sub gvkadugrid_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvkadugrid.SelectedIndexChanged

    End Sub

    Protected Sub drpsite2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpsite2.SelectedIndexChanged
        ObjMid.PopulateList(drpbuilding2, "BldgId", "BldgName", ObjMid.ExecuteSelectSQL("select * from building where siteid = '" & drpsite2.SelectedValue & "'").Tables(0))
    End Sub
End Class
