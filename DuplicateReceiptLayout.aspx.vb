Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Imports System.Math

Partial Class mmsoft_DuplicateReceiptLayout
    Inherits System.Web.UI.Page
    Dim objMid As New MiddleLayer

    Dim PartiDetails As DataTable
    Dim SRNO As DataColumn
    Dim PartiName As DataColumn
    Dim Amount As DataColumn
    Dim myRow As DataRow

    Public Sub CreatePartiDetails()
        PartiDetails = New DataTable("PartiDetails")

        SRNO = New DataColumn("SrNo", System.Type.GetType("System.String"))
        PartiName = New DataColumn("Particulars", System.Type.GetType("System.String"))
        Amount = New DataColumn("Amount", System.Type.GetType("System.String"))

        PartiDetails.Columns.Add(SRNO)
        PartiDetails.Columns.Add(PartiName)
        PartiDetails.Columns.Add(Amount)

        Session("TempPartiDetails") = PartiDetails
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("TempPartiDetails") = Nothing
        Call CreatePartiDetails()
        PartiDetails = Session("TempPartiDetails")
        Dim dsparti As New DataSet
        Dim dtparti As New DataTable
        Dim intRow As Integer
        Dim total As Double
        dsparti = objMid.ExecuteSelectSQL("Select * from ParticularsTable where ReceiptNos=" & Session("ReceiptNos") & "")
        Dim i As Integer
        If Session("TempPartiDetails") Is Nothing Then
            CreatePartiDetails()
        End If
        intRow = 0
        total = 0
        dtparti = dsparti.Tables(0)
        PartiDetails = Session("TempPartiDetails")
        For i = 0 To dtparti.Rows.Count - 1
            intRow = intRow + 1
            myRow = PartiDetails.NewRow()
            myRow("SrNo") = i + 1
            myRow("Particulars") = GetParticularsName(dtparti.Rows(i)("ParticularsId").ToString)
            myRow("Amount") = dtparti.Rows(i)("ParticularsAmt").ToString
            total = total + dtparti.Rows(i)("ParticularsAmt").ToString
            PartiDetails.Rows.Add(myRow)
        Next
        If intRow < 6 Then
            For i = intRow To 6
                myRow = PartiDetails.NewRow()
                myRow("SrNo") = i + 1
                myRow("Particulars") = ""
                myRow("Amount") = ""

                PartiDetails.Rows.Add(myRow)
            Next
            myRow = PartiDetails.NewRow()
            myRow("SrNo") = ""
            myRow("Particulars") = "Total"
            myRow("Amount") = total
            'total = total + dtparti.Rows(i)("ParticularsAmt").ToString
            PartiDetails.Rows.Add(myRow)
        Else
            myRow = PartiDetails.NewRow()
            myRow("SrNo") = ""
            myRow("Particulars") = "Total"
            myRow("Amount") = total
            'total = total + dtparti.Rows(i)("ParticularsAmt").ToString
            PartiDetails.Rows.Add(myRow)
        End If
        Gridview1.DataSource = PartiDetails
        Gridview1.DataBind()
        GridView2.DataSource = PartiDetails
        GridView2.DataBind()

        Dim ds As New DataSet

        ds = objMid.ExecuteSelectSQL("Select * from BillDetails where ReceiptNos=" & Session("ReceiptNos") & "")

        If ds.Tables(0).Rows.Count > 0 Then
            lblReceiptNos.Text = Session("ReceiptNos")
            lblReceiptNos2.Text = Session("ReceiptNos")
            lblamtinwords.Text = ds.Tables(0).Rows(0)("AmtInLetters").ToString
            lblamtinwords2.Text = ds.Tables(0).Rows(0)("AmtInLetters").ToString
            lblotherdetails.Text = ds.Tables(0).Rows(0)("OtherDetails").ToString
            lblotherdetails2.Text = ds.Tables(0).Rows(0)("OtherDetails").ToString
            lblbank.Text = ds.Tables(0).Rows(0)("BankName").ToString
            lblbank2.Text = ds.Tables(0).Rows(0)("BankName").ToString
            lblbranch.Text = ds.Tables(0).Rows(0)("BranchName").ToString
            lblbranch2.Text = ds.Tables(0).Rows(0)("BranchName").ToString
            lblmode.Text = ds.Tables(0).Rows(0)("modeOfPayment").ToString
            lblmode2.Text = ds.Tables(0).Rows(0)("modeOfPayment").ToString
            ReceiptDate.Date = ds.Tables(0).Rows(0)("ReceiptDate").ToString

            lblBillDate.Text = ReceiptDate.Date
            lblBillDate2.Text = ReceiptDate.Date
            Call PrintMemberDetails(ds.Tables(0).Rows(0)("RoomId").ToString)
            Call PrintNear(ds.Tables(0).Rows(0)("RoomId").ToString)
            If lblmode.Text = "Cash" Then
                lblcheqdate.Text = "-"
                lblcheqdate2.Text = "-"
            Else
                ReceiptDate.Date = ds.Tables(0).Rows(0)("chequeDate").ToString
                lblcheqdate.Text = ReceiptDate.Date
                lblcheqdate2.Text = ReceiptDate.Date
            End If
        End If
        'myRow = PartiDetails.NewRow()
        'myRow("SrNo") = drpStage.SelectedItem.Text
        'myRow("Particulars") = txtPercentage.Text
        'myRow("Amount") = txtPercentage.Text
        ''nos = CDec(lblPercent.Text) + CDec(txtPercentage.Text)
        ''lblPercent.Text = nos
        'PartiDetails.Rows.Add(myRow)
    End Sub
    Public Function GetParticularsName(ByVal PartiId As Integer) As String
        Dim dsparti As New DataSet
        dsparti = objMid.ExecuteSelectSQL("select ParticularsName from ParticularsMaster where ParticularsId='" & PartiId & "'")
        Return dsparti.Tables(0).Rows(0)(0).ToString
    End Function
    Public Sub PrintMemberDetails(ByVal RoomId As Integer)
        Dim dsparti As New DataSet
        'Dim dt As New DataTablegh
        dsparti = objMid.ExecuteSelectSQL("SELECT dbo.Building.BldgId, dbo.Building.BldgName, dbo.Room.RoomId, dbo.Room.RoomNumber, dbo.salesDetails.FName, dbo.salesDetails.LName, dbo.salesDetails.SFName,dbo.salesDetails.SLName FROM dbo.Building INNER JOIN dbo.salesDetails ON dbo.Building.BldgId = dbo.salesDetails.BldgId INNER JOIN dbo.Room ON dbo.salesDetails.RoomId = dbo.Room.RoomId WHERE (dbo.Room.RoomId = " & RoomId & ")")
        'dt = dsparti.Tables(0)
        If dsparti.Tables.Count > 0 Then
            lblBuildingName.Text = dsparti.Tables(0).Rows(0)("BldgName").ToString
            lblBuildingNo2.Text = dsparti.Tables(0).Rows(0)("BldgName").ToString
            lblRoomNo.Text = dsparti.Tables(0).Rows(0)("RoomNumber").ToString
            lblRoomNo2.Text = dsparti.Tables(0).Rows(0)("RoomNumber").ToString
            lblMembersName.Text = dsparti.Tables(0).Rows(0)("FName").ToString & " " & dsparti.Tables(0).Rows(0)("LName").ToString
            lblMembersName2.Text = dsparti.Tables(0).Rows(0)("FName").ToString & " " & dsparti.Tables(0).Rows(0)("LName").ToString
            Label1.Text = dsparti.Tables(0).Rows(0)("SFName").ToString & " " & dsparti.Tables(0).Rows(0)("SLName").ToString
            Label2.Text = dsparti.Tables(0).Rows(0)("SFName").ToString & " " & dsparti.Tables(0).Rows(0)("SLName").ToString
        End If

    End Sub
    Public Sub PrintNear(ByVal RoomId As Integer)
        Dim dsparti As New DataSet
        Dim dt As New DataTable
        dsparti = objMid.ExecuteSelectSQL("select * from NearMaster where RoomId=" & RoomId & "")
        dt = dsparti.Tables(0)
        If dsparti.Tables.Count > 0 Then
            If dt.Rows.Count > 0 Then
                lblnear.Text = GetPosition(dt.Rows(0)("PosId").ToString)
                lblnear2.Text = lblnear.Text
            End If
        End If

    End Sub
    Public Function GetPosition(ByVal PositionId As Integer) As String
        Dim dsparti As New DataSet
        dsparti = objMid.ExecuteSelectSQL("select PosName from PositionMaster where PosId='" & PositionId & "'")
        Return dsparti.Tables(0).Rows(0)(0).ToString
    End Function

End Class
