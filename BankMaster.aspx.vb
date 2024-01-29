Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Partial Class BankMaster
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

        Instring = "INSERT INTO bank_master(bank_name)values('" & txtBank.Text & "')"

        Dim cmd As New SqlCommand(Instring, con)
        Dim exQuery As Integer

        Try
            exQuery = cmd.ExecuteNonQuery
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try

        'MsgBox("Bank name added Succesfully", MsgBoxStyle.OkOnly, "Update")
        ' Response.Redirect("mangalmurti autolink.htm")
        con.Close()

    End Sub
    'Protected Sub btnsubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnsubmit.Click
    '    Dim BankName As String = txtBank.Text
    '    CheckBank(BankName)

    '    If myFlag = True Then
    '        ADDDATA() 'Add new Bank Entry
    '    Else
    '        lblmsg.Text = "Bank Name already Exists!"
    '        txtbank.Text = ""
    '    End If
    'End Sub
    Public Function DeleteData() As Boolean
        If objMid.ExecuteSqlStmt("delete bank_master where bank_id = '" & txthidden.Text & "'") Then
            Return True
        Else
            Return False
        End If
    End Function
    Public Sub CheckBank(ByVal BankName)
        Dim conn As New SqlConnection(constr)
        Dim dt As New DataTable

        Try
            conn.Open()
            Dim sql As String = "SELECT * FROM bank_master WHERE bank_name =@BankName "
            Dim cmd As New SqlCommand(sql, conn)
            cmd.Parameters.AddWithValue("@BankName", BankName)
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
        Dim BankName As String = txtbank.Text
        CheckBank(BankName)
        If mnuMenu.Items(1).Enabled = True Then
            If myFlag = True Then
                ADDDATA() 'Add new Bank Entry
                txtbank.Text = ""
                lblmsg.Text = "Added New Entry"
            Else
                lblmsg.Text = "Bank Name already Exists!"
                txtbank.Text = ""
            End If
        Else
            If myFlag = True Then
                If DeleteData() Then
                    ADDDATA() 'Add new Bank Entry
                    txtbank.Text = ""
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
                lblmsg.Text = "Bank Name already Exists!"
            End If
        End If
    End Sub

    Protected Sub BankMaster_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            mnuMenu.Items(0).Selected = True
            mnuMenu.Items(1).Enabled = True
            mnuMenu.Items(0).Enabled = False
            MultiView1.ActiveViewIndex = 0
            objMid.PopulateList(drpbank, "bank_id", "bank_name", objMid.ExecuteSelectSQL("select * from bank_master").Tables(0))
        End If
    End Sub

    Public Function getBankData() As DataSet
        Dim ds As New DataSet
        ds = objMid.ExecuteSelectSQL("select * from bank_master where bank_id='" & txthidden.Text & "'")
        Return ds
    End Function

    Protected Sub mnuMenu_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles mnuMenu.MenuItemClick
        lblmsg.Text = ""
        If mnuMenu.Items(0).Enabled = True Then
            mnuMenu.Items(0).Selected = True
            mnuMenu.Items(1).Enabled = True
            mnuMenu.Items(0).Enabled = False
            MultiView1.ActiveViewIndex = 0
            txtbank.Text = ""
            txthidden.Text = ""
        Else
            objMid.PopulateList(drpbank, "bank_id", "bank_name", objMid.ExecuteSelectSQL("select * from bank_master").Tables(0))
            MultiView1.ActiveViewIndex = 1
            mnuMenu.Items(1).Selected = True
            mnuMenu.Items(1).Enabled = False
            mnuMenu.Items(0).Enabled = True
        End If
    End Sub


    Protected Sub imbedit_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbedit.Click
        Dim ds As New DataSet
        txthidden.Text = drpbank.SelectedValue
        MultiView1.ActiveViewIndex = 0
        ds = getBankData()
        If Not ds Is Nothing Then
            If ds.Tables(0).Rows.Count > 0 Then

                txtbank.Text = ds.Tables(0).Rows(0)("bank_Name").ToString()
                
            End If
        End If

    End Sub
End Class
