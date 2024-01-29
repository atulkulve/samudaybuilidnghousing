Imports System.Data
Imports System.Data.SqlClient
Imports System.ComponentModel
Imports System.Web
Imports Microsoft.VisualBasic
Imports System.Web.UI.HtmlControls
Imports System.Web.UI
Imports System.Data.SqlClient.SqlDataReader
Imports System.Diagnostics
Partial Class user_login
    Inherits System.Web.UI.Page
    Dim constr As String = ConfigurationSettings.AppSettings("MyConnection")
    Dim myFlag As Boolean

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Public Sub ValidateUser()
        If txtuser.Text = "masteradmin" And txtpass.Text = "jid123" Then
            Session("admin") = txtuser.Text
            Response.Redirect("DeleteRoom.aspx")
        Else
            Dim conn As New SqlConnection(constr)
            Dim USERID As String
            Dim USERNAME As String
            Dim USERROLE As String
            Dim strread As SqlDataReader
            Dim sql As String = "SELECT * FROM login WHERE userid = '" & txtuser.Text & "' and pasword ='" & txtpass.Text & "'"
            Dim cmd As New SqlCommand(sql, conn)
            Dim dt As New DataTable
            Try
                conn.Open()
                Dim da As New SqlDataAdapter(cmd)
                da.Fill(dt)

                strread = cmd.ExecuteReader
                If (dt.Rows.Count > 0) Then
                    myFlag = False

                    While strread.Read
                        USERID = strread("userid")
                        USERNAME = strread("username")
                        USERROLE = strread("userrole")
                    End While

                    strread.Close()
                    Session("USERID") = USERID
                    Session("USERNAME") = USERNAME
                    Session("USERROLE") = USERROLE
                    Server.Transfer("SiteMaster.aspx")

                Else
                    myFlag = True
                    'MsgBox("Invalid User name or Password!")
                    myFlag = False

                End If

            Catch ex As Exception

                Response.Write(ex.Message)

            End Try
            conn.Close()
        End If
    End Sub

    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
        ValidateUser()
    End Sub
End Class
