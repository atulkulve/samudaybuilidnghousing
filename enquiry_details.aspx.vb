Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls
Partial Class enquiry_details
    Inherits System.Web.UI.Page
    Dim constr As String = ConfigurationSettings.AppSettings("MyConnection")
    Dim myFlag As Boolean
    Dim ar(20) As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblId.Text = Session("LocId")
    End Sub

    'Protected Sub btnsubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnsubmit.Click
    '    Dim custName As String = txtname.Text
    '    'AddCustomer()
    '    AddEnquiry()

    'End Sub

    Public Sub AddEnquiry()

        Dim con As New SqlConnection(constr)
        Dim Instring, selstr, strUP, Regno As String
        Dim getReg, incrReg As Integer

        con.Open()
        selstr = "Select * from runningID"

        Dim selcmd As New SqlCommand(selstr, con)




        Dim strreader As SqlDataReader
        strreader = selcmd.ExecuteReader()
        strreader.Read()
        getReg = strreader("running_tag")
        Regno = "cust" & getReg + 1
        incrReg = getReg + 1
        strUP = "Update runningID set running_tag= '" & incrReg & "' where running_id=" & 1 & ""
        Dim cmdUP As New SqlCommand(strUP, con)
        strreader.Close()


        Instring = "INSERT INTO customer_master(cust_id,cust_name,cust_add1,cust_std,cust_phno,loc_id)VALUES('" & Regno & "','" & txtname.Text & "','" & txtaddr.Text & "','" & txtstd.Text & "','" & txtphno.Text & "','" & lblId.Text & "')"
        Dim cmd As New SqlCommand(Instring, con)

        Dim Instr As String
        Dim enstr, upEn As String
        Dim strSch As String
        'Dim custId As String
        Dim getID, incrID, schId As Integer
        Dim enqID As String

        enstr = "Select * from enqID"

        Dim encmd As New SqlCommand(enstr, con)


        Dim reader1, schemeRead As SqlDataReader

        reader1 = encmd.ExecuteReader()
        reader1.Read()
        getID = reader1("run_tag")
        enqID = "Enq" & getID + 1

        incrID = getID + 1

        upEn = "Update enqID set run_tag = '" & incrID & "' where run_id= " & 1 & ""
        Dim encmdUP As New SqlCommand(upEn, con)
        reader1.Close()


        'For Customer ID
        'strCust = "Select cust_id from customer_master where cust_name='" & txtname.Text & "'"
        'Dim selcmd1 As New SqlCommand(strCust, con)
        'custRead = selcmd1.ExecuteReader()
        'custRead.Read()
        'custId = custRead("cust_id")
        'custRead.Close()

        'For Scheme ID
        strSch = "Select scheme_id from scheme_master where scheme_name='" & drpscheme.Text & "'"
        Dim selcmd1 As New SqlCommand(strSch, con)
        schemeRead = selcmd1.ExecuteReader()
        schemeRead.Read()
        schId = schemeRead("scheme_id")
        schemeRead.Close()

        Instr = "INSERT INTO enquiry_details(enq_id,enq_date,cust_id, " & _
        "scheme_id,loc_id)VALUES('" & enqID & "','" & enqDate.Date & "'," & _
        "'" & Regno & "','" & schId & "','" & lblId.Text & "')"

        Dim cmdIN As New SqlCommand(Instr, con)

        'For Model Choice


        Dim Item As ListItem
        Dim strSql As String

        Dim a As Integer
        For Each Item In chkmodel.Items
            If Item.Selected = True Then
                strSql = "Insert Into model_choice(cust_id,model_choice)values('" & Regno & "','" & Item.Text & "')"
                'MsgBox(Item.Text)
                For a = 0 To 20
                    ar(a) = Item.Text
                Next

                Dim exQuery As Integer
                Dim cmdH As New SqlCommand(strSql, con)

                Try
                    exQuery = cmdH.ExecuteNonQuery

                Catch ex As Exception
                    Response.Write(ex.Message)
                End Try

            End If
        Next


        Dim cmdSc As New SqlCommand(strSch, con)
        Dim exQ, exQ1, exQ2, exQ4, exQ5, exQ6, exQ7 As Integer

        Try
            exQ = cmd.ExecuteNonQuery
            exQ1 = selcmd.ExecuteNonQuery
            exQ2 = cmdUP.ExecuteNonQuery
            exQ4 = encmd.ExecuteNonQuery
            exQ5 = encmdUP.ExecuteNonQuery
            exQ6 = cmdIN.ExecuteNonQuery
            exQ7 = selcmd1.ExecuteNonQuery

        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
        con.Close()
        Response.Redirect("UserMenu.aspx")
    End Sub

    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
        Dim custName As String = txtname.Text
        'AddCustomer()
        AddEnquiry()
    End Sub
End Class
