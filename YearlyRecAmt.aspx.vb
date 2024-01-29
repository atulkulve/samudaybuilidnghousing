Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Imports System.Math

Partial Class mmsoft_YearlyRecAmt
    Inherits System.Web.UI.Page

    Dim min As Integer
    Dim max As Integer

    Dim objMid As New MiddleLayer
    Dim myflag As Boolean
    Dim constr As String = ConfigurationSettings.AppSettings("MyConnection")

    Dim DefaultersTbl As DataTable
    Dim myrow As DataRow

    Dim Name As DataColumn
    Dim TelNo As DataColumn
    Dim MobNo As DataColumn
    Dim totalOutStanding As DataColumn
    'Dim OverDueDays As DataColumn
    Dim totalInterest As DataColumn
    Dim totalPendingInt As DataColumn
    Dim TotalAggAmount As DataColumn
    Dim TotalScheduleamt As DataColumn
    Dim TotalAmount As DataColumn
    'Dim OverDueDays As DataColumn
    Dim PaidAmount As DataColumn
    'Dim Duedatef As DataColumn
    Dim BLDGName As DataColumn
    Dim FlatNos As DataColumn
    Dim Advance As DataColumn
    Dim Bank As DataColumn


    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
        'Dim objint As New Interest
        'lblbuilding.Text = drpBuilding.SelectedItem.Text
        'objint.UpdatePaymentInterest()
        MultiView1.ActiveViewIndex = 1
        'lblfromdate.Text = fromdate.Date
        'lbltodate.Text = todate.Date
        'If drpSite.SelectedValue = 1 Then
        '    min = 0
        '    max = 100000
        '    lblmin.Text = min
        '    lblmax.Text = max
        'ElseIf drpSite.SelectedValue = 2 Then
        '    min = 100000
        '    max = 200000
        '    lblmin.Text = min
        '    lblmax.Text = max
        'ElseIf drpSite.SelectedValue = 3 Then
        '    min = 200000
        '    max = 300000
        '    lblmin.Text = min
        '    lblmax.Text = max
        'ElseIf drpSite.SelectedValue = 4 Then
        '    min = 300000
        '    max = 400000
        '    lblmin.Text = min
        '    lblmax.Text = max
        'ElseIf drpSite.SelectedValue = 5 Then
        '    min = 400000
        '    max = 1000000
        '    lblmin.Text = min
        '    lblmax.Text = "Above"
        'End If



        Dim ds As New DataSet
        If Not Session("DefaultersTbl") Is Nothing Then
            Session("DefaultersTbl") = Nothing
        End If
        If Session("DefaultersTbl") Is Nothing Then
            CreateDefaultersTbl()
        End If
        Dim i As Integer
        DefaultersTbl = Session("TempDefaultersTbl")

        Dim fromyear As Integer
        fromyear = 2005
        'Dim date1, date2 As Date
        'date1 = fromdate.Date
        'date2 = todate.Date

        'Dim fromyear, frommonth As Integer
        'Dim toyear, tomonth As Integer

        'fromyear = date1.Year
        'frommonth = date1.Month
        'lblbuilding.Text = getMonth(frommonth)
        'lblfromdate.Text = fromyear

        'toyear = date2.Year
        'tomonth = date2.Month

        'lbltodate.Text = getMonth(tomonth)
        'lblyear.Text = toyear
        Dim status As Boolean
        status = True

        While status
            'fromyear <= toyear Or fromyear <> toyear And frommonth <> tomonth

            If fromyear = 2012 Then
                status = False
                'If fromyear > toyear Then
                '    status = False

                'Else
                '    If frommonth = tomonth Then
                '        status = False
                '    End If
                'End If
            End If

            If status Then

                'If frommonth = 12 Then
                ds = objMid.ExecuteSelectSQL("SELECT sum(PymtAmount) FROM  PymtEntry WHERE PymtDate between '4/1/" & Str(fromyear) & "' and '3/31/" & Str(fromyear + 1) & "'")
                'Else
                '    ds = objMid.ExecuteSelectSQL("SELECT sum(PymtAmount) FROM  PymtEntry WHERE PymtDate between '" & Str(frommonth) & "/1/" & Str(fromyear) & "' and '" & Str(frommonth + 1) & "/1/" & Str(fromyear) & "'")
                'End If

                Dim dt As DataTable
                dt = ds.Tables(0)
                If Not ds Is Nothing Then
                    myrow = DefaultersTbl.NewRow()
                    myrow("Year") = Str(fromyear) + " - " + Str(Val(fromyear + 1))
                    'myrow("Month") = getMonth(frommonth)
                    myrow("Amount") = Val(dt.Rows(0)(0).ToString()) + GetAdvance(fromyear, fromyear + 1)
                    'lblbuilding.Text = lblbuilding.Text + Str(frommonth) + " : year: " + Str(fromyear) + " : " + dt.Rows(0)(0).ToString()
                End If
                'If frommonth = 12 Then
                '    fromyear = fromyear + 1
                '    frommonth = 1
                'Else
                '    frommonth = frommonth + 1
                'End If
                fromyear = fromyear + 1
                DefaultersTbl.Rows.Add(myrow)
            End If
        End While
        Grid1.DataSource = DefaultersTbl
        Grid1.DataBind()




        '  (BldgId = " & drpBuilding.SelectedValue & ") ORDER BY RoomId")
        'Dim dt As DataTable
        'dt = ds.Tables(0)
        'Dim duedate As New Date
        'Dim duedays As Integer
        'Dim interest As Double
        'Dim paymentamount As Double
        'If Not ds Is Nothing Then
        '    For i = 0 To dt.Rows.Count - 1
        '        'If (GetTotalOut(CDbl(dt.Rows(i)("RoomId").ToString())) > min And GetTotalOut(CDbl(dt.Rows(i)("RoomId").ToString())) < max) Then
        '        myrow = DefaultersTbl.NewRow()
        '        myrow("Name") = dt.Rows(i)("FName").ToString() & " " & dt.Rows(i)("LName").ToString()
        '        myrow("Building No.") = objMid.getName("Building", "BldgName", "BldgId", dt.Rows(i)("BldgId").ToString())
        '        myrow("Flat No.") = objMid.getName("Room", "RoomNumber", "RoomId", dt.Rows(i)("RoomId").ToString())
        '        myrow("Tel No.") = dt.Rows(i)("telno").ToString()
        '        myrow("Mobile No.") = dt.Rows(i)("Mobno").ToString()
        '        myrow("Scheduled Amt") = GetTotalPay(dt.Rows(i)("RoomId").ToString())
        '        myrow("OutStanding Amt") = GetTotalOut(dt.Rows(i)("RoomId").ToString())
        '        myrow("Total Amt") = GetTotalPymt(dt.Rows(i)("RoomId").ToString())
        '        myrow("Paid Amt") = GetTotalPaidAmt(dt.Rows(i)("RoomId").ToString())
        '        myrow("Advance Amt") = GetAdvance(dt.Rows(i)("RoomId").ToString())

        '        paymentamount = GetTotalOut(dt.Rows(i)("RoomId").ToString())
        '        duedate = GetDueDate()
        '        duedays = DateDiff(DateInterval.Day, duedate, Now.Date)
        '        'myrow("Due Days") = duedays
        '        'interest = (paymentamount * 21 * duedays) / 36500
        '        myrow("Interest") = Round(GetInterest(dt.Rows(i)("RoomId").ToString()))
        '        myrow("Pending Interest") = Round(getPendingInt(dt.Rows(i)("RoomId").ToString()))
        '        myrow("Aggregate Amt") = Round(GetAggAmt(dt.Rows(i)("RoomId").ToString())) + Round(getPendingInt(dt.Rows(i)("RoomId").ToString()))
        '        myrow("Bank") = dt.Rows(i)("Bank").ToString()
        '        DefaultersTbl.Rows.Add(myrow)
        '        'End If
        '    Next
        'End If
        'Grid1.DataSource = DefaultersTbl
        'Grid1.DataBind()
    End Sub
    Public Function getMonth(ByVal monthint As Integer) As String
        Dim strmonth As String

        If monthint = 1 Then
            strmonth = "January"
            Return strmonth
        ElseIf monthint = 2 Then
            strmonth = "February"
            Return strmonth
        ElseIf monthint = 3 Then
            strmonth = "March"
            Return strmonth
        ElseIf monthint = 4 Then
            strmonth = "April"
            Return strmonth

        ElseIf monthint = 5 Then
            strmonth = "May"
            Return strmonth
        ElseIf monthint = 6 Then
            strmonth = "June"
            Return strmonth
        ElseIf monthint = 7 Then
            strmonth = "July"
            Return strmonth
        ElseIf monthint = 8 Then
            strmonth = "August"
            Return strmonth
        ElseIf monthint = 9 Then
            strmonth = "September"
            Return strmonth
        ElseIf monthint = 10 Then
            strmonth = "October"
            Return strmonth

        ElseIf monthint = 11 Then
            strmonth = "November"
            Return strmonth

        ElseIf monthint = 12 Then
            strmonth = "December"
            Return strmonth
        End If

    End Function

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
        strsql = "SELECT SUM(dbo.PymtEntry.PymtAmount) FROM dbo.Pyment INNER JOIN dbo.PymtEntry ON dbo.Pyment.PymtId = dbo.PymtEntry.PymtId WHERE (dbo.Pyment.RoomId =  " & roomid & ") and pymtdate between '" & fromdate.Date & "' and '" & todate.Date & "'"
        gnds = objMid.ExecuteSelectSQL(strsql)
        If gnds.Tables(0).Rows(0)(0).ToString() = "" Then
            Return 0
        Else
            Return gnds.Tables(0).Rows(0)(0).ToString()
        End If
    End Function

    Public Function GetAdvance(ByVal fromyear As Integer, ByVal toyear As Integer) As Integer
        Dim strsql As String
        Dim gnds As New DataSet
        'Dim gndt As New DataTable
        strsql = "select pymtamount from pymtAdventry where PymtDate between '4/1/" & Str(fromyear) & "' and '3/31/" & Str(toyear) & "'"

        'ds = objMid.ExecuteSelectSQL("SELECT sum(PymtAmount) FROM  PymtEntry WHERE PymtDate between '" & Str(frommonth) & "/1/" & Str(fromyear) & "' and '" & Str(1) & "/1/" & Str(fromyear + 1) & "'")
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
        Dim sql As String
        sql = "select sum(TotalPayment) from pyment where roomid =" & roomid & ""
        localds = objMid.ExecuteSelectSQL(sql)
        Return CDbl(localds.Tables(0).Rows(0)(0).ToString())
    End Function
    Public Sub CreateDefaultersTbl()
        DefaultersTbl = New DataTable("DefaultersTbl")
        FlatNos = New DataColumn("Year", System.Type.GetType("System.String"))
        'Name = New DataColumn("Month", System.Type.GetType("System.String"))
        BLDGName = New DataColumn("Amount", System.Type.GetType("System.String"))
        'FlatNos = New DataColumn("Flat No.", System.Type.GetType("System.String"))
        'TelNo = New DataColumn("Tel No.", System.Type.GetType("System.String"))
        'MobNo = New DataColumn("Mobile No.", System.Type.GetType("System.String"))
        'TotalScheduleamt = New DataColumn("Scheduled Amt", System.Type.GetType("System.String"))
        'totalOutStanding = New DataColumn("OutStanding Amt", System.Type.GetType("System.String"))
        ''Duedatef = New DataColumn("Due Date", System.Type.GetType("System.String"))
        ''OverDueDays = New DataColumn("Due Days", System.Type.GetType("System.String"))
        'totalInterest = New DataColumn("Interest", System.Type.GetType("System.String"))
        'totalPendingInt = New DataColumn("Pending Interest", System.Type.GetType("System.String"))
        'TotalAggAmount = New DataColumn("Aggregate Amt", System.Type.GetType("System.String"))
        'TotalAmount = New DataColumn("Total Amt", System.Type.GetType("System.String"))
        'PaidAmount = New DataColumn("Paid Amt", System.Type.GetType("System.String"))
        'Advance = New DataColumn("Advance Amt", System.Type.GetType("System.String"))
        'Bank = New DataColumn("Bank", System.Type.GetType("System.String"))

        DefaultersTbl.Columns.Add(FlatNos)
        'DefaultersTbl.Columns.Add(Name)
        DefaultersTbl.Columns.Add(BLDGName)
        'DefaultersTbl.Columns.Add(Name)
        'DefaultersTbl.Columns.Add(TelNo)
        'DefaultersTbl.Columns.Add(MobNo)
        'DefaultersTbl.Columns.Add(TotalAmount)
        'DefaultersTbl.Columns.Add(TotalScheduleamt)
        'DefaultersTbl.Columns.Add(totalOutStanding)
        'DefaultersTbl.Columns.Add(PaidAmount)
        'DefaultersTbl.Columns.Add(Advance)
        ''DefaultersTbl.Columns.Add(Duedatef)
        ''DefaultersTbl.Columns.Add(OverDueDays)
        'DefaultersTbl.Columns.Add(totalInterest)
        'DefaultersTbl.Columns.Add(totalPendingInt)
        'DefaultersTbl.Columns.Add(TotalAggAmount)
        'DefaultersTbl.Columns.Add(Bank)


        Session("TempDefaultersTbl") = DefaultersTbl
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            MultiView1.ActiveViewIndex = 0
            drpSite.SelectedIndex = 0
            objMid.PopulateList(drpBuilding, "BldgId", "BldgName", objMid.ExecuteSelectSQL("select * from building where siteid = '" & drpSite.SelectedValue & "'").Tables(0))
        End If
    End Sub

    'Protected Sub drpSite_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpSite.SelectedIndexChanged
    '    'objMid.PopulateList(drpBuilding, "BldgId", "BldgName", objMid.ExecuteSelectSQL("select * from building where siteid = '" & drpSite.SelectedValue & "'").Tables(0))
    'End Sub

End Class
