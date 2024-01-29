Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls
Partial Class calldetails
    Inherits System.Web.UI.Page
    Dim constr As String = ConfigurationSettings.AppSettings("MyConnection")

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblId.Text = Session("LocId")
    End Sub

    Public Sub ADDCALLDETAILS()
        Dim con As New SqlConnection(constr)
        Dim Instring, strEmp, strCust As String
        Dim ds As New DataSet
        Dim empID, custID As String
        'Dim callDate, nextcallDate As String

        con.Open()
        'For Date Conversion
        'callDate = Val(drpdt.Text) & " " & drpmonth.Text & " " & Val(drpyr.Text)
        'nextcallDate = Val(drpNdt.Text) & " " & drpNmonth.Text & " " & Val(drpNyr.Text)


        'For Finding Employee Id
        strEmp = "Select emp_id from employee_master where emp_name='" & drpemp.Text & "'"
        Dim cmdEmp As New SqlCommand(strEmp, con)
        Dim reader As SqlDataReader
        reader = cmdEmp.ExecuteReader()
        reader.Read()
        empID = reader("emp_id")
        reader.Close()


        'For Finding Customer Id
        strCust = "Select cust_id from customer_master where cust_name='" & drpcust.Text & "'"
        Dim cmdCust As New SqlCommand(strCust, con)
        Dim reader1 As SqlDataReader
        reader1 = cmdCust.ExecuteReader()
        reader1.Read()
        custID = reader1("cust_id")
        reader1.Close()


        Instring = "INSERT INTO call_details(loc_id,emp_id,cust_id,call_details,call_date," _
       & " call_nextdate)values('" & lblId.Text & "','" & empID & "','" & custID & "'," _
        & "'" & txtdetails.Text & "','" & callDate.Date & "','" & nextcallDate.Date & "')"

        Dim cmd As New SqlCommand(Instring, con)
        Dim exQ1, exQ2, exQ3 As Integer

        Try
            exQ1 = cmdEmp.ExecuteNonQuery
            exQ2 = cmdCust.ExecuteNonQuery
            exQ3 = cmd.ExecuteNonQuery
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try


        con.Close()
        Response.Redirect("UserMenu.aspx")
    End Sub

    'Protected Sub btnsubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnsubmit.Click
    '    ADDCALLDETAILS()
    'End Sub

    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
        ADDCALLDETAILS()
    End Sub
End Class
