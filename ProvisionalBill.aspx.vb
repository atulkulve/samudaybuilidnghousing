Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Imports System.Math
Partial Class mmsoft_ProvisionalBill
    Inherits System.Web.UI.Page
    Dim objMid As New MiddleLayer
    Dim ParticularsDetails As DataTable
    Dim StageName As DataColumn
    Dim Percentage As DataColumn

    Dim myRow As DataRow


    Protected Sub drpFlatNumber_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpFlatNumber.SelectedIndexChanged
        If Not Session("NewRoomId") Is Nothing Then
            Session("NewRoomId") = Nothing
        End If
        MultiView1.ActiveViewIndex = 1
        Session("NewRoomId") = drpFlatNumber.SelectedValue
        Dim ds As DataSet
        Dim dt As DataTable
        ds = objMid.ExecuteSelectSQL("Select * from SalesDetails where RoomId = " & drpFlatNumber.SelectedValue & "")
        dt = ds.Tables(0)
        Dim i As Integer

        For i = 0 To dt.Rows.Count - 1
            'lblratepersqft.Text = CDbl(dt.Rows(i)("Rate").ToString())
            lblFName.Text = dt.Rows(i)("FName").ToString()
            lblLName.Text = dt.Rows(i)("LName").ToString()
            lblAddress.Text = dt.Rows(i)("Add1").ToString()
            lbltelno.Text = dt.Rows(i)("telno").ToString()
        Next
        ds = Nothing
        'ds = objMid.ExecuteSelectSQL("SELECT SUM(dbo.PymtEntry.IntPending) AS InterestPending FROM dbo.Pyment INNER JOIN dbo.PymtEntry ON dbo.Pyment.PymtId = dbo.PymtEntry.PymtId WHERE (dbo.Pyment.RoomId = " & drpFlatNumber.SelectedValue & ")")
        'If Not ds Is Nothing Then
        '    lblPendingInterest.Text = ds.Tables(0).Rows(0)(0)
        'End If
        lblReceiptNo.Text = getReceiptNo("ProvBillDetails", "ReceiptNos")
        objMid.PopulateList(drpParticulars, "ParticularsId", "ParticularsName", objMid.ExecuteSelectSQL("select * from ParticularsMaster").Tables(0))

    End Sub
    Protected Sub drpSite_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpSite.SelectedIndexChanged
        objMid.PopulateList(drpBuilding, "BldgId", "BldgName", objMid.ExecuteSelectSQL("select * from building where siteid = '" & drpSite.SelectedValue & "'").Tables(0))
    End Sub

    Protected Sub drpBuilding_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpBuilding.SelectedIndexChanged
        objMid.PopulateList(drpFlatNumber, "RoomId", "RoomNumber", objMid.ExecuteSelectSQL("select * from Room where Bldgid = '" & drpBuilding.SelectedValue & "' and Booked='Yes'").Tables(0))
        'lblsqft.Text = ""
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            objMid.PopulateList(drpSite, "SiteId", "SiteName", objMid.ExecuteSelectSQL("select * from Site").Tables(0))
            MultiView1.ActiveViewIndex = 0
            If Not Session("NewRoomId") Is Nothing Then
                Session("NewRoomId") = Nothing
            End If
            If Not Session("TempParticularsDetails") Is Nothing Then
                Session("TempParticularsDetails") = Nothing
            End If
            objMid.PopulateList(drpParticulars, "ParticularsId", "ParticularsName", objMid.ExecuteSelectSQL("select * from Particularsmaster").Tables(0))
        End If
    End Sub

    Public Sub CreateParticularsDetails()
        ParticularsDetails = New DataTable("TempParticularsDetails")
        StageName = New DataColumn("Particulars", System.Type.GetType("System.String"))
        Percentage = New DataColumn("Amount", System.Type.GetType("System.String"))

        ParticularsDetails.Columns.Add(StageName)
        ParticularsDetails.Columns.Add(Percentage)

        Session("TempParticularsDetails") = ParticularsDetails
    End Sub

    Public Function GetParticularsId(ByVal Partiname As String) As Integer
        Dim dsparti As New DataSet
        dsparti = objMid.ExecuteSelectSQL("select ParticularsId from ParticularsMaster where ParticularsName='" & Partiname & "'")
        Return CInt(dsparti.Tables(0).Rows(0)(0).ToString)
    End Function

    Public Function CheckValid(ByVal RecpNo As String) As Boolean
        Dim dsparti As New DataSet
        Dim dtparti As New DataTable
        dsparti = objMid.ExecuteSelectSQL("select ReceiptNos from ProvBillDetails where ReceiptNos='" & RecpNo & "'")
        dtparti = dsparti.Tables(0)
        If dtparti.Rows.Count > 0 Then
            Return False
        Else
            Return True
        End If
    End Function

    Public Function getReceiptNo(ByVal TableName As String, ByVal ColumnName As String) As Integer
        Dim myQuery As String
        Dim myDataSet As DataSet
        Dim myID As Integer
        myQuery = "Select MAX(" & ColumnName & ")+1 from " & TableName
        myDataSet = objMid.ExecuteSelectSQL(myQuery)
        myID = IIf(myDataSet.Tables(0).Rows(0).Item(0).ToString = "", 1, myDataSet.Tables(0).Rows(0).Item(0))
        Return myID
    End Function
    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
        If Session("TempParticularsDetails") Is Nothing Then
            lblmsg.Text = "Please Add Particulars"
            Exit Sub
        End If

        If validateAggregate() = False Then
            lblmsg.Text = "Particulars Total amount Should be Equal to amount Entered"
            Exit Sub
        End If

        If CheckValid(lblReceiptNo.Text) = False Then
            lblmsg.Text = "Entry Failed. Duplicate Entry"
            Exit Sub
        End If

        Dim sql As String
        sql = "Insert ProvBillDetails (ReceiptNos,ReceiptDate,RoomId,ReceiptAmt,AmtInLetters,ModeOfPayment,BankName,BranchName,OtherDetails,chequedate,UserId,CreatedDate,Status) Values("
        sql = sql & lblReceiptNo.Text & ",'" & ReceiptDate.Date & "'," & drpFlatNumber.SelectedValue & "," & txtamount.Text & ",'" & txtAmtInWords.Text & "',"
        sql = sql & "'" & drpMode.SelectedItem.Text & "','" & txtBank.Text & "','" & txtBranch.Text & "','" & txtotherdetails.Text & "','" & cheqdate.Date & "' ,'" & Session("USERID") & "','" & Now.Date & "','Pending')"
        objMid.ExecuteSqlStmt(sql)
        ParticularsDetails = Session("TempParticularsDetails")
        Dim particulars As String
        Dim amount As Double

        For Each gvRow As DataRow In ParticularsDetails.Rows
            particulars = gvRow.Item(0).ToString()
            amount = CDbl(gvRow.Item(1).ToString())
            'Stage = myRow("Stage").ToString
            'Percentage = CInt(myRow("Percentage\\).ToString)
            objMid.ExecuteSqlStmt("Insert Into ParticularsProvTable(particulartblId,ReceiptNos,ParticularsId,ParticularsAmt) values(" & objMid.getUniqueID("ParticularsProvTable", "particulartblId") & "," & lblReceiptNo.Text & ",'" & GetParticularsId(particulars) & "'," & amount & ")")

        Next
        Session("ReceiptNos") = lblReceiptNo.Text
        Response.Redirect("ProvisionalBillLayout.aspx")
        'If CInt(lblPendingInterest.Text) > 0 And CInt(txtamount.Text) <= CInt(lblPendingInterest.Text) Then
        '    Dim sql As String
        '    Dim i As Integer
        '    Dim amount As Integer
        '    Dim PaidAmt As Integer
        '    Dim balamt As Integer

        '    amount = CInt(txtamount.Text)
        '    'sql = "Insert into InterestPayment(InterestId,InterestMode,InterestAmt,InterestDate,InterestDetails,UserId,CreatedDate) Values("
        '    'sql = sql & objMid.getUniqueID("InterestPayment", "InterestId") & ",'" & drpMode.SelectedItem.Text & "'," & txtamount.Text & ""
        '    'sql = sql & ",'" & PaidDate.Date & "','" & txtotherdetails.Text & "','" & Session("USERID") & "','" & Now.Date & "')"
        '    'objMid.ExecuteSqlStmt(sql)
        '    Dim ds As DataSet
        '    Dim dt As DataTable
        '    ds = objMid.ExecuteSelectSQL("SELECT DISTINCT PymtEntry.PymtEntryId, PymtEntry.PymtId, Pyment.TotalPayment, stage.StageDesc, salesDetails.FName, salesDetails.LName, salesDetails.SFName, PymtEntry.IntPending, PymtEntry.intDays, PymtEntry.PymtAmount, PymtEntry.PymtDate, Pyment.DueDate, Pyment.RoomId FROM PymtEntry INNER JOIN Pyment ON PymtEntry.PymtId = Pyment.PymtId INNER JOIN salesDetails ON Pyment.RoomId = salesDetails.RoomId INNER JOIN BldgStage ON Pyment.BldgStageId = BldgStage.BldgStageId INNER JOIN stage ON BldgStage.StageId = stage.StageId WHERE (PymtEntry.IntPending > 0) AND (Pyment.RoomId = " & drpFlatNumber.SelectedValue & ")")
        '    dt = ds.Tables(0)

        '    For i = 0 To dt.Rows.Count - 1

        '        If CInt(dt.Rows(i)("IntPending").ToString()) > amount Then
        '            PaidAmt = amount
        '            amount = 0
        '            balamt = CInt(dt.Rows(i)("IntPending").ToString()) - PaidAmt
        '            sql = "Insert into InterestPayment(InterestId,PymtEntryId,PymtId,InterestMode,InterestAmt,InterestDate,InterestDetails,UserId,CreatedDate) Values("
        '            sql = sql & objMid.getUniqueID("InterestPayment", "InterestId") & "," & dt.Rows(i)("PymtEntryId").ToString & "," & dt.Rows(i)("PymtId").ToString & ",'" & drpMode.SelectedItem.Text & "'," & PaidAmt & ""
        '            sql = sql & ",'" & PaidDate.Date & "','" & txtotherdetails.Text & "','" & Session("USERID") & "','" & Now.Date & "')"
        '            objMid.ExecuteSqlStmt(sql)
        '            sql = "Update PymtEntry set IntPending=" & balamt & " where pymtEntryId=" & CInt(dt.Rows(i)("PymtEntryId").ToString)
        '            objMid.ExecuteSqlStmt(sql)
        '        Else
        '            PaidAmt = CInt(dt.Rows(i)("IntPending").ToString())
        '            amount = amount - CInt(dt.Rows(i)("IntPending").ToString())
        '            sql = "Insert into InterestPayment(InterestId,PymtEntryId,PymtId,InterestMode,InterestAmt,InterestDate,InterestDetails,UserId,CreatedDate) Values("
        '            sql = sql & objMid.getUniqueID("InterestPayment", "InterestId") & "," & dt.Rows(i)("PymtEntryId").ToString & "," & dt.Rows(i)("PymtId").ToString & ",'" & drpMode.SelectedItem.Text & "'," & PaidAmt & ""
        '            sql = sql & ",'" & PaidDate.Date & "','" & txtotherdetails.Text & "','" & Session("USERID") & "','" & Now.Date & "')"
        '            objMid.ExecuteSqlStmt(sql)
        '            sql = "Update PymtEntry set IntPending=0 where pymtEntryId=" & CInt(dt.Rows(i)("PymtEntryId").ToString)
        '            objMid.ExecuteSqlStmt(sql)
        '        End If
        '        If amount = 0 Then
        '            Exit For
        '        End If
        '    Next
        'Else
        '    lblmsg.Text = "There is no Pending Interest to be Settled on or Pending Interest is Less than Amount Paid"
        'End If
    End Sub

    Protected Sub imbAddNew_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbAddNew.Click
        If Session("TempParticularsDetails") Is Nothing Then
            CreateParticularsDetails()
        End If
        ParticularsDetails = Session("TempParticularsDetails")
        myRow = ParticularsDetails.NewRow()
        myRow("Particulars") = drpParticulars.SelectedItem.Text
        myRow("Amount") = txtDetailAmt.Text

        'nos = CDec(lblPercent.Text) + CDec(txtPercentage.Text)
        'lblPercent.Text = nos
        ParticularsDetails.Rows.Add(myRow)
        Grid1.DataSource = ParticularsDetails
        Grid1.DataBind()
        drpParticulars.SelectedIndex = 0
        txtDetailAmt.Text = ""
    End Sub

    Protected Sub drpMode_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpMode.SelectedIndexChanged
        If drpMode.SelectedIndex = 2 Then
            txtBank.Enabled = False
            txtBranch.Enabled = False
            txtBank.Text = "-"
            txtBranch.Text = "-"
            cheqdate.Enabled = False
        Else
            txtBank.Enabled = True
            txtBranch.Enabled = True
            txtBank.Text = ""
            txtBranch.Text = ""
            cheqdate.Enabled = True
        End If
    End Sub
    Public Function validateAggregate() As Boolean
        Dim percent As Double
        ParticularsDetails = Session("TempParticularsDetails")
        percent = 0
        For Each gvRow As DataRow In ParticularsDetails.Rows
            percent = percent + CDbl(gvRow.Item(1).ToString())
        Next
        If Round(percent) = CDbl(txtamount.Text) Then
            Return True
        Else
            Return False
        End If
    End Function

    Protected Sub imbCancel_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbCancel.Click
        Session("TempParticularsDetails") = Nothing
        Response.Redirect("ProvisionalBill.aspx")
    End Sub

End Class
