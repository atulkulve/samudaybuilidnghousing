
Partial Class mmsoft_CustomerCalls
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            MultiView1.ActiveViewIndex = 0
        End If
    End Sub
    Protected Sub imbOk_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbOk.Click
        Session("CustID") = drpcust.SelectedValue
        'lbldate.Text = callDate.Date
        lblName.Text = drpcust.SelectedItem.Text
        MultiView1.ActiveViewIndex = 1
    End Sub
End Class
