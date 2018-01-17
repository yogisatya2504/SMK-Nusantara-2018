Imports System.Data.SqlClient

Module modulkoneksi
    Dim str As String = "Data Source=DESKTOP-D2PBETU\SQLEXPRESS;Initial Catalog=LKSN2017;Integrated Security=True"

    ' Fungsi ini nantinya akan mengembalikan data berupa datatable yang akan digunakan
    ' untuk memanipulasi programnya
    ' s adalah query yang diperlukan saat memanggil fungsi ini
    Function bacadb(s As String)
        Dim dt As New DataTable

        ' gunakan try untuk memudahkan analisa bila terjadi error
        Try
            Using conn As New SqlConnection(str)
                conn.Open()
                Dim cmd As New SqlCommand(s, conn)
                Dim dr As SqlDataReader = cmd.ExecuteReader
                dt.Load(dr)
            End Using
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try

        Return dt
    End Function
End Module
