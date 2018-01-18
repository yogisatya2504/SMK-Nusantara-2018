Public Class frmeditprofile
    ' Role untuk form edit profile
    ' 1. Pastikan data yang muncul sesuai dengan user yang login
    ' 2. Pastikan gambar terlihat dari file yang diupload
    ' 3. Pastikan gambar yang akan diubah berformat .jpg atau .png
    ' 4. Format nama gambar adalah (ddmmyyhhmmss sekarang)
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
    Dim sttsupfoto As Boolean = False
    ' untuk openfiledialog saat upload foto
    Dim op As New OpenFileDialog

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
            pb.Image = Image.FromFile(IO.Directory.GetCurrentDirectory.ToString & dt.Rows(0).Item(4))
        Else
            pb.Image = Image.FromFile(IO.Directory.GetCurrentDirectory & "\image\user\default.png")
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

    ' Cari gambar
    Private Sub btupimage_Click(sender As Object, e As EventArgs) Handles btupimage.Click
        ' Point 3
        op.Filter = "Image Files|*.jpg;*.png"
        op.Title = "Select user image"

        If op.ShowDialog = DialogResult.OK Then
            ' jika file yang dipilih ada
            pb.Image = Image.FromFile(op.FileName)
        End If

        ' status untuk update foto
        sttsupfoto = True
    End Sub

    Private Sub btsave_Click(sender As Object, e As EventArgs) Handles btsave.Click
        ' Point 5
        If Split(tbalamat.Text, " ")(0) = "" Then
            MsgBox("Please enter address correctly!", MsgBoxStyle.Exclamation, "Warning")
            Exit Sub
        End If

        ' Point 6
        If tbname.Text.Length < 3 Or Split(tbname.Text, " ")(0) = "" Then
            MsgBox("Please enter name correctly!", MsgBoxStyle.Exclamation, "Warning")
            Exit Sub
        End If

        ' Point 7
        If tbnohp.Text(0) <> "0" Or tbnohp.Text(1) <> "8" Then
            MsgBox("Please enter phone number correctly!", MsgBoxStyle.Exclamation, "Warning")
            Exit Sub
        End If

        Dim str As String = ""
        If sttsupfoto = True Then
            ' upload foto terlebih dahulu
            ' Point 4
            Dim frmtfoto As String = Format(Now, "ddMMyyhhmmss")
            FileCopy(op.FileName, IO.Directory.GetCurrentDirectory & "\image\user\" & frmtfoto & IO.Path.GetExtension(op.FileName))

            If role = "guru" Then
                str = "update Teacher set [Name] = '" & tbname.Text & "', PhoneNumber = '" & tbnohp.Text & "', [Address] = '" & tbalamat.Text & "', Photo = '" & "\image\user\" & frmtfoto & IO.Path.GetExtension(op.FileName) & "' where TeacherId = '" & tbid.Text & "' "
            Else
                str = "update Student set [Name] = '" & tbname.Text & "', PhoneNumber = '" & tbnohp.Text & "', [Address] = '" & tbalamat.Text & "', Photo = '" & "\image\user\" & frmtfoto & IO.Path.GetExtension(op.FileName) & "' where StudentId = '" & tbid.Text & "' "
            End If
        Else
            ' jika tidak merubah foto
            If role = "guru" Then
                str = "update Teacher set [Name] = '" & tbname.Text & "', PhoneNumber = '" & tbnohp.Text & "', [Address] = '" & tbalamat.Text & "' where TeacherId = '" & tbid.Text & "' "
            Else
                str = "update Student set [Name] = '" & tbname.Text & "', PhoneNumber = '" & tbnohp.Text & "', [Address] = '" & tbalamat.Text & "' where StudentId = '" & tbid.Text & "' "
            End If
        End If

        Try
            ' update profile
            simpandb(str)

            ' feedback
            MsgBox("Profile success updated!", MsgBoxStyle.Information, "Info")
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try

        ' reset sttsupfoto
        sttsupfoto = False
    End Sub

    Private Sub btcancel_Click(sender As Object, e As EventArgs) Handles btcancel.Click
        Me.Close()
    End Sub

    ' Point 8
    Private Sub btubahpwd_Click(sender As Object, e As EventArgs) Handles btubahpwd.Click
        Me.Hide()
        frmubahpwd.Show()
    End Sub
End Class