Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls

Partial Class mmsoft_Kadu
    Inherits System.Web.UI.Page
    Dim objMid As New MiddleLayer

    Protected Sub drpSite_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpSite.SelectedIndexChanged
        objMid.PopulateList(drpBuilding, "BldgId", "BldgName", objMid.ExecuteSelectSQL("select * from building where siteid = '" & drpSite.SelectedValue & "'").Tables(0))
    End Sub

    Protected Sub drpBuilding_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpBuilding.SelectedIndexChanged
        objMid.PopulateList(drpFlatNumber, "RoomId", "RoomNumber", objMid.ExecuteSelectSQL("select * from Room where Bldgid = '" & drpBuilding.SelectedValue & "' and Booked='Yes'").Tables(0))
        lblsqft.Text = ""
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            objMid.PopulateList(drpSite, "SiteId", "SiteName", objMid.ExecuteSelectSQL("select * from Site").Tables(0))
            objMid.PopulateList(drpsite2, "SiteId", "SiteName", objMid.ExecuteSelectSQL("select * from Site").Tables(0))
            MultiView1.ActiveViewIndex = 0
            mnuMenu.Items(0).Selected = True
            mnuMenu.Items(1).Enabled = True
            mnuMenu.Items(0).Enabled = False
        End If
    End Sub

    Protected Sub drpFlatNumber_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpFlatNumber.SelectedIndexChanged
        Dim ds As New DataSet
        ds = objMid.ExecuteSelectSQL("select * from RoomType where RoomtypeId = '" & objMid.getID("Room", "RoomID", "RoomtypeId", drpFlatNumber.SelectedValue) & "'")
        If Not ds Is Nothing Then
            lblsqft.Text = ds.Tables(0).Rows(0)("sqft").ToString
        End If
        ds = Nothing
        Dim dt As DataTable
        ds = objMid.ExecuteSelectSQL("Select * from SalesDetails where RoomId = " & drpFlatNumber.SelectedValue & "")
        dt = ds.Tables(0)
        Dim i As Integer

        For i = 0 To dt.Rows.Count - 1
            lblratepersqft.Text = CDbl(dt.Rows(i)("Rate").ToString())
            txtFName.Text = dt.Rows(i)("FName").ToString()
            txtSFName.Text = dt.Rows(i)("SFName").ToString()
            txtLName.Text = dt.Rows(i)("LName").ToString()
            txtSLName.Text = dt.Rows(i)("SLName").ToString()
            txtadd1.Text = dt.Rows(i)("Add1").ToString()
            txtadd2.Text = dt.Rows(i)("Add2").ToString()
            txttelno.Text = dt.Rows(i)("telno").ToString()
            txtmobno.Text = dt.Rows(i)("MobNo").ToString()
            txtemail.Text = dt.Rows(i)("email").ToString()
            txtbank.Text = dt.Rows(i)("bank").ToString()
        Next
    End Sub

    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
        'Call AddSalesEntry()
        Dim sql As String
        sql = "Insert KaduTable (RoomId,KaduAmt,kadudate) values(" & drpFlatNumber.SelectedValue & "," & txtKaduAmt.Text & ",'" & kadudate.Date & "')"
        objMid.ExecuteSqlStmt(sql)
        lblmsg.Text = "Data Updated"
        clearcontrols()
    End Sub
    Public Sub clearcontrols()
        txtFName.Text = ""
        txtLName.Text = ""
        txtSFName.Text = ""
        txtSLName.Text = ""
        txttelno.Text = ""
        txtmobno.Text = ""
        txtemail.Text = ""
        txtadd1.Text = ""
        txtadd2.Text = ""
        txtbank.Text = ""
        lblsqft.Text = ""
        txtKaduAmt.Text = ""
        lblratepersqft.Text = ""
        drpFlatNumber.Items.Clear()
        drpFlatNumber2.Items.Clear()
        drpBuilding.Items.Clear()
        drpbuilding2.Items.Clear()
        drpSite.SelectedIndex = 0
        drpsite2.SelectedIndex = 0
        'drpBuilding.SelectedIndex = 0
        gvInterest.DataSource = Nothing
        gvInterest.DataBind()
    End Sub
    'Public Function AddSalesEntry() As Boolean
    '    Dim mydate As New Date
    '    Dim sql As String
    '    Dim BldStageds As New DataSet
    '    Dim BldStagedt As New DataTable

    '    mydate = Today
    '    sql = "INSERT INTO salesDetails (SalesId,SiteId,BldgId,RoomId,SqFt,Rate,FName,LName,SFName,SLName,Add1,Add2,telno,Mobno,email,saledate,Bank,userId,createdDate) VALUES("
    '    sql = sql & objMid.getUniqueID("salesDetails", "SalesId") & ",'" & drpSite.SelectedValue & "','" & drpBuilding.SelectedValue & "'," & drpFlatNumber.SelectedValue & "," & lblsqft.Text & "," & txtRateOfInterest.Text & ","
    '    sql = sql & "'" & txtFName.Text & "','" & txtLName.Text & "','" & txtSFName.Text & "','" & txtSLName.Text & "','" & txtadd1.Text & "','" & txtadd2.Text & "','" & txttelno.Text & "',"
    '    sql = sql & "'" & txtmobno.Text & "','" & txtemail.Text & "','" & SaleDate.Date & "','" & txtbank.Text & "','" & Session("USERID") & "','" & Now.Date & "') "

    '    objMid.ExecuteSqlStmt(sql)
    '    'If objMid.ExecuteSqlStmt(sql) Then
    '    '    Return True
    '    'Else
    '    '    Return False
    '    'End If
    '    sql = ""
    '    sql = "update room set Booked='Yes' where RoomId = " & drpFlatNumber.SelectedValue
    '    objMid.ExecuteSqlStmt(sql)
    '    sql = ""
    '    Dim sqft As Double
    '    Dim rateofint As Double
    '    Dim otherCharges As Double
    '    Dim gnds As DataSet
    '    Dim gndt As DataTable

    '    Dim i As Integer

    '    sqft = CDbl(lblsqft.Text)
    '    rateofint = CDbl(txtRateOfInterest.Text)

    '    sql = "SELECT B.Sqft, B.OtherCharges FROM Room A, RoomType B WHERE A.Roomtypeid = B.Roomtypeid AND RoomId = " & drpFlatNumber.SelectedValue
    '    gnds = objMid.ExecuteSelectSQL(sql)
    '    gndt = gnds.Tables(0)
    '    sql = ""
    '    If gndt.Rows.Count > 0 Then
    '        otherCharges = gndt.Rows(i)("OtherCharges").ToString()
    '        sqft = gndt.Rows(i)("Sqft").ToString
    '    End If
    '    Dim Percentage As Double
    '    Dim StageAmt As Double

    '    sql = "SELECT CompletePercentage, BldgStageId FROM BldgStage where CompletionFlag <> 0  and  BldgId = " & drpBuilding.SelectedValue
    '    BldStageds = objMid.ExecuteSelectSQL(sql)
    '    BldStagedt = BldStageds.Tables(0)
    '    sql = ""
    '    For i = 0 To BldStagedt.Rows.Count - 1
    '        Percentage = CDbl(BldStagedt.Rows(i)("completePercentage").ToString())
    '        StageAmt = (rateofint * sqft + otherCharges) * Percentage / 100
    '        sql = "INSERT INTO Pyment (PymtId,BldgStageId,RoomId,DueDate,TotalPayment,OutStanding,userId,  createdDate) VALUES("
    '        sql = sql & objMid.getUniqueID("Pyment", "pymtID") & "," & CInt(BldStagedt.Rows(i)("BldgStageId").ToString()) & ","
    '        sql = sql & drpFlatNumber.SelectedValue & ",'" & SaleDate.Date & "'," & StageAmt & "," & StageAmt & ",'" & Session("USERID") & "','" & Now.Date & "') "
    '        objMid.ExecuteSqlStmt(sql)
    '    Next

    'End Function


    Protected Sub imbCancel_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbCancel.Click
        Call clearcontrols()
    End Sub

    Protected Sub drpsite2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpsite2.SelectedIndexChanged
        objMid.PopulateList(drpbuilding2, "BldgId", "BldgName", objMid.ExecuteSelectSQL("select * from building where siteid = '" & drpsite2.SelectedValue & "'").Tables(0))
    End Sub

    Protected Sub drpbuilding2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpbuilding2.SelectedIndexChanged
        objMid.PopulateList(drpFlatNumber2, "RoomId", "RoomNumber", objMid.ExecuteSelectSQL("select * from Room where Bldgid = '" & drpbuilding2.SelectedValue & "' and Booked='Yes'").Tables(0))
    End Sub

    Private Sub GridBind()
        Dim ds As New DataSet
        Dim sql As String
        sql = "SELECT * FROM  KaduTable WHERE RoomId= " & drpFlatNumber2.SelectedValue & ""
        ds = objMid.ExecuteSelectSQL(sql)
        Dim dt As New DataTable
        dt = ds.Tables(0)
        gvInterest.DataSource = dt
        gvInterest.DataBind()
    End Sub

    Protected Sub drpFlatNumber2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpFlatNumber2.SelectedIndexChanged
        Call GridBind()
        lblmsg.Text = ""
    End Sub

    Protected Sub mnuMenu_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles mnuMenu.MenuItemClick
        lblmsg.Text = ""
        If mnuMenu.Items(0).Enabled = True Then
            mnuMenu.Items(0).Selected = True
            mnuMenu.Items(1).Enabled = True
            mnuMenu.Items(0).Enabled = False
            MultiView1.ActiveViewIndex = 0
            txthidden.Text = ""

            Call clearcontrols()
            'objMid.PopulateList(drpSiteName, "SiteId", "SiteName", objMid.ExecuteSelectSQL("select * from Site").Tables(0))
        Else
            MultiView1.ActiveViewIndex = 1
            mnuMenu.Items(1).Selected = True
            mnuMenu.Items(1).Enabled = False
            mnuMenu.Items(0).Enabled = True
            Call clearcontrols()
            'objMid.PopulateList(drpSiteName, "SiteId", "SiteName", objMid.ExecuteSelectSQL("select * from Site").Tables(0))
        End If
    End Sub

    Protected Sub imgdelete_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgdelete.Click
        Dim hiddenID As HtmlInputHidden
        Dim KaduId As Integer
        Dim ChkBox As CheckBox
        For Each gvRow As GridViewRow In gvInterest.Rows
            ChkBox = gvRow.FindControl("chkSelect")
            If ChkBox.Checked = True Then
                If gvRow.RowType = DataControlRowType.DataRow Then
                    hiddenID = gvRow.FindControl("HiddenID")
                    KaduId = CType(hiddenID.Value, Integer)
                    objMid.ExecuteSqlStmt("delete from KaduTable where kaduId = " & KaduId & "")
                    lblmsg.Text = "Successfully Deleted"
                End If
            End If
        Next
        GridBind()
    End Sub
End Class
