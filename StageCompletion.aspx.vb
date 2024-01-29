Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Partial Class mmsoft_StageCompletion
    Inherits System.Web.UI.Page
    Dim objMid As New MiddleLayer
    Dim myflag As Boolean
    Dim ds As DataSet
    Dim dt As DataTable
    Dim Array1 As New ArrayList
    Dim constr As String = ConfigurationSettings.AppSettings("MyConnection")

    Protected Sub drpBuilding_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpBuilding.SelectedIndexChanged
        If Not Session("BuiltID") Is Nothing Then
            Session("BuiltID") = Nothing
        End If
        Dim rowcount As Integer
        Session("BuiltID") = drpBuilding.SelectedValue
        rowcount = BuildingCount(drpBuilding.SelectedValue)
        Call ArryList1()
        ds = objMid.ExecuteSelectSQL("SELECT BldgStage.BldgStageId, BldgStage.BldgId, Building.BldgName, BldgStage.StageId, stage.StageDesc, BldgStage.CompletePercentage, BldgStage.CompletionDate, BldgStage.CompletionFlag, BldgStage.srNo FROM BldgStage INNER JOIN stage ON BldgStage.StageId = stage.StageId INNER JOIN Building ON BldgStage.BldgId = Building.BldgId WHERE (BldgStage.BldgId = " & drpBuilding.SelectedValue & ") AND (BldgStage.CompletionFlag = 0) and (BldgStage.srno = '" & Array1.Item(rowcount) & "')")
        If Not ds Is Nothing Then
            If Not ds.Tables(0).Rows(0)("BldgStageID").ToString = "" Then
                MultiView1.ActiveViewIndex = 0
                txthidden.Text = ds.Tables(0).Rows(0)("BldgStageID").ToString
                lblStageDesc.Text = ds.Tables(0).Rows(0)("StageDesc").ToString
                lblpercentage.Text = ds.Tables(0).Rows(0)("CompletePercentage").ToString
            End If
        End If
    End Sub
    Public Function BuildingCount(ByVal bldgid As Integer) As Integer
        Dim dscount As New DataSet
        'Dim dtcount As New DataTable
        dscount = objMid.ExecuteSelectSQL("select bldgid from bldgstage where completionflag=1 and bldgid =" & bldgid & "")
        'dtcount = dscount.Tables(0)

        Return dscount.Tables(0).Rows.Count
    End Function
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
            MultiView1.ActiveViewIndex = 1
            objMid.PopulateList(drpSite, "SiteId", "SiteName", objMid.ExecuteSelectSQL("select * from Site").Tables(0))
            If Not Session("BuiltID") Is Nothing Then
                Session("BuiltID") = Nothing
            End If
        End If
    End Sub

    Protected Sub drpSite_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpSite.SelectedIndexChanged
        objMid.PopulateList(drpBuilding, "BldgId", "BldgName", objMid.ExecuteSelectSQL("select * from building where siteid = '" & drpSite.SelectedValue & "'").Tables(0))
    End Sub

    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
        Dim sql As String
        Dim generalds As DataSet
        Dim roomds As DataSet
        Dim generaldt As DataTable
        'Dim roomdt As New DataTable

        Dim sqft As Integer
        Dim rate As Double
        Dim percentage As Double
        Dim saledate As Date
        Dim othercharges As Integer
        Dim amount As Integer
        Dim payduedate As Date

        payduedate = completedate.Date
        payduedate.AddDays(15)
        percentage = CDbl(lblpercentage.Text)

        Dim i As Integer
        sql = "Update BldgStage SET CompletionDate ='" & completedate.Date & "' , CompletionFlag = '1' WHERE BldgStageId = " & txthidden.Text
        objMid.ExecuteSqlStmt(sql)

        sql = "SELECT RoomId, SqFt, Rate,saledate FROM SALESDETAILS WHERE  BldgId = " & drpBuilding.SelectedValue
        generalds = objMid.ExecuteSelectSQL(sql)
        generaldt = generalds.Tables(0)
        If Not generaldt Is Nothing Then
            For i = 0 To generaldt.Rows.Count - 1
                sqft = generaldt.Rows(i)("Sqft").ToString()
                rate = generaldt.Rows(i)("Rate").ToString
                saledate = generaldt.Rows(i)("saledate").ToString
                sql = "SELECT B.Sqft, B.OtherCharges FROM Room A, RoomType B WHERE A.Roomtypeid = B.Roomtypeid AND RoomId = " & generaldt.Rows(i)("RoomId").ToString
                roomds = objMid.ExecuteSelectSQL(sql)
                'Take Other Charges From Room Master
                If Not roomds Is Nothing Then
                    othercharges = roomds.Tables(0).Rows(0)("OtherCharges").ToString
                End If
                amount = (rate * sqft + othercharges) * percentage / 100
                'Insert into Pyment Table
                sql = "INSERT INTO Pyment (pymtID, BldgStageId,RoomId,DueDate,TotalPayment,OutStanding,userId,createdDate) VALUES("
                sql = sql & "" & objMid.getUniqueID("Pyment", "PymtID") & "," & txthidden.Text & ","
                sql = sql & "'" & generaldt.Rows(i)("RoomId").ToString() & "','" & payduedate.AddDays(15) & "','" & amount & "',"
                sql = sql & "'" & amount & "','" & Session("USERID") & "','" & Now.Date & "')"
                objMid.ExecuteSqlStmt(sql)
            Next
            sql = "SELECT A.ROOMID, A.PYMTDATE, A.PYMTMODE, A.PYMTAMOUNT, A.CHQDET, B.SITEID, B.BLDGID  FROM PYMTADVENTRY A, SALESDETAILS B WHERE A.ROOMID = B.ROOMID"
            ds = objMid.ExecuteSelectSQL(sql)
            dt = ds.Tables(0)
            If Not dt Is Nothing Then
                If dt.Rows.Count > 0 Then
                    For i = 0 To dt.Rows.Count - 1
                        Call AdjustAdvance(dt.Rows(i)("PYMTAMOUNT").ToString(), dt.Rows(i)("ROOMID").ToString(), dt.Rows(i)("PYMTMODE").ToString(), dt.Rows(i)("CHQDET").ToString(), dt.Rows(i)("PYMTDATE").ToString())
                    Next
                End If
            End If
        End If
        Call clearcontrols()
        lblmsg.Text = "Stage Added"
        If Not Session("BuiltID") Is Nothing Then
            Session("BuiltID") = Nothing
        End If
        Response.Redirect("UserMenu.aspx")
    End Sub

    Public Sub AdjustAdvance(ByVal paidamt As Integer, ByVal RoomId As Integer, ByVal PayMode As String, ByVal Cheqdetails As String, ByVal pymtdate As Date)
        Dim outstandingds As New DataSet
        Dim outstandingdt As New DataTable
        outstandingds = objMid.ExecuteSelectSQL("SELECT B.SiteId, B.BldgId, B.RoomId, B.SqFt, B.Rate, B.FName, B.LName, B.Add1, B.Add2, B.telno, B.Mobno, B.email, B.saledate, D.StageDesc, A.DueDate, A.TotalPayment, A.OutStanding, A.PymtId, B.SFName, B.SLName FROM Pyment AS A INNER JOIN salesDetails AS B ON A.RoomId = B.RoomId INNER JOIN BldgStage AS C ON A.BldgStageId = C.BldgStageId INNER JOIN stage AS D ON C.StageId = D.StageId WHERE (A.OutStanding > 0) AND (B.RoomId = '" & RoomId & "')")

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

        amount = paidamt
        duedays = 0
        InterestOut = 0
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
                'datedue = outstandingdt.Rows(i)("DueDate").ToString()
                'duedays = DateDiff(DateInterval.Day, datedue, Now.Date)
                'myrow("Over Days Due") = duedays
                'InterestOut = payamount * 21 * duedays / 36500
                'myrow("Stage Description") = outstandingdt.Rows(i)("StageDesc").ToString()
                sql = "Insert into PymtEntry (PymtEntryID,PymtId,PymtDate,PymtMode,Pymtamount,ChqDet,IntPending,IntDays,UserID,CreatedDate) Values("
                sql = sql & "" & objMid.getUniqueID("PymtEntry", "PymtEntryID") & "," & outstandingdt.Rows(i)("PymtId").ToString() & ","
                sql = sql & "'" & pymtdate.Date & "','" & PayMode & "','" & payamount & "',"
                sql = sql & "'" & Cheqdetails & "'," & InterestOut & "," & duedays & ",'" & Session("USERID") & "','" & Now.Date & "')"
                objMid.ExecuteSqlStmt(sql)
                sql = "Update Pyment set outstanding = " & balamount & " where pymtId=" & outstandingdt.Rows(i)("PymtID").ToString & ""
                objMid.ExecuteSqlStmt(sql)
                If amount = 0 Then
                    Exit For
                End If
            Next
        End If
        sql = "Delete from PymtAdvEntry where RoomId = " & RoomId & ""
        objMid.ExecuteSqlStmt(sql)
        If amount > 0 Then
            sql = "Insert into PymtAdvEntry (RoomId,PymtDate,PymtMode, PymtAmount, ChqDet,  userId,  createdDate) values("
            sql = sql & "" & RoomId & ",'" & pymtdate.date & "','" & PayMode & "'," & amount & ", "
            sql = sql & "'" & Cheqdetails & "','" & Session("USERID") & "','" & Now.Date & "')"
            objMid.ExecuteSqlStmt(sql)
        End If
    End Sub
    Public Sub clearcontrols()
        objMid.ClearDropDown(drpBuilding)
        drpSite.SelectedIndex = 0
        If Not Session("BuiltID") Is Nothing Then
            Session("BuiltID") = Nothing
        End If
        lblmsg.Text = ""
        lblpercentage.Text = ""
        lblStageDesc.Text = ""
        completedate.Date = Now.Date
        If Not Session("BuiltID") Is Nothing Then
            Session("BuiltID") = Nothing
        End If

    End Sub

    Protected Sub imbCancel_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbCancel.Click
        Call clearcontrols()
    End Sub
End Class
