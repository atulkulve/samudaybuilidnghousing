Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Partial Class locationemp
    Inherits System.Web.UI.Page
    Dim objMid As New MiddleLayer
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
        'LOCID = reader1("loc_id")
        'reader1.Close()
        locid = drploc.SelectedValue
        'If empDOB.SelectedDate = "" Then

        'End If

        Instring = "INSERT INTO employee_master(emp_name,emp_dob,emp_addr,emp_phone,emp_email," _
                       & " emp_designation,remarks,loc_id)values('" & txtname.Text & "','" & empDOB.Date & "'," _
                       & "'" & txtaddr.Text & "','" & txtphone.Text & "'," _
                       & "'" & txtemail.Text & "','" & txtdesig.Text & "'," _
                       & "'" & txtremarks.Text & "','" & LOCID & "')"



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
        If Not IsPostBack Then
            mnuMenu.Items(0).Selected = True
            mnuMenu.Items(1).Enabled = True
            mnuMenu.Items(0).Enabled = False
            MultiView1.ActiveViewIndex = 0
            objMid.PopulateList(drpEmployee, "emp_id", "emp_name", objMid.ExecuteSelectSQL("select * from Employee_master").Tables(0))
            objMid.PopulateList(drploc, "loc_id", "loc_name", objMid.ExecuteSelectSQL("select * from location_master").Tables(0))
        End If
    End Sub
    Private Sub ClearControls()
        'empDOB.Date = Date
        txtaddr.Text = ""
        txtphone.Text = ""
        txtname.Text = ""
        txtemail.Text = ""
        txtdesig.Text = ""
        txtremarks.Text = ""
        drploc.SelectedIndex = 0
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
        'LOCID = reader1("loc_id")
        'reader1.Close()
        LOCID = drploc.SelectedValue

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
    Public Sub CheckEmployee(ByVal EmployeeName)

        Dim conn As New SqlConnection(constr)
        Dim dt As New DataTable

        Try
            conn.Open()
            Dim sql As String = "SELECT * FROM Employee_master WHERE Emp_name =@EmployeeName "
            Dim cmd As New SqlCommand(sql, conn)
            cmd.Parameters.AddWithValue("@EmployeeName", EmployeeName)
            Dim da As New SqlDataAdapter(cmd)
            da.Fill(dt)

            If (dt.Rows.Count > 0) Then
                myFlag = False
                'MsgBox(" Exist!")
                'Do the Update code here

            Else
                myFlag = True
                'MsgBox("Not Exists!")
                'Do the INSERT codes here
            End If

        Catch ex As Exception
            Response.Write(ex.Message)

        End Try
        conn.Close()

    End Sub
    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
        Dim EmployeeName As String = txtname.Text
        CheckEmployee(EmployeeName)
        If mnuMenu.Items(1).Enabled = True Then
            If myFlag = True Then
                ADDDATA() 'Add new Employee Entry
                ADDUSER()
                ClearControls()
                lblmsg.Text = "Added New Entry"
            Else
                lblmsg.Text = "Employee Name already Exists!"
            End If
        Else
            If myFlag = True Then
                If DeleteData() Then
                    ADDDATA() 'Add new Employee Entry
                    ADDUSER()
                    ClearControls()
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
                lblmsg.Text = "Employee Name already Exists!"
            End If
        End If


        'If IsPostBack Then
        '    ADDDATA()
        '    ADDUSER()
        '    ClearControls()
        '    Response.Redirect("locationemp.aspx")
        'End If
    End Sub
    Public Function getDeleteEmployeeData() As DataSet
        Dim ds As New DataSet
        ds = objMid.ExecuteSelectSQL("select * from employee_master where emp_id='" & txthidden.Text & "'")
        Return ds
    End Function

    Public Function DeleteData() As Boolean
        Dim ds As New DataSet
        Dim strname As String
        Dim locid As String

        ds = getDeleteEmployeeData()
        If Not ds Is Nothing Then
            If ds.Tables(0).Rows.Count > 0 Then

                strname = ds.Tables(0).Rows(0)("emp_Name").ToString()
                locid = ds.Tables(0).Rows(0)("loc_id").ToString()

            End If
        End If
        If objMid.ExecuteSqlStmt("delete user_master where user_name = '" & strname & "' and loc_id = '" & locid & "'") And objMid.ExecuteSqlStmt("delete Employee_master where emp_id = '" & txthidden.Text & "'") Then
            Return True
        Else
            Return False
        End If
    End Function
    Public Function getEmployeeData() As DataSet
        Dim ds As New DataSet
        ds = objMid.ExecuteSelectSQL("select * from Employee_master where emp_id='" & txthidden.Text & "'")
        Return ds
    End Function
    Protected Sub mnuMenu_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles mnuMenu.MenuItemClick
        lblmsg.Text = ""
        If mnuMenu.Items(0).Enabled = True Then
            mnuMenu.Items(0).Selected = True
            mnuMenu.Items(1).Enabled = True
            mnuMenu.Items(0).Enabled = False
            MultiView1.ActiveViewIndex = 0
            ClearControls()
        Else
            objMid.PopulateList(drpEmployee, "emp_id", "emp_name", objMid.ExecuteSelectSQL("select * from Employee_master").Tables(0))
            MultiView1.ActiveViewIndex = 1
            mnuMenu.Items(1).Selected = True
            mnuMenu.Items(1).Enabled = False
            mnuMenu.Items(0).Enabled = True
        End If
    End Sub
    Protected Sub imbedit_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbedit.Click
        Dim ds As New DataSet
        txthidden.Text = drpEmployee.SelectedValue
        MultiView1.ActiveViewIndex = 0
        ds = getEmployeeData()
        If Not ds Is Nothing Then
            If ds.Tables(0).Rows.Count > 0 Then

                txtname.Text = ds.Tables(0).Rows(0)("emp_Name").ToString()
                empDOB.Date = ds.Tables(0).Rows(0)("emp_dob").ToString()
                txtaddr.Text = ds.Tables(0).Rows(0)("emp_addr").ToString()
                txtphone.Text = ds.Tables(0).Rows(0)("emp_phone").ToString()
                txtemail.Text = ds.Tables(0).Rows(0)("emp_email").ToString()
                txtdesig.Text = ds.Tables(0).Rows(0)("emp_designation").ToString()
                txtremarks.Text = ds.Tables(0).Rows(0)("remarks").ToString()
                drploc.SelectedValue = ds.Tables(0).Rows(0)("loc_id").ToString()

            End If
        End If

    End Sub
