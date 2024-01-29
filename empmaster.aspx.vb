Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Partial Class empmaster
    Inherits System.Web.UI.Page
    Dim constr As String = ConfigurationSettings.AppSettings("MyConnection")

    Dim myFlag As Boolean

    'Protected Sub btnsubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnsubmit.Click
    '    ADDDATA()
    '    ADDUSER()
    'End Sub

    Private Sub ADDDATA()
        Dim con As New SqlConnection(constr)
        Dim Instring As String
        'Dim ds As New DataSet


        con.Open()

        'For Finding Location Id
        'Dim strLoc As String
        Dim LOCID As String
        'strLoc = "Select loc_id from location_master where loc_name='" & drploc.Text & "'"
        'Dim cmdLoc As New SqlCommand(strLoc, con)
        'Dim reader1 As SqlDataReader
        'reader1 = cmdLoc.ExecuteReader()
        'reader1.Read()
        LOCID = Session("LocID")
        'reader1.Close()

        'If empDOB.SelectedDate = "" Then

        'End If

        Instring = "INSERT INTO employee_master(emp_name,emp_dob,emp_addr,emp_phone,emp_email," _
                       & " emp_designation,remarks,loc_id,emp_bank,emp_branch,emp_accountno)values('" & txtname.Text & "','" & empDOB.Date & "'," _
                       & "'" & txtaddr.Text & "','" & txtphone.Text & "'," _
                       & "'" & txtemail.Text & "','" & txtdesig.Text & "'," _
                       & "'" & txtremarks.Text & "','" & LOCID & "','" & txtbank.Text & "','" & txtbranch.Text & "','" & txtaccountno.Text & "')"



        Dim cmd As New SqlCommand(Instring, con)
        Dim exQuery As Integer

        Try
            exQuery = cmd.ExecuteNonQuery
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try

        'MsgBox("Employee Added Succesfully", MsgBoxStyle.OkOnly, "Update")
        con.Close()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Private Sub ClearControls()
        'empDOB.Date = Date
        txtaddr.Text = ""
        txtphone.Text = ""
        txtname.Text = ""
        txtemail.Text = ""
        txtdesig.Text = ""
        txtremarks.Text = ""
        'drploc.SelectedIndex = 0
    End Sub
    Private Sub ADDUSER()
        Dim con As New SqlConnection(constr)
        Dim strIn As String
        con.Open()

        'For Finding Location Id
        'Dim strLoc As String
        Dim LOCID As String
        'strLoc = "Select loc_id from location_master where loc_name='" & drploc.Text & "'"
        'Dim cmdLoc As New SqlCommand(strLoc, con)
        'Dim reader1 As SqlDataReader
        'reader1 = cmdLoc.ExecuteReader()
        'reader1.Read()
        LOCID = Session("LocID")
        'reader1.Close()

        strIn = "INSERT INTO user_master(user_name,user_pwd,loc_id)values('" & txtname.Text & "','" & LOCID & "','" & LOCID & "')"


        Dim cmdIn As New SqlCommand(strIn, con)
        Dim exQuery As Integer

        Try
            exQuery = cmdIn.ExecuteNonQuery
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try

        'MsgBox("Employee Added Succesfully")
        con.Close()
    End Sub

    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
        If IsPostBack Then
            ADDDATA()
            ADDUSER()
            ClearControls()
            Response.Redirect("UserMenu.aspx")
        End If
    End Sub
End Class
