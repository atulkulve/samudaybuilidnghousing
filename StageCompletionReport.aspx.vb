
Partial Class mmsoft_StageCompletionReport
    Inherits System.Web.UI.Page
    Dim objMid As New MiddleLayer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            objMid.PopulateList(drpSite, "Siteid", "SiteName", objMid.ExecuteSelectSQL("select * from Site").Tables(0))

            MultiView1.ActiveViewIndex = 0
        End If
    End Sub

    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
        If Not Session("BldgID") Is Nothing Then
            Session("BldgID") = Nothing
        End If
        Session("BldgID") = drpBuilding.SelectedValue
        MultiView1.ActiveViewIndex = 1
    End Sub

    Protected Sub drpSite_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpSite.SelectedIndexChanged
        objMid.PopulateList(drpBuilding, "BldgId", "BldgName", objMid.ExecuteSelectSQL("select * from building where siteid = '" & drpSite.SelectedValue & "'").Tables(0))
    End Sub
End Class
