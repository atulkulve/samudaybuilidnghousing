Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls

Partial Class locationmaster
    Inherits System.Web.UI.Page
    Dim constr As String = ConfigurationSettings.AppSettings("MyConnection")
    Dim myFlag As Boolean
    Dim objMid As New MiddleLayer


    'Protected Sub btnsubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnsubmit.Click
    '    ADDDATA()
    'End Sub

    Public Sub ADDDATA()
        Dim con As New SqlConnection(constr)
        Dim Instring As String
        Dim ds As New DataSet
        Dim LocID As String

        LocID = MakeLocationID()
        con.Open()
        Instring = "INSERT INTO location_master(loc_id,loc_name,loc_addr,loc_phone,incharge_person)values('" & LocID & "','" & txtname.Text & "','" & txtaddr.Text & "','" & txtphno.Text & "','" & txtincharge.Text & "')"

        Dim cmd As New SqlCommand(Instring, con)
        Dim exQuery As Integer

        Try
            exQuery = cmd.ExecuteNonQuery
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try

        con.Close()

    End Sub
    Public Sub MODIFYDATA()
        Dim con As New SqlConnection(constr)
        Dim Instring As String
        Dim ds As New DataSet
        Dim LocID As String

        con.Open()
        Instring = "INSERT INTO location_master(loc_id,loc_name,loc_addr,loc_phone,incharge_person)values('" & txthidden.Text & "','" & txtname.Text & "','" & txtaddr.Text & "','" & txtphno.Text & "','" & txtincharge.Text & "')"

        Dim cmd As New SqlCommand(Instring, con)
        Dim exQuery As Integer

        Try
            exQuery = cmd.ExecuteNonQuery
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try

        con.Close()

    End Sub
    'Protected Sub lnkLogout_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkLogout.Click
    '    Session.Abandon()
    '    Response.Redirect("admin_login.aspx")
    'End Sub

    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
        Dim locationName As String = txtname.Text
        Checklocation(locationName)
        If mnuMenu.Items(1).Enabled = True Then
            If myFlag = True Then
                ADDDATA() 'Add new location Entry
                clearcontrols()
                lblmsg.Text = "Added New Entry"
            Else
                lblmsg.Text = "Location Name already Exists!"
                'clearcontrols()
            End If
        Else
            If myFlag = True Then
                If DeleteData() Then 'Delete location Entry
                    MODIFYDATA() 'Modify/Add location Entry
                    clearcontrols()
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
                lblmsg.Text = "Location Name already Exists!"
            End If
        End If
    End Sub
    Public Function DeleteData() As Boolean
        If objMid.ExecuteSqlStmt("delete location_master where loc_id = '" & txthidden.Text & "'") Then
            Return True
        Else
            Return False
        End If
    End Function
    Public Sub Checklocation(ByVal locationName)

        Dim conn As New SqlConnection(constr)
        Dim dt As New DataTable

        Try
            conn.Open()
            Dim sql As String = "SELECT * FROM location_master WHERE loc_name =@locationName "
            Dim cmd As New SqlCommand(sql, conn)
            cmd.Parameters.AddWithValue("@locationName", locationName)
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

    Public Sub clearcontrols()
        txtname.Text = ""
        txtaddr.Text = ""
        txthidden.Text = ""
        txtincharge.Text = ""
        txtphno.Text = ""
    End Sub

    Public Function MakeLocationID() As String
        Dim locationID As String
        Dim runningID As Integer
        Dim runningstr As String

        Dim ds As New DataSet
        ds = getRunningID()
        If Not ds Is Nothing Then
            If ds.Tables(0).Rows.Count > 0 Then

                runningstr = ds.Tables(0).Rows(0)("prefix").ToString()
                runningID = ds.Tables(0).Rows(0)("inv_tag").ToString()
                runningID = runningID + 1
                locationID = runningstr & runningID

            End If
        End If
        objMid.ExecuteSqlStmt("Update invrunningID set inv_tag= " & runningID & " where inv_id=2")
        Return locationID
    End Function

    Protected Sub imbedit_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbedit.Click
        Dim ds As New DataSet
        txthidden.Text = drplocation.SelectedValue
        MultiView1.ActiveViewIndex = 0
        ds = getlocationData()
        If Not ds Is Nothing Then
            If ds.Tables(0).Rows.Count > 0 Then

                txtname.Text = ds.Tables(0).Rows(0)("loc_Name").ToString()
                txtaddr.Text = ds.Tables(0).Rows(0)("loc_addr").ToString()
                txtphno.Text = ds.Tables(0).Rows(0)("loc_phone").ToString()
                txtincharge.Text = ds.Tables(0).Rows(0)("incharge_person").ToString()

            End If
        End If
    End Sub
    Public Function getRunningID() As DataSet
        Dim ds As New DataSet
        ds = objMid.ExecuteSelectSQL("select * from invrunningID where inv_id=2")
        Return ds
    End Function
    Public Function getlocationData() As DataSet
        Dim ds As New DataSet
        ds = objMid.ExecuteSelectSQL("select * from location_master where loc_id='" & txthidden.Text & "'")
        Return ds
    End Function
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            mnuMenu.Items(0).Selected = True
            mnuMenu.Items(1).Enabled = True
            mnuMenu.Items(0).Enabled = False
            MultiView1.ActiveViewIndex = 0
            objMid.PopulateList(drplocation, "loc_id", "loc_name", objMid.ExecuteSelectSQL("select * from location_master").Tables(0))
        End If
    End Sub
    Protected Sub mnuMenu_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles mnuMenu.MenuItemClick
        lblmsg.Text = ""
        If mnuMenu.Items(0).Enabled = True Then
            mnuMenu.Items(0).Selected = True
            mnuMenu.Items(1).Enabled = True
            mnuMenu.Items(0).Enabled = False
            MultiView1.ActiveViewIndex = 0
            clearcontrols()
        Else
            objMid.PopulateList(drplocation, "loc_id", "loc_name", objMid.ExecuteSelectSQL("select * from location_master").Tables(0))
            MultiView1.ActiveViewIndex = 1
            mnuMenu.Items(1).Selected = True
            mnuMenu.Items(1).Enabled = False
            mnuMenu.Items(0).Enabled = True
        End If
    End Sub
End Class
