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
            If Not Session("TempPaymentDetailsTbl") Is Nothing Then
                Session("TempPaymentDetailsTbl") = Nothing
            End If
            If Not Session("RoomID") Is Nothing Then
                Session("RoomID") = Nothing
            End If
            If Not Session("Edit") Is Nothing Then
                Session("Edit") = Nothing
                Session("Edit") = "False"
            End If
            Session("Edit") = "False"
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
        If Session("Edit") = "False" Then
            Dim sql As String
            Dim TransactId As Integer
            TransactId = getTransactId("tbl_Transaction_Details", "Transact_Id")
            sql = "Insert into tbl_Transaction_Details (Transact_Id,RoomId,ParticularsId,Transact_Amt,Transact_Type,Transact_Date,Transact_Remarks,Transact_IsModify) Values("
            sql = sql & TransactId & ",'" & drpFlatnumber.SelectedValue & "'," & drpParticulars.SelectedValue & "," & txtTransactAmt.Text & ",'INIT',"
            sql = sql & "'" & transactdate.Date & "','-',0)"
            objMid.ExecuteSqlStmt(sql)
            clearcontrols()
        Else
            Dim sql As String
            Dim TransactId As Integer
            TransactId = txthidden.Text
            sql = "update tbl_Transaction_Details set Transact_Date='" & transactdate.Date & "',ParticularsId='" & drpParticulars.SelectedValue & "',Transact_Amt='" & txtTransactAmt.Text & "' where Transact_Id = " & TransactId & ""
            objMid.ExecuteSqlStmt(sql)
            clearcontrols()
            gvInterest.DataSource = Nothing
            gvInterest.DataBind()
            Session("Edit") = "False"
        End If
    End Sub
    Private Sub clearcontrols()
        drpParticulars.SelectedIndex = 0
        transactdate.Date = Now.Date
        txtTransactAmt.Text = ""
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

        ds = objMid.ExecuteSelectSQL("SELECT * FROM vw_Transaction_Details where RoomID = '" & drpFlatnumber.SelectedValue & "' and Transact_Amt > 0")
        gvInterest.DataSource = ds
        gvInterest.DataBind()

    End Sub

    Protected Sub imbEdit_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbEdit.Click
        Dim hiddenID As HtmlInputHidden
        Dim KaduId As Integer
        Dim ChkBox As CheckBox
        Dim ds As New DataSet
        For Each gvRow As GridViewRow In gvInterest.Rows
            ChkBox = gvRow.FindControl("chkSelect")
            If ChkBox.Checked = True Then
                If gvRow.RowType = DataControlRowType.DataRow Then
                    hiddenID = gvRow.FindControl("HiddenID")
                    KaduId = CType(hiddenID.Value, Integer)
                    txthidden.Text = KaduId
                    ds = objMid.ExecuteSelectSQL("select * from tbl_Transaction_Details where Transact_Id = " & KaduId & "")
                    drpParticulars.SelectedValue = ds.Tables(0).Rows(0)("ParticularsId").ToString
                    transactdate.Date = ds.Tables(0).Rows(0)("Transact_Date").ToString
                    txtTransactAmt.Text = ds.Tables(0).Rows(0)("Transact_Amt").ToString
                    Session("Edit") = "True"
                End If
            End If
        Next
    End Sub

    Protected Sub imbCancel_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbCancel.Click
        Session("Edit") = "False"
        clearcontrols()
    End Sub
End Class
