Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls
Partial Class modifytrans
    Inherits System.Web.UI.Page
    Dim objMid As New MiddleLayer
    Dim constr As String = ConfigurationSettings.AppSettings("MyConnection")

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            lblId.Text = Session("LocId")
            MultiView1.ActiveViewIndex = 0
            txtchno.Enabled = False
            txtbank.Enabled = False
            txtbranch.Enabled = False
            chqDate.Enabled = False
        End If
        'pnldetails.Enabled = False
    End Sub

    Protected Sub drpmode_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpmode.SelectedIndexChanged
        If drpmode.SelectedItem.Text = "Cheque" Then
            txtchno.Enabled = True
            txtbank.Enabled = True
            txtbranch.Enabled = True
            chqDate.Enabled = True
        Else
            txtchno.Enabled = False
            txtbank.Enabled = False
            txtbranch.Enabled = False
            chqDate.Enabled = False
            txtchno.Text = ""
            txtbank.Text = ""
            txtbranch.Text = ""
        End If
    End Sub

    Protected Sub drpname_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpname.SelectedIndexChanged
        Dim con As New SqlConnection(constr)
        Dim selstr, getADDR As String
        con.Open()

        selstr = "Select * from customer_master where cust_name='" & drpname.Text & "'"

        Dim selcmd As New SqlCommand(selstr, con)
        Dim strreader As SqlDataReader

        strreader = selcmd.ExecuteReader()
        strreader.Read()
        getADDR = strreader("cust_add1")
        strreader.Close()
        txtaddr.Text = getADDR

        Dim exQuery As Integer

        Try
            exQuery = selcmd.ExecuteNonQuery

        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
        con.Close()
    End Sub

    'Protected Sub btndisplay_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btndisplay.Click
    '    If drptrans.Text = "" Then
    '        MsgBox("No Transaction for this customer")
    '        Exit Sub
    '    End If
    '    pnldetails.Enabled = True
    '    GETDATA()
    'End Sub
    
    'Sub populateScheme()
    '    drpmodel.Items.Insert(0, "-- Select --")
    '    drpmodel.Items(0).Value = ""
    '    Dim con As New SqlConnection(constr)
    '    con.Open()
    '    Dim strFind As String

    '    'Dim schID, modID As Integer
    '    strFind = "Select * from scheme_master"
    '    Dim cmdFind As New SqlCommand(strFind, con)
    '    Dim reader As SqlDataReader
    '    reader = cmdFind.ExecuteReader()

    '    drpmodel.Items.Add(reader("scheme_name"))

    '    reader.Close()
    '    con.Close()
    'End Sub
    Public Sub GETDATA()
        MultiView1.ActiveViewIndex = 1

        'For Finding Scheme and Model Name
        Dim con As New SqlConnection(constr)
        con.Open()
        Dim strFind As String
        Dim schID, modID As Integer
        strFind = "Select * from invest_trans where it_id='" & drptrans.Text & "'"
        Dim cmdFind As New SqlCommand(strFind, con)
        Dim reader As SqlDataReader
        reader = cmdFind.ExecuteReader()
        reader.Read()
        schID = reader("scheme_id")
        modID = reader("model_id")
        reader.Close()


        'For Finding Scheme Name
        Dim strSchN As String
        Dim schName As String
        strSchN = "Select scheme_name from scheme_master where scheme_id='" & schID & "'"
        Dim cmdSchN As New SqlCommand(strSchN, con)
        Dim readerS As SqlDataReader
        readerS = cmdSchN.ExecuteReader()
        readerS.Read()
        schName = readerS("scheme_name")
        readerS.Close()

        'For Finding Model Name
        Dim strModN As String
        Dim modName As String
        strModN = "Select model_name from model_master where model_id='" & modID & "'"
        Dim cmdModN As New SqlCommand(strModN, con)
        Dim readerM As SqlDataReader
        readerM = cmdModN.ExecuteReader()
        readerM.Read()
        modName = readerM("model_name")
        readerM.Close()


        'For Details
        'txtamt.Text = schName
        drpscheme.SelectedValue = schName
        drpmodel.SelectedValue = modName

        Dim strread As SqlDataReader
        Dim sql As String = "SELECT * FROM invest_trans WHERE it_id='" & drptrans.Text & "'"
        Dim cmd As New SqlCommand(sql, con)

        strread = cmd.ExecuteReader
        While strread.Read
            If IsDBNull(strread("agreement_date")) = False Then agreeDate.Date = strread("agreement_date")
            If IsDBNull(strread("scheme_tenure")) = False Then txttenure.Text = strread("scheme_tenure")
            If IsDBNull(strread("due_date")) = False Then dueDate.Date = strread("due_date")
            If IsDBNull(strread("down_pay")) = False Then txtdownpay.Text = strread("down_pay")
            If IsDBNull(strread("net_income")) = False Then txtnetinc.Text = strread("net_income")
            If IsDBNull(strread("installment")) = False Then txtinstallment.Text = strread("installment")
            If IsDBNull(strread("discount")) = False Then txtdisc.Text = strread("discount")
        End While
        strread.Close()


        Dim readPay As SqlDataReader
        Dim sqlPay As String = "SELECT * FROM payment_details WHERE it_id='" & drptrans.Text & "'"
        Dim cmdPay As New SqlCommand(sqlPay, con)

        readPay = cmdPay.ExecuteReader
        While readPay.Read
            If IsDBNull(readPay("amount")) = False Then txtamt.Text = readPay("amount")
            If IsDBNull(readPay("payment_mode")) = False Then drpmode.Text = readPay("payment_mode")
            If drpmode.SelectedIndex = 2 Then
                txtchno.Enabled = True
                txtbank.Enabled = True
                txtbranch.Enabled = True
                chqDate.Enabled = True
            Else
                txtchno.Enabled = False
                txtbank.Enabled = False
                txtbranch.Enabled = False
                chqDate.Enabled = False
            End If
            If IsDBNull(readPay("payment_date")) = False Then payDate.Date = readPay("payment_date")
            If IsDBNull(readPay("chq_no")) = False Then txtchno.Text = readPay("chq_no")
            If IsDBNull(readPay("chq_bank")) = False Then txtbank.Text = readPay("chq_bank")
            If IsDBNull(readPay("chq_branch")) = False Then txtbranch.Text = readPay("chq_branch")
            If IsDBNull(readPay("chq_date")) = False Then chqDate.Date = readPay("chq_date")
        End While
        readPay.Close()
        con.Close()

    End Sub

    Public Sub UPDATEDATA()
        Dim conn As New SqlConnection(constr)
        Dim strUp, strPay As String
        'Dim getId As Integer
        conn.Open()

        'strSel = "Select * from employee_master where emp_name='" & drpemp.Text & "'"
        'Dim selcmd As New SqlCommand(strSel, conn)
        'Dim strreader As SqlDataReader

        'strreader = selcmd.ExecuteReader()
        'strreader.Read()
        'getId = strreader("emp_id")
        'strreader.Close()


        'For Finding Scheme Id
        Dim strSch As String
        Dim schID As Integer
        strSch = "Select scheme_id from scheme_master where scheme_name='" & drpscheme.Text & "'"
        Dim cmdSch As New SqlCommand(strSch, conn)
        Dim reader As SqlDataReader
        reader = cmdSch.ExecuteReader()
        reader.Read()
        schID = reader("scheme_id")
        reader.Close()


        'For Finding Model Id
        Dim strMod As String
        Dim modID As Integer
        strMod = "Select model_id from model_master where model_name='" & drpmodel.Text & "'"
        Dim cmdMod As New SqlCommand(strMod, conn)
        Dim reader1 As SqlDataReader
        reader1 = cmdMod.ExecuteReader()
        reader1.Read()
        modID = reader1("model_id")
        reader1.Close()


        strUp = "Update invest_trans set scheme_id='" & schID & "',model_id='" & modID & "'," _
