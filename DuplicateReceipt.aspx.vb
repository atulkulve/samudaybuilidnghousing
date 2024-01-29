
Partial Class mmsoft_DuplicateReceipt
    Inherits System.Web.UI.Page
    Dim objmid As New MiddleLayer
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            objmid.PopulateList(drpReceiptNo, "ReceiptNos", "ReceiptNos", objmid.ExecuteSelectSQL("select * from BillDetails").Tables(0))
        End If
    End Sub

    Protected Sub imbAddNew_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbAddNew.Click
        If Not Session("ReceiptNos") Is Nothing Then
            Session("ReceiptNos") = Nothing
        End If
        Session("ReceiptNos") = drpReceiptNo.SelectedValue
        Response.Redirect("DuplicateReceiptLayout.aspx")
    End Sub
End Class
