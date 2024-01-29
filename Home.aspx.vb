Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls

Partial Class mmsoft_Home
    Inherits System.Web.UI.Page
    Dim objMid As New MiddleLayer

    Protected Sub drpSite_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpSite.SelectedIndexChanged
        objMid.PopulateList(drpBuilding, "BldgId", "BldgName", objMid.ExecuteSelectSQL("select * from building where siteid = '" & drpSite.SelectedValue & "'").Tables(0))
    End Sub

    Protected Sub drpBuilding_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpBuilding.SelectedIndexChanged
        objMid.PopulateList(drpFlatNumber, "RoomId", "RoomNumber", objMid.ExecuteSelectSQL("select * from Room where Bldgid = '" & drpBuilding.SelectedValue & "' and Booked = 'No'").Tables(0))
        lblsqft.Text = ""
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            objMid.PopulateList(drpSite, "SiteId", "SiteName", objMid.ExecuteSelectSQL("select * from Site").Tables(0))
        End If
    End Sub

    Protected Sub drpFlatNumber_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpFlatNumber.SelectedIndexChanged
        Dim ds As New DataSet
        ds = objMid.ExecuteSelectSQL("select * from RoomType where RoomtypeId = '" & objMid.getID("Room", "RoomID", "RoomtypeId", drpFlatNumber.SelectedValue) & "'")
        If Not ds Is Nothing Then
            lblsqft.Text = ds.Tables(0).Rows(0)("sqft").ToString
        End If
    End Sub

    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
        Call AddSalesEntry()

        Call clearcontrols()
    End Sub
    Public Function AddSalesEntry() As Boolean
        Dim mydate As New Date
        Dim sql As String
        Dim BldStageds As New DataSet
        Dim BldStagedt As New DataTable

        mydate = Today
        sql = "INSERT INTO salesDetails (SalesId,SiteId,BldgId,RoomId,SqFt,Rate,FName,LName,SFName,SLName,Add1,Add2,telno,Mobno,email,saledate,Bank,userId,createdDate,installments) VALUES("
        sql = sql & objMid.getUniqueID("salesDetails", "SalesId") & ",'" & drpSite.SelectedValue & "','" & drpBuilding.SelectedValue & "'," & drpFlatNumber.SelectedValue & "," & lblsqft.Text & "," & txtRateOfInterest.Text & ","
        sql = sql & "'" & txtFName.Text & "','" & txtLName.Text & "','" & txtSFName.Text & "','" & txtSLName.Text & "','" & txtadd1.Text & "','" & txtadd2.Text & "','" & txttelno.Text & "',"
        sql = sql & "'" & txtmobno.Text & "','" & txtemail.Text & "','" & SaleDate.Date & "','" & txtbank.Text & "','" & Session("USERID") & "','" & Now.Date & "','" & drpinstallments.SelectedValue & "') "

        objMid.ExecuteSqlStmt(sql)


        'If objMid.ExecuteSqlStmt(sql) Then
        '    Return True
        'Else
        '    Return False
        'End If
        sql = ""
        sql = "update room set Booked='Yes' where RoomId = " & drpFlatNumber.SelectedValue
        objMid.ExecuteSqlStmt(sql)
        sql = ""
        Dim sqft As Double
        Dim rateofint As Double
        Dim otherCharges As Double
        Dim gnds As DataSet
        Dim gndt As DataTable

        Dim i As Integer

        sqft = CDbl(lblsqft.Text)
        rateofint = CDbl(txtRateOfInterest.Text)

        sql = "SELECT B.Sqft, B.OtherCharges FROM Room A, RoomType B WHERE A.Roomtypeid = B.Roomtypeid AND RoomId = " & drpFlatNumber.SelectedValue
        gnds = objMid.ExecuteSelectSQL(sql)
        gndt = gnds.Tables(0)
        sql = ""
        If gndt.Rows.Count > 0 Then
            otherCharges = gndt.Rows(i)("OtherCharges").ToString()
            sqft = gndt.Rows(i)("Sqft").ToString
        End If

        Dim Percentage As Double
        Dim StageAmt As Double

        sql = "SELECT CompletePercentage, BldgStageId FROM BldgStage where CompletionFlag <> 0  and  BldgId = " & drpBuilding.SelectedValue
        BldStageds = objMid.ExecuteSelectSQL(sql)
        BldStagedt = BldStageds.Tables(0)
        sql = ""


        For i = 0 To BldStagedt.Rows.Count - 1

            Percentage = CDbl(BldStagedt.Rows(i)("completePercentage").ToString())
            If i = 0 Then
                Dim flatcost As Double = rateofint * sqft + otherCharges
                Dim servicetax As Double = CDbl(getServiceTax())
                Dim servircetaxamt As Double = (flatcost * servicetax) / 100
                Dim vatamt As Double = (flatcost * CDbl(getVatax())) / 100
                StageAmt = ((flatcost + servircetaxamt) * Percentage / 100) + vatamt
            Else
                StageAmt = (rateofint * sqft + otherCharges) * Percentage / 100
            End If
            sql = "INSERT INTO Pyment (PymtId,BldgStageId,RoomId,DueDate,TotalPayment,OutStanding,userId,  createdDate) VALUES("
            sql = sql & objMid.getUniqueID("Pyment", "pymtID") & "," & CInt(BldStagedt.Rows(i)("BldgStageId").ToString()) & ","
            sql = sql & drpFlatNumber.SelectedValue & ",'" & SaleDate.Date & "'," & StageAmt & "," & StageAmt & ",'" & Session("USERID") & "','" & Now.Date & "') "
            objMid.ExecuteSqlStmt(sql)


            If i = 0 Then

                sql = "SELECT * from RoomType where Roomtypeid = " & getRoomTypeId(drpFlatNumber.SelectedValue)
                gnds = objMid.ExecuteSelectSQL(sql)
                gndt = gnds.Tables(0)


                Call installments(StageAmt, CDbl(gndt.Rows(0)("BookingAmt")), CDbl(gndt.Rows(0)("EMIAmt")))

            End If

        Next

    End Function

    Private Function getServiceTax()
        Dim gnds As DataSet
        Dim gndt As DataTable
        Dim sql As String
        Dim i As Integer = 0
        sql = "SELECT * from tbl_tax_master where tax_name='Service Tax' and tax_active = 'Active' and tax_year = '" & getcurrentyear() & "'"
        gnds = objMid.ExecuteSelectSQL(sql)
        gndt = gnds.Tables(0)

        getServiceTax = gndt.Rows(0)("tax_percent")
    End Function


    Private Function getRoomTypeId(ByVal roomid)
        Dim gnds As DataSet
        Dim gndt As DataTable
        Dim sql As String
        Dim i As Integer = 0
        sql = "SELECT * from Room where RoomId = '" & roomid & "'"
        gnds = objMid.ExecuteSelectSQL(sql)
        gndt = gnds.Tables(0)

        getRoomTypeId = gndt.Rows(0)("Roomtypeid").ToString()
    End Function

    Private Function getVatax()
        Dim gnds As DataSet
        Dim gndt As DataTable
        Dim sql As String
        Dim i As Integer = 0
        sql = "SELECT * from tbl_tax_master where tax_name='Vat Tax' and tax_active = 'Active' and tax_year = '" & getcurrentyear() & "'"
        gnds = objMid.ExecuteSelectSQL(sql)
        gndt = gnds.Tables(0)

        getVatax = gndt.Rows(0)("tax_percent").ToString()
    End Function

    Private Function getcurrentyear()
        Dim gnds As DataSet
        Dim gndt As DataTable
        Dim sql As String
        Dim i As Integer = 0
        sql = "SELECT * from tbl_year_master where year_active = 'Active'"
        gnds = objMid.ExecuteSelectSQL(sql)
        gndt = gnds.Tables(0)

        getcurrentyear = gndt.Rows(0)("year_name").ToString()
    End Function

    Public Sub installments(ByVal nos As Double, ByVal bookamt As Double, ByVal emiamt As Double)
        Dim install As Double = 0
        'install = CDec(nos / CDec(drpinstallments.SelectedValue))
        install = emiamt
        Dim datedl As Date
        datedl = SaleDate.Date
        Dim i As Integer = 0
        Dim xstr As String = ""
        Dim sql As String = ""
        drpinstallments.SelectedIndex = 3
        For i = 0 To CDec(drpinstallments.SelectedValue) - 1
            If i = 0 Then
                sql = "INSERT INTO tbl_roominstallments_details (installment_name,RoomId,installment_date,installment_value,installment_status) VALUES('Booking Amoount',"
                sql = sql & drpFlatNumber.SelectedValue & ",'" & datedl.AddMonths(i).Date & "'," & bookamt & ",'pending')"
                nos = nos - bookamt
            Else
                sql = "INSERT INTO tbl_roominstallments_details (installment_name,RoomId,installment_date,installment_value,installment_status) VALUES('Installment: " & i & "',"
                sql = sql & drpFlatNumber.SelectedValue & ",'" & datedl.AddMonths(i).Date & "'," & install & ",'pending')"
                nos = nos - emiamt
            End If
            objMid.ExecuteSqlStmt(sql)
            'xstr = xstr + "--" + datedl.AddMonths(i).Date
        Next
        sql = "INSERT INTO tbl_roominstallments_details (installment_name,RoomId,installment_date,installment_value,installment_status) VALUES('Installment: 36',"
        sql = sql & drpFlatNumber.SelectedValue & ",'" & datedl.AddMonths(i).Date & "'," & nos & ",'pending')"
        objMid.ExecuteSqlStmt(sql)
        'lblmsg.Text = xstr
    End Sub

    Public Sub clearcontrols()
        txtadd1.Text = ""
        txtadd2.Text = ""
        txtbank.Text = ""
        txtemail.Text = ""
        txtFName.Text = ""
        txtLName.Text = ""
        txtmobno.Text = ""
        txtRateOfInterest.Text = ""
        txtSFName.Text = ""
        txtSLName.Text = ""
        txttelno.Text = ""
        lblsqft.Text = ""
        objMid.ClearDropDown(drpFlatNumber)
        objMid.ClearDropDown(drpBuilding)
        drpSite.SelectedIndex = 0
        SaleDate.Date = Now.Date
    End Sub
    Protected Sub imbCancel_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbCancel.Click
        Call clearcontrols()
    End Sub


End Class
