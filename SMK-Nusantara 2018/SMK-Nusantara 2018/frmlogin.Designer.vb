<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frmlogin
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
        Me.Label2 = New System.Windows.Forms.Label()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.tbuname = New System.Windows.Forms.TextBox()
        Me.tbpwd = New System.Windows.Forms.TextBox()
        Me.cbpwd = New System.Windows.Forms.CheckBox()
        Me.btlogin = New System.Windows.Forms.Button()
        Me.SuspendLayout()
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 20.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.Location = New System.Drawing.Point(38, 9)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(205, 31)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "SMK Nusantara"
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(12, 59)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(55, 13)
        Me.Label2.TabIndex = 1
        Me.Label2.Text = "Username"
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(12, 85)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(53, 13)
        Me.Label3.TabIndex = 2
        Me.Label3.Text = "Password"
        '
        'tbuname
        '
        Me.tbuname.Location = New System.Drawing.Point(73, 56)
        Me.tbuname.Name = "tbuname"
        Me.tbuname.Size = New System.Drawing.Size(199, 20)
        Me.tbuname.TabIndex = 0
        '
        'tbpwd
        '
        Me.tbpwd.Location = New System.Drawing.Point(73, 82)
        Me.tbpwd.Name = "tbpwd"
        Me.tbpwd.PasswordChar = Global.Microsoft.VisualBasic.ChrW(42)
        Me.tbpwd.Size = New System.Drawing.Size(178, 20)
        Me.tbpwd.TabIndex = 1
        '
        'cbpwd
        '
        Me.cbpwd.AutoSize = True
        Me.cbpwd.Location = New System.Drawing.Point(257, 85)
        Me.cbpwd.Name = "cbpwd"
        Me.cbpwd.Size = New System.Drawing.Size(15, 14)
        Me.cbpwd.TabIndex = 2
        Me.cbpwd.UseVisualStyleBackColor = True
        '
        'btlogin
        '
        Me.btlogin.Location = New System.Drawing.Point(87, 121)
        Me.btlogin.Name = "btlogin"
        Me.btlogin.Size = New System.Drawing.Size(107, 40)
        Me.btlogin.TabIndex = 3
        Me.btlogin.Text = "Login"
        Me.btlogin.UseVisualStyleBackColor = True
        '
        'frmlogin
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(284, 173)
        Me.Controls.Add(Me.btlogin)
        Me.Controls.Add(Me.cbpwd)
        Me.Controls.Add(Me.tbpwd)
        Me.Controls.Add(Me.tbuname)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.Name = "frmlogin"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Login"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents Label1 As Label
    Friend WithEvents Label2 As Label
    Friend WithEvents Label3 As Label
    Friend WithEvents tbuname As TextBox
    Friend WithEvents tbpwd As TextBox
    Friend WithEvents cbpwd As CheckBox
    Friend WithEvents btlogin As Button
End Class
