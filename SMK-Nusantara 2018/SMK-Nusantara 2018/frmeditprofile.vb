Public Class frmeditprofile
    ' Role untuk form edit profile
    ' 1. Pastikan data yang muncul sesuai dengan user yang login
    ' 2. Pastikan gambar terlihat dari file yang diupload
    ' 3. Pastikan gambar yang akan diubah berformat .jpg atau .png
    ' 4. Format nama gambar adalah (dmmyyhhmmss sekarang)
    ' 5. Pastikan alamat terisi
    ' 6. Pastikan nama yang diinput berkisar antara 3 - 20 karakter
    ' 7. Pastikan nomor telepon terdiri dari 11 - 12 nomor dan diawali dengan 08
    ' 8. Jika tombol change password diklik maka munculkan frmubahpwd
    ' 9. Jika btsave diklik maka program akan menyimpan data ke database dan mengupload foto

    ' Propertise (opsional)
    ' frm - start position = center screen
    ' tabindex :
    '   sesuai saat aplikasi dijalankan
    ' pb - size mode = scretch
    ' tbnama - maxlength = 20 (point 6)
    ' tbnohp - maxlength = 12 (point 7)

    ' untuk menentukan role dan id apa yang sedang mengganti profile
    Friend role As String = ""
    Friend id As String = ""

    ' berfungsi menampilkan data - data saat form ini di load
    Private Sub cls()
        ' baca data yang diperlukan dari database
        Dim dt As New DataTable
        ' +--------+--------+--------+--------+--------+--------+--------+
        ' |   id   |  nama  |  nohp  | tglhr  |   jk   |  lamat |  foto  |
        ' +--------+--------+--------+--------+--------+--------+--------+
        ' |        |        |        |        |        |        |        |
        ' +--------+--------+--------+--------+--------+--------+--------+
        If role = "guru" Then
            dt = bacadb("select TeacherId, [Name], PhoneNumber, [Address], Photo from Teacher where TeacherId = '" & id & "'")
        ElseIf role = "murid" Then
            dt = bacadb("select StudentId, [Name], PhoneNumber, [Address], Photo from Student where StudentId = '" & id & "'")
        End If

        ' id tidak dapat dirubah
        tbid.Enabled = False
        tbid.Text = dt.Rows(0).Item(0)
        tbname.Text = dt.Rows(0).Item(1)
        tbnohp.Text = dt.Rows(0).Item(2)
        tbalamat.Text = dt.Rows(0).Item(3)

        ' karena tipedata foto di db adalah varchar(100) jadi gak kosong
        Dim foto As String() = Split(dt.Rows(0).Item(4), " ")
        ' jika foto gak kosong
        If foto(0) <> "" Then
            pb.Image = Image.FromFile(dt.Rows(0).Item(4))
        End If
    End Sub

    Private Sub frmeditprofile_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        cls()
    End Sub

    Private Sub frmeditprofile_FormClosing(sender As Object, e As FormClosingEventArgs) Handles Me.FormClosing
        If role = "guru" Then
            frmnavigasiguru.Show()
        ElseIf role = "murid" Then
            frmnavigasimurid.Show()
        End If
    End Sub

    ' Milih gambar user
    Private Sub pb_Click(sender As Object, e As EventArgs) Handles pb.Click

    End Sub
End Class