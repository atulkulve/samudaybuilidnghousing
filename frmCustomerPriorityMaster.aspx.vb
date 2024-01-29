Imports System.Data
Imports System.Data.SqlClient
Partial Class Forms_frmCustomerPriorityMaster
    Inherits System.Web.UI.Page

    ''Variables Declaration
    'Dim objCustomerPriority As New clsCustomerPriority
    'Dim typId As String
    'Dim Type_Id As Integer
    'Dim Type_Main_Id As Integer
    'Dim ds As New DataSet
    'Dim customer_priority_ID As Integer
    'Dim dr As SqlDataReader
    'Dim Exists As Boolean
    'Dim objDB As New DBLayer
    ' ''End Declaration

    'Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    '    Search1.DataGridobj = gvwCustomerPriority
    '    btnDelete.Attributes.Add("OnClick", "return confirmDelete();")
    '    btnEdit.Attributes.Add("OnClick", "return confirmEdit();")
    '    Menu1.Attributes.Add("onClick", "return CheckBeforSwitching()") 'Added by sadhna 15-Jun-2007

    '    'Session("S_User_Name") = "SFA"
    '    'Session("S_Login_ID") = "1"

    '    If Not IsPostBack Then
    '        Menu1.Items(0).Selected = True
    '        MultiView1.ActiveViewIndex = 0
    '        Menu1.Items(1).Enabled = True
    '        Menu1.Items(0).Enabled = False
    '        Bind()
    '        imbBtnsave.Attributes.Add("onclick", "return Validate();")

    '        Session("User_Name") = Session("S_User_Name")
    '        Session("User_Id") = Session("S_Login_ID")
    '    End If
    '    Menu1.Items(1).Text = "Add Distributor Priority"

    '    lblErrMsg.Text = ""
    'End Sub
    'Protected Sub Menu1_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles Menu1.MenuItemClick
    '    MultiView1.ActiveViewIndex = CInt(e.Item.Value)
    '    clearControl()
    '    If e.Item.Value = 0 Then
    '        If tdMode.InnerText = "Updating Distributor Priority..." Or tdMode.InnerText = "Activity Type Info..." Then
    '            tdMode.InnerText = "Adding Distributor Priority..."
    '        End If
    '    Else
    '        If tdMode.InnerText = "Updating Distributor Priority..." Or tdMode.InnerText = "Activity Type Info..." Then
    '            tdMode.InnerText = "Adding Distributor Priority..."
    '        End If
    '        clearControl()
    '        imbBtnsave.ImageUrl = "~/softimages/Save.gif"
    '        imbReset.ImageUrl = "~/softimages/reset.gif"
    '        imbReset.ToolTip = "Reset"
    '        txtDescription.Focus()
    '    End If


    '    'added by sadhna 15-Jun-2007
    '    If Menu1.Items(1).Selected = True Then
    '        Menu1.Items(1).Enabled = False
    '        Menu1.Items(0).Enabled = True
    '    Else
    '        Menu1.Items(1).Enabled = True
    '        Menu1.Items(0).Enabled = False
    '    End If


    '    Search1.DropDownId = 0
    '    Search1.TextVale = ""
    '    Search1.lblMsgValue = ""
    '    Bind()
    'End Sub
    'Private Sub Bind()
    '    Dim Search As Search = FindControl("Search1")
    '    Dim dv As New DataView
    '    Search1.TabName = "vw_type_details_Customer_Priority"
    '    dv = Search1.getview()
    '    If dv.Count = 0 Then
    '        'ShowMessage("No Records Found!!", DisplayMessage.MessageType.Information)
    '    End If
    '    If (Not ViewState("SortExpression") Is Nothing) Then
    '        dv.Sort = CType(ViewState("SortExpression"), String)
    '        gvwCustomerPriority.DataSource = dv
    '        'GridViewContact.DataKeys = "UserId"
    '        gvwCustomerPriority.DataBind()
    '    Else

    '    End If
    '    gvwCustomerPriority.DataSource = dv
    '    dv.Sort = "Type_Detail_ID desc"
    '    gvwCustomerPriority.DataBind()
    '    gvwCustomerPriority.Focus()
    'End Sub
    ' ''Binding Grid
    'Private Sub FillCustomerPriority()
    '    gvwCustomerPriority.DataSource = objCustomerPriority.FillCustomerPriorityMaster
    '    gvwCustomerPriority.DataBind()
    'End Sub

    'Protected Sub imbBtnsave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbBtnsave.Click


    '    'Add Code By sadhna on 11-Jun-2007
    '    Try
    '        Search1.DropDownId = 0
    '        Search1.TextVale = ""
    '        'Dim VTypeMain_ID As DataSet
    '        'VTypeMain_ID = objCustomerPriority.GetTypeMainId()


    '        If imbBtnsave.ImageUrl = "~/softimages/Save.gif" Then


    '            'Added By Shweta Kulkarni 12-6-07
    '            'fetch the typeid from tbl_Type_Detail table check it for the existance of record
    '            Dim ds As New DataSet
    '            ds = objCustomerPriority.GetTypeMainId()
    '            Dim typeId As Integer = ds.Tables(0).Rows(0)(0)
    '            Exists = objDB.IsExists("tbl_Type_Detail", "Type_Detail_desc", txtDescription.Text, "and Is_Deleted='0'", " and Type_Main_Id=" & typeId)
    '            If Exists = False Then
    '                objCustomerPriority.Description = txtDescription.Text
    '                objCustomerPriority.Name = txtDescription.Text
    '                objCustomerPriority.CreatedBy = CInt(Session("User_ID"))
    '                objCustomerPriority.InsertTypeDetailMaster()
    '                clearControl()
    '                Bind()
    '                lblErrMsg.Text = "Record added successfully"
    '                Menu1.Items(1).Text = "Add Distributor Priority"
    '                Menu1.Items(0).Selected = True
    '                MultiView1.ActiveViewIndex = 0
    '                Menu1.Items(1).Enabled = True
    '                Menu1.Items(0).Enabled = False
    '                lblErrMsg.Visible = True


    '            Else
    '                lblErrMsg.Visible = True
    '                lblErrMsg.Text = "Name Already Present"


    '            End If
    '            'End Add
    '        Else

    '            objCustomerPriority.Type_Detail_ID = ViewState("Type_Id")
    '            objCustomerPriority.Description = txtDescription.Text
    '            objCustomerPriority.Name = txtDescription.Text

    '            Exists = objCustomerPriority.CheckEditDescription()

    '            If Exists = False Then


    '                objCustomerPriority.Description = txtDescription.Text
    '                objCustomerPriority.Name = txtDescription.Text
    '                objCustomerPriority.ModifyBy = CInt(Session("User_ID"))
    '                objCustomerPriority.UpdateCustomerPriority(CType(ViewState("Type_Id"), Integer))
    '                clearControl()
    '                Bind()
    '                Menu1.Items(1).Text = "Add Distributor Priority"
    '                Menu1.Items(0).Selected = True
    '                MultiView1.ActiveViewIndex = 0
    '                Menu1.Items(1).Enabled = True
    '                Menu1.Items(0).Enabled = False
    '                lblErrMsg.Visible = True
    '                imbBtnsave.ImageUrl = "~/softimages/Save.gif"
    '                lblErrMsg.Text = "Record updated successfully"


    '            Else
    '                lblErrMsg.Visible = True
    '                lblErrMsg.Text = txtDescription.Text & " " & "Already Present"

    '            End If

    '        End If
    '        ' End If
    '    Catch ex As Exception
    '    End Try
    'End Sub

    'Protected Sub gvwCustomerPriority_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles gvwCustomerPriority.PageIndexChanging
    '    gvwCustomerPriority.PageIndex = e.NewPageIndex
    '    Bind()
    'End Sub
    ' ''Reset values 
    'Protected Sub clearControl()
    '    txtDescription.Text = ""
    'End Sub

    'Protected Sub imbReset_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbReset.Click
    '    If imbReset.ImageUrl = "~/softimages/Cancel.gif" Then
    '        clearControl()
    '        Menu1.Items(0).Selected = True
    '        MultiView1.ActiveViewIndex = 0
    '        Menu1.Items(1).Enabled = True
    '        Menu1.Items(0).Enabled = False
    '        Menu1.Items(1).Text = "Add Distributor Priority"
    '        Search1.DropDownId = 0
    '        Search1.TextVale = ""
    '        Bind()

    '    Else
    '        clearControl()
    '        txtDescription.Focus()
    '    End If
    'End Sub

    'Protected Sub btnEdit_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnEdit.Click
    '    Try
    '        Dim chkSelect As CheckBox
    '        Dim hiddenID As HtmlInputHidden
    '        For Each gvRow As GridViewRow In gvwCustomerPriority.Rows
    '            If gvRow.RowType = DataControlRowType.DataRow Then
    '                chkSelect = gvRow.FindControl("chkSelect")
    '                hiddenID = gvRow.FindControl("HiddenID")
    '                If chkSelect.Checked = True Then
    '                    Type_Id = CType(hiddenID.Value, Integer)
    '                    ViewState("Type_Id") = Type_Id
    '                    ds = objCustomerPriority.GetCustomerPriorityMaster(Type_Id)
    '                    txtDescription.Text = ds.Tables(0).Rows(0)("Type_Detail_desc").ToString()
    '                    Menu1.Items(1).Selected = True
    '                    MultiView1.ActiveViewIndex = 1
    '                    Menu1.Items(1).Text = "Update Distributor Priority"
    '                    Menu1.Items(1).Enabled = False
    '                    Menu1.Items(0).Enabled = True
    '                    imbBtnsave.ImageUrl = "~/softimages/Update.gif"
    '                    imbReset.ImageUrl = "~/softimages/Cancel.gif"
    '                    imbReset.ToolTip = "Cancel"
    '                    tdMode.InnerText = "Updating Distributor Priority..."
    '                    txtDescription.Focus()
    '                    Bind()
    '                End If
    '            End If
    '        Next

    '    Catch ex As Exception
    '        lblErrMsg.Text = ex.Message
    '    End Try
    'End Sub

    'Protected Sub btnDelete_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnDelete.Click
    '    Try
    '        Dim chkSelect As CheckBox
    '        Dim hiddenID As HtmlInputHidden
    '        For Each gvRow As GridViewRow In gvwCustomerPriority.Rows
    '            If gvRow.RowType = DataControlRowType.DataRow Then
    '                chkSelect = gvRow.FindControl("chkSelect")
    '                hiddenID = gvRow.FindControl("HiddenID")
    '                If chkSelect.Checked = True Then
    '                    Type_Id = CType(hiddenID.Value, Integer)
    '                    If Not objCustomerPriority.DeleteCustomerPriorityMaster(Type_Id) > 0 Then
    '                        lblErrMsg.Text = "Record already used, delete all dependencies before deleting"
    '                    Else
    '                        lblErrMsg.Text = "Record deleted successfully"
    '                    End If
    '                    Bind()
    '                End If
    '            End If
    '        Next

    '    Catch ex As Exception
    '        lblErrMsg.Text = ex.Message
    '    End Try
    'End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'MultiView1.ActiveViewIndex = 0   'View1.Visible = True
        'View2.Visible = False
    End Sub
End Class
