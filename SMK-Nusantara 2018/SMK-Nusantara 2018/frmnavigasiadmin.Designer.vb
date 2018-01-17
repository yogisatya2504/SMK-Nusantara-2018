<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frmnavigasiadmin
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
        Me.lbwelcome = New System.Windows.Forms.Label()
        Me.btmanagemurid = New System.Windows.Forms.Button()
        Me.btmanageguru = New System.Windows.Forms.Button()
        Me.btmanagekelas = New System.Windows.Forms.Button()
        Me.btviewreport = New System.Windows.Forms.Button()
        Me.btfinalizeschedule = New System.Windows.Forms.Button()
        Me.btmanagejadwal = New System.Windows.Forms.Button()
        Me.btlogout = New System.Windows.Forms.Button()
        Me.SuspendLayout()
        '
        'lbwelcome
        '
        Me.lbwelcome.AutoSize = True
        Me.lbwelcome.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lbwelcome.Location = New System.Drawing.Point(12, 18)
        Me.lbwelcome.Name = "lbwelcome"
        Me.lbwelcome.Size = New System.Drawing.Size(205, 16)
        Me.lbwelcome.TabIndex = 6
        Me.lbwelcome.Text = "Welcome, [ nama admin  dari db]"
        '
        'btmanagemurid
        '
        Me.btmanagemurid.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btmanagemurid.Location = New System.Drawing.Point(12, 59)
        Me.btmanagemurid.Name = "btmanagemurid"
        Me.btmanagemurid.Size = New System.Drawing.Size(161, 35)
        Me.btmanagemurid.TabIndex = 0
        Me.btmanagemurid.Text = "Manage Student"
        Me.btmanagemurid.UseVisualStyleBackColor = True
        '
        'btmanageguru
        '
        Me.btmanageguru.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btmanageguru.Location = New System.Drawing.Point(12, 100)
        Me.btmanageguru.Name = "btmanageguru"
        Me.btmanageguru.Size = New System.Drawing.Size(161, 35)
        Me.btmanageguru.TabIndex = 1
        Me.btmanageguru.Text = "Manage Teacher"
        Me.btmanageguru.UseVisualStyleBackColor = True
        '
        'btmanagekelas
        '
        Me.btmanagekelas.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btmanagekelas.Location = New System.Drawing.Point(12, 141)
        Me.btmanagekelas.Name = "btmanagekelas"
        Me.btmanagekelas.Size = New System.Drawing.Size(161, 35)
        Me.btmanagekelas.TabIndex = 2
        Me.btmanagekelas.Text = "Manage Class"
        Me.btmanagekelas.UseVisualStyleBackColor = True
        '
        'btviewreport
        '
        Me.btviewreport.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btviewreport.Location = New System.Drawing.Point(203, 141)
        Me.btviewreport.Name = "btviewreport"
        Me.btviewreport.Size = New System.Drawing.Size(161, 35)
        Me.btviewreport.TabIndex = 5
        Me.btviewreport.Text = "View Report Score"
        Me.btviewreport.UseVisualStyleBackColor = True
        '
        'btfinalizeschedule
        '
        Me.btfinalizeschedule.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btfinalizeschedule.Location = New System.Drawing.Point(203, 100)
        Me.btfinalizeschedule.Name = "btfinalizeschedule"
        Me.btfinalizeschedule.Size = New System.Drawing.Size(161, 35)
        Me.btfinalizeschedule.TabIndex = 4
        Me.btfinalizeschedule.Text = "Finalize Schedule"
        Me.btfinalizeschedule.UseVisualStyleBackColor = True
        '
        'btmanagejadwal
        '
        Me.btmanagejadwal.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btmanagejadwal.Location = New System.Drawing.Point(203, 59)
        Me.btmanagejadwal.Name = "btmanagejadwal"
        Me.btmanagejadwal.Size = New System.Drawing.Size(161, 35)
        Me.btmanagejadwal.TabIndex = 3
        Me.btmanagejadwal.Text = "Manage Schedule"
        Me.btmanagejadwal.UseVisualStyleBackColor = True
        '
        'btlogout
        '
        Me.btlogout.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btlogout.Location = New System.Drawing.Point(271, 12)
        Me.btlogout.Name = "btlogout"
        Me.btlogout.Size = New System.Drawing.Size(93, 29)
        Me.btlogout.TabIndex = 6
        Me.btlogout.Text = "Logout"
        Me.btlogout.UseVisualStyleBackColor = True
        '
        'frmnavigasiadmin
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(385, 194)
        Me.Controls.Add(Me.btlogout)
        Me.Controls.Add(Me.btviewreport)
        Me.Controls.Add(Me.btfinalizeschedule)
        Me.Controls.Add(Me.btmanagejadwal)
        Me.Controls.Add(Me.btmanagekelas)
        Me.Controls.Add(Me.btmanageguru)
        Me.Controls.Add(Me.btmanagemurid)
        Me.Controls.Add(Me.lbwelcome)
        Me.Name = "frmnavigasiadmin"
        Me.Text = "Admin Navigation"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents lbwelcome As Label
    Friend WithEvents btmanagemurid As Button
    Friend WithEvents btmanageguru As Button
    Friend WithEvents btmanagekelas As Button
    Friend WithEvents btviewreport As Button
    Friend WithEvents btfinalizeschedule As Button
    Friend WithEvents btmanagejadwal As Button
    Friend WithEvents btlogout As Button
End Class
