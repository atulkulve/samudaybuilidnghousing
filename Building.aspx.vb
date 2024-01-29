Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Imports System.Math
Partial Class mmsoft_Building
    Inherits System.Web.UI.Page
    Dim objMid As New MiddleLayer
    Public dsCustomer As DataSet
    Dim myFlag As Boolean
    Dim constr As String = ConfigurationSettings.AppSettings("MyConnection")
    Dim Array1 As New ArrayList

    Dim BldgStageDetails As DataTable
    Dim StageName As DataColumn
    Dim Percentage As DataColumn

    
    Dim myRow As DataRow
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
    Public Sub CreateBldgStageDetails()
        BldgStageDetails = New DataTable("BldgStageDetails")
        StageName = New DataColumn("Stage", System.Type.GetType("System.String"))
        Percentage = New DataColumn("Percentage", System.Type.GetType("System.String"))

        BldgStageDetails.Columns.Add(StageName)
        BldgStageDetails.Columns.Add(Percentage)
        
        Session("TempBldgStageDetails") = BldgStageDetails
    End Sub

    'Private Sub clearcontrols()
    '    drpSelectSite.SelectedIndex = 0
    '    txtBuilding.Text = ""
    'End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            objMid.PopulateList(drpStage, "StageId", "StageDesc", objMid.ExecuteSelectSQL("select * from Stage").Tables(0))
            objMid.PopulateList(drpSelectSite, "SiteId", "SiteName", objMid.ExecuteSelectSQL("select * from Site").Tables(0))
        End If
    End Sub

    Protected Sub imbCancel_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbCancel.Click
        Call clearcontrols()
        If Not Session("TempBldgStageDetails") Is Nothing Then
            Session("TempBldgStageDetails") = Nothing
        End If

        BldgStageDetails = Session("TempBldgStageDetails")
        Grid1.DataSource = BldgStageDetails
        Grid1.DataBind()
        lblmsg.Text = ""
    End Sub
    Public Sub clearcontrols()
        If Not Session("TempBldgStageDetails") Is Nothing Then
            Session("TempBldgStageDetails") = Nothing
        End If
        BldgStageDetails = Session("TempBldgStageDetails")
        Grid1.DataSource = BldgStageDetails
        Grid1.DataBind()
        txtBuilding.Text = ""
        drpSelectSite.SelectedIndex = 0
    End Sub

    Protected Sub imbAddNew_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbAddNew.Click
        If Session("TempBldgStageDetails") Is Nothing Then
            CreateBldgStageDetails()
        End If
        'Dim nos As Double
        If CheckDuplicate(drpStage.SelectedItem.Text) = False Then
            Exit Sub
        End If

        BldgStageDetails = Session("TempBldgStageDetails")
        myRow = BldgStageDetails.NewRow()
        myRow("Stage") = drpStage.SelectedItem.Text
        myRow("Percentage") = txtPercentage.Text

        'nos = CDec(lblPercent.Text) + CDec(txtPercentage.Text)
        'lblPercent.Text = nos
        BldgStageDetails.Rows.Add(myRow)
        Grid1.DataSource = BldgStageDetails
        Grid1.DataBind()
        drpStage.SelectedIndex = 0
        txtPercentage.Text = ""
    End Sub

    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
        Dim BuildingName As String = txtBuilding.Text
        If Session("TempBldgStageDetails") Is Nothing Then
            lblmsg.Text = "Enter Stages for this Building " & txtBuilding.Text & ""
            Exit Sub
        End If
        CheckBuilding(BuildingName)

        lblmsg.Text = ""
        If validatePercent() Then
            If myFlag = True Then
                If AddData() Then 'Add new Building Entry
                    Call clearcontrols()
                    lblmsg.Text = "Added New Entry"
                    Response.Redirect("UserMenu.aspx")
                Else
                    lblmsg.Text = "Data Cannot be Added"
                End If
            Else
                lblmsg.Text = "Building Name already Exists!"
            End If
        Else
            lblmsg.Text = "Aggregate of percentage should be 100.00"
        End If
    End Sub
    Public Function AddData() As Boolean
        Dim mydate As New Date
        mydate = Today
        Dim BldgID As Integer = objMid.getUniqueID("Building", "BldgId")
        'Session("BldgID") = BldgID
        If objMid.ExecuteSqlStmt("Insert Into Building (BldgId,SiteId,BldgName,userId,createdDate) values(" & BldgID & ",'" & drpSelectSite.SelectedValue & "', '" & txtBuilding.Text & "','" & Session("USERID") & "','" & Now.Date & "')") Then
            Call InsertBldgStage(BldgID)
            Return True
        Else
            Return False
        End If
    End Function
    Public Function validatePercent() As Boolean
        Dim percent As Double
        BldgStageDetails = Session("TempBldgStageDetails")
        percent = 0
        For Each gvRow As DataRow In BldgStageDetails.Rows
            percent = percent + CDbl(gvRow.Item(1).ToString())
        Next
        Return True

        'If Round(percent) = 100.0 Then
        '    Return True
        'Else
        '    Return False
        'End If
    End Function

    Public Function CheckDuplicate(ByVal StrStage As String) As Boolean
        If Not Session("TempBldgStageDetails") Is Nothing Then
            BldgStageDetails = Session("TempBldgStageDetails")
            For Each gvRow As DataRow In BldgStageDetails.Rows
                If CStr(gvRow.Item(0).ToString()) = StrStage Then
                    lblmsg.Text = "Duplicate Stage cannot be Added"
                    Return False
                End If
            Next
            Return True
        End If
    End Function

    Public Sub InsertBldgStage(ByVal BldgID As Integer)
        Dim Stage As String
        Dim Percentage As Double
        BldgStageDetails = Session("TempBldgStageDetails")
        Dim intRows As Integer = 0
        Call ArryList1()
        For Each gvRow As DataRow In BldgStageDetails.Rows
            Stage = gvRow.Item(0).ToString()
            Percentage = CDbl(gvRow.Item(1).ToString())
            'Stage = myRow("Stage").ToString
            'Percentage = CInt(myRow("Percentage\\).ToString)
            objMid.ExecuteSqlStmt("Insert Into BldgStage(BldgStageId,BldgId,StageId,CompletePercentage,CompletionFlag,srNo) values(" & objMid.getUniqueID("BldgStage", "BldgStageId") & "," & BldgID & ",'" & objMid.getID("Stage", "StageDesc", "StageID", Stage) & "'," & Percentage & ",0,'" & Array1.Item(intRows) & "')")
            intRows = intRows + 1
        Next
    End Sub
    Public Sub CheckBuilding(ByVal Building)
        Dim conn As New SqlConnection(constr)
        Dim dt As New DataTable

        Try
            conn.Open()
            Dim sql As String = "SELECT * FROM Building WHERE BldgName =@Building"
            Dim cmd As New SqlCommand(sql, conn)
            cmd.Parameters.AddWithValue("@Building", Building)
            Dim da As New SqlDataAdapter(cmd)
            da.Fill(dt)

            If (dt.Rows.Count > 0) Then
                MyFlag = False
            Else
                MyFlag = True
            End If

        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
        conn.Close()
    End Sub
End Class
