Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Partial Class mmsoft_FlatDetails
    Inherits System.Web.UI.Page
    Dim objMid As New MiddleLayer
    Dim myflag As Boolean
    Dim constr As String = ConfigurationSettings.AppSettings("MyConnection")

    Public Sub CheckRoom(ByVal Room)
        Dim conn As New SqlConnection(constr)
        Dim dt As New DataTable

        Try
            conn.Open()
            Dim sql As String = "SELECT * FROM Room WHERE RoomNumber =@Room and BldgId =@BldgId"
            Dim cmd As New SqlCommand(sql, conn)
            cmd.Parameters.AddWithValue("@Room", Room)
            cmd.Parameters.AddWithValue("@BldgId", drpBuilding.SelectedValue)
            Dim da As New SqlDataAdapter(cmd)
            da.Fill(dt)

            If (dt.Rows.Count > 0) Then
                myflag = False
            Else
                myflag = True
            End If

        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
        conn.Close()
    End Sub

    Private Sub clearcontrols()
        drpBuilding.SelectedIndex = 0
        drpSite.SelectedIndex = 0
        drpFlatType.SelectedIndex = 0
        txtFlatNumber.Text = ""
        lblsqft.Text = ""
    End Sub

    Protected Sub mnuMenu_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles mnuMenu.MenuItemClick
        lblmsg.Text = ""
        drpSite.Enabled = True
        drpBuilding.Enabled = True
        drpFlatType.Enabled = True
        If mnuMenu.Items(0).Enabled = True Then
            mnuMenu.Items(0).Selected = True
            mnuMenu.Items(1).Enabled = True
            mnuMenu.Items(0).Enabled = False
            MultiView1.ActiveViewIndex = 0
            txthidden.Text = ""
            Call clearcontrols()
            objMid.PopulateList(drpFlatNumber1, "RoomId", "RoomNumber", objMid.ExecuteSelectSQL("select * from Room").Tables(0))
        Else
            MultiView1.ActiveViewIndex = 1
            mnuMenu.Items(1).Selected = True
            mnuMenu.Items(1).Enabled = False
            mnuMenu.Items(0).Enabled = True
            objMid.PopulateList(drpFlatNumber1, "RoomId", "RoomNumber", objMid.ExecuteSelectSQL("select * from Room").Tables(0))
        End If
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            mnuMenu.Items(0).Selected = True
            mnuMenu.Items(1).Enabled = True
            mnuMenu.Items(0).Enabled = False
            MultiView1.ActiveViewIndex = 0
            objMid.PopulateList(drpFlatNumber1, "RoomId", "RoomNumber", objMid.ExecuteSelectSQL("select * from Room").Tables(0))
            objMid.PopulateList(drpSite, "SiteId", "SiteName", objMid.ExecuteSelectSQL("select * from Site").Tables(0))
            objMid.PopulateList(drpFlatType, "RoomTypeId", "RoomType", objMid.ExecuteSelectSQL("select * from RoomType").Tables(0))
        End If
    End Sub

    Protected Sub imbCancel_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbCancel.Click
        If txthidden.Text = "" Then
            Call clearcontrols()
        Else
            Call clearcontrols()
            mnuMenu.Items(0).Selected = True
            mnuMenu.Items(1).Enabled = True
            mnuMenu.Items(0).Enabled = False
            MultiView1.ActiveViewIndex = 0
            drpSite.Enabled = True
            drpBuilding.Enabled = True
            drpFlatType.Enabled = True
        End If
        lblmsg.Text = ""
    End Sub

    Protected Sub imbEditCancel_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbEditCancel.Click
        Call clearcontrols()
        mnuMenu.Items(0).Selected = True
        mnuMenu.Items(1).Enabled = True
        mnuMenu.Items(0).Enabled = False
        MultiView1.ActiveViewIndex = 0
        lblmsg.Text = ""
        drpSite.Enabled = True
        drpBuilding.Enabled = True
        drpFlatType.Enabled = True
    End Sub

    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
        Dim RoomName As String = txtFlatNumber.Text
        CheckRoom(RoomName)
        lblmsg.Text = ""
        If mnuMenu.Items(1).Enabled = True Then
            If myFlag = True Then
                If AddData() Then 'Add new Room Entry
                    Call clearcontrols()
                    lblmsg.Text = "Added New Entry"
                Else
                    lblmsg.Text = "Data Cannot be Added"
                End If


            Else
                lblmsg.Text = "Flat Number already Exists!"
            End If
        Else
            If myFlag = True Then
                If ModifyData() Then
                    Call clearcontrols()
                    txthidden.Text = ""
                    lblmsg.Text = "Data Modified"
                    MultiView1.ActiveViewIndex = 0
                    mnuMenu.Items(0).Selected = True
                    mnuMenu.Items(0).Enabled = False
                    mnuMenu.Items(1).Enabled = True
                    objMid.PopulateList(drpFlatNumber1, "RoomId", "RoomNumber", objMid.ExecuteSelectSQL("select * from Room").Tables(0))
                Else
                    lblmsg.Text = "Data Cannot be Modified"
                End If
                'AddData() 'Add new Room Entry

            Else
                lblmsg.Text = "Flat Type already Exists!"
            End If

        End If
    End Sub
    Public Function AddData() As Boolean
        Dim mydate As New Date
        mydate = Today
        If objMid.ExecuteSqlStmt("Insert Into Room(Roomid,BldgId,RoomNumber,Booked, roomtypeid, userId,createdDate) values(" & objMid.getUniqueID("Room", "RoomId") & ",'" & drpBuilding.SelectedValue & "','" & txtFlatNumber.Text & "','No'," & drpFlatType.SelectedValue & ",'" & Session("USERID") & "','" & mydate & "')") Then
            Return True
        Else
            Return False
        End If
    End Function
    Public Function ModifyData() As Boolean
        Dim mydate As New Date
        mydate = Today
        If objMid.ExecuteSqlStmt("Update Room set RoomNumber='" & txtFlatNumber.Text & "', BldgID='" & drpBuilding.SelectedValue & "',RoomtypeId='" & drpFlatType.SelectedValue & "' where RoomId = " & CInt(txthidden.Text) & "") Then
            Return True
        Else
            Return False
        End If
    End Function
    Public Function getRoomData() As DataSet
        Dim ds As New DataSet
        Dim sql As String
        'sql = "SELECT     dbo.Room.RoomId, dbo.Room.BldgId, dbo.Building.BldgName, dbo.Building.SiteId, dbo.Site.SiteName, dbo.Room.RoomNumber, dbo.Room.Booked, "
        'sql = sql & " dbo.Room.Roomtypeid, dbo.RoomType.RoomType, dbo.RoomType.Sqft, dbo.RoomType.OtherCharges, dbo.Room.userId, dbo.Room.createdDate"
        'sql = sql & "FROM dbo.Building INNER JOIN"
        'sql = sql & "dbo.Room ON dbo.Building.BldgId = dbo.Room.BldgId INNER JOIN"
        'sql = sql & "  dbo.RoomType ON dbo.Room.Roomtypeid = dbo.RoomType.Roomtypeid INNER JOIN"
        'sql = sql & "dbo.Site ON dbo.Building.SiteId = dbo.Site.SiteId"
        'sql = sql = "WHERE     (dbo.Room.RoomId = '" & drpFlatType.SelectedValue & "')"
        'ds = objMid.ExecuteSelectSQL(" select * from Room where RoomId='" & txthidden.Text & "'")
        sql = "select * from Room where RoomId='" & txthidden.Text & "'"
        ds = objMid.ExecuteSelectSQL(sql)
        Return ds
    End Function
    Protected Sub imbedit_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbedit.Click
        Dim ds As New DataSet
        txthidden.Text = drpFlatNumber1.SelectedValue
        MultiView1.ActiveViewIndex = 0
        ds = getRoomData()
        If Not ds Is Nothing Then
            If ds.Tables(0).Rows.Count > 0 Then

                txtFlatNumber.Text = ds.Tables(0).Rows(0)("RoomNumber").ToString()
                drpSite.SelectedValue = FindSiteId(CInt(ds.Tables(0).Rows(0)("BldgId").ToString()))
                objMid.PopulateList(drpBuilding, "BldgId", "BldgName", objMid.ExecuteSelectSQL("select * from building where siteid = '" & drpSite.SelectedValue & "'").Tables(0))
                drpBuilding.SelectedValue = ds.Tables(0).Rows(0)("BldgId").ToString()
                drpFlatType.SelectedValue = ds.Tables(0).Rows(0)("roomtypeId").ToString

                'txtFlatNumber.Text = ds.Tables(0).Rows(0)("OtherCharges").ToString()

            End If
        End If
        Call FlatSqft()
        drpSite.Enabled = False
        drpBuilding.Enabled = False
        drpFlatType.Enabled = False
    End Sub
    Public Sub FlatSqft()
        Dim ds As New DataSet
        ds = objMid.ExecuteSelectSQL("select * from RoomType where RoomtypeId = '" & drpFlatType.SelectedValue & "'")
        If Not ds Is Nothing Then
            lblsqft.Text = ds.Tables(0).Rows(0)("sqft").ToString
        End If
    End Sub
    Public Function FindSiteId(ByVal BldgID) As Integer
        Dim ds As New DataSet
        Dim siteid As Integer
        ds = objMid.ExecuteSelectSQL("select distinct siteID from building where bldgId = '" & BldgID & "'")
        If Not ds Is Nothing Then
            siteId = ds.Tables(0).Rows(0)("siteid").ToString
        End If
        Return siteid
    End Function

    Protected Sub drpSite_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpSite.SelectedIndexChanged
        objMid.PopulateList(drpBuilding, "BldgId", "BldgName", objMid.ExecuteSelectSQL("select * from building where siteid = '" & drpSite.SelectedValue & "'").Tables(0))
    End Sub

 
    Protected Sub drpFlatType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub



    Protected Sub drpFlatType_SelectedIndexChanged1(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpFlatType.SelectedIndexChanged
        Dim ds As New DataSet
        ds = objMid.ExecuteSelectSQL("select * from RoomType where RoomtypeId = '" & drpFlatType.SelectedValue & "'")
        If Not ds Is Nothing Then
            lblsqft.Text = ds.Tables(0).Rows(0)("sqft").ToString
        End If
    End Sub
End Class
