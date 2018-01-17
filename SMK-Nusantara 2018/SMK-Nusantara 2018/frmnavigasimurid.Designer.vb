<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frmnavigasimurid
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.btlogout = New System.Windows.Forms.Button()
        Me.btlihat = New System.Windows.Forms.Button()
        Me.btjadwal = New System.Windows.Forms.Button()
        Me.bteditprofile = New System.Windows.Forms.Button()
        Me.lbwelcome = New System.Windows.Forms.Label()
        Me.SuspendLayout()
        '
        'btlogout
        '
        Me.btlogout.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btlogout.Location = New System.Drawing.Point(40, 216)
        Me.btlogout.Name = "btlogout"
        Me.btlogout.Size = New System.Drawing.Size(206, 47)
        Me.btlogout.TabIndex = 3
        Me.btlogout.Text = "Logout"
        Me.btlogout.UseVisualStyleBackColor = True
        '
        'btlihat
        '
        Me.btlihat.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btlihat.Location = New System.Drawing.Point(40, 163)
        Me.btlihat.Name = "btlihat"
        Me.btlihat.Size = New System.Drawing.Size(206, 47)
        Me.btlihat.TabIndex = 2
        Me.btlihat.Text = "View  Score"
        Me.btlihat.UseVisualStyleBackColor = True
        '
        'btjadwal
        '
        Me.btjadwal.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btjadwal.Location = New System.Drawing.Point(40, 110)
        Me.btjadwal.Name = "btjadwal"
        Me.btjadwal.Size = New System.Drawing.Size(206, 47)
        Me.btjadwal.TabIndex = 1
        Me.btjadwal.Text = "Class Schedule"
        Me.btjadwal.UseVisualStyleBackColor = True
        '
        'bteditprofile
        '
        Me.bteditprofile.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.bteditprofile.Location = New System.Drawing.Point(40, 57)
        Me.bteditprofile.Name = "bteditprofile"
        Me.bteditprofile.Size = New System.Drawing.Size(206, 47)
        Me.bteditprofile.TabIndex = 0
        Me.bteditprofile.Text = "Edit Profile"
        Me.bteditprofile.UseVisualStyleBackColor = True
        '
        'lbwelcome
        '
        Me.lbwelcome.AutoSize = True
        Me.lbwelcome.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lbwelcome.Location = New System.Drawing.Point(12, 20)
        Me.lbwelcome.Name = "lbwelcome"
        Me.lbwelcome.Size = New System.Drawing.Size(201, 16)
        Me.lbwelcome.TabIndex = 5
        Me.lbwelcome.Text = "Welcome, [ nama murid  dari db]"
        '
        'frmnavigasimurid
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(284, 282)
        Me.Controls.Add(Me.btlogout)
        Me.Controls.Add(Me.btlihat)
        Me.Controls.Add(Me.btjadwal)
        Me.Controls.Add(Me.bteditprofile)
        Me.Controls.Add(Me.lbwelcome)
        Me.Name = "frmnavigasimurid"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Student Navigation"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents btlogout As Button
    Friend WithEvents btlihat As Button
    Friend WithEvents btjadwal As Button
    Friend WithEvents bteditprofile As Button
    Friend WithEvents lbwelcome As Label
End Class
