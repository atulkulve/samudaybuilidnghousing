Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Imports System.Math

Partial Class mmsoft_DemandReport
    Inherits System.Web.UI.Page
    Dim objMid As New MiddleLayer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            objMid.PopulateList(drpSite, "Siteid", "SiteName", objMid.ExecuteSelectSQL("select * from Site").Tables(0))

            MultiView1.ActiveViewIndex = 0
        End If
    End Sub

    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
        'Dim ds As New DataSet
        'Dim i As Integer
        'ds = objMid.ExecuteSelectSQL("select *from demandletter")
        'Dim dt As DataTable
        'dt = ds.Tables(0)
        'For i = 0 To dt.Rows.Count - 1
        '    objMid.ExecuteSqlStmt("update demandletter set ")
        'Next
        lblbldgname.Text = drpBuilding.SelectedItem.Text

        If Not Session("Bldid") Is Nothing Then
            Session("Bldid") = Nothing
        End If
        Session("Bldid") = drpBuilding.SelectedValue

        If Not Session("FrmDate") Is Nothing Then
            Session("FrmDate") = Nothing
        End If
        Session("FrmDate") = fromdate.Date

        If Not Session("ToDate") Is Nothing Then
            Session("ToDate") = Nothing
        End If
        Session("ToDate") = todate.Date

        MultiView1.ActiveViewIndex = 1
    End Sub

    Protected Sub drpSite_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpSite.SelectedIndexChanged
        objMid.PopulateList(drpBuilding, "BldgId", "BldgName", objMid.ExecuteSelectSQL("select * from building where siteid = '" & drpSite.SelectedValue & "'").Tables(0))
    End Sub

   
End Class
