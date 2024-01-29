Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable

Public Class MiddleLayer
    Dim objdbSQL As New dbSQL

    Public Function ExecuteSelectSQL(ByVal StrSQL As String) As DataSet
        Dim cmd As SqlCommand
        cmd = New SqlCommand
        cmd.CommandType = CommandType.Text
        cmd.CommandText = StrSQL
        Return objdbSQL.PrepareDataSet(cmd)
    End Function

    Public Sub PopulateList(ByVal listControl As System.Web.UI.WebControls.ListControl, ByVal valueDataName As String, ByVal textDataName As String, ByVal dataTable As DataTable)
        'Try
        listControl.Items.Clear()
        listControl.DataSource = dataTable
        listControl.DataValueField = valueDataName
        listControl.DataTextField = textDataName
        listControl.DataBind()
        'DropDownList is a special case, which needs an empty item
        If (listControl.GetType().ToString().IndexOf("DropDownList") > -1) Then
            'list.Items.Add(New ListItem("--Select--", ""))
            listControl.Items.Insert(0, "-- Select --")
            listControl.Items(0).Value = ""
            listControl.SelectedIndex = listControl.Items.IndexOf(listControl.Items.FindByValue(""))
        End If
    End Sub
End Class
