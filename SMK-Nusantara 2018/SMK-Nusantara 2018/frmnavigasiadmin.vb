Public Class frmnavigasiadmin
    ' Role untuk form navigasi admin
    ' 1. Pastikan form hanya bisa diakses admin (sudah pasti jika form login benar)

    ' Propertise (opsional)
    ' frm - start position = center screen
    ' tabindex :
    '   sesuai saat di run

    Private Sub frmnavigasiadmin_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        ' menampilkan nama sesuai dengan yang ada di database
        ' Isi dari dt nantinya adalah sebuah datatable
        ' +--------+
        ' |  Name  | - Item(0)
        ' +--------+
        ' |        | - Rows(0) -> Item(0) artinya kolom ke 0
        ' +--------+
        ' gimana tabel untuk user admin?
        Dim dt As New DataTable
        dt = bacadb("select [Name] from Student where StudentId = '" & frmlogin.tbuname.Text & "'")

        lbwelcome.Text = "Welcome, " & dt.Rows(0).Item(0).ToString
    End Sub

    Private Sub frmnavigasiadmin_FormClosing(sender As Object, e As FormClosingEventArgs) Handles Me.FormClosing
        ' Point 3 (frmlogin)
        ' panggil fungsi cls agar formlogin direset terlebih dahulu
        frmlogin.cls()
        frmlogin.Show()
    End Sub
End Class