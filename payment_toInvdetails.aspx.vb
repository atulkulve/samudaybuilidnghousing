Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls
Partial Class payment_toInvdetails
    Inherits System.Web.UI.Page
    Dim constr As String = ConfigurationSettings.AppSettings("MyConnection")


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'pnlChq.Visible = False
        If Not IsPostBack Then
            MultiView1.ActiveViewIndex = 1
            lblId.Text = Session("LocId")
            paymentGrid.Visible = False
            transactionGrid.Visible = False
            imbmore.Visible = False
            imbview.Visible = False
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

        'pnlTrans.Visible = True

        Dim exQuery As Integer

        Try
            exQuery = selcmd.ExecuteNonQuery
            imbmore.Visible = True
            transactionGrid.Visible = True
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
        con.Close()

    End Sub

    'Protected Sub btnshow_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnshow.Click

    '    'pnlChq.Visible = True
    '    MultiView1.ActiveViewIndex = 0
    '    Dim con As New SqlConnection(constr)
    '    con.Open()
    '    'Dim strSelcount As Integer
    '    'strSelcount = Session("Selected Count")
    '    ''Dim abc As Integer
    '    ''abc = strSelcount

    '    For Each row As GridViewRow In paymentGrid.Rows

    '        Dim rb As RadioButton = row.FindControl("rdselect")

    '        If rb.Checked = True Then
    '            Dim selId As String = Convert.ToString(paymentGrid.DataKeys(row.RowIndex).Value)

    '            'For Getting Data

    '            Dim reader As SqlDataReader
    '            Dim strSql As String = "SELECT * FROM pay_investor WHERE pi_id='" & selId & "'"
    '            Dim cmd As New SqlCommand(strSql, con)

    '            reader = cmd.ExecuteReader
    '            While reader.Read
    '                If IsDBNull(reader("chq_no")) = False Then txtchno.Text = reader("chq_no")
    '                If IsDBNull(reader("chq_bank")) = False Then txtbank.Text = reader("chq_bank")
    '                If IsDBNull(reader("chq_branch")) = False Then txtbranch.Text = reader("chq_branch")
    '                If IsDBNull(reader("chq_date")) = False Then chqDate.SelectedDate = reader("chq_date")
    '            End While
    '            reader.Close()
    '            Exit Sub

    '        Else
    '            txtchno.Text = ""
    '            txtbank.Text = ""
    '            txtbranch.Text = ""
    '            chqDate.SelectedDate = Date.Now
    '        End If
    '    Next
    '    con.Close()
    'End Sub

    'Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click
    '    Dim con As New SqlConnection(constr)
    '    Dim strUp As String
    '    'Dim getId As Integer
    '    con.Open()
    '    For Each row As GridViewRow In paymentGrid.Rows

    '        Dim rb As RadioButton = row.FindControl("rdselect")

    '        If rb.Checked = True Then
    '            Dim selId As String = Convert.ToString(paymentGrid.DataKeys(row.RowIndex).Value)
    '            strUp = "Update pay_investor set  chq_no='" & txtchno.Text & "',chq_bank='" & txtbank.Text & "',chq_branch='" & txtbranch.Text & "'," _
    '           & "chq_date='" & chqDate.Text & "' where pi_id='" & selId & "'"

    '            Dim cmdUp As New SqlCommand(strUp, con)

    '            Dim exQuery As Integer

    '            Try
    '                exQuery = cmdUp.ExecuteNonQuery


    '            Catch ex As Exception
    '                Response.Write(ex.Message)
    '            End Try
    '            MsgBox("Transaction Saved Successfully")
    '            con.Close()

    '        End If

    '    Next
    'End Sub

    'Protected Sub btnDisplay_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDisplay.Click
    '    'pnlPayment.Visible = True

    '    Dim con As New SqlConnection(constr)
    '    con.Open()

    '    For Each row As GridViewRow In transactionGrid.Rows

    '        Dim rbT As RadioButton = row.FindControl("rdTrans")

    '        'If paymentGrid.Rows.Count <= 0 Then
    '        '    pnlPayment.Visible = False
    '        '    MsgBox("No Data Present!")
    '        'End If

    '        If rbT.Checked = True Then
    '            Dim TrId As String = Convert.ToString(transactionGrid.DataKeys(row.RowIndex).Value)
    '            Session("TransID") = TrId

    '        End If
    '    Next
    '    con.Close()

    'End Sub
    Public Sub DisplayTransaction()
        Dim con As New SqlConnection(constr)
        con.Open()
        For Each row As GridViewRow In transactionGrid.Rows
            Dim rbT As RadioButton = row.FindControl("rdTrans")

            'If paymentGrid.Rows.Count <= 0 Then
            '    pnlPayment.Visible = False
            '    MsgBox("No Data Present!")
            'End If

            If rbT.Checked = True Then
                Dim TrId As String = Convert.ToString(transactionGrid.DataKeys(row.RowIndex).Value)
                Session("TransID") = TrId
                imbview.Visible = True
                paymentGrid.Visible = True
            End If
        Next
        con.Close()
    End Sub
    Protected Sub imbmore_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbmore.Click
        'pnlPayment.Visible = True
        Call DisplayTransaction()
    End Sub

    Protected Sub imbview_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbview.Click

        'pnlChq.Visible = True

        Dim con As New SqlConnection(constr)
        con.Open()
        'Dim strSelcount As Integer
        'strSelcount = Session("Selected Count")
        ''Dim abc As Integer
        ''abc = strSelcount

        For Each row As GridViewRow In paymentGrid.Rows

            Dim rb As RadioButton = row.FindControl("rdselect")

            If rb.Checked = True Then
                MultiView1.ActiveViewIndex = 0
                Dim selId As String = Convert.ToString(paymentGrid.DataKeys(row.RowIndex).Value)

                'For Getting Data

                Dim reader As SqlDataReader
                Dim strSql As String = "SELECT * FROM actual_payto_investor WHERE pi_id='" & selId & "'"
                Dim cmd As New SqlCommand(strSql, con)

                reader = cmd.ExecuteReader
                While reader.Read
                    If IsDBNull(reader("chq_no")) = False Then txtchno.Text = reader("chq_no")
                    If IsDBNull(reader("chq_bank")) = False Then txtbank.Text = reader("chq_bank")
                    If IsDBNull(reader("chq_branch")) = False Then txtbranch.Text = reader("chq_branch")
                    If IsDBNull(reader("chq_date")) = False Then chqDate.Date = reader("chq_date")
                End While
                reader.Close()

                Exit Sub

            Else
                txtchno.Text = ""
                txtbank.Text = ""
                txtbranch.Text = ""
                chqDate.Date = Date.Now
            End If
        Next
        con.Close()

    End Sub
    Public Sub UpdatePaytoInv()
        Dim objMid As New MiddleLayer
        Dim strSql As String
        strSql = "update payto_investors set Is_Issued = 'Yes' where it_id = '" & Session("TransID") & "'"
        objMid.ExecuteSelectSQL(strSql)
    End Sub

    Protected Sub imbsave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbsave.Click
        Dim con As New SqlConnection(constr)
        Dim strUp As String
        'Dim getId As Integer pay_investor
        con.Open()
        For Each row As GridViewRow In paymentGrid.Rows

            Dim rb As RadioButton = row.FindControl("rdselect")

            If rb.Checked = True Then
                Call UpdatePaytoInv()
                Dim selId As String = Convert.ToString(paymentGrid.DataKeys(row.RowIndex).Value)
                strUp = "Update actual_payto_investor set  chq_no='" & txtchno.Text & "',chq_bank='" & txtbank.Text & "',chq_branch='" & txtbranch.Text & "'," _
               & "chq_date='" & chqDate.Date & "' where pi_id='" & selId & "'"

                Dim cmdUp As New SqlCommand(strUp, con)

                Dim exQuery As Integer

                Try
                    exQuery = cmdUp.ExecuteNonQuery


                Catch ex As Exception
                    Response.Write(ex.Message)
                End Try
                'MsgBox("Transaction Saved Successfully")
                con.Close()
                MultiView1.ActiveViewIndex = 1
                DisplayTransaction()
                paymentGrid.Visible = False
                imbview.Visible = False
                Session("TransID") = "0"
            End If

        Next
    End Sub
End Class



