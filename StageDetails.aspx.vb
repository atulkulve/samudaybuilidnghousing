Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Partial Class mmsoft_StageDetails
    Inherits System.Web.UI.Page
    Dim objMid As New MiddleLayer
    Dim constr As String = ConfigurationSettings.AppSettings("MyConnection")
    Dim MyFlag As Boolean

    Public Sub CheckStage(ByVal Stage)
        Dim conn As New SqlConnection(constr)
        Dim dt As New DataTable

        Try
            conn.Open()
            Dim sql As String = "SELECT * FROM Stage WHERE StageDesc =@Stage"
            Dim cmd As New SqlCommand(sql, conn)
            cmd.Parameters.AddWithValue("@Stage", Stage)
            Dim da As New SqlDataAdapter(cmd)
            da.Fill(dt)

            If (dt.Rows.Count > 0) Then
                MyFlag = False
            Else
                MyFlag = True
            End If

        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
        conn.Close()
    End Sub

    Public Function AddData() As Boolean
        Dim mydate As New Date
        mydate = Today
        If objMid.ExecuteSqlStmt("Insert Into Stage (StageId, StageDesc,userId,createdDate) values(" & objMid.getUniqueID("Stage", "StageId") & ",'" & txtStageName.Text & "','" & Session("USERID") & "','" & mydate & "')") Then
            Return True
        Else
            Return False
        End If
    End Function

    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
        Dim StageName As String = txtStageName.Text
        CheckStage(StageName)
        lblmsg.Text = ""
        If mnuMenu.Items(1).Enabled = True Then
            If myFlag = True Then
                If AddData() Then 'Add new Stage Entry
                    Call clearcontrols()
                    lblmsg.Text = "Added New Entry"
                Else
                    lblmsg.Text = "Data Cannot be Added"
                End If


            Else
                lblmsg.Text = "Stage Name already Exists!"
            End If
        Else
            If myFlag = True Then
                If ModifyData() Then
                    Call clearcontrols()
                    txthidden.Text = ""
                    lblmsg.Text = "Data Modified"
                    MultiView1.ActiveViewIndex = 0
                    mnuMenu.Items(0).Selected = True
                    mnuMenu.Items(0).Enabled = False
                    mnuMenu.Items(1).Enabled = True
                    objMid.PopulateList(drpStageName, "StageId", "StageDesc", objMid.ExecuteSelectSQL("select * from Stage").Tables(0))
                Else
                    lblmsg.Text = "Data Cannot be Modified"
                End If
                'AddData() 'Add new Stage Entry

            Else
                lblmsg.Text = "Stage Name already Exists!"
            End If

        End If
    End Sub
    Private Sub clearcontrols()
        txtStageName.Text = ""
    End Sub
    Public Function ModifyData() As Boolean
        Dim mydate As New Date
        mydate = Today
        If objMid.ExecuteSqlStmt("Update Stage set StageDesc='" & txtStageName.Text & "' where StageId = " & CInt(txthidden.Text) & "") Then
            Return True
        Else
            Return False
        End If
    End Function
    Protected Sub mnuMenu_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles mnuMenu.MenuItemClick
        lblmsg.Text = ""
        If mnuMenu.Items(0).Enabled = True Then
            mnuMenu.Items(0).Selected = True
            mnuMenu.Items(1).Enabled = True
            mnuMenu.Items(0).Enabled = False
            MultiView1.ActiveViewIndex = 0
            txthidden.Text = ""
            Call clearcontrols()
            objMid.PopulateList(drpStageName, "StageId", "StageDesc", objMid.ExecuteSelectSQL("select * from Stage").Tables(0))
        Else
            MultiView1.ActiveViewIndex = 1
            mnuMenu.Items(1).Selected = True
            mnuMenu.Items(1).Enabled = False
            mnuMenu.Items(0).Enabled = True
            objMid.PopulateList(drpStageName, "StageId", "StageDesc", objMid.ExecuteSelectSQL("select * from Stage").Tables(0))
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            mnuMenu.Items(0).Selected = True
            mnuMenu.Items(1).Enabled = True
            mnuMenu.Items(0).Enabled = False
            MultiView1.ActiveViewIndex = 0
            objMid.PopulateList(drpStageName, "StageId", "StageDesc", objMid.ExecuteSelectSQL("select * from Stage").Tables(0))
        End If
    End Sub
    Public Function getStageData() As DataSet
        Dim ds As New DataSet
        ds = objMid.ExecuteSelectSQL("select * from Stage where StageId='" & txthidden.Text & "'")
        Return ds
    End Function
    Protected Sub imbedit_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbedit.Click
        Dim ds As New DataSet
        txthidden.Text = drpStageName.SelectedValue
        MultiView1.ActiveViewIndex = 0
        ds = getStageData()
        If Not ds Is Nothing Then
            If ds.Tables(0).Rows.Count > 0 Then

                txtStageName.Text = ds.Tables(0).Rows(0)("StageDesc").ToString()
                

            End If
        End If

    End Sub

    Protected Sub imbCancel_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbCancel.Click
        If txthidden.Text = "" Then
            Call clearcontrols()
        Else
            Call clearcontrols()
            mnuMenu.Items(0).Selected = True
            mnuMenu.Items(1).Enabled = True
            mnuMenu.Items(0).Enabled = False
            MultiView1.ActiveViewIndex = 0
        End If
        lblmsg.Text = ""
    End Sub

    Protected Sub imbEditCancel_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbEditCancel.Click
        Call clearcontrols()
        mnuMenu.Items(0).Selected = True
        mnuMenu.Items(1).Enabled = True
        mnuMenu.Items(0).Enabled = False
        MultiView1.ActiveViewIndex = 0
        lblmsg.Text = ""
    End Sub
End Class
