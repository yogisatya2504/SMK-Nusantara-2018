Public Class frmlogin
    ' Role untuk form login
    ' 1. Pastikan user yang mempunyai akun bisa login
    ' 2. Pastikan user yang login terbawa ke form navigasi yang sesuai dengan role nya
    ' 3. Jika tombol logout di klik maka semua form di close dan buka form login

    ' Propertise (opsional)
    ' frm - start position = center screen
    ' tabindex :
    '   tbuname = 0
    '   tbpwd   = 1
    '   cbpwd   = 2
    '   btlogin = 3

    ' berfungsi untuk mereset form login saat dibuka
    Friend Sub cls()
        ' reset form
        tbuname.Text = ""
        tbpwd.Text = ""
        cbpwd.Checked = False
    End Sub

    ' prosedur saat form pertama kali di load
    Private Sub frmlogin_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        cls()
    End Sub

    ' saat checkbox dicentang maka password akan muncul
    Private Sub cbpwd_CheckedChanged(sender As Object, e As EventArgs) Handles cbpwd.CheckedChanged
        If cbpwd.Checked = True Then
            tbpwd.PasswordChar = ""
        Else
            tbpwd.PasswordChar = "*"
        End If
    End Sub

    ' proses login -- proses hanya mengecek user di database
    Private Sub btlogin_Click(sender As Object, e As EventArgs) Handles btlogin.Click
        ' untuk role ada :
        ' Teacher
        ' Student
        ' Admin

        ' Point 1
        ' Isi dari dt nantinya adalah sebuah datatable
        ' +--------+
        ' |  role  | - Item(0)
        ' +--------+
        ' |        | - Rows(0) -> Item(0) artinya kolom ke 0
        ' +--------+
        Dim dt As New DataTable
        dt = bacadb("select [role] from [User] where username = '" & tbuname.Text & "' and [password] = '" & tbpwd.Text & "'")

        ' Jika saat bacadb ditemukan data maka row count nya pasti lebih dari 0
        If dt.Rows.Count > 0 Then
            ' Point 2
            If dt.Rows(0).Item(0).ToString = "Teacher" Then
                Me.Hide()
                frmnavigasiguru.Show()
            ElseIf dt.Rows(0).Item(0).ToString = "Student" Then
                Me.Hide()
                frmnavigasimurid.Show()
            ElseIf dt.Rows(0).Item(0).ToString = "Admin" Then
                Me.Hide()
                frmnavigasiadmin.Show()
            End If
        Else
            ' munculkan pesan error
            MsgBox("Incorrect username and password combination!", MsgBoxStyle.Exclamation, "Warning!")
        End If
    End Sub
End Class
