Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Imports System.Math

Partial Class mmsoft_Letters2
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
            Call ArryList1()
            Call PopulateForm(Session("RoomID"))
        End If
    End Sub

    Public Function GetTotalOut(ByVal roomid As Integer) As Double
        Dim localds As New DataSet
        localds = objMid.ExecuteSelectSQL("select sum(outstanding) from pyment where roomid =" & roomid & "")
        Return CDbl(localds.Tables(0).Rows(0)(0).ToString())
    End Function

    Public Function GetDueDate() As Date
        Dim localds As New DataSet
        localds = objMid.ExecuteSelectSQL("select duedate from PayDueDate")
        Return localds.Tables(0).Rows(0)(0).ToString()
    End Function

    Public Function GetLastDate(ByVal roomid As Integer) As Date
        Dim localds As New DataSet
        localds = objMid.ExecuteSelectSQL("select letterdate from LettersHistory where roomid =" & roomid & " and SerialNo=1")
        Return localds.Tables(0).Rows(0)(0).ToString()
    End Function

    Public Sub PopulateForm(ByVal RoomID As Integer)
        'Dim prvid As String
        'Dim privname As String
        'Dim beginid As String
        'Dim beginname As String
        lbldate.Text = Convert.ToDateTime(Session("LetterDate")).ToString("dd-MMM-yy")
        'prvid = PrivStageId(RoomID)
        'lblcompstageid.Text = prvid
        'privname = PrivStageName(RoomID)
        'beginid = BeginStageId(RoomID)
        'beginname = BeginStageName(RoomID)
        'lblcompstagename.Text = privname
        'lblbeginstageid.Text = beginid
        'lblbeginstageid2.Text = beginid
        'lblbeginstagename.Text = beginname
        'lblbeginstagename2.Text = beginname
        'lblbeginstageid3.Text = beginid
        lblLastDate.Text = Convert.ToDateTime(GetLastDate(RoomID)).ToString("dd-MMM-yy")
        Dim TotalOut As Double = GetTotalOut(RoomID)
        Dim DueDate As Date = GetDueDate()
        Dim duedays As Integer = DateDiff(DateInterval.Day, DueDate.Date, Now.Date)
        Dim interest As Double = (TotalOut * duedays * 21) / 36500
        interest = GetInterest(RoomID)

        lblinterest.Text = Round(interest) + getPendingInt(RoomID)
        lbltotalout.Text = TotalOut

        'lblPendingInt.Text = getPendingInt(RoomID)
        lblaggamt.Text = Round(CDbl(GetAggAmt(RoomID)) + CDbl(getPendingInt(RoomID)))
        Dim ds As New DataSet
        ds = objMid.ExecuteSelectSQL("SELECT     dbo.salesDetails.SalesId, dbo.salesDetails.SiteId, dbo.salesDetails.BldgId, dbo.salesDetails.RoomId, dbo.Room.RoomNumber, dbo.Building.BldgName, dbo.salesDetails.SqFt, dbo.salesDetails.Rate, dbo.salesDetails.FName, dbo.salesDetails.LName, dbo.salesDetails.SFName, dbo.salesDetails.SLName, dbo.salesDetails.Add1, dbo.salesDetails.Add2, dbo.salesDetails.telno, dbo.salesDetails.Mobno, dbo.salesDetails.email, dbo.salesDetails.saledate, dbo.salesDetails.Bank FROM dbo.salesDetails INNER JOIN dbo.Building ON dbo.salesDetails.BldgId = dbo.Building.BldgId INNER JOIN dbo.Room ON dbo.salesDetails.RoomId = dbo.Room.RoomId WHERE (dbo.salesDetails.RoomId = " & RoomID & ")")
        Dim dt As DataTable
        dt = ds.Tables(0)
        Dim i As Integer = 0

        'If LCase(dt.Rows(i)("BreakDown_Name").ToString()).Equals(LCase(BreakDownNameNew)) And dt.Rows(i)("Process_ID").ToString().Equals(ProcessID.ToString()) Then
        lblname.Text = dt.Rows(i)("FName").ToString() & " " & dt.Rows(i)("LName").ToString()
        lbladd.Text = dt.Rows(i)("Add1").ToString() & " " & dt.Rows(i)("Add2").ToString()
        lbltelno.Text = dt.Rows(i)("telno").ToString() & "," & dt.Rows(i)("Mobno").ToString()
        lblFlatNo.Text = dt.Rows(i)("RoomNumber").ToString()
        lblbuilding.Text = dt.Rows(i)("BldgName").ToString()
        lblsqft.Text = dt.Rows(i)("Sqft").ToString()
        'End If
    End Sub

    Public Function getPendingInt(ByVal roomid As Integer) As Double
        Dim dsint As New DataSet
        dsint = objMid.ExecuteSelectSQL("SELECT SUM(dbo.PymtEntry.IntPending) AS PendingInt FROM dbo.Pyment INNER JOIN dbo.PymtEntry ON dbo.Pyment.PymtId = dbo.PymtEntry.PymtId WHERE (dbo.Pyment.RoomId = " & roomid & ")")
        Return CDbl(dsint.Tables(0).Rows(0)(0).ToString)
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
End Class
