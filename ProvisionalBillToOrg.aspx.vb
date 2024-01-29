Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls

Partial Class mmsoft_ProvisionalBillToOrg
    Inherits System.Web.UI.Page

    Dim objMid As New MiddleLayer

    Private Sub GridBind()
        Dim ds As New DataSet
        Dim sql As String
        sql = "SELECT dbo.ProvBillDetails.ReceiptNos, dbo.ProvBillDetails.ReceiptDate, dbo.ProvBillDetails.RoomId, dbo.salesDetails.FName, dbo.salesDetails.LName, dbo.ProvBillDetails.ReceiptAmt, dbo.ProvBillDetails.AmtInLetters, dbo.ProvBillDetails.ModeOfPayment, dbo.ProvBillDetails.BankName, dbo.ProvBillDetails.BranchName, dbo.ProvBillDetails.OtherDetails, dbo.ProvBillDetails.Chequedate, dbo.ProvBillDetails.UserId, dbo.ProvBillDetails.CreatedDate, dbo.ProvBillDetails.Status FROM  dbo.ProvBillDetails INNER JOIN dbo.salesDetails ON dbo.ProvBillDetails.RoomId = dbo.salesDetails.RoomId WHERE (dbo.ProvBillDetails.Status = 'Pending')"
        ds = objMid.ExecuteSelectSQL(sql)
        Dim dt As New DataTable
        dt = ds.Tables(0)
        gvInterest.DataSource = dt
        gvInterest.DataBind()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            clearcontrols()
            GridBind()
        End If
    End Sub

    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
        Dim hiddenID As HtmlInputHidden
        Dim ReceiptId As Integer
        Dim ChkBox As CheckBox
        For Each gvRow As GridViewRow In gvInterest.Rows
            ChkBox = gvRow.FindControl("chkSelect")
            If ChkBox.Checked = True Then
                If gvRow.RowType = DataControlRowType.DataRow Then
                    hiddenID = gvRow.FindControl("HiddenID")
                    ReceiptId = CType(hiddenID.Value, Integer)
                End If
            End If
        Next
        lblReceiptNo.Text = ReceiptId
        lblNewReceiptNo.Text = getReceiptNo("BillDetails", "ReceiptNos")
        Call Display()
    End Sub

    Private Sub Display()
        Dim ds As New DataSet
        Dim dt As New DataTable
        Dim sql As String

        sql = "SELECT dbo.ProvBillDetails.ReceiptNos, dbo.ProvBillDetails.ReceiptDate, dbo.ProvBillDetails.RoomId, dbo.salesDetails.FName, dbo.salesDetails.LName, dbo.ProvBillDetails.ReceiptAmt, dbo.ProvBillDetails.AmtInLetters, dbo.ProvBillDetails.ModeOfPayment, dbo.ProvBillDetails.BankName, dbo.ProvBillDetails.BranchName, dbo.ProvBillDetails.OtherDetails, dbo.ProvBillDetails.Chequedate, dbo.ProvBillDetails.UserId, dbo.ProvBillDetails.CreatedDate, dbo.ProvBillDetails.Status FROM  dbo.ProvBillDetails INNER JOIN dbo.salesDetails ON dbo.ProvBillDetails.RoomId = dbo.salesDetails.RoomId WHERE (dbo.ProvBillDetails.Status = 'Pending')AND (dbo.ProvBillDetails.ReceiptNos = '" & lblReceiptNo.Text & "')"

        ds = objMid.ExecuteSelectSQL(sql)
        dt = ds.Tables(0)

        lblReceiptDate.Text = dt.Rows(0)("ReceiptDate").ToString()
        lblReceiptamt.Text = dt.Rows(0)("ReceiptAmt").ToString()
        lblBank.Text = dt.Rows(0)("BankName").ToString()
        lblBranch.Text = dt.Rows(0)("BranchName").ToString()
        lblChequeDate.Text = dt.Rows(0)("chequedate").ToString()
        lblFname.Text = dt.Rows(0)("fname").ToString()
        lblLName.Text = dt.Rows(0)("lname").ToString()
        lblModeOfPay.Text = dt.Rows(0)("ModeOfPayment").ToString()
        lblOtherDetails.Text = dt.Rows(0)("otherdetails").ToString()
        lblAmtInLetter.Text = dt.Rows(0)("AmtInLetters").ToString()
        txthidden.Text = dt.Rows(0)("Roomid").ToString()

    End Sub
    Private Sub UpdateBill()
        Dim sql As String
        sql = "Insert BillDetails (ReceiptNos,ReceiptDate,RoomId,ReceiptAmt,AmtInLetters,ModeOfPayment,BankName,BranchName,OtherDetails,chequedate,UserId,CreatedDate,ProvReceiptNos) Values("
        sql = sql & lblNewReceiptNo.Text & ",'" & Now.Date & "'," & txthidden.Text & "," & lblReceiptamt.Text & ",'" & lblAmtInLetter.Text & "',"
        sql = sql & "'" & lblModeOfPay.Text & "','" & lblBank.Text & "','" & lblBranch.Text & "','" & lblOtherDetails.Text & "','" & lblChequeDate.Text & "' ,'" & Session("USERID") & "','" & Now.Date & "'," & lblReceiptNo.Text & ")"
        objMid.ExecuteSqlStmt(sql)

       
        Dim ds As New DataSet
        Dim dt As New DataTable
        Dim i As Integer
        ds = objMid.ExecuteSelectSQL("Select * from ParticularsProvTable where ReceiptNos=" & lblReceiptNo.Text & "")
        dt = ds.Tables(0)
        For i = 0 To dt.Rows.Count - 1
            'particulars = dt.Rows(0)("otherdetails").ToString()
            'amount = CDbl(gvRow.Item(1).ToString())
            'Stage = myRow("Stage").ToString
            'Percentage = CInt(myRow("Percentage\\).ToString)
            objMid.ExecuteSqlStmt("Insert Into ParticularsTable(particulartblId,ReceiptNos,ParticularsId,ParticularsAmt) values(" & objMid.getUniqueID("ParticularsTable", "particulartblId") & "," & lblNewReceiptNo.Text & ",'" & dt.Rows(i)("ParticularsID").ToString() & "'," & dt.Rows(i)("ParticularsAmt").ToString() & ")")

        Next
        Session("ReceiptNos") = lblNewReceiptNo.Text
        Session("ProvReceiptNos") = lblReceiptNo.Text
    End Sub

    Public Function getReceiptNo(ByVal TableName As String, ByVal ColumnName As String) As Integer
        Dim myQuery As String
        Dim myDataSet As DataSet
        Dim myID As Integer
        myQuery = "Select MAX(" & ColumnName & ")+1 from " & TableName
        myDataSet = objMid.ExecuteSelectSQL(myQuery)
        myID = IIf(myDataSet.Tables(0).Rows(0).Item(0).ToString = "", 1, myDataSet.Tables(0).Rows(0).Item(0))
        Return myID
    End Function

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        objMid.ExecuteSqlStmt("update ProvBillDetails set Status='" & drpStatus.SelectedItem.Text & "' where ReceiptNos = " & lblReceiptNo.Text & "")
        If drpStatus.SelectedValue = "Honoured" Then
            Call UpdateBill()
            Response.Redirect("ProvToOrgBillLayout.aspx")
        ElseIf drpStatus.SelectedValue = "Bounced" Then
            Session("ReceiptNos") = lblReceiptNo.Text
            Response.Redirect("ProvisionalBillReturned.aspx")
        Else
            clearcontrols()
        End If
    End Sub
    Private Sub clearcontrols()
        lblReceiptDate.Text = ""
        lblReceiptamt.Text = ""
        lblBank.Text = ""
        lblBranch.Text = ""
        lblChequeDate.Text = ""
        lblFname.Text = ""
        lblLName.Text = ""
        lblModeOfPay.Text = ""
        lblOtherDetails.Text = ""
        lblAmtInLetter.Text = ""
        txthidden.Text = ""
        drpStatus.SelectedIndex = 0
        lblNewReceiptNo.Text = ""
        GridBind()
        lblReceiptNo.Text = ""
    End Sub

  
End Class
