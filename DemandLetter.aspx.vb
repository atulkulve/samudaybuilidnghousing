Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Imports System.Math
Imports System.DateTime
Imports System.DateTimeKind

Partial Class mmsoft_DemandLetter
    Inherits System.Web.UI.Page
    Dim objMid As New MiddleLayer
    Dim myflag As Boolean
    Dim Array1 As New ArrayList
    Dim constr As String = ConfigurationSettings.AppSettings("MyConnection")
    Public Sub ArryList1()
        Array1.Insert(0, "1st")
        Array1.Insert(1, "2nd")
        Array1.Insert(2, "3rd")
        Array1.Insert(3, "4th")
        Array1.Insert(4, "5th")
        Array1.Insert(5, "6th")
        Array1.Insert(6, "7th")
        Array1.Insert(7, "8th")
        Array1.Insert(8, "9th")
        Array1.Insert(9, "10th")
        Array1.Insert(10, "11th")
        Array1.Insert(11, "12th")
        Array1.Insert(12, "13th")
        Array1.Insert(13, "14th")
        Array1.Insert(14, "15th")
        Array1.Insert(15, "16th")
        Array1.Insert(16, "17th")
        Array1.Insert(17, "18th")
        Array1.Insert(18, "19th")
        Array1.Insert(19, "20th")
        Array1.Insert(20, "21th")
        Array1.Insert(21, "22th")
        Array1.Insert(22, "23th")
        Array1.Insert(23, "24th")
        Array1.Insert(24, "25th")
        Array1.Insert(25, "26th")
        Array1.Insert(26, "27th")
        Array1.Insert(27, "28th")
        Array1.Insert(28, "29th")
        Array1.Insert(29, "30th")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            objMid.PopulateList(drpSite, "Siteid", "SiteName", objMid.ExecuteSelectSQL("select * from Site").Tables(0))
            MultiView1.ActiveViewIndex = 0
        End If
    End Sub

    Public Function GetTotalOut(ByVal roomid As Integer) As Double
        Dim localds As New DataSet
        localds = objMid.ExecuteSelectSQL("select sum(outstanding) from pyment where roomid =" & roomid & "")
        Return CDbl(localds.Tables(0).Rows(0)(0).ToString())
    End Function

    Public Function GetFinalTotalOut(ByVal roomid As Integer) As Double
        Dim localds As New DataSet
        localds = objMid.ExecuteSelectSQL("select sum(Totaloutstanding) from pyment where roomid =" & roomid & "")
        Return CDbl(localds.Tables(0).Rows(0)(0).ToString())
    End Function

    Public Function GetInterest(ByVal roomid As Integer) As Double
        Dim localds As New DataSet
        localds = objMid.ExecuteSelectSQL("select sum(interest) from pyment where roomid =" & roomid & "")
        Return CDbl(localds.Tables(0).Rows(0)(0).ToString())
    End Function

    Public Function GetTotalSchAmt(ByVal roomid As Integer) As Double
        Dim localds As New DataSet
        localds = objMid.ExecuteSelectSQL("select sum(TotalPayment) from pyment where roomid =" & roomid & "")
        Return CDbl(localds.Tables(0).Rows(0)(0).ToString())
    End Function

    Public Function GetTotalPaidAmt(ByVal roomid As Integer) As Double
        Return CDbl(GetTotalSchAmt(roomid)) - CDbl(GetTotalOut(roomid))
    End Function

    Public Function GetDueDate() As Date
        Dim localds As New DataSet
        localds = objMid.ExecuteSelectSQL("select duedate from PayDueDate")
        Return localds.Tables(0).Rows(0)(0).ToString()
    End Function

    Public Sub PopulateForm(ByVal RoomID As Integer)
        Dim prvid As String
        Dim privname As String
        Dim beginid As String
        Dim beginname As String
        Dim objInt As New Interest

        objInt.UpdatePaymentInterest()
        lbldate.Text = Convert.ToDateTime(lblLetterdate.Date).ToString("dd-MMM-yy")
        'lbldate.Text = Convert.ChangeType(Session("LetterDate"), TypeCode.DateTime, "dd-mmm-yy")
        'lbldate.Text = DateTimeKind.Unspecified
        'lbldate.Text = CType(Session("LetterDate"), DateFormat)

        prvid = PrivStageId(RoomID)
        'lblcompstageid.Text = prvid
        privname = PrivStageName(RoomID)
        beginid = BeginStageId(RoomID)
        beginname = BeginStageName(RoomID)
        lblCompletedStage.Text = privname
        'lblcompstagename.Text = privname
        lblbeginstageid.Text = beginid
        'lblbeginstageid2.Text = beginid
        lblbeginstagename.Text = beginname
        lblbeginstage.Text = beginname
        'lblbeginstageid3.Text = beginid
        lblScheduleAmt.Text = GetTotalSchAmt(RoomID)
        lblPaidAmt.Text = GetTotalPaidAmt(RoomID)

        Dim TotalOut As Double = GetTotalOut(RoomID)
        Dim DueDate As Date = GetDueDate()
        Dim duedays As Integer = DateDiff(DateInterval.Day, DueDate.Date, Now.Date)
        Dim interest As Double = (TotalOut * duedays * 21) / 36500
        'lblinterest.Text = Round(interest)
        'TotalOut = GetFinalTotalOut(RoomID)
        interest = GetInterest(RoomID)

        lblinterest.Text = Round(interest) + getPendingInt(RoomID)

        lblBalAmt.Text = Round(TotalOut)
        'lblaggamt.Text = Round(TotalOut + interest)
        objMid.ExecuteSqlStmt("Insert into DemandLetter (DemandId,demanddate,RoomId,ScheduleAmt,PaidAmt,BalAmt,UserId,CreatedDate) values(" & objMid.getUniqueID("DemandLetter", "DemandId") & ",'" & lblLetterdate.Date & "'," & RoomID & "," & CDbl(lblScheduleAmt.Text) & "," & CDbl(lblPaidAmt.Text) & "," & CDbl(lblBalAmt.Text) & ",'" & Session("USERID") & "','" & Now.Date & "' )")
        Dim ds As New DataSet
        ds = objMid.ExecuteSelectSQL("SELECT     dbo.salesDetails.SalesId, dbo.salesDetails.SiteId, dbo.salesDetails.BldgId, dbo.salesDetails.RoomId, dbo.Room.RoomNumber, dbo.Building.BldgName, dbo.salesDetails.SqFt, dbo.salesDetails.Rate, dbo.salesDetails.FName, dbo.salesDetails.LName, dbo.salesDetails.SFName, dbo.salesDetails.SLName, dbo.salesDetails.Add1, dbo.salesDetails.Add2, dbo.salesDetails.telno, dbo.salesDetails.Mobno, dbo.salesDetails.email, dbo.salesDetails.saledate, dbo.salesDetails.Bank FROM dbo.salesDetails INNER JOIN dbo.Building ON dbo.salesDetails.BldgId = dbo.Building.BldgId INNER JOIN dbo.Room ON dbo.salesDetails.RoomId = dbo.Room.RoomId WHERE (dbo.salesDetails.RoomId = " & RoomID & ")")
        Dim dt As DataTable
        dt = ds.Tables(0)
        Dim i As Integer = 0

        'If LCase(dt.Rows(i)("BreakDown_Name").ToString()).Equals(LCase(BreakDownNameNew)) And dt.Rows(i)("Process_ID").ToString().Equals(ProcessID.ToString()) Then
        lblname.Text = dt.Rows(i)("FName").ToString() & " " & dt.Rows(i)("LName").ToString()
        lbladd.Text = dt.Rows(i)("Add1").ToString() & " " & dt.Rows(i)("Add2").ToString()
        lbltelno.Text = dt.Rows(i)("telno").ToString()
        Label1.Text = dt.Rows(i)("mobno").ToString()
        lblFlatNo.Text = dt.Rows(i)("RoomNumber").ToString()
        lblbuilding.Text = dt.Rows(i)("BldgName").ToString()

        lblBldgName.Text = lblbuilding.Text
        lblBldgName2.Text = lblbuilding.Text
        lblBldgName3.Text = lblbuilding.Text
        'lblBldgName4.Text = lblbuilding.Text
        'lblbldgname5.Text = lblbuilding.Text

        lblsqft.Text = dt.Rows(i)("Sqft").ToString()
        'End If
    End Sub

    Public Function getPendingInt(ByVal roomid As Integer) As Double
        Dim dsint As New DataSet
        dsint = objMid.ExecuteSelectSQL("SELECT SUM(dbo.PymtEntry.IntPending) AS PendingInt FROM dbo.Pyment INNER JOIN dbo.PymtEntry ON dbo.Pyment.PymtId = dbo.PymtEntry.PymtId WHERE (dbo.Pyment.RoomId = " & roomid & ")")
        If dsint.Tables(0).Rows(0)(0) Is DBNull.Value Then
            Return 0
        End If
        Return CDbl(dsint.Tables(0).Rows(0)(0).ToString)
    End Function

    Public Function PrivStageId(ByVal RoomID As Integer) As String
        Dim prvds As New DataSet
        Dim prvdt As New DataTable
        prvds = objMid.ExecuteSelectSQL("SELECT TOP 100 PERCENT dbo.BldgStage.BldgStageId, dbo.BldgStage.BldgId, dbo.Building.BldgName, dbo.BldgStage.StageId, dbo.stage.StageDesc, dbo.BldgStage.CompletePercentage, dbo.BldgStage.CompletionDate, dbo.BldgStage.CompletionFlag, dbo.BldgStage.srNo FROM dbo.BldgStage INNER JOIN dbo.Building ON dbo.BldgStage.BldgId = dbo.Building.BldgId INNER JOIN dbo.stage ON dbo.BldgStage.StageId = dbo.stage.StageId  WHERE     (dbo.BldgStage.BldgId = " & objMid.getID("Room", "RoomId", "BldgId", RoomID) & ") AND (dbo.BldgStage.CompletionFlag <> 0) ORDER BY dbo.BldgStage.BldgStageId")
        prvdt = prvds.Tables(0)
        'Dim i As Integer
        Dim prvid As Integer = prvdt.Rows.Count - 2
        Return Array1.Item(prvid)
    End Function
    Public Function PrivStageName(ByVal RoomID As Integer) As String
        Dim prvds As New DataSet
        Dim prvdt As New DataTable
        prvds = objMid.ExecuteSelectSQL("SELECT TOP 100 PERCENT dbo.BldgStage.BldgStageId, dbo.BldgStage.BldgId, dbo.Building.BldgName, dbo.BldgStage.StageId, dbo.stage.StageDesc, dbo.BldgStage.CompletePercentage, dbo.BldgStage.CompletionDate, dbo.BldgStage.CompletionFlag, dbo.BldgStage.srNo FROM dbo.BldgStage INNER JOIN dbo.Building ON dbo.BldgStage.BldgId = dbo.Building.BldgId INNER JOIN dbo.stage ON dbo.BldgStage.StageId = dbo.stage.StageId  WHERE     (dbo.BldgStage.BldgId = " & objMid.getID("Room", "RoomId", "BldgId", RoomID) & ") AND (dbo.BldgStage.CompletionFlag <> 0) ORDER BY dbo.BldgStage.BldgStageId")
        prvdt = prvds.Tables(0)
        'Dim i As Integer
        Dim prvid As Integer = prvdt.Rows.Count - 2

        Return prvdt.Rows(prvid)("StageDesc").ToString()
    End Function
    Public Function BeginStageName(ByVal RoomID As Integer) As String
        Dim prvds As New DataSet
        Dim prvdt As New DataTable
        prvds = objMid.ExecuteSelectSQL("SELECT TOP 100 PERCENT dbo.BldgStage.BldgStageId, dbo.BldgStage.BldgId, dbo.Building.BldgName, dbo.BldgStage.StageId, dbo.stage.StageDesc, dbo.BldgStage.CompletePercentage, dbo.BldgStage.CompletionDate, dbo.BldgStage.CompletionFlag, dbo.BldgStage.srNo FROM dbo.BldgStage INNER JOIN dbo.Building ON dbo.BldgStage.BldgId = dbo.Building.BldgId INNER JOIN dbo.stage ON dbo.BldgStage.StageId = dbo.stage.StageId  WHERE     (dbo.BldgStage.BldgId = " & objMid.getID("Room", "RoomId", "BldgId", RoomID) & ") AND (dbo.BldgStage.CompletionFlag <> 0) ORDER BY dbo.BldgStage.BldgStageId")
        prvdt = prvds.Tables(0)
        'Dim i As Integer
        Dim Beginid As Integer = prvdt.Rows.Count - 1

        Return prvdt.Rows(Beginid)("StageDesc").ToString()
    End Function
    Public Function BeginStageId(ByVal RoomID As Integer) As String
        Dim prvds As New DataSet
        Dim prvdt As New DataTable
        prvds = objMid.ExecuteSelectSQL("SELECT TOP 100 PERCENT dbo.BldgStage.BldgStageId, dbo.BldgStage.BldgId, dbo.Building.BldgName, dbo.BldgStage.StageId, dbo.stage.StageDesc, dbo.BldgStage.CompletePercentage, dbo.BldgStage.CompletionDate, dbo.BldgStage.CompletionFlag, dbo.BldgStage.srNo FROM dbo.BldgStage INNER JOIN dbo.Building ON dbo.BldgStage.BldgId = dbo.Building.BldgId INNER JOIN dbo.stage ON dbo.BldgStage.StageId = dbo.stage.StageId  WHERE     (dbo.BldgStage.BldgId = " & objMid.getID("Room", "RoomId", "BldgId", RoomID) & ") AND (dbo.BldgStage.CompletionFlag <> 0) ORDER BY dbo.BldgStage.BldgStageId")
        prvdt = prvds.Tables(0)
        'Dim i As Integer
        Dim Beginid As Integer = prvdt.Rows.Count - 1

        Return Array1.Item(Beginid)
    End Function

    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
        Call ArryList1()
        Call PopulateForm(drpFlatnumber.SelectedValue)
        MultiView1.ActiveViewIndex = 1
    End Sub
    Protected Sub drpSite_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpSite.SelectedIndexChanged
        objMid.PopulateList(drpBuilding, "BldgId", "BldgName", objMid.ExecuteSelectSQL("select * from Building where siteid = '" & drpSite.SelectedValue & "'").Tables(0))
    End Sub

    Protected Sub drpBuilding_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpBuilding.SelectedIndexChanged
        objMid.PopulateList(drpFlatnumber, "RoomId", "RoomNumber", objMid.ExecuteSelectSQL("select * from Room where Bldgid = '" & drpBuilding.SelectedValue & "' and Booked='Yes'").Tables(0))
    End Sub

End Class
