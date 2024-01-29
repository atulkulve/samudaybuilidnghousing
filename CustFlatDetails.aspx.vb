
Partial Class mmsoft_CustFlatDetails
    Inherits System.Web.UI.Page
    Dim objMid As New MiddleLayer

    Protected Sub drpSite_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpSite.SelectedIndexChanged
        objMid.PopulateList(drpBuilding, "BldgId", "BldgName", objMid.ExecuteSelectSQL("select * from building where siteid = '" & drpSite.SelectedValue & "'").Tables(0))
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            objMid.PopulateList(drpSite, "SiteId", "SiteName", objMid.ExecuteSelectSQL("select * from Site").Tables(0))
            MultiView1.ActiveViewIndex = 0
        End If
    End Sub

    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
        Session("blgID") = drpBuilding.SelectedValue
        lblBldg.Text = drpBuilding.SelectedItem.Text
        lblSite.Text = drpSite.SelectedItem.Text
        MultiView1.ActiveViewIndex = 1
    End Sub

End Class
