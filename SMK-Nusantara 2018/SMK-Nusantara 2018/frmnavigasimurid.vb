Public Class frmnavigasimurid
    ' Role untuk form navigasi murid
    ' 1. Pastikan form hanya bisa diakses murid (sudah pasti jika form login benar)

    ' Propertise (opsional)
    ' frm - start position = center screen
    ' tabindex :
    '   btedit  = 0
    '   btjadwal= 1
    '   btlihat = 2
    '   btlogout= 3

    Private Sub frmnavigasimurid_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        ' menampilkan nama sesuai dengan yang ada di database
        ' Isi dari dt nantinya adalah sebuah datatable
        ' +--------+
        ' |  Name  | - Item(0)
        ' +--------+
        ' |        | - Rows(0) -> Item(0) artinya kolom ke 0
        ' +--------+
        Dim dt As New DataTable
        dt = bacadb("select [Name] from Student where StudentId = '" & frmlogin.tbuname.Text & "'")

        lbwelcome.Text = "Welcome, " & dt.Rows(0).Item(0).ToString
    End Sub

    Private Sub frmnavigasimurid_FormClosing(sender As Object, e As FormClosingEventArgs) Handles Me.FormClosing
        ' Point 3 (frmlogin)
        ' panggil fungsi cls agar formlogin direset terlebih dahulu
        frmlogin.cls()
        frmlogin.Show()
    End Sub

    ' panggil form edit profile
    Private Sub bteditprofile_Click(sender As Object, e As EventArgs) Handles bteditprofile.Click
        ' set role jika nanti akan merubah profile
        frmeditprofile.role = "murid"
        frmeditprofile.id = frmlogin.tbuname.Text

        Me.Hide()
        frmeditprofile.Show()
    End Sub
End Class