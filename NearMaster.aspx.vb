Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls

Partial Class mmsoft_NearMaster
    Inherits System.Web.UI.Page
    Dim objMid As New MiddleLayer
    Dim constr As String = ConfigurationSettings.AppSettings("MyConnection")
    Dim MyFlag As Boolean

    Public Sub CheckSite(ByVal Site)
        Dim conn As New SqlConnection(constr)
        Dim dt As New DataTable

        Try
            conn.Open()
            Dim sql As String = "SELECT * FROM NearMaster WHERE RoomId =@Site"
            Dim cmd As New SqlCommand(sql, conn)
            cmd.Parameters.AddWithValue("@Site", Site)
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

    Public Function AddData() As Boolean
        Dim mydate As New Date
        mydate = Today
        If objMid.ExecuteSqlStmt("Insert Into NearMaster(NearId,RoomId,PosId) values(" & objMid.getUniqueID("NearMaster", "NearId") & "," & drpFlatnumber.SelectedValue & ", " & drpPosition.SelectedValue & " )") Then
            Return True
        Else
            Return False
        End If
    End Function

    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
        Dim SiteName As Integer = drpFlatnumber.SelectedValue
        CheckSite(SiteName)
        lblmsg.Text = ""
        If mnuMenu.Items(1).Enabled = True Then
            If myFlag = True Then
                If AddData() Then 'Add new Site Entry
                    Call clearcontrols()
                    lblmsg.Text = "Added New Entry"
                Else
                    lblmsg.Text = "Data Cannot be Added"
                End If


            Else
                lblmsg.Text = "Entry already Exists!"
            End If
        Else

            If ModifyData() Then
                Call clearcontrols()
                txthidden.Text = ""
                lblmsg.Text = "Data Modified"
                MultiView1.ActiveViewIndex = 0
                mnuMenu.Items(0).Selected = True
                mnuMenu.Items(0).Enabled = False
                mnuMenu.Items(1).Enabled = True
                'objMid.PopulateList(drpSite, "ParticularsId", "ParticularsName", objMid.ExecuteSelectSQL("select * from ParticularsMaster").Tables(0))
            Else
                lblmsg.Text = "Data Cannot be Modified"
            End If
            'AddData() 'Add new Site Entry
        End If
    End Sub
    Private Sub clearcontrols()
        drpSite.SelectedIndex = 0
        objMid.ClearDropDown(drpBuilding)
        objMid.ClearDropDown(drpFlatnumber)
        drpPosition.SelectedIndex = 0
        'txtadd1.Text = ""
        'txtadd2.Text = ""
        'txttelno.Text = ""
    End Sub
    Public Function ModifyData() As Boolean
        Dim mydate As New Date
        mydate = Today
        If objMid.ExecuteSqlStmt("Update NearMaster set RoomId=" & drpFlatnumber.SelectedValue & ",PosId=" & drpPosition.SelectedValue & " where NearId = " & CInt(txthidden.Text) & "") Then
            Return True
        Else
            Return False
        End If
    End Function
    Protected Sub mnuMenu_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles mnuMenu.MenuItemClick
        lblmsg.Text = ""
        If mnuMenu.Items(0).Enabled = True Then
            mnuMenu.Items(0).Selected = True
            mnuMenu.Items(1).Enabled = True
            mnuMenu.Items(0).Enabled = False
            MultiView1.ActiveViewIndex = 0
            txthidden.Text = ""
            Call clearcontrols()
            'objMid.PopulateList(drpSite, "SiteId", "SiteName", objMid.ExecuteSelectSQL("select * from SiteMaster").Tables(0))
        Else
            MultiView1.ActiveViewIndex = 1
            Call PopFlatModify()
            mnuMenu.Items(1).Selected = True
            mnuMenu.Items(1).Enabled = False
            mnuMenu.Items(0).Enabled = True
            'objMid.PopulateList(drpSite, "SiteId", "SiteName", objMid.ExecuteSelectSQL("select * from SiteMaster").Tables(0))
        End If
    End Sub
    Public Sub PopFlatModify()
        objMid.PopulateList(drpNearModify, "NearId", "RoomNumber", getModifyData.Tables(0))
    End Sub
    Protected Sub drpSite_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpSite.SelectedIndexChanged
        objMid.PopulateList(drpBuilding, "BldgId", "BldgName", objMid.ExecuteSelectSQL("select * from building where siteid = '" & drpSite.SelectedValue & "'").Tables(0))
    End Sub
    Protected Sub drpBuilding_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpBuilding.SelectedIndexChanged
        objMid.PopulateList(drpFlatnumber, "RoomId", "RoomNumber", objMid.ExecuteSelectSQL("select * from Room where Bldgid = " & drpBuilding.SelectedValue & "").Tables(0))
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            mnuMenu.Items(0).Selected = True
            mnuMenu.Items(1).Enabled = True
            mnuMenu.Items(0).Enabled = False
            MultiView1.ActiveViewIndex = 0
            objMid.PopulateList(drpSite, "SiteId", "SiteName", objMid.ExecuteSelectSQL("select * from Site").Tables(0))
            objMid.PopulateList(drpPosition, "PosId", "PosName", objMid.ExecuteSelectSQL("select * from PositionMaster").Tables(0))
        End If
    End Sub
    Public Function getSiteData() As DataSet
        Dim ds As New DataSet
        ds = objMid.ExecuteSelectSQL("SELECT dbo.NearMaster.NearId, dbo.NearMaster.RoomId, dbo.Room.BldgId, dbo.Room.RoomNumber, dbo.NearMaster.PosId, dbo.PositionMaster.PosName, dbo.Building.BldgName, dbo.Site.SiteId FROM dbo.NearMaster INNER JOIN dbo.Room ON dbo.NearMaster.RoomId = dbo.Room.RoomId INNER JOIN dbo.PositionMaster ON dbo.NearMaster.PosId = dbo.PositionMaster.PosId INNER JOIN dbo.Building ON dbo.Room.BldgId = dbo.Building.BldgId INNER JOIN dbo.Site ON dbo.Building.SiteId = dbo.Site.SiteId WHERE (dbo.NearMaster.NearId =  " & drpNearModify.SelectedValue & ")")
        Return ds
    End Function
    Public Function getModifyData() As DataSet
        Dim ds As New DataSet
        ds = objMid.ExecuteSelectSQL("SELECT dbo.NearMaster.NearId, dbo.NearMaster.RoomId, dbo.Room.BldgId,dbo.Room.RoomNumber FROM dbo.NearMaster INNER JOIN dbo.Room ON dbo.NearMaster.RoomId = dbo.Room.RoomId")
        Return ds
    End Function
    Protected Sub imbedit_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbedit.Click
        Dim ds As New DataSet
        txthidden.Text = drpNearModify.SelectedValue
        MultiView1.ActiveViewIndex = 0
        ds = getSiteData()
        If Not ds Is Nothing Then
            If ds.Tables(0).Rows.Count > 0 Then

                drpSite.SelectedValue = ds.Tables(0).Rows(0)("SiteId").ToString()
                objMid.PopulateList(drpBuilding, "BldgId", "BldgName", objMid.ExecuteSelectSQL("select * from building where siteid = '" & drpSite.SelectedValue & "'").Tables(0))
                drpBuilding.SelectedValue = ds.Tables(0).Rows(0)("BldgId").ToString
                objMid.PopulateList(drpFlatnumber, "RoomId", "RoomNumber", objMid.ExecuteSelectSQL("select * from Room where Bldgid = " & drpBuilding.SelectedValue & "").Tables(0))
                drpFlatnumber.SelectedValue = ds.Tables(0).Rows(0)("RoomId").ToString
                drpPosition.SelectedValue = ds.Tables(0).Rows(0)("PosId").ToString
                'txtadd1.Text = ds.Tables(0).Rows(0)("Address1").ToString()
                'txtadd2.Text = ds.Tables(0).Rows(0)("Address2").ToString()
                'txttelno.Text = ds.Tables(0).Rows(0)("TelNo").ToString()

            End If
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
    End Sub

 
    
End Class
