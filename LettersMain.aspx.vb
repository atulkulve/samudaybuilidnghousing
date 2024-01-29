Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Imports System.Math

Partial Class mmsoft_LettersMain
    Inherits System.Web.UI.Page
    Dim objMid As New MiddleLayer
    Dim FName As String
    Dim LName As String
    Dim Array1 As New ArrayList
    Dim constr As String = ConfigurationSettings.AppSettings("MyConnection")

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            'If Not Session("TempPaymentDetailsTbl") Is Nothing Then
            '    Session("TempPaymentDetailsTbl") = Nothing
            'End If
            'If Not Session("RoomID") Is Nothing Then
            '    Session("RoomID") = Nothing
            'End If
            'objMid.PopulateList(drpFlatnumber, "RoomId", "RoomNumber", objMid.ExecuteSelectSQL("select * from Room").Tables(0))
            Call ArryList1()
            If Not Session("RoomID") Is Nothing Then
                Session("RoomID") = Nothing
            End If
            objMid.PopulateList(drpSite, "SiteId", "SiteName", objMid.ExecuteSelectSQL("select * from Site").Tables(0))
        End If
    End Sub

    Protected Sub drpSite_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpSite.SelectedIndexChanged
        objMid.PopulateList(drpBuilding, "BldgId", "BldgName", objMid.ExecuteSelectSQL("select * from building where siteid = '" & drpSite.SelectedValue & "'").Tables(0))
    End Sub

    Protected Sub drpBuilding_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpBuilding.SelectedIndexChanged
        objMid.PopulateList(drpFlatnumber, "RoomId", "RoomNumber", objMid.ExecuteSelectSQL("select * from Room where Bldgid = '" & drpBuilding.SelectedValue & "' and Booked='Yes'").Tables(0))
    End Sub

    Protected Sub drpFlatnumber_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpFlatnumber.SelectedIndexChanged
        Session("RoomID") = drpFlatnumber.SelectedValue
        Dim Checkds As New DataSet
        Dim Checkdt As New DataTable
        'Dim sql As String

        Call SetName(drpFlatnumber.SelectedValue)
        Checkds = objMid.ExecuteSelectSQL("Select * from LettersHistory where RoomId=" & drpFlatnumber.SelectedValue & "")
        Checkdt = Checkds.Tables(0)
        If Checkdt.Rows.Count = 1 Then
            lblletterMsg.Text = "You can Send 2nd Letter to " & FName & " " & LName & " and his/her O/S is " & GetTotalOut(drpFlatnumber.SelectedValue)
        ElseIf Checkdt.Rows.Count = 0 Then
            lblletterMsg.Text = "You can Send 1st Letter to " & FName & " " & LName & " and his/her O/S is " & GetTotalOut(drpFlatnumber.SelectedValue)
        ElseIf Checkdt.Rows.Count = 2 Then
            lblletterMsg.Text = "You can Send 3rd Letter to " & FName & " " & LName & " and his/her O/S is " & GetTotalOut(drpFlatnumber.SelectedValue)
        ElseIf Checkdt.Rows.Count = 3 Then
            lblletterMsg.Text = "Final Letter is Dispatched to " & FName & " " & LName & " and his/her O/S is " & GetTotalOut(drpFlatnumber.SelectedValue) & ". If You want to again send Letters then Click Proceed"
        End If
        txthidden.Text = Checkdt.Rows.Count + 1

    End Sub
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
    'Public Function GetTotalOut(ByVal roomid As Integer) As Double
    '    Dim localds As New DataSet
    '    localds = objMid.ExecuteSelectSQL("select sum(outstanding) from pyment where roomid =" & roomid & "")
    '    If localds.Tables(0).Rows(0)(0).ToString() = "" Then
    '        Return 0
    '    Else
    '        Return CDbl(localds.Tables(0).Rows(0)(0).ToString())
    '    End If
    'End Function

    Public Sub SetName(ByVal roomid As Integer)
        Dim localds As New DataSet
        Dim localdt As DataTable
        localds = objMid.ExecuteSelectSQL("select FName,Lname from salesDetails where roomid =" & roomid & "")
        localdt = localds.Tables(0)
        If Not localds Is Nothing Then
            If localdt.Rows.Count > 0 Then
                FName = localds.Tables(0).Rows(0)(0).ToString()
                LName = localds.Tables(0).Rows(0)(1).ToString()
            End If
        End If
    End Sub
    Protected Sub imbCancel_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbCancel.Click
        drpFlatnumber.Items.Clear()
        drpFlatnumber.Items.Insert(0, "-- Select --")
        drpFlatnumber.Items(0).Value = ""

        drpBuilding.Items.Clear()
        drpBuilding.Items.Insert(0, "-- Select --")
        drpBuilding.Items(0).Value = ""

        drpSite.Items.Clear()
        objMid.PopulateList(drpSite, "SiteId", "SiteName", objMid.ExecuteSelectSQL("select * from Site").Tables(0))
        Session("RoomID") = Nothing
        lblletterMsg.Text = ""
        lblmsg.Text = ""
    End Sub

    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
        Call ArryList1()
        Dim sql As String
        Dim int As New Interest
        int.UpdatePaymentInterest()
        If CInt(txthidden.Text) <= 3 Then
            sql = "Insert into LettersHistory (LetterId,RoomId,LetterDate,SerialNo,CharSerial,outstanding,interest,OSWithPending,UserId,CreatedDate) Values("
            sql = sql & "" & objMid.getUniqueID("LettersHistory", "LetterId") & "," & drpFlatnumber.SelectedValue & ","
            sql = sql & "'" & LetterDate.Date & "','" & CInt(txthidden.Text) & "','" & Array1.Item(CInt(txthidden.Text) - 1) & "',"
            sql = sql & "" & Round(GetAggAmt(drpFlatnumber.SelectedValue)) & "," & Round(GetInterest(drpFlatnumber.SelectedValue)) & "," & Round(GetAggAmt(drpFlatnumber.SelectedValue)) + getPendingInt(drpFlatnumber.SelectedValue) & ",'" & Session("USERID") & "','" & Now.Date & "')"
            objMid.ExecuteSqlStmt(sql)
            Session("LetterDate") = LetterDate.Date
            If CInt(txthidden.Text) = 1 Then
                Response.Redirect("Letters.aspx")
            ElseIf CInt(txthidden.Text) = 2 Then
                Response.Redirect("Letters2.aspx")
            ElseIf CInt(txthidden.Text) = 3 Then
                Response.Redirect("Letters3.aspx")
            End If
        Else
            lblmsg.Text = "You Cannot Send Further Letters"
        End If
        
    End Sub

    Public Function getPendingInt(ByVal roomid As Integer) As Double
        Dim dsint As New DataSet
        dsint = objMid.ExecuteSelectSQL("SELECT SUM(dbo.PymtEntry.IntPending) AS PendingInt FROM dbo.Pyment INNER JOIN dbo.PymtEntry ON dbo.Pyment.PymtId = dbo.PymtEntry.PymtId WHERE (dbo.Pyment.RoomId = " & roomid & ")")
        Return CDbl(dsint.Tables(0).Rows(0)(0).ToString)
    End Function

    Public Function GetTotalOut(ByVal roomid As Integer) As Double
        Dim localds As New DataSet
        localds = objMid.ExecuteSelectSQL("select sum(outstanding) from pyment where roomid =" & roomid & "")
        Return CDbl(localds.Tables(0).Rows(0)(0).ToString())
    End Function

    Public Function GetAggAmt(ByVal roomid As Integer) As Double
        Dim localds As New DataSet
        localds = objMid.ExecuteSelectSQL("select sum(TotalOutStanding) from pyment where roomid =" & roomid & "")
        Return CDbl(localds.Tables(0).Rows(0)(0).ToString())
    End Function

    Public Function GetInterest(ByVal roomid As Integer) As Double
        Dim localds As New DataSet
        localds = objMid.ExecuteSelectSQL("select sum(interest) from pyment where roomid =" & roomid & "")
        Return CDbl(localds.Tables(0).Rows(0)(0).ToString())
    End Function

    Protected Sub imbProceed_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbProceed.Click
        If objMid.ExecuteSqlStmt("Delete LettersHistory where RoomId=" & drpFlatnumber.SelectedValue & "") Then
            lblmsg.Text = "History of Letter is Deleted, Now You can Send From 1st Letter Again"
        Else
            lblmsg.Text = "History of Letter Cannot be Deleted"
        End If
    End Sub
End Class