End Class

'***************
'EMP Source code
'**************8



'    Inherits System.Web.UI.Page
'    Dim constr As String = ConfigurationSettings.AppSettings("MyConnection")

'    Dim myFlag As Boolean


'    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
'        lblId.Text = Session("LocID")
'    End Sub

'    Public Sub ADDDATA()
'        Dim con As New SqlConnection(constr)
'        Dim Instring As String
'        con.Open()

'        ''For Finding Location Id
'        'Dim strLoc As String
'        'Dim LOCID As String
'        'strLoc = "Select loc_id from location_master where loc_name='" & drploc.Text & "'"
'        'Dim cmdLoc As New SqlCommand(strLoc, con)
'        'Dim reader1 As SqlDataReader
'        'reader1 = cmdLoc.ExecuteReader()
'        'reader1.Read()
'        'LOCID = reader1("loc_id")
'        'reader1.Close()

'        Instring = "INSERT INTO employee_master(emp_name,emp_dob,emp_addr,emp_phone,emp_email," _
'                       & " emp_designation,remarks,loc_id)values('" & txtname.Text & "','" & empDOB.Text & "'," _
'                       & "'" & txtaddr.Text & "','" & txtphone.Text & "'," _
'                       & "'" & txtemail.Text & "','" & txtdesig.Text & "'," _
'                       & "'" & txtremarks.Text & "','" & lblId.Text & "')"


'        Dim cmd As New SqlCommand(Instring, con)
'        Dim exQuery As Integer

'        Try
'            exQuery = cmd.ExecuteNonQuery
'        Catch ex As Exception
'            Response.Write(ex.Message)
'        End Try

'        'MsgBox("Employee Added Succesfully", MsgBoxStyle.OkOnly, "Update")
'        con.Close()
'    End Sub

'    Public Sub ADDUSER()
'        Dim con As New SqlConnection(constr)
'        Dim strIn As String
'        con.Open()

'        ''For Finding Location Id
'        'Dim strLoc As String
'        'Dim LOCID As String
'        'strLoc = "Select loc_id from location_master where loc_name='" & drploc.Text & "'"
'        'Dim cmdLoc As New SqlCommand(strLoc, con)
'        'Dim reader1 As SqlDataReader
'        'reader1 = cmdLoc.ExecuteReader()
'        'reader1.Read()
'        'LOCID = reader1("loc_id")
'        'reader1.Close()

'        strIn = "INSERT INTO user_master(user_name,user_pwd,loc_id)values('" & txtname.Text & "','" & lblId.Text & "','" & lblId.Text & "')"


'        Dim cmdIn As New SqlCommand(strIn, con)
'        Dim exQuery As Integer

'        Try
'            exQuery = cmdIn.ExecuteNonQuery
'        Catch ex As Exception
'            Response.Write(ex.Message)
'        End Try

'        MsgBox("Employee Added Succesfully")
'        con.Close()

'    End Sub

'    'Protected Sub btnsubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnsubmit.Click
'    '    ADDDATA()
'    '    ADDUSER()
'    'End Sub

'    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
'        ADDDATA()
'        ADDUSER()
'    End Sub
'End Class
