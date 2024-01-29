Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Partial Class mmsoft_ModifyPaymentEntry
    Inherits System.Web.UI.Page
    Dim constr As String = ConfigurationSettings.AppSettings("MyConnection")
    Dim ObjMid As New MiddleLayer

    Protected Sub imbOk_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbOk.Click
        txtfromdate.Text = fromdate.Date
        txttodate.Text = todate.Date
        MultiView1.ActiveViewIndex = 0
    End Sub

    Protected Sub imbview_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbview.Click
        Dim con As New SqlConnection(constr)
        con.Open()
        For Each row As GridViewRow In paymentGrid.Rows
            Dim rbT As RadioButton = row.FindControl("rdTrans")

            'If paymentGrid.Rows.Count <= 0 Then
            '    pnlPayment.Visible = False
            '    MsgBox("No Data Present!")
            'End If

            If rbT.Checked = True Then
                Dim TrId As String = Convert.ToString(paymentGrid.DataKeys(row.RowIndex).Value)
                Session("TransID") = TrId
                ObjMid.PopulateList(drpaccounthead, "accounthead_id", "accounthead_name", ObjMid.ExecuteSelectSQL("select * from accounthead_master").Tables(0))
                MultiView1.ActiveViewIndex = 1
                DisplayData()
            End If
        Next
        con.Close()

    End Sub
    Public Function getBankData() As DataSet
        Dim ds As New DataSet
        ds = ObjMid.ExecuteSelectSQL("select * from transaction_account where trans_id='" & Session("TransID") & "'")
        Return ds
    End Function
    Public Sub DisplayData()
        Dim ds As New DataSet
        ds = getBankData()
        If Not ds Is Nothing Then
            If ds.Tables(0).Rows.Count > 0 Then
                trans_date.Date = ds.Tables(0).Rows(0)("trans_date").ToString()
                drpaccounthead.SelectedValue = ds.Tables(0).Rows(0)("accounthead_id").ToString()
                txtamount.Text = ds.Tables(0).Rows(0)("trans_amount").ToString()
                txtnarration.Text = ds.Tables(0).Rows(0)("trans_narration").ToString()
            End If
        End If

    End Sub

    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
        ObjMid.ExecuteSqlStmt("delete transaction_account where trans_id = '" & Session("TransID") & "'")
        Dim strsql As String
        strsql = "INSERT INTO transaction_account(trans_date,accounthead_id,trans_amount,trans_narration,tr_type) values(" _
       & "'" & trans_date.Date & "','" & drpaccounthead.SelectedValue & "'," & CInt(txtamount.Text) & "," _
       & " '" & txtnarration.Text & "','P')"
        ObjMid.ExecuteSelectSQL(strsql)

        clearcontrols()
        Session("TransID") = ""
        Response.Redirect("ModifyPaymentEntry.aspx")
    End Sub
    Public Sub clearcontrols()
        txtamount.Text = ""
        txtnarration.Text = ""
        drpaccounthead.SelectedIndex = 0
        Dim mydate As Date
        trans_date.Date = mydate.Date
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ObjMid.PopulateList(drpaccounthead, "accounthead_id", "accounthead_name", ObjMid.ExecuteSelectSQL("select * from accounthead_master").Tables(0))
            MultiView1.ActiveViewIndex = 2
        End If
    End Sub

    Protected Sub imbCancel_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbCancel.Click
        Session("TransID") = ""
        MultiView1.ActiveViewIndex = 2
        Response.Redirect("ModifyPaymentEntry.aspx")
    End Sub
End Class
