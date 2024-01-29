Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Partial Class modifyemp
    Inherits System.Web.UI.Page
    Dim constr As String = ConfigurationSettings.AppSettings("MyConnection")

    Dim myFlag As Boolean

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Panel1.Visible = False
        MultiView1.ActiveViewIndex = 0
    End Sub

    'Protected Sub btndisplay_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btndisplay.Click
    '    'If drpemp.Text = "-Select-" Then
    '    '    MsgBox("Select Employee Name")
    '    '    Exit Sub
    '    'End If

    '    'If IsPostBack = False Then
    '    GETDATA()
    '    'End If


    'End Sub

    Public Sub GETDATA()
        'txtname.Text = Session("MyName")
        Dim conn As New SqlConnection(constr)
        Dim strread As SqlDataReader
        Dim sql As String = "SELECT * FROM employee_master WHERE emp_name ='" & drpemp.Text & "'"
        Dim cmd As New SqlCommand(sql, conn)
        conn.Open()
        strread = cmd.ExecuteReader

        While strread.Read

            If IsDBNull(strread("emp_name")) = False Then txtname.Text = strread("emp_name")
            If IsDBNull(strread("emp_dob")) = False Then empDOB.Date = strread("emp_dob")
            If IsDBNull(strread("emp_addr")) = False Then txtaddr.Text = strread("emp_addr")
            If IsDBNull(strread("emp_phone")) = False Then txtphone.Text = strread("emp_phone")
            If IsDBNull(strread("emp_email")) = False Then txtemail.Text = strread("emp_email")
            If IsDBNull(strread("emp_designation")) = False Then txtdesig.Text = strread("emp_designation")
            If IsDBNull(strread("remarks")) = False Then txtremarks.Text = strread("remarks")

        End While
        strread.Close()
        conn.Close()

    End Sub

    Public Sub UPDATEDATA()
        'Dim strId As String
        'strId = Session("RegId")

        Dim conn As New SqlConnection(constr)
        Dim strUp, strSel As String
        Dim ds As New DataSet
        Dim getId As Integer

        conn.Open()

        strSel = "Select * from employee_master where emp_name='" & drpemp.Text & "'"
        Dim selcmd As New SqlCommand(strSel, conn)
        Dim strreader As SqlDataReader

        strreader = selcmd.ExecuteReader()
        strreader.Read()
        getId = strreader("emp_id")
        strreader.Close()


        strUp = "Update employee_master set emp_name='" & txtname.Text & "',emp_dob='" & empDOB.Date & "'," _
& " emp_addr='" & txtaddr.Text & "',emp_phone='" & txtphone.Text & "',emp_email='" & txtemail.Text & "',emp_designation='" & txtdesig.Text & "'," _
& "remarks='" & txtremarks.Text & "' where emp_id='" & getId & "'"


        Dim cmd As New SqlCommand(strUp, conn)
        Dim exQuery, exQuery1 As Integer

        Try
            exQuery = cmd.ExecuteNonQuery
            exQuery1 = selcmd.ExecuteNonQuery

        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
        conn.Close()


    End Sub

    'Protected Sub btnupdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnupdate.Click
    '    UPDATEDATA()
    'End Sub

    Protected Sub imbEdit_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbEdit.Click
        MultiView1.ActiveViewIndex = 1
        GETDATA()
    End Sub

    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
        UPDATEDATA()
        Response.Redirect("modifyemp.aspx")
    End Sub
End Class
