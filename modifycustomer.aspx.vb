Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlConnection
Imports System.Data.DataSet
Imports System.Data.DataTable
Imports System.Type
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Partial Class modifycustomer
    Inherits System.Web.UI.Page
    Dim constr As String = ConfigurationSettings.AppSettings("MyConnection")

    Public Sub GETDATA()
        Dim conn As New SqlConnection(constr)
        Dim dt As New DataTable
        Dim strread As SqlDataReader
        Dim sql As String = "SELECT * FROM customer_master WHERE cust_id ='" & drpcust.SelectedValue & "'"
        Dim cmd As New SqlCommand(sql, conn)
        conn.Open()
        strread = cmd.ExecuteReader


        While strread.Read
            'TextBox1.Text = strread("cust_name")

            If IsDBNull(strread("cust_name")) = False Then txtname.Text = strread("cust_name")
            If IsDBNull(strread("cust_dob")) = False Then custDOB.Date = strread("cust_dob")
            If IsDBNull(strread("cust_add1")) = False Then txtadd1.Text = strread("cust_add1")
            If IsDBNull(strread("cust_add2")) = False Then txtadd2.Text = strread("cust_add2")
            If IsDBNull(strread("cust_add3")) = False Then txtadd3.Text = strread("cust_add3")
            If IsDBNull(strread("cust_email")) = False Then txtemail.Text = strread("cust_email")
            If IsDBNull(strread("cust_anvdate")) = False Then anvDate.Date = strread("cust_anvdate")
            If IsDBNull(strread("cust_std")) = False Then txtstd.Text = strread("cust_std")
            If IsDBNull(strread("cust_phno")) = False Then txtphno.Text = strread("cust_phno")
            If IsDBNull(strread("cust_fax")) = False Then txtfax.Text = strread("cust_fax")
        End While
        strread.Close()

        Dim strSql As String = "SELECT * FROM relative_master WHERE cust_id ='" & drpcust.Text & "'"
        Dim cmdR As New SqlCommand(strSql, conn)
        Dim reader As SqlDataReader
        reader = cmdR.ExecuteReader

        While reader.Read

            If IsDBNull(reader("spouse_name")) = False Then txtspouse.Text = reader("spouse_name")
            If IsDBNull(reader("spouse_dob")) = False Then spouseDOB.Date = reader("spouse_dob")
            If IsDBNull(reader("son_name")) = False Then txtson.Text = reader("son_name")
            If IsDBNull(reader("son_dob")) = False Then sonDOB.Date = reader("son_dob")
            If IsDBNull(reader("daughter_name")) = False Then txtdaughter.Text = reader("daughter_name")
            If IsDBNull(reader("daughter_dob")) = False Then daughterDOB.Date = reader("daughter_dob")
        End While
        reader.Close()

        Dim strSql1 As String = "SELECT * FROM nomref_master WHERE cust_id ='" & drpcust.Text & "'"
        Dim cmdR1 As New SqlCommand(strSql1, conn)
        Dim reader1 As SqlDataReader
        reader1 = cmdR1.ExecuteReader

        While reader1.Read

            If IsDBNull(reader1("nom_name")) = False Then txtnominee.Text = reader1("nom_name")
            If IsDBNull(reader1("nom_dob")) = False Then nomDOB.Date = reader1("nom_dob")
            If IsDBNull(reader1("nom_addr")) = False Then txtNadd.Text = reader1("nom_addr")
            If IsDBNull(reader1("nom_rel")) = False Then txtNrel.Text = reader1("nom_rel")
            If IsDBNull(reader1("nom_std")) = False Then txtNstd.Text = reader1("nom_std")
            If IsDBNull(reader1("nom_phno")) = False Then txtNphno.Text = reader1("nom_phno")
            If IsDBNull(reader1("ref_name")) = False Then txtref.Text = reader1("ref_name")
            If IsDBNull(reader1("ref_addr")) = False Then txtrefadd.Text = reader1("ref_addr")
            If IsDBNull(reader1("ref_std")) = False Then txtrefstd.Text = reader1("ref_std")
            If IsDBNull(reader1("ref_phno")) = False Then txtrefphno.Text = reader1("ref_phno")

        End While
        reader1.Close()

        conn.Close()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Panel1.Visible = False
        MultiView1.ActiveViewIndex = 0
        'TextBox1.Text = lblId.Text
    End Sub

    'Protected Sub btndisplay_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btndisplay.Click
    '    'Panel1.Visible = True
    '    'drpcust.Enabled = False
    '    If IsPostBack = False Then
    '        GETDATA()
    '    End If

    'End Sub

    Public Sub UpdateData()

        Dim conn As New SqlConnection(constr)
        Dim cmd As New SqlCommand("sp_UpdateCustomer", conn)
        cmd.CommandType = CommandType.StoredProcedure
        conn.Open()
        Dim pc As New SqlParameter

        pc = cmd.Parameters.Add(New SqlParameter("@theCustId", SqlDbType.VarChar))
        cmd.Parameters("@theCustId").Value = drpcust.Text

        pc = cmd.Parameters.Add(New SqlParameter("@theCustomer", SqlDbType.VarChar))
        cmd.Parameters("@theCustomer").Value = txtname.Text

        pc = cmd.Parameters.Add(New SqlParameter("@theBirthDate", SqlDbType.VarChar))
        cmd.Parameters("@theBirthDate").Value = custDOB.Date

        pc = cmd.Parameters.Add(New SqlParameter("@theAdd1", SqlDbType.VarChar))
        cmd.Parameters("@theAdd1").Value = txtadd1.Text

        pc = cmd.Parameters.Add(New SqlParameter("@theAdd2", SqlDbType.VarChar))
        cmd.Parameters("@theAdd2").Value = txtadd2.Text

        pc = cmd.Parameters.Add(New SqlParameter("@theAdd3", SqlDbType.VarChar))
        cmd.Parameters("@theAdd3").Value = txtadd3.Text

        pc = cmd.Parameters.Add(New SqlParameter("@theEmail", SqlDbType.VarChar))
        cmd.Parameters("@theEmail").Value = txtemail.Text

        pc = cmd.Parameters.Add(New SqlParameter("@theAnvDate", SqlDbType.VarChar))
        cmd.Parameters("@theAnvDate").Value = anvDate.Date

        pc = cmd.Parameters.Add(New SqlParameter("@theStd", SqlDbType.VarChar))
        cmd.Parameters("@theStd").Value = txtstd.Text

        pc = cmd.Parameters.Add(New SqlParameter("@thePhno", SqlDbType.VarChar))
        cmd.Parameters("@thePhno").Value = txtphno.Text

        pc = cmd.Parameters.Add(New SqlParameter("@theFax", SqlDbType.VarChar))
        cmd.Parameters("@theFax").Value = txtfax.Text


        'MsgBox("Profile Updated Succesfully", MsgBoxStyle.OkOnly, "Profile Update")
        cmd.ExecuteNonQuery()

        'Relative Information

        Dim cmd1 As New SqlCommand("sp_UpdateRelative", conn)
        cmd1.CommandType = CommandType.StoredProcedure
        Dim pc1 As New SqlParameter

        pc = cmd1.Parameters.Add(New SqlParameter("@theCustId", SqlDbType.VarChar))
        cmd1.Parameters("@theCustId").Value = drpcust.Text

        pc1 = cmd1.Parameters.Add(New SqlParameter("@theSpouse", SqlDbType.VarChar))
        cmd1.Parameters("@theSpouse").Value = txtspouse.Text

        pc1 = cmd1.Parameters.Add(New SqlParameter("@theSpDOB", SqlDbType.VarChar))
        cmd1.Parameters("@theSpDOB").Value = spouseDOB.Date

        pc1 = cmd1.Parameters.Add(New SqlParameter("@theSon", SqlDbType.VarChar))
        cmd1.Parameters("@theSon").Value = txtson.Text

        pc1 = cmd1.Parameters.Add(New SqlParameter("@theSonDOB", SqlDbType.VarChar))
        cmd1.Parameters("@theSonDOB").Value = sonDOB.Date


        pc1 = cmd1.Parameters.Add(New SqlParameter("@theDaughter", SqlDbType.VarChar))
        cmd1.Parameters("@theDaughter").Value = txtdaughter.Text

        pc1 = cmd1.Parameters.Add(New SqlParameter("@theDauDOB", SqlDbType.VarChar))
        cmd1.Parameters("@theDauDOB").Value = daughterDOB.Date

        cmd1.ExecuteNonQuery()

        'Nominee and Reference

        Dim cmd2 As New SqlCommand("sp_UpdateNomRef", conn)
        cmd2.CommandType = CommandType.StoredProcedure
        Dim pc2 As New SqlParameter

        pc2 = cmd2.Parameters.Add(New SqlParameter("@theCustId", SqlDbType.VarChar))
        cmd2.Parameters("@theCustId").Value = drpcust.Text

        pc2 = cmd2.Parameters.Add(New SqlParameter("@theNomName", SqlDbType.VarChar))
        cmd2.Parameters("@theNomName").Value = txtnominee.Text

        pc2 = cmd2.Parameters.Add(New SqlParameter("@theNmDOB", SqlDbType.VarChar))
        cmd2.Parameters("@theNmDOB").Value = nomDOB.Date

        pc2 = cmd2.Parameters.Add(New SqlParameter("@theNmAddr", SqlDbType.VarChar))
        cmd2.Parameters("@theNmAddr").Value = txtNadd.Text

        pc2 = cmd2.Parameters.Add(New SqlParameter("@theNmRel", SqlDbType.VarChar))
        cmd2.Parameters("@theNmRel").Value = txtNrel.Text

        pc2 = cmd2.Parameters.Add(New SqlParameter("@theNmStd", SqlDbType.VarChar))
        cmd2.Parameters("@theNmStd").Value = txtNstd.Text

        pc2 = cmd2.Parameters.Add(New SqlParameter("@theNmPhno", SqlDbType.VarChar))
        cmd2.Parameters("@theNmPhno").Value = txtNphno.Text

        pc2 = cmd2.Parameters.Add(New SqlParameter("@theRefName", SqlDbType.VarChar))
        cmd2.Parameters("@theRefName").Value = txtref.Text

        pc2 = cmd2.Parameters.Add(New SqlParameter("@theRefAddr", SqlDbType.VarChar))
        cmd2.Parameters("@theRefAddr").Value = txtrefadd.Text

        pc2 = cmd2.Parameters.Add(New SqlParameter("@theRefStd", SqlDbType.VarChar))
        cmd2.Parameters("@theRefStd").Value = txtrefstd.Text

        pc2 = cmd2.Parameters.Add(New SqlParameter("@theRefPhno", SqlDbType.VarChar))
        cmd2.Parameters("@theRefPhno").Value = txtrefphno.Text

        cmd2.ExecuteNonQuery()

        'MsgBox("Profile Updated Succesfully", MsgBoxStyle.OkOnly, "Profile Update")


        conn.Close()
    End Sub

    'Protected Sub btnmodify_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnmodify.Click
    '    UpdateData()
    'End Sub

    Protected Sub imbEdit_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbEdit.Click
        If IsPostBack = True Then
            GETDATA()
            MultiView1.ActiveViewIndex = 1
        End If
    End Sub

    Protected Sub imbSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imbSave.Click
        UpdateData()
    End Sub


End Class
