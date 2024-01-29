Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Imports System.Math

Partial Class mmsoft_Buildingwiseoutstanding
    Inherits System.Web.UI.Page

    Dim objMid As New MiddleLayer
    Dim myflag As Boolean
    Dim constr As String = ConfigurationSettings.AppSettings("MyConnection")
    Dim DefaultersTbl As New DataTable
    Dim myrow As DataRow

    Dim Outstanding As DataColumn
    Dim BldgName As DataColumn
    Dim Oldbldgname(7) As String

    Dim Oldbldgid(7) As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim dx, dxroom As New DataTable
        Dim df, dfroom As New DataSet
        Dim sqft As Double
        Oldbldgname(0) = "B1"
        Oldbldgname(1) = "B2"
        Oldbldgname(2) = "B3"
        Oldbldgname(3) = "B4"
        Oldbldgname(4) = "RH-A"
        Oldbldgname(5) = "RH-B"
        Oldbldgname(6) = "RH-A-Desai"
        Oldbldgname(7) = "RH-A-Plot A"

        'Id
        Oldbldgid(0) = "38"
        Oldbldgid(1) = "39"
        Oldbldgid(2) = "40"
        Oldbldgid(3) = "41"
        Oldbldgid(4) = "42"
        Oldbldgid(5) = "43"
        Oldbldgid(6) = "44"
        Oldbldgid(7) = "45"

        'myrow = New DataRow
        'Dim rateofint As Double
        Dim otherCharges, sqftrate, TotalResidualBldg As Double

        If Not Session("DefaultersTbl") Is Nothing Then
            Session("DefaultersTbl") = Nothing
        End If
        If Session("DefaultersTbl") Is Nothing Then
            CreateDefaultersTbl()
        End If
        dx = New DataTable
        Dim i As Integer
        df = objMid.ExecuteSelectSQL("SELECT BldgId,BldgName FROM Building")
        dx = df.Tables(0)
        If Not df Is Nothing Then
            For i = 0 To dx.Rows.Count - 1
                If checkbuildigId(dx.Rows(i)("BldgId").ToString()) Then

                    myrow = DefaultersTbl.NewRow()
                    dfroom = objMid.ExecuteSelectSQL("SELECT roomid FROM Room where BldgId='" + dx.Rows(i)("BldgId").ToString() + "'")
                    Dim bldgname As String = dx.Rows(i)("BldgName").ToString()
                    myrow("Building") = bldgname
                    dxroom = dfroom.Tables(0)
                    Dim indexroom As Integer
                    Dim paymentdone, outstanding, TotalResidualroom As Double
                    Dim dxrates As New DataTable
                    Dim dfrates As New DataSet
                    If Not dfroom Is Nothing Then
                        For indexroom = 0 To dxroom.Rows.Count - 1
                            dfrates = objMid.ExecuteSelectSQL("SELECT B.Sqft, B.OtherCharges FROM Room A, RoomType B WHERE A.Roomtypeid = B.Roomtypeid AND RoomId =" + dxroom.Rows(indexroom)(0).ToString() + "")
                            dxrates = dfrates.Tables(0)
                            'Payment done for that room
                            paymentdone = getPaymentAmount(dxroom.Rows(indexroom)(0).ToString())
                            'Outstanding of that room
                            If dxrates.Rows.Count > 0 Then
                                otherCharges = CDbl(dxrates.Rows(0)("OtherCharges").ToString())
                                sqft = CDbl(dxrates.Rows(0)("Sqft").ToString)
                            End If
                            Dim dxsqftrate As New DataTable
                            Dim dfsqftrate As New DataSet
                            dfsqftrate = objMid.ExecuteSelectSQL("SELECT Rate FROM salesDetails WHERE RoomId =" + dxroom.Rows(indexroom)(0).ToString() + "")
                            dxsqftrate = dfsqftrate.Tables(0)
                            If dxsqftrate.Rows.Count > 0 Then
                                sqftrate = CDbl(dxsqftrate.Rows(0)(0).ToString())
                            End If
                            outstanding = (sqftrate * sqft) + otherCharges
                            TotalResidualroom = outstanding - paymentdone
                            TotalResidualBldg = TotalResidualBldg + TotalResidualroom
                        Next
                    End If

                    'myrow("Month") = getMonth(frommonth)
                    myrow("Amount Outstanding") = TotalResidualBldg
                    TotalResidualBldg = CDbl(0)
                    DefaultersTbl.Rows.Add(myrow)
                End If
            Next
        End If

        'For OLD members
        TotalResidualBldg = CDbl(0)
        Dim indexbldg As Integer = 0
        For Each value As String In Oldbldgid


            myrow = DefaultersTbl.NewRow()
            dfroom = objMid.ExecuteSelectSQL("SELECT roomid FROM Room where BldgId='" + value + "'")
            Dim bldgname As String = Oldbldgname(indexbldg)
            myrow("Building") = bldgname
            dxroom = dfroom.Tables(0)
            Dim indexroom, salescat As Integer
            Dim paymentdone, outstanding, TotalResidualroom As Double
            Dim dxrates, dxsales As New DataTable
            Dim dfrates, dfsales As New DataSet
            If Not dfroom Is Nothing Then
                For indexroom = 0 To dxroom.Rows.Count - 1
                    dfrates = objMid.ExecuteSelectSQL("SELECT B.Sqft, B.OtherCharges FROM Room A, RoomType B WHERE A.Roomtypeid = B.Roomtypeid AND RoomId =" + dxroom.Rows(indexroom)(0).ToString() + "")
                    dxrates = dfrates.Tables(0)
                    'Payment done for that room
                    paymentdone = getPaymentAmount(dxroom.Rows(indexroom)(0).ToString())
                    'Outstanding of that room
                    If dxrates.Rows.Count > 0 Then
                        otherCharges = CDbl(dxrates.Rows(0)("OtherCharges").ToString())
                        sqft = CDbl(dxrates.Rows(0)("Sqft").ToString)
                    End If
                    Dim dxsqftrate As New DataTable
                    Dim dfsqftrate As New DataSet
                    dfsqftrate = objMid.ExecuteSelectSQL("SELECT Rate,category FROM salesDetails WHERE RoomId =" + dxroom.Rows(indexroom)(0).ToString() + "")
                    dxsqftrate = dfsqftrate.Tables(0)
                    If dxsqftrate.Rows.Count > 0 Then
                        'sqftrate = CDbl(dxsqftrate.Rows(0)("Rate").ToString())
                        salescat = CDbl(dxsqftrate.Rows(0)("category").ToString())
                    End If
                    'sales details


                    outstanding = (170000 + salescat) + otherCharges
                    TotalResidualroom = outstanding - paymentdone
                    TotalResidualBldg = TotalResidualBldg + TotalResidualroom
                Next
            End If

            'myrow("Month") = getMonth(frommonth)
            myrow("Amount Outstanding") = TotalResidualBldg
            TotalResidualBldg = CDbl(0)
            DefaultersTbl.Rows.Add(myrow)
            indexbldg = indexbldg + 1
        Next



        Grid1.DataSource = DefaultersTbl
        Grid1.DataBind()

    End Sub
    Public Function checkbuildigId(ByVal bldgid As String) As Boolean
        For Each value As String In Oldbldgid
            If value = bldgid Then
                Return False
            End If
        Next
        Return True
    End Function

    Public Function getPaymentAmount(ByVal roomid As Integer) As Double
        Dim dx As DataTable
        Dim df As New DataSet
        'Dim i As Integer
        Dim advance, pymt As Double
        'Advance Entry payment retrival
        df = objMid.ExecuteSelectSQL("SELECT sum(pymtamount) FROM pymtadventry where roomid = '" + Str(roomid) + "'")
        dx = df.Tables(0)
        If Not df Is Nothing Then
            If dx.Rows.Count > 0 Then
                If dx.Rows(0)(0).ToString() <> "" Then
                    advance = CDbl(dx.Rows(0)(0).ToString())
                End If
            End If
        End If
        'Schedule entry payment retrival
        Dim sql1 As String
        sql1 = "SELECT     SUM(dbo.PymtEntry.PymtAmount) AS Expr1 FROM dbo.Pyment INNER JOIN dbo.PymtEntry ON dbo.Pyment.PymtId = dbo.PymtEntry.PymtId"
        sql1 = sql1 + " GROUP BY dbo.Pyment.RoomId HAVING(dbo.Pyment.RoomId = " + Str(roomid) + ")"

        df = objMid.ExecuteSelectSQL(sql1)
        dx = df.Tables(0)
        If Not df Is Nothing Then
            If dx.Rows.Count > 0 Then
                If dx.Rows(0)(0).ToString() <> "" Then
                    pymt = CDbl(dx.Rows(0)(0).ToString())
                End If
            End If
        End If
        Return CDbl(advance + pymt)
    End Function

    Public Sub CreateDefaultersTbl()
        DefaultersTbl = New DataTable("DefaultersTbl")
        BldgName = New DataColumn("Building", System.Type.GetType("System.String"))
        'Name = New DataColumn("Month", System.Type.GetType("System.String"))
        Outstanding = New DataColumn("Amount Outstanding", System.Type.GetType("System.String"))
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

        DefaultersTbl.Columns.Add(BldgName)
        'DefaultersTbl.Columns.Add(Name)
        DefaultersTbl.Columns.Add(Outstanding)
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
End Class