& " agreement_date='" & agreeDate.Date & "',scheme_tenure='" & txttenure.Text & "',due_date='" & dueDate.Date & "',down_pay='" & txtdownpay.Text & "'," _
& "net_income='" & txtnetinc.Text & "',installment='" & txtinstallment.Text & "',discount='" & txtdisc.Text & "' where it_id='" & drptrans.Text & "'"

        Dim cmd As New SqlCommand(strUp, conn)

        strPay = "Update payment_details set amount='" & txtamt.Text & "',payment_mode='" & drpmode.Text & "'," _
& " payment_date='" & payDate.Date & "',chq_no='" & txtchno.Text & "',chq_bank='" & txtbank.Text & "',chq_branch='" & txtbranch.Text & "'," _
& "chq_date='" & chqDate.Date & "' where it_id='" & drptrans.Text & "'"

        Dim cmdPay As New SqlCommand(strPay, conn)

        Dim exQuery, exQuery1 As Integer

        Try
            exQuery = cmd.ExecuteNonQuery
            exQuery1 = cmdPay.ExecuteNonQuery

        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
        conn.Close()
        MultiView1.ActiveViewIndex = 0
        drpname.SelectedIndex = 0
        drptrans.Items.Clear()
    End Sub

    'Protected Sub btnsubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnsubmit.Click
    '    UPDATEDATA()
    'End Sub

    Protected Sub imbEdit_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbEdit.Click
        If drptrans.Text = "" Then
            MsgBox("No Transaction for this customer")
            Exit Sub
        End If
        MultiView1.ActiveViewIndex = 1

        objMid.PopulateList(drpscheme, "scheme_name", "scheme_name", objMid.ExecuteSelectSQL("select * from scheme_master").Tables(0))
        objMid.PopulateList(drpmodel, "model_name", "model_name", objMid.ExecuteSelectSQL("select * from model_master").Tables(0))

        'Dim cmd As SqlCommand
        'cmd = New SqlCommand
        'cmd.CommandType = CommandType.Text
        'cmd.CommandText = "select * from scheme_master"
        'Call PrepareExecuteDataSet(cmd)
        'txtamt.Text = drpmodel.SelectedValue
        'drpmodel.SelectedValue = txtamt.Text
        'Call populateScheme()
        'drpscheme.Items.Clear()
        'Call PopulateList(drpscheme, "scheme_name", "scheme_name", ds.Tables(0))
        'pnldetails.Enabled = True
        GETDATA()
    End Sub
    'Private Sub PrepareExecuteDataSet(ByVal Command As SqlCommand) 'As DataSet
    '    Dim val As DataSet
    '    Dim adapter As SqlDataAdapter
    '    Dim con1 As SqlConnection
    '    'Try
    '    con1 = New SqlConnection(constr)
    '    adapter = New SqlDataAdapter
    '    adapter.SelectCommand = Command
    '    adapter.SelectCommand.Connection = con1
    '    val = New DataSet
    '    adapter.Fill(val)
    '    ds = val

    '    'Catch ex As Exception
    '    '    'Calling the function to raise the event OnExecuteError
    '    '    'ErrorOccured("UnKnown", ex.Message, "PrepareExceuteDataSet")
    '    '    val = Nothing
    '    'Finally
    '    '    If (con1.State = ConnectionState.Open) Then
    '    '        con1.Close()
    '    '    End If
    '    'End Try
    '    'Returning the result

    'End Sub
    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        UPDATEDATA()
    End Sub

    Protected Sub drpmode_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpmode.TextChanged
        If drpmode.SelectedItem.Text = "Cheque" Then
            txtchno.Enabled = True
            txtbank.Enabled = True
            txtbranch.Enabled = True
            chqDate.Enabled = True
        Else
            txtchno.Enabled = False
            txtbank.Enabled = False
            txtbranch.Enabled = False
            chqDate.Enabled = False
        End If
    End Sub
End Class
