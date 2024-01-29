Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls

Partial Class mmsoft_PaymentInterest
    Inherits System.Web.UI.Page
    Dim objMid As New MiddleLayer

    Protected Sub drpFlatNumber_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpFlatNumber.SelectedIndexChanged
        If Not Session("NewRoomId") Is Nothing Then
            Session("NewRoomId") = Nothing
        End If
        MultiView1.ActiveViewIndex = 1
        Session("NewRoomId") = drpFlatNumber.SelectedValue
        Dim ds As DataSet
        Dim dt As DataTable
        ds = objMid.ExecuteSelectSQL("Select * from SalesDetails where RoomId = " & drpFlatNumber.SelectedValue & "")
        dt = ds.Tables(0)
        Dim i As Integer

        For i = 0 To dt.Rows.Count - 1
            'lblratepersqft.Text = CDbl(dt.Rows(i)("Rate").ToString())
            lblFName.Text = dt.Rows(i)("FName").ToString()
            lblLName.Text = dt.Rows(i)("LName").ToString()
            lblAddress.Text = dt.Rows(i)("Add1").ToString()
            lbltelno.Text = dt.Rows(i)("telno").ToString()
        Next
        ds = Nothing
        ds = objMid.ExecuteSelectSQL("SELECT SUM(dbo.PymtEntry.IntPending) AS InterestPending FROM dbo.Pyment INNER JOIN dbo.PymtEntry ON dbo.Pyment.PymtId = dbo.PymtEntry.PymtId WHERE (dbo.Pyment.RoomId = " & drpFlatNumber.SelectedValue & ")")
        If Not ds Is Nothing Then
            lblPendingInterest.Text = ds.Tables(0).Rows(0)(0)
        End If
    End Sub
    Protected Sub drpSite_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpSite.SelectedIndexChanged
        objMid.PopulateList(drpBuilding, "BldgId", "BldgName", objMid.ExecuteSelectSQL("select * from building where siteid = '" & drpSite.SelectedValue & "'").Tables(0))
    End Sub

    Protected Sub drpBuilding_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpBuilding.SelectedIndexChanged
        objMid.PopulateList(drpFlatNumber, "RoomId", "RoomNumber", objMid.ExecuteSelectSQL("select * from Room where Bldgid = '" & drpBuilding.SelectedValue & "' and Booked='Yes'").Tables(0))
        'lblsqft.Text = ""
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            objMid.PopulateList(drpSite, "SiteId", "SiteName", objMid.ExecuteSelectSQL("select * from Site").Tables(0))
            MultiView1.ActiveViewIndex = 0
            If Not Session("NewRoomId") Is Nothing Then
                Session("NewRoomId") = Nothing
            End If
        End If
    End Sub

    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
        If CInt(lblPendingInterest.Text) > 0 And CInt(txtamount.Text) <= CInt(lblPendingInterest.Text) Then
            Dim sql As String
            Dim i As Integer
            Dim amount As Integer
            Dim PaidAmt As Integer
            Dim balamt As Integer

            amount = CInt(txtamount.Text)
            'sql = "Insert into InterestPayment(InterestId,InterestMode,InterestAmt,InterestDate,InterestDetails,UserId,CreatedDate) Values("
            'sql = sql & objMid.getUniqueID("InterestPayment", "InterestId") & ",'" & drpMode.SelectedItem.Text & "'," & txtamount.Text & ""
            'sql = sql & ",'" & PaidDate.Date & "','" & txtotherdetails.Text & "','" & Session("USERID") & "','" & Now.Date & "')"
            'objMid.ExecuteSqlStmt(sql)
            Dim ds As DataSet
            Dim dt As DataTable
            ds = objMid.ExecuteSelectSQL("SELECT DISTINCT PymtEntry.PymtEntryId, PymtEntry.PymtId, Pyment.TotalPayment, stage.StageDesc, salesDetails.FName, salesDetails.LName, salesDetails.SFName, PymtEntry.IntPending, PymtEntry.intDays, PymtEntry.PymtAmount, PymtEntry.PymtDate, Pyment.DueDate, Pyment.RoomId FROM PymtEntry INNER JOIN Pyment ON PymtEntry.PymtId = Pyment.PymtId INNER JOIN salesDetails ON Pyment.RoomId = salesDetails.RoomId INNER JOIN BldgStage ON Pyment.BldgStageId = BldgStage.BldgStageId INNER JOIN stage ON BldgStage.StageId = stage.StageId WHERE (PymtEntry.IntPending > 0) AND (Pyment.RoomId = " & drpFlatNumber.SelectedValue & ")")
            dt = ds.Tables(0)

            For i = 0 To dt.Rows.Count - 1

                If CInt(dt.Rows(i)("IntPending").ToString()) > amount Then
                    PaidAmt = amount
                    amount = 0
                    balamt = CInt(dt.Rows(i)("IntPending").ToString()) - PaidAmt
                    sql = "Insert into InterestPayment(InterestId,PymtEntryId,PymtId,InterestMode,InterestAmt,InterestDate,InterestDetails,UserId,CreatedDate) Values("
                    sql = sql & objMid.getUniqueID("InterestPayment", "InterestId") & "," & dt.Rows(i)("PymtEntryId").ToString & "," & dt.Rows(i)("PymtId").ToString & ",'" & drpMode.SelectedItem.Text & "'," & PaidAmt & ""
                    sql = sql & ",'" & PaidDate.Date & "','" & txtotherdetails.Text & "','" & Session("USERID") & "','" & Now.Date & "')"
                    objMid.ExecuteSqlStmt(sql)
                    sql = "Update PymtEntry set IntPending=" & balamt & " where pymtEntryId=" & CInt(dt.Rows(i)("PymtEntryId").ToString)
                    objMid.ExecuteSqlStmt(sql)
                Else
                    PaidAmt = CInt(dt.Rows(i)("IntPending").ToString())
                    amount = amount - CInt(dt.Rows(i)("IntPending").ToString())
                    sql = "Insert into InterestPayment(InterestId,PymtEntryId,PymtId,InterestMode,InterestAmt,InterestDate,InterestDetails,UserId,CreatedDate) Values("
                    sql = sql & objMid.getUniqueID("InterestPayment", "InterestId") & "," & dt.Rows(i)("PymtEntryId").ToString & "," & dt.Rows(i)("PymtId").ToString & ",'" & drpMode.SelectedItem.Text & "'," & PaidAmt & ""
                    sql = sql & ",'" & PaidDate.Date & "','" & txtotherdetails.Text & "','" & Session("USERID") & "','" & Now.Date & "')"
                    objMid.ExecuteSqlStmt(sql)
                    sql = "Update PymtEntry set IntPending=0 where pymtEntryId=" & CInt(dt.Rows(i)("PymtEntryId").ToString)
                    objMid.ExecuteSqlStmt(sql)
                End If
                If amount = 0 Then
                    Exit For
                End If
            Next
        Else
            lblmsg.Text = "There is no Pending Interest to be Settled on or Pending Interest is Less than Amount Paid"
        End If
    End Sub

    Protected Sub imbCancel_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbCancel.Click
        Session("NewRoomId") = Nothing
        Response.Redirect("PaymentInterest.aspx")
    End Sub
End Class
