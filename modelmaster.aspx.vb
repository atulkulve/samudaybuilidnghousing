Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Partial Class modelmaster
    Inherits System.Web.UI.Page
    Dim objMid As New MiddleLayer
    Dim constr As String = ConfigurationSettings.AppSettings("MyConnection")
    Dim myFlag As Boolean

    Public Sub ADDDATA()
        Dim con As New SqlConnection(constr)
        Dim Instring, selstr As String
        Dim ds As New DataSet
        Dim brID As String

        con.Open()
        'Dim cmd As New SqlCommand("sp_Empdetails", conn)
        'cmd.CommandType = CommandType.StoredProcedure



        'selstr = "Select brand_id from brand_master where brand_name='" & drpbrand.Text & "'"

        'Dim selcmd As New SqlCommand(selstr, con)
        'Dim strreader As SqlDataReader

        'strreader = selcmd.ExecuteReader()
        'strreader.Read()
        'brID = strreader("brand_id")
        'strreader.Close()

        brID = drpbrand.SelectedValue

        Instring = "INSERT INTO model_master(model_name,brand_id)values('" & txtmodel.Text & "','" & brID & "')"

        Dim cmd As New SqlCommand(Instring, con)
        Dim exQuery, exQuery1 As Integer

        Try
            exQuery = cmd.ExecuteNonQuery
            'exQuery1 = selcmd.ExecuteNonQuery
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try

        'MsgBox("Model name added Succesfully", MsgBoxStyle.OkOnly, "Update")
        con.Close()
    End Sub

    'Protected Sub btnsubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnsubmit.Click
    '    Dim ModelName As String = txtmodel.Text
    '    CheckModel(ModelName)

    '    If myFlag = True Then
    '        ADDDATA()
    '        'Response.Redirect("Welcome.aspx")
    '    Else
    '        lblmsg.Text = "Model Name already Exists!"
    '        txtmodel.Text = ""
    '    End If

    'End Sub

    Public Sub CheckModel(ByVal ModelName)
        Dim conn As New SqlConnection(constr)
        Dim dt As New DataTable

        Try
            conn.Open()
            Dim sql As String = "SELECT * FROM model_master WHERE model_name =@ModelName "
            Dim cmd As New SqlCommand(sql, conn)
            cmd.Parameters.AddWithValue("@ModelName", ModelName)
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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            mnuMenu.Items(0).Selected = True
            mnuMenu.Items(1).Enabled = True
            mnuMenu.Items(0).Enabled = False
            MultiView1.ActiveViewIndex = 0
            'objMid.PopulateList(drpModel, ",model_id", "model_name", objMid.ExecuteSelectSQL("select * from model_master").Tables(0))
            objMid.PopulateList(drpbrand, "brand_id", "brand_name", objMid.ExecuteSelectSQL("select * from brand_master").Tables(0))
        End If
    End Sub

    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
        Dim ModelName As String = txtmodel.Text
        CheckModel(ModelName)
        If mnuMenu.Items(1).Enabled = True Then
            If myFlag = True Then
                ADDDATA() 'Add new Model Entry
                txtmodel.Text = ""
                lblmsg.Text = "Added New Entry"
                drpbrand.SelectedValue = ""
            Else
                lblmsg.Text = "Model Name already Exists!"
                txtmodel.Text = ""
            End If
        Else
            If myFlag = True Then
                If DeleteData() Then
                    ADDDATA() 'Add new Model Entry
                    txtmodel.Text = ""
                    txthidden.Text = ""
                    lblmsg.Text = "Data Modified"
                    MultiView1.ActiveViewIndex = 0
                    mnuMenu.Items(0).Selected = True
                    mnuMenu.Items(0).Enabled = False
                    mnuMenu.Items(1).Enabled = True
                    drpbrand.SelectedValue = ""
                Else
                    lblmsg.Text = "Data Cannot be deleted"
                    Exit Sub
                End If
            Else
                lblmsg.Text = "Model Name already Exists!"
            End If
        End If

    End Sub
    Public Function DeleteData() As Boolean
        If objMid.ExecuteSqlStmt("delete model_master where model_id = '" & txthidden.Text & "'") Then
            Return True
        Else
            Return False
        End If
    End Function

    Public Function getModelData() As DataSet
        Dim ds As New DataSet
        ds = objMid.ExecuteSelectSQL("select * from model_master where model_id='" & txthidden.Text & "'")
        Return ds
    End Function
    Protected Sub mnuMenu_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles mnuMenu.MenuItemClick
        lblmsg.Text = ""
        If mnuMenu.Items(0).Enabled = True Then
            mnuMenu.Items(0).Selected = True
            mnuMenu.Items(1).Enabled = True
            mnuMenu.Items(0).Enabled = False
            MultiView1.ActiveViewIndex = 0
            txtmodel.Text = ""
            drpbrand.SelectedValue = ""
            txthidden.Text = ""
        Else
            objMid.PopulateList(drpModel, "model_id", "model_name", objMid.ExecuteSelectSQL("select * from model_master").Tables(0))
            MultiView1.ActiveViewIndex = 1
            mnuMenu.Items(1).Selected = True
            mnuMenu.Items(1).Enabled = False
            mnuMenu.Items(0).Enabled = True
        End If
    End Sub
    Protected Sub imbedit_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbedit.Click
        Dim ds As New DataSet
        txthidden.Text = drpModel.SelectedValue
        MultiView1.ActiveViewIndex = 0
        ds = getModelData()
        If Not ds Is Nothing Then
            If ds.Tables(0).Rows.Count > 0 Then

                txtmodel.Text = ds.Tables(0).Rows(0)("model_Name").ToString()
                drpbrand.SelectedValue = ds.Tables(0).Rows(0)("brand_id").ToString

            End If
        End If

    End Sub
End Class
