Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Partial Class insurancemaster
    Inherits System.Web.UI.Page
    Dim ObjMid As New MiddleLayer
    Dim constr As String = ConfigurationSettings.AppSettings("MyConnection")

    Dim myFlag As Boolean


    Public Sub ADDDATA()
        Dim con As New SqlConnection(constr)
        Dim Instring As String
        Dim ds As New DataSet

        con.Open()
        'Dim cmd As New SqlCommand("sp_Empdetails", conn)
        'cmd.CommandType = CommandType.StoredProcedure

        Instring = "INSERT INTO insurance_master(insurance_name)values('" & txtInsurance.Text & "')"

        Dim cmd As New SqlCommand(Instring, con)
        Dim exQuery As Integer

        Try
            exQuery = cmd.ExecuteNonQuery
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try

        'MsgBox("insurance name added Succesfully", MsgBoxStyle.OkOnly, "Update")
        ' Response.Redirect("mangalmurti autolink.htm")
        con.Close()

    End Sub

    'Protected Sub btnsubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnsubmit.Click
    '    Dim insuranceName As String = txtinsurance.Text
    '    Checkinsurance(insuranceName)

    '    If myFlag = True Then
    '        If Session("admin") <> "" Then
    '            ADDDATA()
    '        Else
    '            'MsgBox("Sorry!You are already logged out!")
    '            Response.Redirect("newlogin.aspx")

    '        End If
    '    Else
    '        lblmsg.Text = "Brnad Name already Exists!"
    '        txtinsurance.Text = ""
    '    End If
    'End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Response.Cache.SetCacheability(HttpCacheability.NoCache)
        Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1))
        Response.Cache.SetNoStore()
        If Not IsPostBack Then
            mnuMenu.Items(0).Selected = True
            mnuMenu.Items(1).Enabled = True
            mnuMenu.Items(0).Enabled = False
            MultiView1.ActiveViewIndex = 0
            objMid.PopulateList(drpInsurance, "Insurance_id", "Insurance_name", objMid.ExecuteSelectSQL("select * from Insurance_master").Tables(0))
        End If
        'lblId.Text = Session("LocID")
        'TextBox1.text = Session("admin")
    End Sub

    Public Sub Checkinsurance(ByVal insuranceName)

        Dim conn As New SqlConnection(constr)
        Dim dt As New DataTable

        Try
            conn.Open()
            Dim sql As String = "SELECT * FROM insurance_master WHERE insurance_name =@insuranceName "
            Dim cmd As New SqlCommand(sql, conn)
            cmd.Parameters.AddWithValue("@insuranceName", insuranceName)
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

    'Protected Sub LoginStatus1_LoggingOut(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.LoginCancelEventArgs) Handles LoginStatus1.LoggingOut
    '    Session.Abandon()
    '    Session("admin") = ""

    'End Sub

    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
        Dim InsuranceName As String = txtInsurance.Text
        Checkinsurance(InsuranceName)
        If mnuMenu.Items(1).Enabled = True Then
            If myFlag = True Then
                ADDDATA() 'Add new Insurance Entry
                txtInsurance.Text = ""
                lblmsg.Text = "Added New Entry"
            Else
                lblmsg.Text = "Insurance Name already Exists!"
                txtInsurance.Text = ""
            End If
        Else
            If myFlag = True Then
                If DeleteData() Then
                    ADDDATA() 'Add new Insurance Entry
                    txtInsurance.Text = ""
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
                lblmsg.Text = "Insurance Name already Exists!"
            End If
        End If
    End Sub
    Public Function DeleteData() As Boolean
        If objMid.ExecuteSqlStmt("delete Insurance_master where Insurance_id = '" & txthidden.Text & "'") Then
            Return True
        Else
            Return False
        End If
    End Function
    Public Function getInsuranceData() As DataSet
        Dim ds As New DataSet
        ds = objMid.ExecuteSelectSQL("select * from Insurance_master where Insurance_id='" & txthidden.Text & "'")
        Return ds
    End Function
    Protected Sub mnuMenu_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles mnuMenu.MenuItemClick
        lblmsg.Text = ""
        If mnuMenu.Items(0).Enabled = True Then
            mnuMenu.Items(0).Selected = True
            mnuMenu.Items(1).Enabled = True
            mnuMenu.Items(0).Enabled = False
            MultiView1.ActiveViewIndex = 0
            txtInsurance.Text = ""
            txthidden.Text = ""
        Else
            objMid.PopulateList(drpInsurance, "Insurance_id", "Insurance_name", objMid.ExecuteSelectSQL("select * from Insurance_master").Tables(0))
            MultiView1.ActiveViewIndex = 1
            mnuMenu.Items(1).Selected = True
            mnuMenu.Items(1).Enabled = False
            mnuMenu.Items(0).Enabled = True
        End If
    End Sub
    Protected Sub imbedit_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbedit.Click
        Dim ds As New DataSet
        txthidden.Text = drpInsurance.SelectedValue
        MultiView1.ActiveViewIndex = 0
        ds = getInsuranceData()
        If Not ds Is Nothing Then
            If ds.Tables(0).Rows.Count > 0 Then

                txtInsurance.Text = ds.Tables(0).Rows(0)("Insurance_Name").ToString()

            End If
        End If

    End Sub
End Class
