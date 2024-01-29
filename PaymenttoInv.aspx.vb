Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls

Partial Class PaymenttoInv
    Inherits System.Web.UI.Page
    Dim objMid As New MiddleLayer
    Dim constr As String = ConfigurationSettings.AppSettings("MyConnection")

    Protected Sub imbOk_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbOk.Click
        If IsIssued() Then
            lblmsg.Text = ""
            lblmsg.Visible = False
            MultiView1.ActiveViewIndex = 1
            Dim ds As New DataSet
            ds = GetInvestmentTrans(drpInvestment.SelectedValue)
            If Not ds Is Nothing Then
                If ds.Tables(0).Rows.Count > 0 Then
                    If IsDBNull(ds.Tables(0).Rows(0)("cust_name").ToString()) = False Then lblCustName.Text = ds.Tables(0).Rows(0)("cust_name").ToString()
                    If IsDBNull(ds.Tables(0).Rows(0)("it_id").ToString()) = False Then lblInvId.Text = ds.Tables(0).Rows(0)("it_id").ToString()
                    If IsDBNull(ds.Tables(0).Rows(0)("scheme_name").ToString()) = False Then lblScheme.Text = ds.Tables(0).Rows(0)("scheme_name").ToString()
                    If IsDBNull(ds.Tables(0).Rows(0)("agreement_date").ToString()) = False Then agreeDate.Date = ds.Tables(0).Rows(0)("agreement_date").ToString()
                End If
            End If
            ds = Nothing
        Else
            lblmsg.Visible = True
            lblmsg.Text = "Alreay Issued Payment for this Investment"
        End If
    End Sub
    Public Function IsIssued() As Boolean
        Dim ds As New DataSet
        ds = GetIsIssued()
        If Not ds Is Nothing Then
            If ds.Tables(0).Rows.Count > 0 Then
                Return False
            End If
        End If
        ds = Nothing
        Return True
    End Function
    Public Function GetIsIssued() As DataSet
        Dim ds As New DataSet
        Dim query As String
        query = "select * from payto_investors where it_id='" & drpInvestment.SelectedValue & "'"
        ds = objMid.ExecuteSelectSQL(query)
        Return ds
    End Function
    Public Function GetInvestmentTrans(ByVal it_Id As String) As DataSet
        Dim ds As New DataSet
        Dim query As String
        query = "select * from Invesment_Transaction_view where it_id='" & it_Id & "'"
        ds = objMid.ExecuteSelectSQL(query)
        Return ds
    End Function
    Protected Sub PaymenttoInv_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            MultiView1.ActiveViewIndex = 0
            objMid.PopulateList(drpCustomer, "cust_id", "cust_name", objMid.ExecuteSelectSQL("select * from customer_master where loc_id = '" & Session("LocId") & "'").Tables(0))
            lblmsg.Text = ""
            lblmsg.Visible = False
        End If
    End Sub

    Protected Sub drpCustomer_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpCustomer.SelectedIndexChanged
        objMid.PopulateList(drpInvestment, "it_id", "it_id", objMid.ExecuteSelectSQL("select * from invest_trans where cust_id = '" & drpCustomer.SelectedValue & "'").Tables(0))
    End Sub

    Protected Sub txttenure_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txttenure.TextChanged
        Dim i As Integer
        Dim myDate As String
        dueDate.Date = agreeDate.Date
        For i = 1 To txttenure.Text
            myDate = agreeDate.Date.AddMonths(i)
            dueDate.Date = myDate
        Next
    End Sub

    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
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
        clearcontrols()
        MultiView1.ActiveViewIndex = 0
        drpCustomer.SelectedIndex = 0
        lblmsg.Text = ""
        lblmsg.Visible = False
    End Sub
    Public Sub clearcontrols()
        lblCustName.Text = ""
        lblInvId.Text = ""
        lblScheme.Text = ""
        txtamt.Text = ""
        txttenure.Text = ""
    End Sub
End Class
