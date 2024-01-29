Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Data.OleDb
Imports System.Data.Odbc
Imports System.IO

Public Class dbSQL
    Public Function PrepareDataSet(ByVal Command As SqlCommand) As DataSet
        Dim val As DataSet
        Dim adapter As SqlDataAdapter
        Dim con1 As SqlConnection
        Dim constr As String = ConfigurationSettings.AppSettings("MyConnection")

        con1 = New SqlConnection(constr)
        adapter = New SqlDataAdapter
        adapter.SelectCommand = Command
        adapter.SelectCommand.Connection = con1
        val = New DataSet
        adapter.Fill(val)
        Return val
        'Returning the result
    End Function
End Class
