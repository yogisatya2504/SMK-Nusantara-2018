<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frmeditprofile
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
        Me.Label1 = New System.Windows.Forms.Label()
        Me.pb = New System.Windows.Forms.PictureBox()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.tbid = New System.Windows.Forms.TextBox()
        Me.tbname = New System.Windows.Forms.TextBox()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.tbnohp = New System.Windows.Forms.TextBox()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.tbalamat = New System.Windows.Forms.TextBox()
        Me.Label5 = New System.Windows.Forms.Label()
        Me.btsave = New System.Windows.Forms.Button()
        Me.btcancel = New System.Windows.Forms.Button()
        Me.btubahpwd = New System.Windows.Forms.Button()
        CType(Me.pb, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 18.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.Location = New System.Drawing.Point(88, 9)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(146, 29)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "Form Profile"
        '
        'pb
        '
        Me.pb.Location = New System.Drawing.Point(74, 41)
        Me.pb.Name = "pb"
        Me.pb.Size = New System.Drawing.Size(185, 186)
        Me.pb.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage
        Me.pb.TabIndex = 1
        Me.pb.TabStop = False
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(12, 282)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(18, 13)
        Me.Label2.TabIndex = 2
        Me.Label2.Text = "ID"
        '
        'tbid
        '
        Me.tbid.Location = New System.Drawing.Point(107, 279)
        Me.tbid.Name = "tbid"
        Me.tbid.Size = New System.Drawing.Size(192, 20)
        Me.tbid.TabIndex = 0
        '
        'tbname
        '
        Me.tbname.Location = New System.Drawing.Point(107, 305)
        Me.tbname.MaxLength = 20
        Me.tbname.Name = "tbname"
        Me.tbname.Size = New System.Drawing.Size(192, 20)
        Me.tbname.TabIndex = 1
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(12, 308)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(35, 13)
        Me.Label3.TabIndex = 4
        Me.Label3.Text = "Name"
        '
        'tbnohp
        '
        Me.tbnohp.Location = New System.Drawing.Point(107, 331)
        Me.tbnohp.MaxLength = 12
        Me.tbnohp.Name = "tbnohp"
        Me.tbnohp.Size = New System.Drawing.Size(192, 20)
        Me.tbnohp.TabIndex = 2
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Location = New System.Drawing.Point(12, 334)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(78, 13)
        Me.Label4.TabIndex = 6
        Me.Label4.Text = "Phone Number"
        '
        'tbalamat
        '
        Me.tbalamat.Location = New System.Drawing.Point(107, 357)
        Me.tbalamat.Multiline = True
        Me.tbalamat.Name = "tbalamat"
        Me.tbalamat.Size = New System.Drawing.Size(192, 66)
        Me.tbalamat.TabIndex = 3
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.Location = New System.Drawing.Point(12, 360)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(45, 13)
        Me.Label5.TabIndex = 8
        Me.Label5.Text = "Address"
        '
        'btsave
        '
        Me.btsave.Location = New System.Drawing.Point(84, 431)
        Me.btsave.Name = "btsave"
        Me.btsave.Size = New System.Drawing.Size(75, 23)
        Me.btsave.TabIndex = 4
        Me.btsave.Text = "Save"
        Me.btsave.UseVisualStyleBackColor = True
        '
        'btcancel
        '
        Me.btcancel.Location = New System.Drawing.Point(165, 431)
        Me.btcancel.Name = "btcancel"
        Me.btcancel.Size = New System.Drawing.Size(75, 23)
        Me.btcancel.TabIndex = 5
        Me.btcancel.Text = "Cancel"
        Me.btcancel.UseVisualStyleBackColor = True
        '
        'btubahpwd
        '
        Me.btubahpwd.Location = New System.Drawing.Point(108, 239)
        Me.btubahpwd.Name = "btubahpwd"
        Me.btubahpwd.Size = New System.Drawing.Size(117, 23)
        Me.btubahpwd.TabIndex = 9
        Me.btubahpwd.Text = "Change Password"
        Me.btubahpwd.UseVisualStyleBackColor = True
        '
        'frmeditprofile
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(323, 466)
        Me.Controls.Add(Me.btubahpwd)
        Me.Controls.Add(Me.btcancel)
        Me.Controls.Add(Me.btsave)
        Me.Controls.Add(Me.tbalamat)
        Me.Controls.Add(Me.Label5)
        Me.Controls.Add(Me.tbnohp)
        Me.Controls.Add(Me.Label4)
        Me.Controls.Add(Me.tbname)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.tbid)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.pb)
        Me.Controls.Add(Me.Label1)
        Me.Name = "frmeditprofile"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Edit Profile"
        CType(Me.pb, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents Label1 As Label
    Friend WithEvents pb As PictureBox
    Friend WithEvents Label2 As Label
    Friend WithEvents tbid As TextBox
    Friend WithEvents tbname As TextBox
    Friend WithEvents Label3 As Label
    Friend WithEvents tbnohp As TextBox
    Friend WithEvents Label4 As Label
    Friend WithEvents tbalamat As TextBox
    Friend WithEvents Label5 As Label
    Friend WithEvents btsave As Button
    Friend WithEvents btcancel As Button
    Friend WithEvents btubahpwd As Button
End Class
