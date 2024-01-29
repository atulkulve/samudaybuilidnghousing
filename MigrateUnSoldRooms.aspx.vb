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

Partial Class mmsoft_MigrateUnsoldRooms
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
            objMid.PopulateList(cmbMigSite, "Siteid", "SiteName", objMid.ExecuteSelectSQL("select * from Site").Tables(0))
            MultiView1.ActiveViewIndex = 0
        End If
    End Sub

    Protected Sub drpSite_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpSite.SelectedIndexChanged
        objMid.PopulateList(drpBuilding, "BldgId", "BldgName", objMid.ExecuteSelectSQL("select * from Building where siteid = '" & drpSite.SelectedValue & "'").Tables(0))
    End Sub

    Protected Sub drpBuilding_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpBuilding.SelectedIndexChanged
        objMid.PopulateList(drpFlatnumber, "RoomId", "RoomNumber", objMid.ExecuteSelectSQL("select * from Room where Bldgid = '" & drpBuilding.SelectedValue & "' and Booked='No'").Tables(0))
    End Sub

    Protected Sub cmbMigSite_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmbMigSite.SelectedIndexChanged
        objMid.PopulateList(cmbMigBuilding, "BldgId", "BldgName", objMid.ExecuteSelectSQL("select * from Building where siteid = '" & drpSite.SelectedValue & "'").Tables(0))

    End Sub

    Protected Sub cmbMigBuilding_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmbMigBuilding.SelectedIndexChanged
        'objMid.PopulateList(cmbMigFlatNumber, "RoomId", "RoomNumber", objMid.ExecuteSelectSQL("select * from Room where Bldgid = '" & drpBuilding.SelectedValue & "' and Booked='Yes'").Tables(0))
    End Sub

    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
        'Dim outstandingds As New DataSet
        'Dim outstandingdt As New DataTable
        'Dim outstandingds2 As New DataSet
        'Dim outstandingdt2 As New DataTable
        'outstandingds = objMid.ExecuteSelectSQL("SELECT * from vw_BldgStage_Details where bldgid = " & cmbMigBuilding.SelectedValue & " and completionflag= 1")
        'outstandingdt = outstandingds.Tables(0)
        'Dim i As Integer
        'Dim intbldg As Integer

        'For i = 0 To outstandingdt.Rows.Count - 1
        '    intbldg = intbldg + 1
        'Next
        'outstandingds2 = objMid.ExecuteSelectSQL("SELECT * from vw_Pyment_Details where roomid = '" & drpFlatnumber.SelectedValue & "' and completionflag= 1")
        'outstandingdt2 = outstandingds2.Tables(0)

        'Dim intpymt As Integer

        'For i = 0 To outstandingdt2.Rows.Count - 1
        '    intpymt = intpymt + 1
        'Next
        'If intpymt <> intbldg Then
        '    Exit Sub
        'End If

        'Dim b As Integer
        'Dim pymtid As Integer
        'Dim bldgstageid As Integer
        'Dim sql As String
        'For i = 0 To outstandingdt2.Rows.Count - 1
        '    pymtid = outstandingdt2.Rows(i)("pymtid").ToString()
        '    For b = 0 To outstandingdt.Rows.Count - 1
        '        If (outstandingdt.Rows(b)("stageid").ToString() = outstandingdt2.Rows(i)("stageid").ToString()) Then
        '            If (outstandingdt.Rows(b)("completepercentage").ToString() = outstandingdt2.Rows(i)("completepercentage").ToString()) Then
        '                bldgstageid = outstandingdt.Rows(b)("bldgstageid").ToString()
        '                Exit For
        '            End If
        '        End If
        '    Next
        '    sql = "Update Pyment set bldgstageid = " & bldgstageid & " where pymtId=" & pymtid & ""
        '    objMid.ExecuteSqlStmt(sql)
        'Next
        objMid.ExecuteSqlStmt("Update Room set BldgId = '" & cmbMigBuilding.SelectedValue & "' where RoomId='" & drpFlatnumber.SelectedValue & "'")
        'objMid.ExecuteSqlStmt("Update salesdetails set BldgId = '" & cmbMigBuilding.SelectedValue & "' where RoomId='" & drpFlatnumber.SelectedValue & "'")
    End Sub
End Class
