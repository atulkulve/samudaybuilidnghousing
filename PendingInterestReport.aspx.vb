Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Imports System.Math

Partial Class mmsoft_PendingInterestReport
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

    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
        If Not Session("RoomId") Is Nothing Then
            Session("RoomId") = Nothing
        End If
        Session("RoomId") = drpFlatnumber.SelectedValue
        'Session("FLATNO") = drpFlatnumber.SelectedValue
        lblFlatNo.Text = drpFlatnumber.SelectedItem.Text
        MultiView1.ActiveViewIndex = 1
        Dim dsdetails As New DataSet

        dsdetails = objMid.ExecuteSelectSQL("Select * from salesdetails where roomid=" & drpFlatnumber.SelectedValue & "")
        lblname.Text = dsdetails.Tables(0).Rows(0)("FName").ToString & " " & dsdetails.Tables(0).Rows(0)("LName").ToString
        lbladdress.Text = dsdetails.Tables(0).Rows(0)("add1").ToString & " " & dsdetails.Tables(0).Rows(0)("add2").ToString
        lbltelno.Text = dsdetails.Tables(0).Rows(0)("telno").ToString & "," & dsdetails.Tables(0).Rows(0)("MobNo").ToString
        'Dim i As Integer
        'If Session("TempPaymentDetailsTbl") Is Nothing Then
        '    CreatePaymentDetailsTbl()
        'End If
        'Dim ds As New DataSet

        'ds = objMid.ExecuteSelectSQL("SELECT B.SiteId, B.BldgId, B.RoomId, B.SqFt, B.Rate, B.FName, B.LName, B.Add1, B.Add2, B.telno, B.Mobno, B.email, B.saledate, D.StageDesc, A.DueDate, A.TotalPayment, A.OutStanding, A.PymtId, B.SFName, B.SLName FROM Pyment AS A INNER JOIN salesDetails AS B ON A.RoomId = B.RoomId INNER JOIN BldgStage AS C ON A.BldgStageId = C.BldgStageId INNER JOIN stage AS D ON C.StageId = D.StageId WHERE (A.OutStanding > 0) AND (B.RoomId = '" & drpFlatnumber.SelectedValue & "')")
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
        '        If (duedate.Date > Now.Date) Then
        '            duedays = 0
        '            interest = 0
        '        Else
        '            duedays = DateDiff(DateInterval.Day, duedate, Now.Date)
        '            interest = (paymentamount * 21 * duedays) / 36500
        '        End If

        '        myrow("Over Days Due") = duedays

        '        myrow("Interest") = Round(interest)
        '        myrow("Total Amt Due") = Round(paymentamount + interest)
        '        PaymentDetailsTbl.Rows.Add(myrow)
        '    Next
        'End If


        'Grid1.DataSource = PaymentDetailsTbl
        'Grid1.DataBind()
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

End Class
