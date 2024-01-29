Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls

Partial Class modify_PaymenttoInv
    Inherits System.Web.UI.Page
    Dim objMid As New MiddleLayer
    Dim constr As String = ConfigurationSettings.AppSettings("MyConnection")

    Protected Sub imbOk_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbOk.Click
        If IsIssued() Then
            MultiView1.ActiveViewIndex = 1
            Dim ds As New DataSet
            ds = GetInvestmentTrans(drpInvestment.SelectedValue)
            If Not ds Is Nothing Then
                If ds.Tables(0).Rows.Count > 0 Then
                    If IsDBNull(ds.Tables(0).Rows(0)("cust_name").ToString()) = False Then lblCustName.Text = ds.Tables(0).Rows(0)("cust_name").ToString()
                    If IsDBNull(ds.Tables(0).Rows(0)("it_id").ToString()) = False Then lblInvId.Text = ds.Tables(0).Rows(0)("it_id").ToString()
                    If IsDBNull(ds.Tables(0).Rows(0)("scheme_name").ToString()) = False Then lblScheme.Text = ds.Tables(0).Rows(0)("scheme_name").ToString()
                    If IsDBNull(ds.Tables(0).Rows(0)("aggrement_date").ToString()) = False Then agreeDate.Date = ds.Tables(0).Rows(0)("aggrement_date").ToString()
                    If IsDBNull(ds.Tables(0).Rows(0)("paytoinv_tenure").ToString()) = False Then txttenure.Text = ds.Tables(0).Rows(0)("paytoinv_tenure").ToString()
                    If IsDBNull(ds.Tables(0).Rows(0)("due_date").ToString()) = False Then dueDate.Date = ds.Tables(0).Rows(0)("due_date").ToString()
                    If IsDBNull(ds.Tables(0).Rows(0)("amount").ToString()) = False Then txtamt.Text = ds.Tables(0).Rows(0)("amount").ToString()
                    If IsDBNull(ds.Tables(0).Rows(0)("inst_amount").ToString()) = False Then txtinstamt.Text = ds.Tables(0).Rows(0)("inst_amount").ToString()
                End If
            End If
            ds = Nothing
        Else
            lblEdit.Visible = True
            lblEdit.Text = "Cannot Edit Because Cheques are Issued"
        End If
    End Sub
    Public Function IsIssued() As Boolean
        Dim ds As New DataSet
        ds = GetIsIssued()
        If Not ds Is Nothing Then
            If ds.Tables(0).Rows.Count > 0 Then
                Return True
            End If
        End If
        ds = Nothing
        Return False
    End Function
    Public Function GetIsIssued() As DataSet
        Dim ds As New DataSet
        Dim query As String
        query = "select * from payto_investors where it_id='" & drpInvestment.SelectedValue & "' and Is_Issued='No'"
        ds = objMid.ExecuteSelectSQL(query)
        Return ds
    End Function
    Public Function GetInvestmentTrans(ByVal it_Id As String) As DataSet
        Dim ds As New DataSet
        Dim query As String
        query = "select * from payto_investors_view where it_id='" & it_Id & "'"
        ds = objMid.ExecuteSelectSQL(query)
        Return ds
    End Function
    Protected Sub PaymenttoInv_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            MultiView1.ActiveViewIndex = 0
            lblEdit.Visible = False
            objMid.PopulateList(drpCustomer, "cust_id", "cust_name", objMid.ExecuteSelectSQL("select * from customer_master where loc_id = '" & Session("LocId") & "'").Tables(0))
        End If
    End Sub

    Protected Sub drpCustomer_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpCustomer.SelectedIndexChanged
        objMid.PopulateList(drpInvestment, "it_id", "it_id", objMid.ExecuteSelectSQL("select * from payto_investors_view where cust_id = '" & drpCustomer.SelectedValue & "' and Is_Issued='No'").Tables(0))
    End Sub

    Protected Sub txttenure_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txttenure.TextChanged
        Dim i As Integer
        Dim myDate As String
        DueDate.Date = agreeDate.Date
        For i = 1 To txttenure.Text
            myDate = agreeDate.Date.AddMonths(i)
            DueDate.Date = myDate
        Next
    End Sub
    Public Function DeletePaymentToInvestors() As Boolean
        If objMid.ExecuteSqlStmt("delete payto_investors where it_id = '" & lblInvId.Text & "'") And objMid.ExecuteSqlStmt("delete actual_payto_investor where it_id = '" & lblInvId.Text & "'") Then
            Return True
        Else
            Return False
        End If
    End Function
    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
        If (DeletePaymentToInvestors()) Then
            Dim strsql As String
            strsql = "INSERT INTO payto_investors(it_id,aggrement_date,paytoinv_tenure," _
           & " due_date,inst_amount,amount)VALUES('" & lblInvId.Text & "','" & agreeDate.Date & "'," & txttenure.Text & "," _
           & " '" & dueDate.Date & "'," & txtinstamt.Text & "," & txtamt.Text & ")"
            objMid.ExecuteSelectSQL(strsql)
            Dim myDate As String
            Dim Instr As String
            Dim i As Integer
            For i = 1 To txttenure.Text
                myDate = agreeDate.Date.AddMonths(i)

                Instr = "Insert Into actual_payto_investor(it_id,pay_date,amount)values('" & lblInvId.Text & "','" & myDate & "','" & txtinstamt.Text & "')"

                objMid.ExecuteSelectSQL(Instr)
            Next
        Else
            lblmsg.Text = "Entry cannot be Modified"
        End If
        clearcontrols()
        MultiView1.ActiveViewIndex = 0
        drpCustomer.SelectedIndex = 0
        drpInvestment.Items.Clear()
        drpInvestment.Items.Insert(0, "-- Select --")
        drpInvestment.Items(0).Value = ""
        drpInvestment.SelectedIndex = 0
        lblEdit.Visible = False
        lblEdit.Text = ""
    End Sub
    Public Sub clearcontrols()
        lblCustName.Text = ""
        lblInvId.Text = ""
        lblScheme.Text = ""
        txtamt.Text = ""
        txttenure.Text = ""
        lblmsg.Text = ""
        lblmsg.Visible = False
    End Sub
End Class
