Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Imports System.Math

Partial Class mmsoft_StagesHorizontal
    Inherits System.Web.UI.Page
    Dim objMid As New MiddleLayer
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Not Session("TempPaymentDetailsTbl") Is Nothing Then
                Session("TempPaymentDetailsTbl") = Nothing
            End If
            If Not Session("RoomID") Is Nothing Then
                Session("RoomID") = Nothing
            End If
            MultiView1.ActiveViewIndex = 0
            'objMid.PopulateList(drpFlatnumber, "RoomId", "RoomNumber", objMid.ExecuteSelectSQL("select * from Room").Tables(0))
            objMid.PopulateList(drpsite, "SiteId", "SiteName", objMid.ExecuteSelectSQL("select * from Site").Tables(0))
        End If
    End Sub

    Protected Sub drpsite_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpsite.SelectedIndexChanged
        objMid.PopulateList(drpbuilding, "BldgId", "BldgName", objMid.ExecuteSelectSQL("select * from building where siteid = '" & drpsite.SelectedValue & "'").Tables(0))
    End Sub

    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
        lblbuilding.Text = drpbuilding.SelectedItem.Text
        Dim ds As New DataSet
        Dim generalds As New DataSet
        Dim generaldt As New DataTable
        Dim roomds As New DataSet
        Dim sqft As Double
        Dim othercharges, percentage, amount As Double
        Dim rate As Double
        Dim sql As String
        Dim i As Integer
        Dim a As Integer
        Dim dt As New DataTable
        Dim dtCheck As New DataTable
        Dim dscheck As New DataSet

        ds = objMid.ExecuteSelectSQL("SELECT dbo.BldgStage.BldgStageId, dbo.BldgStage.BldgId, dbo.Building.BldgName, dbo.BldgStage.StageId, dbo.stage.StageDesc, dbo.BldgStage.CompletePercentage, dbo.BldgStage.CompletionDate, dbo.BldgStage.CompletionFlag, dbo.BldgStage.srNo FROM dbo.BldgStage INNER JOIN dbo.Building ON dbo.BldgStage.BldgId = dbo.Building.BldgId INNER JOIN dbo.stage ON dbo.BldgStage.StageId = dbo.stage.StageId WHERE (dbo.BldgStage.BldgId = " & drpbuilding.SelectedValue & ") ORDER BY dbo.BldgStage.BldgStageId ")

        dt = ds.Tables(0)
        
        sql = "drop table stagestemp"
        objMid.ExecuteSqlStmt(sql)
        sql = "CREATE TABLE [dbo].[stagestemp] ( RoomNos [varchar] (50)"
        If dt.Rows.Count > 0 Then
            For i = 0 To dt.Rows.Count - 1
                sql = sql & ",["
                sql = sql & dt.Rows(i)("StageDesc").ToString() & "] [varchar] (50)"
            Next
        End If
        sql = sql & ")"
        objMid.ExecuteSqlStmt(sql)
        sql = "SELECT RoomId, SqFt, Rate,saledate FROM SALESDETAILS WHERE  BldgId = " & drpbuilding.SelectedValue
        generalds = objMid.ExecuteSelectSQL(sql)
        generaldt = generalds.Tables(0)
        If Not generaldt Is Nothing Then
            For i = 0 To generaldt.Rows.Count - 1
                sqft = generaldt.Rows(i)("Sqft").ToString()
                Rate = generaldt.Rows(i)("Rate").ToString

                sql = "SELECT B.Sqft, B.OtherCharges FROM Room A, RoomType B WHERE A.Roomtypeid = B.Roomtypeid AND RoomId = " & generaldt.Rows(i)("RoomId").ToString
                roomds = objMid.ExecuteSelectSQL(sql)
                'Take Other Charges From Room Master
                If Not roomds Is Nothing Then
                    othercharges = roomds.Tables(0).Rows(0)("OtherCharges").ToString
                End If
                'This comes inside the loop of stages
                For a = 0 To dt.Rows.Count - 1
                    percentage = dt.Rows(a)("CompletePercentage").ToString()
                    amount = (rate * sqft + othercharges) * percentage / 100
                    dscheck = objMid.ExecuteSelectSQL("select * from stagestemp where RoomNos=" & Getroomnumber(generaldt.Rows(i)("RoomId").ToString) & "")
                    dtCheck = dscheck.Tables(0)
                    If dtCheck.Rows.Count > 0 Then
                        objMid.ExecuteSqlStmt("update stagestemp set [" & dt.Rows(a)("StageDesc").ToString() & "]='" & Round(amount) & "' where RoomNos='" & Getroomnumber(generaldt.Rows(i)("RoomId").ToString) & "'")
                    Else
                        objMid.ExecuteSqlStmt("Insert into stagestemp (RoomNos,[" & dt.Rows(a)("StageDesc").ToString() & "]) values('" & Getroomnumber(generaldt.Rows(i)("RoomId").ToString) & "','" & Round(amount) & "') ")
                    End If
                Next

                'Insert into Pyment Table
            Next
        End If
        Dim dsReport As New DataSet
        dsReport = objMid.ExecuteSelectSQL("select * from stagestemp")
        Dim dtreport As New DataTable
        dtreport = dsReport.Tables(0)
        GridView1.AutoGenerateColumns = True
        GridView1.DataSource = dtreport
        GridView1.DataBind()
        'GridView1.Columns(0).HeaderText = "dfg"
        'gridview1.Columns(0).

        MultiView1.ActiveViewIndex = 1
    End Sub
    Public Function Getroomnumber(ByVal roomid As Integer) As String
        Dim dslocal As New DataSet
        Dim dtlocal As New DataTable
        dslocal = objMid.ExecuteSelectSQL("select RoomNumber from room where roomid = " & roomid & "")
        dtlocal = dslocal.Tables(0)
        If dtlocal.Rows.Count > 0 Then
            Return dtlocal.Rows(0)(0).ToString()
        Else
            Return 0
        End If
    End Function
End Class
