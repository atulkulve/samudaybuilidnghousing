
Partial Class mmsoft_ReceiptEntry
    Inherits System.Web.UI.Page
    Dim objMid As New MiddleLayer

    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
        Dim strsql As String
        strsql = "INSERT INTO transaction_account(trans_date,accounthead_id,trans_amount,trans_narration,tr_type) values(" _
       & "'" & trans_date.Date & "','" & drpaccounthead.SelectedValue & "'," & CInt(txtamount.Text) * -1 & "," _
       & " '" & txtnarration.Text & "','R')"
        objMid.ExecuteSelectSQL(strsql)
        
        clearcontrols()

    End Sub
    Public Sub clearcontrols()
        txtamount.Text = ""
        txtnarration.Text = ""
        drpaccounthead.SelectedIndex = 0
        Dim mydate As Date
        trans_date.Date = mydate.Date
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            objMid.PopulateList(drpaccounthead, "accounthead_id", "accounthead_name", objMid.ExecuteSelectSQL("select * from accounthead_master").Tables(0))
        End If
    End Sub
End Class
