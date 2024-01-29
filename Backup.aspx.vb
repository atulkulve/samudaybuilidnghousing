
Partial Class mmsoft_Backup
    Inherits System.Web.UI.Page
    Dim objmid As New MiddleLayer
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim sql As String
        sql = "backup database JIDNYASADATA to disk='D:\Databas_Backup\JID" & Now.Date & ".bak' with name='JIDNYASADATA backup all',description='Full Backup Of JIDNYASADATA'"
        objmid.ExecuteSqlStmt(sql)
        Response.Redirect("UserMenu.aspx")
    End Sub
End Class
