Imports System.Data
Imports System.Data.SqlClient
Imports System.ComponentModel
Imports System.Web
Imports Microsoft.VisualBasic
Imports System.Web.UI.HtmlControls
Imports System.Web.UI
Imports System.Data.SqlClient.SqlDataReader
Imports System.Diagnostics
Partial Class admin_module
    Inherits System.Web.UI.Page
    Dim constr As String = ConfigurationSettings.AppSettings("MyConnection")
    Dim myFlag As Boolean

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    Public Sub CheckUser()
        Dim conn As New SqlConnection(constr)
        Dim dt As New DataTable
        'Dim loc_id As String
        Dim strread As SqlDataReader
        Dim sql As String = "SELECT * FROM userlocation_view WHERE user_name = '" & txtUname.Text & "' and user_pwd ='" & txtpass.Text & "'"
        Dim cmd As New SqlCommand(sql, conn)

        Try
            conn.Open()
            Dim da As New SqlDataAdapter(cmd)
            da.Fill(dt)

            strread = cmd.ExecuteReader
            If (dt.Rows.Count > 0) Then
                myFlag = False
                'Server.Transfer("memberpage.aspx")
                'Label1.Visible = False
                'While strread.Read
                '    loc_id = strread("loc_id")
                '    'MsgBox(strID)
                'End While
                strread.Close()
                'Session("LocID") = loc_id
                Session("admin") = txtUname.Text
                Server.Transfer("brandmaster.aspx")

            Else

                myFlag = True

                'Label1.Visible = True

                'MsgBox("Invalid User name and Password!")

                myFlag = False

            End If
        Catch ex As Exception

            Response.Write(ex.Message)

        End Try
        conn.Close()
    End Sub

    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
        If txtUname.Text <> "" And txtpass.Text <> "" Then
            CheckUser()

        End If
    End Sub
End Class
