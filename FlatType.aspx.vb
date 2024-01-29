Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Partial Class mmsoft_FlatType
    Inherits System.Web.UI.Page
    Dim objMid As New MiddleLayer
    Dim myflag As Boolean
    Dim constr As String = ConfigurationSettings.AppSettings("MyConnection")

    Public Sub CheckRoomType(ByVal RoomType)
        Dim conn As New SqlConnection(constr)
        Dim dt As New DataTable

        Try
            conn.Open()
            Dim sql As String = "SELECT * FROM RoomType WHERE RoomType =@RoomType"
            Dim cmd As New SqlCommand(sql, conn)
            cmd.Parameters.AddWithValue("@RoomType", RoomType)
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
        txtFlatTypeName.Text = ""
        txtsqft.Text = ""
        txtaddCharges.Text = ""
    End Sub

    Protected Sub mnuMenu_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles mnuMenu.MenuItemClick
        lblmsg.Text = ""
        txtsqft.Enabled = True
        txtaddCharges.Enabled = True
        If mnuMenu.Items(0).Enabled = True Then
            mnuMenu.Items(0).Selected = True
            mnuMenu.Items(1).Enabled = True
            mnuMenu.Items(0).Enabled = False
            MultiView1.ActiveViewIndex = 0
            txthidden.Text = ""
            Call clearcontrols()
            objMid.PopulateList(drpFlatTypeName, "RoomTypeId", "RoomType", objMid.ExecuteSelectSQL("select * from RoomType").Tables(0))
        Else
            MultiView1.ActiveViewIndex = 1
            mnuMenu.Items(1).Selected = True
            mnuMenu.Items(1).Enabled = False
            mnuMenu.Items(0).Enabled = True
            objMid.PopulateList(drpFlatTypeName, "RoomTypeId", "RoomType", objMid.ExecuteSelectSQL("select * from RoomType").Tables(0))
        End If
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            mnuMenu.Items(0).Selected = True
            mnuMenu.Items(1).Enabled = True
            mnuMenu.Items(0).Enabled = False
            MultiView1.ActiveViewIndex = 0
            objMid.PopulateList(drpFlatTypeName, "RoomTypeId", "RoomType", objMid.ExecuteSelectSQL("select * from RoomType").Tables(0))
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
            txtsqft.Enabled = True
            txtaddCharges.Enabled = True
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
        txtsqft.Enabled = True
        txtaddCharges.Enabled = True
    End Sub

    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
        Dim RoomTypeName As String = txtFlatTypeName.Text
        CheckRoomType(RoomTypeName)
        lblmsg.Text = ""
        If mnuMenu.Items(1).Enabled = True Then
            If myFlag = True Then
                If AddData() Then 'Add new RoomType Entry
                    Call clearcontrols()
                    lblmsg.Text = "Added New Entry"
                Else
                    lblmsg.Text = "Data Cannot be Added"
                End If


            Else
                lblmsg.Text = "Flat Type already Exists!"
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
                    objMid.PopulateList(drpFlatTypeName, "RoomTypeId", "RoomType", objMid.ExecuteSelectSQL("select * from RoomType").Tables(0))
                Else
                    lblmsg.Text = "Data Cannot be Modified"
                End If
                'AddData() 'Add new RoomType Entry

            Else
                lblmsg.Text = "Flat Type already Exists!"
            End If

        End If
    End Sub
    Public Function AddData() As Boolean
        Dim mydate As New Date
        mydate = Today
        If objMid.ExecuteSqlStmt("Insert Into RoomType(Roomtypeid,RoomType,sqft,OtherCharges,userId,createdDate,BookingAmt,EMIAmt) values(" & objMid.getUniqueID("RoomType", "RoomTypeId") & ",'" & txtFlatTypeName.Text & "'," & txtsqft.Text & ", " & txtaddCharges.Text & ",'" & Session("USERID") & "','" & mydate & "','" & CDbl(txtbookamt.Text) & "','" & CDbl(txtemiamt.Text) & "')") Then
            Return True
        Else
            Return False
        End If
    End Function
    Public Function ModifyData() As Boolean
        Dim mydate As New Date
        mydate = Today
        If objMid.ExecuteSqlStmt("Update RoomType set RoomType='" & txtFlatTypeName.Text & "', sqft= '" & txtsqft.Text & "',OtherCharges = '" & txtaddCharges.Text & "' where RoomTypeId = " & CInt(txthidden.Text) & "") Then
            Return True
        Else
            Return False
        End If
    End Function
    Public Function getRoomTypeData() As DataSet
        Dim ds As New DataSet
        ds = objMid.ExecuteSelectSQL("select * from RoomType where RoomTypeId='" & txthidden.Text & "'")
        Return ds
    End Function
    Protected Sub imbedit_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbedit.Click
        Dim ds As New DataSet
        txthidden.Text = drpFlatTypeName.SelectedValue
        MultiView1.ActiveViewIndex = 0
        ds = getRoomTypeData()
        If Not ds Is Nothing Then
            If ds.Tables(0).Rows.Count > 0 Then

                txtFlatTypeName.Text = ds.Tables(0).Rows(0)("RoomType").ToString()
                txtsqft.Text = ds.Tables(0).Rows(0)("sqft").ToString()
                txtaddCharges.Text = ds.Tables(0).Rows(0)("OtherCharges").ToString()

            End If
        End If
        txtsqft.Enabled = False
        txtaddCharges.Enabled = False
    End Sub
End Class
