Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Partial Class schememaster
    Inherits System.Web.UI.Page
    Dim objMid As New MiddleLayer
    Dim constr As String = ConfigurationSettings.AppSettings("MyConnection")

    Dim myFlag As Boolean

    Public Sub ADDDATA()
        Dim con As New SqlConnection(constr)
        Dim Instring As String
        Dim ds As New DataSet

        con.Open()
        'Dim cmd As New SqlCommand("sp_Empdetails", conn)
        'cmd.CommandType = CommandType.StoredProcedure

        Instring = "INSERT INTO scheme_master(scheme_name)values('" & txtScheme.Text & "')"

        Dim cmd As New SqlCommand(Instring, con)
        Dim exQuery As Integer

        Try
            exQuery = cmd.ExecuteNonQuery
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try

        'MsgBox("New Scheme added Succesfully", MsgBoxStyle.OkOnly, "Update")
        con.Close()
    End Sub

    'Protected Sub btnsubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnsubmit.Click
    '    Dim SchemeName As String = txtscheme.Text
    '    CheckScheme(SchemeName)

    '    If myFlag = True Then
    '        ADDDATA()
    '        'Response.Redirect("Welcome.aspx")
    '    Else
    '        lblmsg.Text = "Scheme Name already Exists!"
    '        txtscheme.Text = ""
    '    End If
    'End Sub

    Public Sub CheckScheme(ByVal Scheme)
        Dim conn As New SqlConnection(constr)
        Dim dt As New DataTable

        Try
            conn.Open()
            Dim sql As String = "SELECT * FROM scheme_master WHERE scheme_name =@Scheme"
            Dim cmd As New SqlCommand(sql, conn)
            cmd.Parameters.AddWithValue("@Scheme", Scheme)
            Dim da As New SqlDataAdapter(cmd)
            da.Fill(dt)

            If (dt.Rows.Count > 0) Then
                myFlag = False

            Else
                myFlag = True

            End If

        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
        conn.Close()
    End Sub

    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
        Dim SchemeName As String = txtScheme.Text
        CheckScheme(SchemeName)
        If mnuMenu.Items(1).Enabled = True Then
            If myFlag = True Then
                ADDDATA() 'Add new Scheme Entry
                txtScheme.Text = ""
                lblmsg.Text = "Added New Entry"
            Else
                lblmsg.Text = "Scheme Name already Exists!"
                txtScheme.Text = ""
            End If
        Else
            If myFlag = True Then
                If DeleteData() Then
                    ADDDATA() 'Add new Scheme Entry
                    txtScheme.Text = ""
                    txthidden.Text = ""
                    lblmsg.Text = "Data Modified"
                    MultiView1.ActiveViewIndex = 0
                    mnuMenu.Items(0).Selected = True
                    mnuMenu.Items(0).Enabled = False
                    mnuMenu.Items(1).Enabled = True
                Else
                    lblmsg.Text = "Data Cannot be deleted"
                    Exit Sub
                End If
            Else
                lblmsg.Text = "Scheme Name already Exists!"
            End If
        End If
    End Sub
    Public Function DeleteData() As Boolean
        If objMid.ExecuteSqlStmt("delete Scheme_master where Scheme_id = '" & txthidden.Text & "'") Then
            Return True
        Else
            Return False
        End If
    End Function

    Protected Sub schememaster_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            mnuMenu.Items(0).Selected = True
            mnuMenu.Items(1).Enabled = True
            mnuMenu.Items(0).Enabled = False
            MultiView1.ActiveViewIndex = 0
            objMid.PopulateList(drpScheme, "Scheme_id", "Scheme_name", objMid.ExecuteSelectSQL("select * from Scheme_master").Tables(0))
        End If
    End Sub
    Public Function getSchemeData() As DataSet
        Dim ds As New DataSet
        ds = objMid.ExecuteSelectSQL("select * from Scheme_master where Scheme_id='" & txthidden.Text & "'")
        Return ds
    End Function
    Protected Sub mnuMenu_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles mnuMenu.MenuItemClick
        lblmsg.Text = ""
        If mnuMenu.Items(0).Enabled = True Then
            mnuMenu.Items(0).Selected = True
            mnuMenu.Items(1).Enabled = True
            mnuMenu.Items(0).Enabled = False
            MultiView1.ActiveViewIndex = 0
            txtScheme.Text = ""
            txthidden.Text = ""
        Else
            objMid.PopulateList(drpScheme, "Scheme_id", "Scheme_name", objMid.ExecuteSelectSQL("select * from Scheme_master").Tables(0))
            MultiView1.ActiveViewIndex = 1
            mnuMenu.Items(1).Selected = True
            mnuMenu.Items(1).Enabled = False
            mnuMenu.Items(0).Enabled = True
        End If
    End Sub
    Protected Sub imbedit_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbedit.Click
        Dim ds As New DataSet
        txthidden.Text = drpScheme.SelectedValue
        MultiView1.ActiveViewIndex = 0
        ds = getSchemeData()
        If Not ds Is Nothing Then
            If ds.Tables(0).Rows.Count > 0 Then

                txtScheme.Text = ds.Tables(0).Rows(0)("Scheme_Name").ToString()

            End If
        End If

    End Sub
End Class
