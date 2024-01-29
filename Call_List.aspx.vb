
Partial Class mmsoft_Call_List
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            MultiView1.ActiveViewIndex = 0
        End If
    End Sub

    Protected Sub imbOk_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbOk.Click
        Session("CallDate") = callDate.Date
        lbldate.Text = callDate.Date
        MultiView1.ActiveViewIndex = 1
    End Sub
End Class
