Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Imports System.Math

Partial Class mmsoft_DefaultersList
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
    Dim TotalAggAmount As DataColumn
    Dim TotalScheduleamt As DataColumn
    'Dim Duedatef As DataColumn
    Dim BLDGName As DataColumn
    Dim FlatNos As DataColumn

    
    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
        Dim objint As New Interest
        objint.UpdatePaymentInterest()
        MultiView1.ActiveViewIndex = 1
        If drpSite.SelectedValue = 1 Then
            min = 0
            max = 100000
            lblmin.Text = min
            lblmax.Text = max
        ElseIf drpSite.SelectedValue = 2 Then
            min = 100000
            max = 200000
            lblmin.Text = min
            lblmax.Text = max
        ElseIf drpSite.SelectedValue = 3 Then
            min = 200000
            max = 300000
            lblmin.Text = min
            lblmax.Text = max
        ElseIf drpSite.SelectedValue = 4 Then
            min = 300000
            max = 400000
            lblmin.Text = min
            lblmax.Text = max
        ElseIf drpSite.SelectedValue = 5 Then
            min = 400000
            max = 1000000
            lblmin.Text = min
            lblmax.Text = "Above"
        End If
        Dim ds As New DataSet
        If Not Session("DefaultersTbl") Is Nothing Then
            Session("DefaultersTbl") = Nothing
        End If
        If Session("DefaultersTbl") Is Nothing Then
            CreateDefaultersTbl()
        End If
        Dim i As Integer
        DefaultersTbl = Session("TempDefaultersTbl")
        ds = objMid.ExecuteSelectSQL("SELECT TOP 100 PERCENT SalesId, SiteId, BldgId, RoomId, SqFt, Rate, FName, LName, SFName, SLName, Add1, Add2, telno, Mobno, email, saledate, Bank FROM dbo.salesDetails ORDER BY RoomId,BldgId")
        Dim dt As DataTable
        dt = ds.Tables(0)
        Dim duedate As New Date
        Dim duedays As Integer
        Dim interest As Double
        Dim paymentamount As Double
        If Not ds Is Nothing Then
            For i = 0 To dt.Rows.Count - 1
                If (GetTotalOut(CDbl(dt.Rows(i)("RoomId").ToString())) > min And GetTotalOut(CDbl(dt.Rows(i)("RoomId").ToString())) < max) Then
                    myrow = DefaultersTbl.NewRow()
                    myrow("Flat No.") = objMid.getName("Room", "RoomNumber", "RoomId", dt.Rows(i)("RoomId").ToString())
                    myrow("Name") = dt.Rows(i)("FName").ToString() & " " & dt.Rows(i)("LName").ToString()
                    myrow("Building No.") = objMid.getName("Building", "BldgName", "BldgId", dt.Rows(i)("BldgId").ToString())
                    myrow("Tel No.") = dt.Rows(i)("telno").ToString()
                    myrow("Mobile No.") = dt.Rows(i)("Mobno").ToString()
                    myrow("Total Scheduled Amt") = GetTotalPay(dt.Rows(i)("RoomId").ToString())
                    myrow("Total OutStanding Amt") = GetTotalOut(dt.Rows(i)("RoomId").ToString())
                    paymentamount = GetTotalOut(dt.Rows(i)("RoomId").ToString())
                    duedate = GetDueDate()
                    duedays = DateDiff(DateInterval.Day, duedate, Now.Date)
                    'myrow("Due Days") = duedays
                    interest = (paymentamount * 21 * duedays) / 36500
                    myrow("Total Interest") = Round(GetInterest(dt.Rows(i)("RoomId").ToString()))
                    myrow("Aggregate Amt") = Round(GetAggAmt(dt.Rows(i)("RoomId").ToString()))

                    DefaultersTbl.Rows.Add(myrow)
                End If
            Next
        End If
        Grid1.DataSource = DefaultersTbl
        Grid1.DataBind()
    End Sub
    Public Function GetTotalOut(ByVal roomid As Integer) As Double
        Dim localds As New DataSet
        localds = objMid.ExecuteSelectSQL("select sum(outstanding) from pyment where roomid =" & roomid & "")
        Return CDbl(localds.Tables(0).Rows(0)(0).ToString())
    End Function
    Public Function GetInterest(ByVal roomid As Integer) As Double
        Dim localds As New DataSet
        localds = objMid.ExecuteSelectSQL("select sum(interest) from pyment where roomid =" & roomid & "")
        Return CDbl(localds.Tables(0).Rows(0)(0).ToString())
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
    Public Sub CreateDefaultersTbl()
        DefaultersTbl = New DataTable("DefaultersTbl")
        Name = New DataColumn("Name", System.Type.GetType("System.String"))
        BLDGName = New DataColumn("Building No.", System.Type.GetType("System.String"))
        FlatNos = New DataColumn("Flat No.", System.Type.GetType("System.String"))
        TelNo = New DataColumn("Tel No.", System.Type.GetType("System.String"))
        MobNo = New DataColumn("Mobile No.", System.Type.GetType("System.String"))
        TotalScheduleamt = New DataColumn("Total Scheduled Amt", System.Type.GetType("System.String"))
        totalOutStanding = New DataColumn("Total OutStanding Amt", System.Type.GetType("System.String"))
        'Duedatef = New DataColumn("Due Date", System.Type.GetType("System.String"))
        'OverDueDays = New DataColumn("Due Days", System.Type.GetType("System.String"))
        totalInterest = New DataColumn("Total Interest", System.Type.GetType("System.String"))
        TotalAggAmount = New DataColumn("Aggregate Amt", System.Type.GetType("System.String"))

        DefaultersTbl.Columns.Add(FlatNos)
        DefaultersTbl.Columns.Add(BLDGName)
        DefaultersTbl.Columns.Add(Name)
        DefaultersTbl.Columns.Add(TelNo)
        DefaultersTbl.Columns.Add(MobNo)
        DefaultersTbl.Columns.Add(TotalScheduleamt)
        DefaultersTbl.Columns.Add(totalOutStanding)
        'DefaultersTbl.Columns.Add(Duedatef)
        'DefaultersTbl.Columns.Add(OverDueDays)
        DefaultersTbl.Columns.Add(totalInterest)
        DefaultersTbl.Columns.Add(TotalAggAmount)

        Session("TempDefaultersTbl") = DefaultersTbl
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            MultiView1.ActiveViewIndex = 0
        End If
    End Sub
End Class
