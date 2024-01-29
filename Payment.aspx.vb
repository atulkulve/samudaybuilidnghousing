Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Imports System.Math

Partial Class mmsoft_Payment
    Inherits System.Web.UI.Page
    Dim objMid As New MiddleLayer
    Dim myflag As Boolean
    Dim constr As String = ConfigurationSettings.AppSettings("MyConnection")

    Dim PaymentDetailsTbl As DataTable
    Dim StageDesc As DataColumn
    Dim myrow As DataRow
    Dim DueDate As DataColumn
    Dim TotalAmt As DataColumn
    Dim OutStanding As DataColumn
    Dim OverDueDays As DataColumn
    Dim Interest As DataColumn

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Not Session("TempPaymentDetailsTbl") Is Nothing Then
                Session("TempPaymentDetailsTbl") = Nothing
            End If
            If Not Session("RoomID") Is Nothing Then
                Session("RoomID") = Nothing
            End If
            'objMid.PopulateList(drpFlatnumber, "RoomId", "RoomNumber", objMid.ExecuteSelectSQL("select * from Room").Tables(0))
            objMid.PopulateList(drpSite, "SiteId", "SiteName", objMid.ExecuteSelectSQL("select * from Site").Tables(0))
        End If
    End Sub

    Protected Sub drpSite_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpSite.SelectedIndexChanged
        objMid.PopulateList(drpBuilding, "BldgId", "BldgName", objMid.ExecuteSelectSQL("select * from building where siteid = '" & drpSite.SelectedValue & "'").Tables(0))
    End Sub

    'Public Sub clearcontrols()
    '    lblAddress.Text = ""
    '    lblemail.Text = ""
    '    lblFname.Text = ""
    '    lblLName.Text = ""
    '    lblmsg.Text = ""
    '    lblphoneno.Text = ""
    '    lblSFName.Text = ""
    '    lblSLName.Text = ""
    '    lblsqft.Text = ""
    '    lbltelno.Text = ""
    '    If Not Session("TempPaymentDetailsTbl") Is Nothing Then
    '        Session("TempPaymentDetailsTbl") = Nothing
    '    End If
    '    If Not Session("RoomID") Is Nothing Then
    '        Session("RoomID") = Nothing
    '    End If
    '    txtadvpay.Text = ""
    '    txtamount.Text = ""
    '    txtcheqdetails.Text = ""
    '    drpmode.SelectedIndex = 0
    '    drpBuilding.Items.Clear()
    '    drpBuilding.Items.Insert(0, "-- Select --")
    '    drpBuilding.Items(0).Value = ""
    '    drpBuilding.Items.Clear()
    '    drpBuilding.Items.Insert(0, "-- Select --")
    '    drpFlatnumber.Items(0).Value = ""
    'End Sub

    Public Sub clearcontrols()
        If Not Session("RoomID") Is Nothing Then
            Session("RoomID") = Nothing
        End If
        If Not Session("TempPaymentDetailsTbl") Is Nothing Then
            Session("TempPaymentDetailsTbl") = Nothing
        End If
        drpSite.SelectedIndex = 0
        drpmode.SelectedIndex = 0
        lblAddress.Text = ""
        lblemail.Text = ""
        lblFname.Text = ""
        lblLName.Text = ""
        lblmsg.Text = ""
        lblphoneno.Text = ""
        lblSFName.Text = ""
        lblSLName.Text = ""
        lblsqft.Text = ""
        lbltelno.Text = ""
        txtadvpay.Text = ""
        txtamount.Text = ""
        txtcheqdetails.Text = ""
        objMid.ClearDropDown(drpBuilding)
        objMid.ClearDropDown(drpFlatnumber)
        Grid1.DataSource = PaymentDetailsTbl
        Grid1.DataBind()
    End Sub
    Protected Sub drpFlatnumber_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpFlatnumber.SelectedIndexChanged
        If Not Session("TempPaymentDetailsTbl") Is Nothing Then
            Session("TempPaymentDetailsTbl") = Nothing
        End If
        If Not Session("RoomID") Is Nothing Then
            Session("RoomID") = Nothing
        End If
        drpmode.SelectedIndex = 0
        lblAddress.Text = ""
        lblemail.Text = ""
        lblFname.Text = ""
        lblLName.Text = ""
        lblmsg.Text = ""
        lblphoneno.Text = ""
        lblSFName.Text = ""
        lblSLName.Text = ""
        lblsqft.Text = ""
        lbltelno.Text = ""
        txtadvpay.Text = ""
        txtamount.Text = ""
        txtcheqdetails.Text = ""

        Dim ds As New DataSet
        ds = objMid.ExecuteSelectSQL("select * from Roomtype where RoomtypeId = '" & objMid.getID("Room", "RoomID", "RoomTypeID", drpFlatnumber.SelectedValue) & "'")
        If Not ds Is Nothing Then
            lblsqft.Text = ds.Tables(0).Rows(0)("sqft").ToString
        End If
        ds = Nothing
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
                lbltelno.Text = ds.Tables(0).Rows(0)("telno").ToString
                lblphoneno.Text = ds.Tables(0).Rows(0)("Mobno").ToString

            End If
        End If
        ds = Nothing

        'Data Table for Due Payment
        Session("RoomID") = drpFlatnumber.SelectedValue
        If Session("TempPaymentDetailsTbl") Is Nothing Then
            CreatePaymentDetailsTbl()
        End If
        'Dim nos As Double
        Dim i As Integer
        PaymentDetailsTbl = Session("TempPaymentDetailsTbl")
        ds = objMid.ExecuteSelectSQL("SELECT B.SiteId, B.BldgId, B.RoomId, B.SqFt, B.Rate, B.FName, B.LName, B.Add1, B.Add2, B.telno, B.Mobno, B.email, B.saledate, D.StageDesc, A.DueDate, A.TotalPayment, A.OutStanding, A.PymtId, B.SFName, B.SLName FROM Pyment AS A INNER JOIN salesDetails AS B ON A.RoomId = B.RoomId INNER JOIN BldgStage AS C ON A.BldgStageId = C.BldgStageId INNER JOIN stage AS D ON C.StageId = D.StageId WHERE (A.OutStanding > 0) AND (B.RoomId = '" & drpFlatnumber.SelectedValue & "')")
        Dim dt As DataTable
        dt = ds.Tables(0)
        Dim duedate As New Date
        Dim duedays As Integer
        Dim interest As Double
        Dim paymentamount As Double
        If Not ds Is Nothing Then
            If dt.Rows.Count > 0 Then
                For i = 0 To dt.Rows.Count - 1
                    myrow = PaymentDetailsTbl.NewRow()
                    myrow("Stage Description") = dt.Rows(i)("StageDesc").ToString()
                    duedate = dt.Rows(i)("DueDate").ToString()
                    myrow("Due Date") = Convert.ToDateTime(duedate.Date).ToString("dd-MMM-yy")
                    myrow("Total Amount") = dt.Rows(i)("TotalPayment").ToString()
                    paymentamount = dt.Rows(i)("OutStanding").ToString()
                    myrow("OutStanding Amount") = dt.Rows(i)("OutStanding").ToString()
                    If (duedate.Date < Now.Date) Then
                        duedays = DateDiff(DateInterval.Day, duedate, Now.Date)
                        interest = (paymentamount * 21 * duedays) / 36500
                    Else
                        duedays = 0
                        interest = 0
                    End If

                    myrow("Over Days Due") = duedays

                    myrow("Interest") = Round(interest)
                    PaymentDetailsTbl.Rows.Add(myrow)
                Next
            End If
        End If
        If dt.Rows.Count > 0 Then
            txtamount.Enabled = True
            txtadvpay.Enabled = False
        Else
            txtamount.Enabled = False
            txtadvpay.Enabled = True
        End If
        'myrow = PaymentDetailsTbl.NewRow()
        'myrow("Stage") = drpStage.SelectedItem.Text
        'myrow("Percentage") = txtPercentage.Text

        'nos = CDec(lblPercent.Text) + CDec(txtPercentage.Text)
        'lblPercent.Text = nos

        Grid1.DataSource = PaymentDetailsTbl
        Grid1.DataBind()
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
    Protected Sub drpBuilding_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpBuilding.SelectedIndexChanged
        objMid.PopulateList(drpFlatnumber, "RoomId", "RoomNumber", objMid.ExecuteSelectSQL("select * from Room where Bldgid = '" & drpBuilding.SelectedValue & "' and Booked='Yes'").Tables(0))
    End Sub

    Public Function checkvalidaty() As Boolean
        If txtadvpay.Enabled = True Then
            If txtadvpay.Text = "" Then
                lblmsg.Text = "Enter Advance Amount"
                Return False
            ElseIf drpmode.SelectedIndex = 0 Then
                lblmsg.Text = "Select Mode of Payment"
                Return False
            ElseIf txtcheqdetails.Text = "" Then
                lblmsg.Text = "Enter Cheque Details"
            End If
        Else
            If txtamount.Text = "" Then
                lblmsg.Text = "Enter Payment Amount"
                Return False
            ElseIf drpmode.SelectedIndex = 0 Then
                lblmsg.Text = "Select Mode of Payment"
                Return False
            ElseIf txtcheqdetails.Text = "" Then
                lblmsg.Text = "Enter Cheque Details"
            End If
        End If
        Return True
    End Function

    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
        If checkvalidaty = False Then
            Exit Sub
        End If
        If optyes.Checked = False And optno.Checked = False Then
            lblmsg.Text = "Check if you want to apply interest"
            Exit Sub
        End If

        Dim strsql As String
        If txtamount.Enabled = True Then
            Dim outstandingds As New DataSet
            Dim outstandingdt As New DataTable
            outstandingds = objMid.ExecuteSelectSQL("SELECT B.SiteId, B.BldgId, B.RoomId, B.SqFt, B.Rate, B.FName, B.LName, B.Add1, B.Add2, B.telno, B.Mobno, B.email, B.saledate, D.StageDesc, A.DueDate, A.TotalPayment, A.OutStanding, A.PymtId, B.SFName, B.SLName FROM Pyment AS A INNER JOIN salesDetails AS B ON A.RoomId = B.RoomId INNER JOIN BldgStage AS C ON A.BldgStageId = C.BldgStageId INNER JOIN stage AS D ON C.StageId = D.StageId WHERE (A.OutStanding > 0) AND (B.RoomId = '" & drpFlatnumber.SelectedValue & "')")

            outstandingdt = outstandingds.Tables(0)

            Dim i As Integer
            Dim amount As Double = 0
            Dim outamount As Double = 0
            Dim payamount As Double = 0
            Dim balamount As Double = 0
            Dim duedays As Integer = 0
            Dim datedue As Date
            Dim InterestOut As Double = 0
            Dim sql As String

            amount = txtamount.Text
            If Not outstandingds Is Nothing Then
                For i = 0 To outstandingdt.Rows.Count - 1
                    outamount = outstandingdt.Rows(i)("outstanding").ToString()
                    payamount = 0
                    balamount = 0
                    'myrow = PaymentDetailsTbl.NewRow()
                    If (amount > outamount) Then
                        payamount = outamount
                        amount = amount - outamount
                    Else
                        payamount = amount
                        balamount = outamount - amount
                        amount = 0
                    End If
                    datedue = outstandingdt.Rows(i)("DueDate").ToString()
                    If datedue.Date < Now.Date Then
                        duedays = DateDiff(DateInterval.Day, datedue, Now.Date)
                        'myrow("Over Days Due") = duedays
                        InterestOut = payamount * 21 * duedays / 36500
                    Else
                        duedays = 0
                        InterestOut = 0
                    End If
                    'myrow("Stage Description") = outstandingdt.Rows(i)("StageDesc").ToString()
                    If optyes.Checked = True Then
                        sql = "Insert into PymtEntry (PymtEntryID,PymtId,PymtDate,PymtMode,Pymtamount,ChqDet,IntPending,IntDays,UserID,CreatedDate) Values("
                        sql = sql & "" & objMid.getUniqueID("PymtEntry", "PymtEntryID") & "," & outstandingdt.Rows(i)("PymtID").ToString & ","
                        sql = sql & "'" & paydate.Date & "','" & drpmode.SelectedItem.Text & "','" & payamount & "',"
                        sql = sql & "'" & txtcheqdetails.Text & "'," & Round(InterestOut) & "," & duedays & ",'" & Session("USERID") & "','" & Now.Date & "')"
                    End If
                    If optno.Checked = True Then
                        sql = "Insert into PymtEntry (PymtEntryID,PymtId,PymtDate,PymtMode,Pymtamount,ChqDet,IntPending,IntDays,UserID,CreatedDate) Values("
                        sql = sql & "" & objMid.getUniqueID("PymtEntry", "PymtEntryID") & "," & outstandingdt.Rows(i)("PymtID").ToString & ","
                        sql = sql & "'" & paydate.Date & "','" & drpmode.SelectedItem.Text & "','" & payamount & "',"
                        sql = sql & "'" & txtcheqdetails.Text & "',0,0,'" & Session("USERID") & "','" & Now.Date & "')"
                    End If

                    objMid.ExecuteSqlStmt(sql)
                    sql = "Update Pyment set outstanding = " & balamount & " where pymtId=" & outstandingdt.Rows(i)("PymtID").ToString & ""
                    objMid.ExecuteSqlStmt(sql)
                    If amount = 0 Then
                        Exit For
                    End If
                Next
            End If
            sql = "Delete from PymtAdvEntry where RoomId = " & drpFlatnumber.SelectedValue & ""
            objMid.ExecuteSqlStmt(sql)
            If amount > 0 Then
                sql = "Insert into PymtAdvEntry (RoomId,PymtDate,PymtMode, PymtAmount, ChqDet,  userId,  createdDate) values("
                sql = sql & "" & drpFlatnumber.SelectedValue & ",'" & paydate.Date & "','" & drpmode.SelectedItem.Text & "'," & amount & ", "
                sql = sql & "'" & txtcheqdetails.Text & "','" & Session("USERID") & "','" & Now.Date & "')"
                objMid.ExecuteSqlStmt(sql)
            End If
            Call updatetransaction()
        Else
            Dim ds As DataSet
            Dim dt As DataTable

            ds = objMid.ExecuteSelectSQL("Select * from PymtAdvEntry where RoomId=" & drpFlatnumber.SelectedValue & "")
            dt = ds.Tables(0)
            If dt.Rows.Count > 0 Then
                strsql = "Update PymtAdvEntry set pymtAmount = pymtAmount + " & txtadvpay.Text & " where RoomId = " & drpFlatnumber.SelectedValue
                'strsql = "Insert into PymtAdvEntry (RoomId,PymtDate,PymtMode, PymtAmount, ChqDet,  userId,  createdDate) values("
                'strsql = strsql & "" & drpFlatnumber.SelectedValue & ",'" & paydate.Date & "','" & drpmode.SelectedItem.Text & "'," & txtadvpay.Text & ", "
                'strsql = strsql & "'" & txtcheqdetails.Text & "','" & Session("USERID") & "','" & Now.Date & "')"
            Else
                strsql = "Insert into PymtAdvEntry (RoomId,PymtDate,PymtMode, PymtAmount, ChqDet,  userId,  createdDate) values("
                strsql = strsql & "" & drpFlatnumber.SelectedValue & ",'" & paydate.Date & "','" & drpmode.SelectedItem.Text & "'," & txtadvpay.Text & ", "
                strsql = strsql & "'" & txtcheqdetails.Text & "','" & Session("USERID") & "','" & Now.Date & "')"
            End If

            objMid.ExecuteSqlStmt(strsql)


            
        End If
        Call clearcontrols()
        Response.Redirect("UserMenu.aspx")
    End Sub
    Private Sub updatetransaction()

        Dim gnds As DataSet
        Dim gndt As DataTable
        Dim gnds2 As DataSet
        Dim gndt2 As DataTable
        Dim sql As String
        Dim i As Integer = 0

        sql = "SELECT * from RoomType where Roomtypeid = " & getRoomTypeId(drpFlatnumber.SelectedValue)
        gnds = objMid.ExecuteSelectSQL(Sql)
        gndt = gnds.Tables(0)

        Dim amount As Double
        If txtamount.Enabled Then
            amount = CDbl(txtamount.Text)
        Else
            amount = CDbl(txtadvpay.Text)
        End If

        Dim payamount As Double
        Dim balamount As Double
        Dim osamt As Double

        sql = "SELECT * from tbl_roominstallments_details where installment_status <> 'paid' and installment_value > 0 and Roomid = " & drpFlatnumber.SelectedValue
        gnds2 = objMid.ExecuteSelectSQL(sql)
        gndt2 = gnds2.Tables(0)

        Dim monthint As Integer = Microsoft.VisualBasic.DateAndTime.Month(Date.Now)
        Dim dateinst As DateTime = gndt2.Rows(0)("installment_date")
        Dim interatedate As Date = New DateTime(dateinst.Year, monthint, dateinst.Day)
        Dim introw As Integer = 1

        For i = 0 To gndt2.Rows.Count - 1

            osamt = CDbl(gndt2.Rows(i)("installment_value"))
            payamount = 0
            balamount = 0
            'myrow = PaymentDetailsTbl.NewRow()
            If amount > 0 Then

                If (amount > osamt) Then
                    payamount = osamt
                    amount = amount - osamt
                Else
                    payamount = amount
                    balamount = osamt - amount
                    amount = 0
                End If

                'sql = "INSERT INTO tbl_roominstallments_details (installment_name,RoomId,installment_date,installment_value) VALUES('" & gndt2.Rows(i)("installment_name").ToString & "',"
                'sql = sql & drpFlatnumber.SelectedValue & ",'" & gndt2.Rows(i)("installment_date").ToString & "'," & payamount * -1 & ")"

                'objMid.ExecuteSqlStmt(sql)

                If payamount = CDbl(gndt2.Rows(i)("installment_value")) Then
                    sql = "update tbl_roominstallments_details set installment_status = 'paid',installment_value=0 where  installment_id = '" & gndt2.Rows(i)("installment_id").ToString & "'"

                Else
                    sql = "update tbl_roominstallments_details set installment_value=" & CDbl(gndt2.Rows(i)("installment_value")) - payamount & " where  installment_id = '" & gndt2.Rows(i)("installment_id").ToString & "'"
                End If

                objMid.ExecuteSqlStmt(sql)

                If gndt2.Rows.Count = introw Then
                    sql = "update tbl_roominstallments_details set installment_date = '" & interatedate.AddMonths(introw - 1) & "' where  installment_id = '" & gndt2.Rows(i)("installment_id").ToString & "'"
                Else
                    sql = "update tbl_roominstallments_details set installment_date = '" & interatedate.AddMonths(introw) & "' where  installment_id = '" & gndt2.Rows(i)("installment_id").ToString & "'"
                End If

                objMid.ExecuteSqlStmt(sql)

                introw = introw + 1
            End If

        Next

    End Sub
    Private Function getRoomTypeId(ByVal roomid)
        Dim gnds As DataSet
        Dim gndt As DataTable
        Dim sql As String
        Dim i As Integer = 0
        sql = "SELECT * from Room where RoomId = '" & roomid & "'"
        gnds = objMid.ExecuteSelectSQL(sql)
        gndt = gnds.Tables(0)

        getRoomTypeId = gndt.Rows(0)("Roomtypeid").ToString()
    End Function

    Protected Sub imbCancel_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbCancel.Click
        Call clearcontrols()
        Response.Redirect("UserMenu.aspx")
    End Sub

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        Session("RoomID") = drpFlatnumber.SelectedValue
        Response.Redirect("EMIDemandLetter.aspx")
    End Sub
End Class
