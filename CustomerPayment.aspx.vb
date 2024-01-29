Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Imports System.Math

Partial Class mmsoft_CustomerPayment
    Inherits System.Web.UI.Page
    Dim objMid As New MiddleLayer
    Dim PaymentDetailsTbl As New DataTable
    Dim StageDesc As DataColumn
    Dim myrow As DataRow
    Dim DueDate As DataColumn
    Dim TotalAmt As DataColumn
    Dim OutStanding As DataColumn
    Dim OverDueDays As DataColumn
    Dim Interest As DataColumn
    Dim TotalAmtDue As DataColumn

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            objMid.PopulateList(drpSite, "Siteid", "SiteName", objMid.ExecuteSelectSQL("select * from Site").Tables(0))

            MultiView1.ActiveViewIndex = 0
        End If
    End Sub

    Private Sub GridBind()
        Dim ds As New DataSet
        Dim sql As String
        sql = "SELECT * FROM  KaduTable WHERE RoomId= " & drpFlatnumber.SelectedValue & ""
        ds = objMid.ExecuteSelectSQL(sql)
        Dim dt As New DataTable
        dt = ds.Tables(0)
        gvInterest.DataSource = dt
        gvInterest.DataBind()
    End Sub

    Public Function GetTotalOut(ByVal roomid As Integer) As Double
        Dim localds As New DataSet
        localds = objMid.ExecuteSelectSQL("select sum(outstanding) from pyment where roomid =" & roomid & "")
        Return CDbl(localds.Tables(0).Rows(0)(0).ToString())
    End Function

    Public Function GetTotalPymt(ByVal roomid As Integer) As Double
        Dim strsql As String
        Dim gnds As New DataSet
        Dim gndt As New DataTable
        Dim othercharges, sqft, rate As Integer
        strsql = "SELECT B.Sqft, B.OtherCharges FROM Room A, RoomType B WHERE A.Roomtypeid = B.Roomtypeid AND RoomId = " & roomid & ""
        gnds = objMid.ExecuteSelectSQL(strsql)
        gndt = gnds.Tables(0)

        If gndt.Rows.Count > 0 Then
            othercharges = gndt.Rows(0)("OtherCharges").ToString()
            sqft = gndt.Rows(0)("Sqft").ToString
        End If

        strsql = "SELECT Rate FROM salesdetails WHERE RoomId = " & roomid & ""
        gnds = objMid.ExecuteSelectSQL(strsql)
        gndt = gnds.Tables(0)
        rate = gndt.Rows(0)(0).ToString()

        Dim StageAmt As Double

        StageAmt = (rate * sqft + othercharges) * 100 / 100

        Return Round(StageAmt)
    End Function

    Public Function GetTotalPaidAmt(ByVal roomid As Integer) As Integer
        Dim strsql As String
        Dim gnds As New DataSet
        'Dim gndt As New DataTable
        strsql = "SELECT SUM(dbo.PymtEntry.PymtAmount) FROM dbo.Pyment INNER JOIN dbo.PymtEntry ON dbo.Pyment.PymtId = dbo.PymtEntry.PymtId WHERE (dbo.Pyment.RoomId =  " & roomid & ")"
        gnds = objMid.ExecuteSelectSQL(strsql)
        If gnds.Tables(0).Rows(0)(0).ToString() = "" Then
            Return 0
        Else
            Return gnds.Tables(0).Rows(0)(0).ToString()
        End If
    End Function

    Public Function GetAdvance(ByVal roomid As Integer) As Integer
        Dim strsql As String
        Dim gnds As New DataSet
        'Dim gndt As New DataTable
        strsql = "select pymtamount from pymtAdventry where roomid=" & roomid & ""
        gnds = objMid.ExecuteSelectSQL(strsql)

        If gnds.Tables(0).Rows.Count = 0 Then
            Return 0
        Else
            Return gnds.Tables(0).Rows(0)(0).ToString()
        End If
    End Function

    Public Function GetInterest(ByVal roomid As Integer) As Double
        Dim localds As New DataSet
        localds = objMid.ExecuteSelectSQL("select sum(interest) from pyment where roomid =" & roomid & "")
        Return CDbl(localds.Tables(0).Rows(0)(0).ToString())
    End Function
    Public Function getPendingInt(ByVal roomid As Integer) As Double
        Dim dsint As New DataSet
        dsint = objMid.ExecuteSelectSQL("SELECT SUM(dbo.PymtEntry.IntPending) AS PendingInt FROM dbo.Pyment INNER JOIN dbo.PymtEntry ON dbo.Pyment.PymtId = dbo.PymtEntry.PymtId WHERE (dbo.Pyment.RoomId = " & roomid & ")")
        If dsint.Tables(0).Rows(0)(0).ToString = "" Then
            Return 0
        Else
            Return CDbl(dsint.Tables(0).Rows(0)(0).ToString)
        End If
    End Function
    Public Function GetAggAmt(ByVal roomid As Integer) As Double
        Dim localds As New DataSet
        localds = objMid.ExecuteSelectSQL("select sum(TotalOutStanding) from pyment where roomid =" & roomid & "")
        Return CDbl(localds.Tables(0).Rows(0)(0).ToString())
    End Function
    Public Function GetDueDate() As Date
        Dim localds As New DataSet
        localds = objMid.ExecuteSelectSQL("select duedate from PayDueDate")
        Return localds.Tables(0).Rows(0)(0).ToString()
    End Function
    Public Function GetTotalPay(ByVal roomid As Integer) As Double
        Dim localds As New DataSet
        localds = objMid.ExecuteSelectSQL("select sum(TotalPayment) from pyment where roomid =" & roomid & "")
        Return CDbl(localds.Tables(0).Rows(0)(0).ToString())
    End Function
    Private Sub PopRateandArea()
        Dim dspop As New DataSet

        dspop = objMid.ExecuteSelectSQL("Select * from salesdetails where roomid=" & drpFlatnumber.SelectedValue & "")

    End Sub
    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
        If Not Session("TempPaymentDetailsTbl") Is Nothing Then
            Session("TempPaymentDetailsTbl") = Nothing
        End If
        If Not Session("RoomIid") Is Nothing Then
            Session("RoomIid") = Nothing
        End If
        Session("RoomIid") = drpFlatnumber.SelectedValue

        Session("FLATNO") = drpFlatnumber.SelectedValue
        lblFlatNo.Text = drpFlatnumber.SelectedItem.Text
        MultiView1.ActiveViewIndex = 1
        Dim dsdetails As New DataSet

        dsdetails = objMid.ExecuteSelectSQL("Select * from salesdetails where roomid=" & drpFlatnumber.SelectedValue & "")
        lblname.Text = dsdetails.Tables(0).Rows(0)("FName").ToString & " " & dsdetails.Tables(0).Rows(0)("LName").ToString
        lbladdress.Text = dsdetails.Tables(0).Rows(0)("add1").ToString & " " & dsdetails.Tables(0).Rows(0)("add2").ToString
        lbltelno.Text = dsdetails.Tables(0).Rows(0)("telno").ToString & "," & dsdetails.Tables(0).Rows(0)("MobNo").ToString
        lblsqft2.Text = dsdetails.Tables(0).Rows(0)("sqft").ToString
        lblrate.Text = dsdetails.Tables(0).Rows(0)("Rate").ToString
        lblremarks.Text = dsdetails.Tables(0).Rows(0)("remarks").ToString
        lblwingno.Text = drpBuilding.SelectedItem.Text
        dsdetails = Nothing

        dsdetails = objMid.ExecuteSelectSQL("select * from PymtAdvEntry where Roomid=" & drpFlatnumber.SelectedValue & "")
        If dsdetails.Tables(0).Rows.Count > 0 Then
            lbladvance.Text = ""
            lblpayamt.Text = dsdetails.Tables(0).Rows(0)("Pymtamount").ToString
            lblPaydate.Text = Convert.ToDateTime(dsdetails.Tables(0).Rows(0)("Pymtdate").ToString).ToString("dd-MMM-yy")
            lblpaymode.Text = dsdetails.Tables(0).Rows(0)("PymtMode").ToString
            lblchqdet.Text = dsdetails.Tables(0).Rows(0)("Chqdet").ToString
        Else
            lbladvance.Text = "No Advance"
            lblpayamt.Text = "-"
            lblPaydate.Text = "-"
            lblpaymode.Text = "-"
            lblchqdet.Text = "-"
        End If

        Dim dskadu As New DataSet
        Dim dtkadu As New DataTable
        Dim i As Integer
        dskadu = objMid.ExecuteSelectSQL("select * from Kadutable where roomid= '" & drpFlatnumber.SelectedValue & "'")
        dtkadu = dskadu.Tables(0)
        If dtkadu.Rows.Count > 0 Then
            For i = 0 To dtkadu.Rows.Count - 1
                lblKaduAmt.Text = dtkadu.Rows(i)("KaduAmt").ToString()
                'lblKaduamt.Text = dskadu.Tables(0).Rows(0)("KaduAmt").ToString
            Next
        End If

        Call GridBind()

        'Dim i As Integer
        'If Session("TempPaymentDetailsTbl") Is Nothing Then
        '    CreatePaymentDetailsTbl()
        'End If
        'Dim ds As New DataSet
        'Dim sql As String

        'sql = "SELECT dbo.PymtEntry.PymtEntryId, dbo.PymtEntry.PymtId, dbo.PymtEntry.PymtDate, dbo.PymtEntry.PymtMode, dbo.PymtEntry.PymtAmount, "
        'Sql = Sql & " dbo.PymtEntry.ChqDet, dbo.PymtEntry.IntPending, dbo.PymtEntry.intDays, dbo.Pyment.DueDate, dbo.Pyment.TotalPayment, dbo.Pyment.OutStanding, "
        'Sql = Sql & " dbo.salesDetails.FName, dbo.salesDetails.LName, dbo.salesDetails.Add1, dbo.salesDetails.Add2, dbo.salesDetails.telno, dbo.salesDetails.Mobno, "
        'Sql = Sql & " dbo.salesDetails.email, dbo.salesDetails.Bank"
        'sql = sql & " FROM dbo.PymtEntry INNER JOIN dbo.Pyment ON dbo.PymtEntry.PymtId = dbo.Pyment.PymtId INNER JOIN  dbo.salesDetails ON dbo.Pyment.RoomId = dbo.salesDetails.RoomId WHERE (dbo.Pyment.RoomId = " & drpFlatnumber.SelectedValue & ")"

        'ds = objMid.ExecuteSelectSQL(sql)
        'Dim dt As New DataTable
        'dt = ds.Tables(0)
        'Dim duedate As New Date
        'Dim duedays As Integer
        'Dim interest As Double
        'Dim paymentamount As Double
        'If Not ds Is Nothing Then
        '    For i = 0 To dt.Rows.Count - 1
        '        myrow = PaymentDetailsTbl.NewRow()
        '        myrow("Stage Description") = dt.Rows(i)("StageDesc").ToString()
        '        duedate = dt.Rows(i)("DueDate").ToString()
        '        myrow("Due Date") = duedate.Date
        '        myrow("Total Amount") = dt.Rows(i)("TotalPayment").ToString()
        '        paymentamount = dt.Rows(i)("OutStanding").ToString()
        '        myrow("OutStanding Amount") = dt.Rows(i)("OutStanding").ToString()
        '        duedays = DateDiff(DateInterval.Day, duedate, Now.Date)
        '        myrow("Over Days Due") = duedays
        '        interest = (paymentamount * 21 * duedays) / 36500
        '        myrow("Interest") = interest
        '        myrow("Total Amt Due") = paymentamount + interest
        '        PaymentDetailsTbl.Rows.Add(myrow)
        '    Next
        'End If
        'Grid1.DataSource = PaymentDetailsTbl
        'Grid1.DataBind()

        lblScheduleAmt.Text = Round(GetTotalPay(drpFlatnumber.SelectedValue))
        lbloutstandingamt.Text = Round(GetTotalOut(drpFlatnumber.SelectedValue))
        lblPaidamt.Text = Round(GetTotalPaidAmt(drpFlatnumber.SelectedValue))
        lblAggrementAmt.Text = Round(GetTotalPymt(drpFlatnumber.SelectedValue))
        lblPendingInterest.Text = Round(getPendingInt(drpFlatnumber.SelectedValue))
    End Sub
    Public Sub CreatePaymentDetailsTbl()
        PaymentDetailsTbl = New DataTable("PaymentDetailsTbl")
        StageDesc = New DataColumn("Stage Description", System.Type.GetType("System.String"))
        DueDate = New DataColumn("Due Date", System.Type.GetType("System.String"))
        TotalAmt = New DataColumn("Total Amount", System.Type.GetType("System.String"))
        OutStanding = New DataColumn("OutStanding Amount", System.Type.GetType("System.String"))
        OverDueDays = New DataColumn("Over Days Due", System.Type.GetType("System.String"))
        Interest = New DataColumn("Interest", System.Type.GetType("System.String"))
        TotalAmtDue = New DataColumn("Total Amt Due", System.Type.GetType("System.String"))

        PaymentDetailsTbl.Columns.Add(StageDesc)
        PaymentDetailsTbl.Columns.Add(DueDate)
        PaymentDetailsTbl.Columns.Add(TotalAmt)
        PaymentDetailsTbl.Columns.Add(OutStanding)
        PaymentDetailsTbl.Columns.Add(Interest)
        PaymentDetailsTbl.Columns.Add(OverDueDays)
        PaymentDetailsTbl.Columns.Add(TotalAmtDue)


        Session("TempPaymentDetailsTbl") = PaymentDetailsTbl
    End Sub

    Protected Sub drpSite_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpSite.SelectedIndexChanged
        objMid.PopulateList(drpBuilding, "BldgId", "BldgName", objMid.ExecuteSelectSQL("select * from Building where siteid = '" & drpSite.SelectedValue & "'").Tables(0))
    End Sub

    Protected Sub drpBuilding_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpBuilding.SelectedIndexChanged
        objMid.PopulateList(drpFlatnumber, "RoomId", "RoomNumber", objMid.ExecuteSelectSQL("select * from Room where Bldgid = '" & drpBuilding.SelectedValue & "' and Booked='Yes'").Tables(0))
    End Sub

    Protected Sub drpFlatnumber_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpFlatnumber.SelectedIndexChanged
        Dim ds As New DataSet
        ds = objMid.ExecuteSelectSQL("select * from Roomtype where RoomtypeId = '" & objMid.getID("Room", "RoomID", "RoomTypeID", drpFlatnumber.SelectedValue) & "'")
        If Not ds Is Nothing Then
            lblsqft.Text = ds.Tables(0).Rows(0)("sqft").ToString
        End If
        ds = Nothing
    End Sub
End Class
