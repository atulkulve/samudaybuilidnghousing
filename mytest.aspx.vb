Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls
Partial Class mytest
    Inherits System.Web.UI.Page
    Dim constr As String = ConfigurationSettings.AppSettings("MyConnection")
    Dim ar(8) As String

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        getList()
    End Sub

    Public Sub getList()
        Dim con As New SqlConnection(constr)
        con.Open()
        Dim Item As ListItem
        Dim strSql As String

        Dim a As Integer
        For Each Item In CheckBoxList1.Items
            If Item.Selected = True Then
                strSql = "Insert Into model_choice(model_choice)values('" & Item.Text & "')"
                'MsgBox(Item.Text)
                For a = 0 To 8
                    ar(a) = Item.Text
                Next

                Dim exQuery As Integer
                Dim cmdH As New SqlCommand(strSql, con)

                Try
                    exQuery = cmdH.ExecuteNonQuery

                Catch ex As Exception
                    Response.Write(ex.Message)
                End Try
            End If
        Next
        con.Close()
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged
        If DropDownList1.SelectedItem.Text = "Yes" Then
            TextBox1.Text = "YES"
        Else
            TextBox1.Text = "NO"
        End If
    End Sub
End Class
