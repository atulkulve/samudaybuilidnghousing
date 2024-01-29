
Partial Class _Default
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim myD As String
        Dim i As Integer
        For i = 1 To TextBox1.Text
            myD = mydate.SelectedDate.AddMonths(i)
            MsgBox(myD)
        Next
    End Sub
End Class