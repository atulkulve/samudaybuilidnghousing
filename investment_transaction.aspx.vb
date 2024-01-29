Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls
Partial Class investment_transaction
    Inherits System.Web.UI.Page
    Dim constr As String = ConfigurationSettings.AppSettings("MyConnection")
    Dim objMid As New MiddleLayer
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblId.Text = Session("LocId")
        'MultiView1.ActiveViewIndex = 1
    End Sub

    'Protected Sub btnsubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnsubmit.Click
    '    ADDDATA()
    'End Sub
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

    Public Sub ADDDATA()

        Dim con As New SqlConnection(constr)
        Dim strIn, sqlIn, Instr As String
        Dim selstr, upstr As String
        Dim invID As String
        Dim getID, incrID As Integer

        con.Open()
        selstr = "Select * from invrunningID where inv_id = 1"

        Dim selcmd As New SqlCommand(selstr, con)
        Dim strreader As SqlDataReader

        strreader = selcmd.ExecuteReader()
        strreader.Read()
        getID = strreader("inv_tag")
        invID = "INV" & CStr(getID + 1)

        incrID = getID + 1

        upstr = "Update invrunningID set inv_tag= '" & incrID & "' where inv_id=" & 1 & ""
        Dim upcmd As New SqlCommand(upstr, con)
        strreader.Close()

        'For Finding Scheme Id
        Dim strSch As String
        Dim schID As Integer
        strSch = "Select scheme_id from scheme_master where scheme_name='" & drpscheme.Text & "'"
        Dim cmdSch As New SqlCommand(strSch, con)
        Dim reader As SqlDataReader
        reader = cmdSch.ExecuteReader()
        reader.Read()
        schID = reader("scheme_id")
        reader.Close()

        'For Finding Customer Id
        Dim strCust As String
        Dim custID As String
        strCust = "Select cust_id from customer_master where cust_name='" & drpname.Text & "'"
        Dim cmdCust As New SqlCommand(strCust, con)
        Dim custRead As SqlDataReader
        custRead = cmdCust.ExecuteReader()
        custRead.Read()
        custID = custRead("cust_id")
        custRead.Close()


        'For Finding Model Id
        Dim strMod As String
        Dim modID As Integer
        strMod = "Select model_id from model_master where model_name='" & drpmodel.Text & "'"
        Dim cmdMod As New SqlCommand(strMod, con)
        Dim reader1 As SqlDataReader
        reader1 = cmdMod.ExecuteReader()
        reader1.Read()
        modID = reader1("model_id")
        reader1.Close()

        'For Initial Investment Record
        strIn = "INSERT INTO invest_trans(it_id,loc_id,cust_id,scheme_id,model_id,agreement_date,scheme_tenure," _
       & " due_date,down_pay,net_income,installment,discount)VALUES('" & invID & "','" & lblId.Text & "','" & custID & "'," _
       & " '" & schID & "','" & modID & "'," _
       & " '" & agreeDate.Date & "','" & drptenure.SelectedItem.Text & "'," _
       & " '" & dueDate.Date & "','" & txtdownpay.Text & "'," _
       & " '" & txtnetinc.Text & "','" & txtinstallment.Text & "','" & txtdisc.Text & "')"

        Dim cmdIn As New SqlCommand(strIn, con)

        'For down Payment
        sqlIn = "INSERT INTO payment_details(it_id,loc_id,cust_id,amount,payment_mode," _
        & " payment_date,chq_no,chq_bank,chq_branch,chq_date)values('" & invID & "','" & lblId.Text & "'," _
        & "'" & custID & "','" & txtdownpay.Text & "','" & drpmode.Text & "'," _
        & "'" & payDate.Date & "','" & txtchno.Text & "','" & txtbank.Text & "','" & txtbranch.Text & "'," _
        & "'" & chqDate.Date & "')"

        Dim cmdSql As New SqlCommand(sqlIn, con)


        'For pay_investor details
        Dim myDate As String
        Dim i As Integer
        For i = 1 To drptenure.SelectedItem.Text
            myDate = agreeDate.Date.AddMonths(i)

            Instr = "Insert Into pay_investor(it_id,pay_date,amount)values('" & invID & "','" & myDate & "','" & txtnetinc.Text & "')"

            Dim exQuery As Integer
            Dim cmdDt As New SqlCommand(Instr, con)

            Try
                exQuery = cmdDt.ExecuteNonQuery

            Catch ex As Exception
                Response.Write(ex.Message)
            End Try

            'MsgBox(myD)
        Next
        Call PayToInvestors(invID)
        Dim exQ1, exQ2, exQ3, exQ4, exQ5, exQ6, exQ7 As Integer
        Try
            exQ1 = selcmd.ExecuteNonQuery
            exQ2 = upcmd.ExecuteNonQuery
            exQ3 = cmdIn.ExecuteNonQuery
            exQ4 = cmdSql.ExecuteNonQuery
            exQ5 = cmdSch.ExecuteNonQuery
            exQ6 = cmdMod.ExecuteNonQuery
            exQ7 = cmdCust.ExecuteNonQuery

        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
        con.Close()
        Response.Redirect("UserMenu.aspx")
    End Sub

    Public Sub PayToInvestors(ByVal InvestID As String)
        Dim strsql As String
        strsql = "INSERT INTO payto_investors(it_id,aggrement_date,paytoinv_tenure," _
       & " due_date,inst_amount,amount)VALUES('" & InvestID & "','" & agreeDate.Date & "'," & drptenure.SelectedItem.Text & "," _
       & " '" & dueDate.Date & "'," & txtinstallment.Text & ",0)"
        objMid.ExecuteSelectSQL(strsql)
        Dim myDate As String
        Dim Instr As String
        Dim i As Integer
        For i = 1 To drptenure.Text
            myDate = agreeDate.Date.AddMonths(i)

            Instr = "Insert Into actual_payto_investor(it_id,pay_date,amount)values('" & InvestID & "','" & myDate & "','" & txtinstallment.Text & "')"

            objMid.ExecuteSelectSQL(Instr)
        Next
    End Sub
    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
        ADDDATA()
    End Sub

    Protected Sub txtamt_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtamt.TextChanged
        If (txtdownpay.Text = "") Then txtdownpay.Text = "0"
        If (txtamt.Text = "") Then txtamt.Text = "0"
        If (txtdisc.Text = "") Then txtdisc.Text = "0"
        txtdownpay.Text = CInt(txtamt.Text) - CInt(txtdisc.Text)
    End Sub

    Protected Sub txtdisc_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtdisc.TextChanged
        If (txtdownpay.Text = "") Then txtdownpay.Text = "0"
        If (txtamt.Text = "") Then txtamt.Text = "0"
        If (txtdisc.Text = "") Then txtdisc.Text = "0"
        txtdownpay.Text = CInt(txtamt.Text) - CInt(txtdisc.Text)
    End Sub
End Class
