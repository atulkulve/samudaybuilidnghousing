Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls

Partial Class customerdetails
    Inherits System.Web.UI.Page
    Dim constr As String = ConfigurationSettings.AppSettings("MyConnection")

    Public Sub AddCustomer()
        Dim con As New SqlConnection(constr)
        Dim Instring, sqlrel, strSql As String
        Dim ds As New DataSet
        Dim selstr, upstr As String
        Dim Regno As String
        Dim getReg, incrReg As Integer


        selstr = "Select * from runningID"

        Dim selcmd As New SqlCommand(selstr, con)
        Dim strreader As SqlDataReader

        con.Open()
        strreader = selcmd.ExecuteReader()
        strreader.Read()
        getReg = strreader("running_tag")
        Regno = "cust" & getReg + 1

        incrReg = getReg + 1

        upstr = "Update runningID set running_tag= '" & incrReg & "' where running_id=" & 1 & ""
        strreader.Close()

        Instring = "INSERT INTO customer_master(cust_id,cust_name,cust_dob,cust_add1,cust_add2," _
               & " cust_add3,cust_email,cust_anvdate,cust_std,cust_phno,cust_fax,loc_id)VALUES('" & Regno & "','" & txtname.Text & "','" & custDOB.Date & "'," _
               & "'" & txtadd1.Text & "','" & txtadd2.Text & "'," _
               & "'" & txtadd3.Text & "','" & txtemail.Text & "','" & anvDate.Date & "'," _
               & "'" & txtstd.Text & "','" & txtphno.Text & "','" & txtfax.Text & "','" & lblId.Text & "')"

        sqlrel = "INSERT INTO relative_master(cust_id,spouse_name,spouse_dob," _
        & "son_name,son_dob,daughter_name,daughter_dob,loc_id)values('" & Regno & "','" & txtspouse.Text & "'," _
        & "'" & spouseDOB.Date & "','" & txtson.Text & "','" & sonDOB.Date & "','" & txtdaughter.Text & "','" & daughterDOB.Date & "','" & lblId.Text & "')"

        strSql = "INSERT INTO nomref_master(cust_id,nom_name,nom_dob," _
        & "nom_addr,nom_rel,nom_std,nom_phno,ref_name,ref_addr," _
        & "ref_std,ref_phno,loc_id)values('" & Regno & "','" & txtnominee.Text & "'," _
        & "'" & nomDOB.Date & "','" & txtNadd.Text & "','" & txtNrel.Text & "','" & txtNstd.Text & "','" & txtNphno.Text & "'," _
        & "'" & txtref.Text & "','" & txtrefadd.Text & "','" & txtrefstd.Text & "','" & txtrefphno.Text & "','" & lblId.Text & "')"


        Dim cmd As New SqlCommand(Instring, con)
        Dim cmd1 As New SqlCommand(upstr, con)
        Dim cmdRelative As New SqlCommand(sqlrel, con)
        Dim cmdnom As New SqlCommand(strSql, con)


        Dim exQuery, exQuery1, exRel, exNom As Integer

        Try
            exQuery = cmd.ExecuteNonQuery
            exQuery1 = cmd1.ExecuteNonQuery
            exRel = cmdRelative.ExecuteNonQuery
            exNom = cmdnom.ExecuteNonQuery
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
        con.Close()
        Response.Redirect("UserMenu.aspx")

    End Sub


    'Protected Sub btnsubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnsubmit.Click
    '    AddCustomer()
    'End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblId.Text = Session("LocId")
    End Sub

    Protected Sub lnkLogout_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkLogout.Click
        Session.Abandon()
        Response.Redirect("admin_login.aspx")
    End Sub

    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
        AddCustomer()
    End Sub
End Class


