
Partial Class mmsoft_ProvisionalReportReceipt
    Inherits System.Web.UI.Page

    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
        If Not Session("FrmDate") Is Nothing Then
            Session("FrmDate") = Nothing
        End If
        Session("FrmDate") = Convert.ToDateTime(fromdate.Date).ToString("dd-MMM-yy")


        If Not Session("ToDate") Is Nothing Then
            Session("ToDate") = Nothing
        End If
        Session("ToDate") = Convert.ToDateTime(todate.Date).ToString("dd-MMM-yy")
        Session("Status") = drpStatus.SelectedValue

        lblstatus.Text = drpStatus.SelectedValue

        MultiView1.ActiveViewIndex = 1
        lblfrmdate.Text = Convert.ToDateTime(fromdate.Date).ToString("dd-MMM-yy")
        lbltodate.Text = Convert.ToDateTime(todate.Date).ToString("dd-MMM-yy")
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            MultiView1.ActiveViewIndex = 0
        End If
    End Sub
End Class
