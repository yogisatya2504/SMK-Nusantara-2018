Public Class frmubahpwd
    ' Role untuk form ubah password

    ' Propertise (opsional)
    ' frm - start position = center screen
    ' tabindex :
    '   sesuai saat aplikasi dijalankan

    Private Sub frmubahpwd_Load(sender As Object, e As EventArgs) Handles MyBase.Load

    End Sub

    Private Sub frmubahpwd_FormClosing(sender As Object, e As FormClosingEventArgs) Handles Me.FormClosing
        frmeditprofile.Show()
    End Sub
End Class