Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls

Partial Class mmsoft_TransactionACPayment
    Inherits System.Web.UI.Page

    Dim objMid As New MiddleLayer
    Dim PaymentDetailsTbl As DataTable
    Dim StageDesc As DataColumn
    Dim myrow As DataRow
    Dim DueDate As DataColumn
    Dim TotalAmt As DataColumn
    Dim OutStanding As DataColumn
    Dim OverDueDays As DataColumn
    Dim Interest As DataColumn

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
            If Not Session("TempPaymentDetailsTbl") Is Nothing Then
                Session("TempPaymentDetailsTbl") = Nothing
            End If
            If Not Session("RoomID") Is Nothing Then
                Session("RoomID") = Nothing
            End If
            If Not Session("Edit") Is Nothing Then
                Session("Edit") = Nothing

            End If
            'objMid.PopulateList(drpFlatnumber, "RoomId", "RoomNumber", objMid.ExecuteSelectSQL("select * from Room").Tables(0))
            objMid.PopulateList(drpSite, "SiteId", "SiteName", objMid.ExecuteSelectSQL("select * from Site").Tables(0))
            objMid.PopulateList(drpParticulars, "ParticularsId", "ParticularsName", objMid.ExecuteSelectSQL("select * from ParticularsMaster").Tables(0))
        End If
    End Sub


    Private Sub Display()
        'Dim ds As New DataSet
        'Dim dt As New DataTable
        'Dim sql As String

        'sql = "SELECT dbo.ProvBillDetails.ReceiptNos, dbo.ProvBillDetails.ReceiptDate, dbo.ProvBillDetails.RoomId, dbo.salesDetails.FName, dbo.salesDetails.LName, dbo.ProvBillDetails.ReceiptAmt, dbo.ProvBillDetails.AmtInLetters, dbo.ProvBillDetails.ModeOfPayment, dbo.ProvBillDetails.BankName, dbo.ProvBillDetails.BranchName, dbo.ProvBillDetails.OtherDetails, dbo.ProvBillDetails.Chequedate, dbo.ProvBillDetails.UserId, dbo.ProvBillDetails.CreatedDate, dbo.ProvBillDetails.Status FROM  dbo.ProvBillDetails INNER JOIN dbo.salesDetails ON dbo.ProvBillDetails.RoomId = dbo.salesDetails.RoomId WHERE (dbo.ProvBillDetails.Status = 'Pending')AND (dbo.ProvBillDetails.ReceiptNos = '" & lblReceiptNo.Text & "')"

        'ds = objMid.ExecuteSelectSQL(sql)
        'dt = ds.Tables(0)

        'lblReceiptDate.Text = dt.Rows(0)("ReceiptDate").ToString()
        'lblReceiptamt.Text = dt.Rows(0)("ReceiptAmt").ToString()
        'lblBank.Text = dt.Rows(0)("BankName").ToString()
        'lblBranch.Text = dt.Rows(0)("BranchName").ToString()
        'lblChequeDate.Text = dt.Rows(0)("chequedate").ToString()
        'lblFname.Text = dt.Rows(0)("fname").ToString()
        'lblLName.Text = dt.Rows(0)("lname").ToString()
        'lblModeOfPay.Text = dt.Rows(0)("ModeOfPayment").ToString()
        'lblOtherDetails.Text = dt.Rows(0)("otherdetails").ToString()
        'lblAmtInLetter.Text = dt.Rows(0)("AmtInLetters").ToString()
        'txthidden.Text = dt.Rows(0)("Roomid").ToString()

    End Sub
    Private Sub UpdateBill()
        'Dim sql As String
        'sql = "Insert BillDetails (ReceiptNos,ReceiptDate,RoomId,ReceiptAmt,AmtInLetters,ModeOfPayment,BankName,BranchName,OtherDetails,chequedate,UserId,CreatedDate,ProvReceiptNos) Values("
        'sql = sql & lblNewReceiptNo.Text & ",'" & Now.Date & "'," & txthidden.Text & "," & lblReceiptamt.Text & ",'" & lblAmtInLetter.Text & "',"
        'sql = sql & "'" & lblModeOfPay.Text & "','" & lblBank.Text & "','" & lblBranch.Text & "','" & lblOtherDetails.Text & "','" & lblChequeDate.Text & "' ,'" & Session("USERID") & "','" & Now.Date & "'," & lblReceiptNo.Text & ")"
        'objMid.ExecuteSqlStmt(sql)


        'Dim ds As New DataSet
        'Dim dt As New DataTable
        'Dim i As Integer
        'ds = objMid.ExecuteSelectSQL("Select * from ParticularsProvTable where ReceiptNos=" & lblReceiptNo.Text & "")
        'dt = ds.Tables(0)
        'For i = 0 To dt.Rows.Count - 1
        '    'particulars = dt.Rows(0)("otherdetails").ToString()
        '    'amount = CDbl(gvRow.Item(1).ToString())
        '    'Stage = myRow("Stage").ToString
        '    'Percentage = CInt(myRow("Percentage\\).ToString)
        '    objMid.ExecuteSqlStmt("Insert Into ParticularsTable(particulartblId,ReceiptNos,ParticularsId,ParticularsAmt) values(" & objMid.getUniqueID("ParticularsTable", "particulartblId") & "," & lblNewReceiptNo.Text & ",'" & dt.Rows(i)("ParticularsID").ToString() & "'," & dt.Rows(i)("ParticularsAmt").ToString() & ")")

        'Next
        'Session("ReceiptNos") = lblNewReceiptNo.Text
        'Session("ProvReceiptNos") = lblReceiptNo.Text
    End Sub

    Public Function getTransactId(ByVal TableName As String, ByVal ColumnName As String) As Integer
        Dim myQuery As String
        Dim myDataSet As DataSet
        Dim myID As Integer
        myQuery = "Select MAX(" & ColumnName & ")+1 from " & TableName
        myDataSet = objMid.ExecuteSelectSQL(myQuery)
        myID = IIf(myDataSet.Tables(0).Rows(0).Item(0).ToString = "", 1, myDataSet.Tables(0).Rows(0).Item(0))
        Return myID
    End Function

    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
        'objMid.ExecuteSqlStmt("update ProvBillDetails set Status='" & drpStatus.SelectedItem.Text & "' where ReceiptNos = " & lblReceiptNo.Text & "")
        'If drpStatus.SelectedValue = "Honoured" Then
        '    Call UpdateBill()
        '    Response.Redirect("ProvToOrgBillLayout.aspx")
        'Else
        '    clearcontrols()
        'End If
        If Trim(txtTransactAmt.Text) = "" Then
            lblmsg.Text = "Please Select the Particulars against the payment to be made"
            Exit Sub
        End If
        If Val(txtTransactPayamt.Text) > Val(txtTransactAmt.Text) Then
            lblmsg.Text = "Paid Amount cannot be more than actual transaction amount"
            Exit Sub
        End If

        Dim sql As String
        Dim TransactId As Integer
        TransactId = getTransactId("tbl_Transaction_Details", "Transact_Id")
        sql = "Insert into tbl_Transaction_Details (Transact_Id,RoomId,ParticularsId,Transact_Amt,Transact_Type,Transact_Date,Transact_Remarks,Transact_IsModify) Values("
        sql = sql & TransactId & ",'" & drpFlatnumber.SelectedValue & "'," & drpParticulars.SelectedValue & "," & Val(txtTransactPayamt.Text) * -1 & ",'" & drpPaymentType.Text & "',"
        sql = sql & "'" & TransactdatePay.Date & "','" & txtRemarks.Text & "',0)"
        objMid.ExecuteSqlStmt(sql)
        clearcontrols()
        Dim ds As New DataSet
        ds = objMid.ExecuteSelectSQL("SELECT * FROM vw_transaction_Sum where RoomID = '" & drpFlatnumber.SelectedValue & "'")
        gvInterest.DataSource = ds
        gvInterest.DataBind()
        lblmsg.Text = "Payment made"
    End Sub
    Private Sub clearcontrols()
        drpParticulars.SelectedIndex = 0
        'transactdate.Date = Now.Date
        txtTransactAmt.Text = ""
        txtTransactPayamt.Text = ""
        TransactdatePay.Date = Now.Date
        txtRemarks.Text = ""
        drpPaymentType.SelectedIndex = 0
    End Sub


    Protected Sub drpSite_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpSite.SelectedIndexChanged
        objMid.PopulateList(drpBuilding, "BldgId", "BldgName", objMid.ExecuteSelectSQL("select * from building where siteid = '" & drpSite.SelectedValue & "'").Tables(0))
    End Sub

    Protected Sub drpBuilding_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpBuilding.SelectedIndexChanged
        objMid.PopulateList(drpFlatnumber, "RoomId", "RoomNumber", objMid.ExecuteSelectSQL("select * from Room where Bldgid = '" & drpBuilding.SelectedValue & "' and Booked='Yes'").Tables(0))
    End Sub

    Protected Sub drpFlatnumber_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpFlatnumber.SelectedIndexChanged
        If Not Session("TempPaymentDetailsTbl") Is Nothing Then
            Session("TempPaymentDetailsTbl") = Nothing
        End If
        If Not Session("RoomID") Is Nothing Then
            Session("RoomID") = Nothing
        End If
        Dim ds As New DataSet

        Dim ast As New DataTable



        ds = objMid.ExecuteSelectSQL("SELECT RoomId, SiteId, BldgId, SqFt, Rate, FName, LName, SFName, SLName, Add1, Add2, telno, Mobno, email, saledate, Bank FROM dbo.salesDetails where RoomID = '" & drpFlatnumber.SelectedValue & "'")

        ast = ds.Tables(0)
        If ast.Rows.Count > 0 Then
            If Not ds Is Nothing Then
                lblFname.Text = ds.Tables(0).Rows(0)("FName").ToString
                lblLName.Text = ds.Tables(0).Rows(0)("LName").ToString
                lblSFName.Text = ds.Tables(0).Rows(0)("SFName").ToString
                lblSLName.Text = ds.Tables(0).Rows(0)("SLName").ToString
                lblAddress.Text = ds.Tables(0).Rows(0)("Add1").ToString & ", " & ds.Tables(0).Rows(0)("Add2").ToString
                lblemail.Text = ds.Tables(0).Rows(0)("email").ToString
            End If
        End If
        ds = Nothing

        ds = objMid.ExecuteSelectSQL("SELECT * FROM vw_transaction_Sum where RoomID = '" & drpFlatnumber.SelectedValue & "'")
        gvInterest.DataSource = ds
        gvInterest.DataBind()

        'If Session("TempPaymentDetailsTbl") Is Nothing Then
        '    CreatePaymentDetailsTbl()
        'End If
        'Dim i As Integer
        'PaymentDetailsTbl = Session("TempPaymentDetailsTbl")
        'Dim ds2 As New DataSet
        'ds2 = objMid.ExecuteSelectSQL("SELECT * FROM vw_Transaction_Details where RoomID = '" & drpFlatnumber.SelectedValue & "'")
        'ds = objMid.ExecuteSelectSQL("SELECT * FROM vw_transaction_Sum where RoomID = '" & drpFlatnumber.SelectedValue & "'")
        'Dim dt As DataTable
        'dt = ds.Tables(0)
        'Dim duedate As New Date
        'Dim duedays As Integer
        'Dim interest As Double
        'Dim paymentamount As Double
        'If Not ds Is Nothing Then
        '    If dt.Rows.Count > 0 Then
        '        For i = 0 To dt.Rows.Count - 1
        '            myrow = PaymentDetailsTbl.NewRow()
        '            myrow("Stage Description") = dt.Rows(i)("StageDesc").ToString()
        '            duedate = dt.Rows(i)("DueDate").ToString()
        '            myrow("Due Date") = Convert.ToDateTime(duedate.Date).ToString("dd-MMM-yy")
        '            myrow("Total Amount") = dt.Rows(i)("TotalPayment").ToString()
        '            paymentamount = dt.Rows(i)("OutStanding").ToString()
        '            myrow("OutStanding Amount") = dt.Rows(i)("OutStanding").ToString()
        '            If (duedate.Date < Now.Date) Then
        '                duedays = DateDiff(DateInterval.Day, duedate, Now.Date)
        '                interest = (paymentamount * 21 * duedays) / 36500
        '            Else
        '                duedays = 0
        '                interest = 0
        '            End If

        '            myrow("Over Days Due") = duedays

        '            myrow("Interest") = Round(interest)
        '            PaymentDetailsTbl.Rows.Add(myrow)
        '        Next
        '    End If
        'End If
    End Sub
    Public Sub CreatePaymentDetailsTbl()
        PaymentDetailsTbl = New DataTable("PaymentDetailsTbl")
        StageDesc = New DataColumn("Stage Description", System.Type.GetType("System.String"))
        DueDate = New DataColumn("Due Date", System.Type.GetType("System.String"))
        TotalAmt = New DataColumn("Total Amount", System.Type.GetType("System.String"))
        OutStanding = New DataColumn("OutStanding Amount", System.Type.GetType("System.String"))
        OverDueDays = New DataColumn("Over Days Due", System.Type.GetType("System.String"))
        Interest = New DataColumn("Interest", System.Type.GetType("System.String"))


        PaymentDetailsTbl.Columns.Add(StageDesc)
        PaymentDetailsTbl.Columns.Add(TotalAmt)
        PaymentDetailsTbl.Columns.Add(OutStanding)
        PaymentDetailsTbl.Columns.Add(DueDate)
        PaymentDetailsTbl.Columns.Add(OverDueDays)
        PaymentDetailsTbl.Columns.Add(Interest)


        Session("TempPaymentDetailsTbl") = PaymentDetailsTbl
    End Sub
    Protected Sub imbEdit_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbEdit.Click
        Dim txtpartiId As HtmlInputHidden
        Dim txtamtgrid As HtmlInputHidden

        Dim ChkBox As CheckBox
        Dim ds As New DataSet
        For Each gvRow As GridViewRow In gvInterest.Rows
            ChkBox = gvRow.FindControl("chkSelect")
            If ChkBox.Checked = True Then
                If gvRow.RowType = DataControlRowType.DataRow Then
                    txtpartiId = gvRow.FindControl("txtpartiIdgrid")
                    drpParticulars.SelectedValue = CType(txtpartiId.Value, Integer)
                    txtamtgrid = gvRow.FindControl("txtamtgrid")
                    txtTransactAmt.Text = CType(txtamtgrid.Value, Integer)

                    'ds = objMid.ExecuteSelectSQL("select * from tbl_Transaction_Details where Transact_Id = " & KaduId & "")
                    'drpParticulars.SelectedValue = ds.Tables(0).Rows(0)("ParticularsId").ToString
                    'transactdate.Date = ds.Tables(0).Rows(0)("Transact_Date").ToString
                    'txtTransactAmt.Text = ds.Tables(0).Rows(0)("Transact_Amt").ToString

                End If
            End If
        Next
    End Sub

    Protected Sub imbCancel_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbCancel.Click
        clearcontrols()
    End Sub
End Class
