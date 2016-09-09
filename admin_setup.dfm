object Form_adminSetup: TForm_adminSetup
  Left = 402
  Top = 118
  BorderStyle = bsToolWindow
  Caption = #31995#32479#35774#32622
  ClientHeight = 265
  ClientWidth = 354
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 337
    Height = 217
    Caption = #31995#32479#35774#32622
    TabOrder = 0
    object chk_NotAdmin: TCheckBox
      Left = 24
      Top = 16
      Width = 281
      Height = 17
      Caption = #20197#38750#31649#29702#21592#27169#24335#36733#20837#25191#34892#22120
      TabOrder = 0
      OnClick = chk_NotAdminClick
    end
    object CheckBox_Mouse: TCheckBox
      Left = 24
      Top = 40
      Width = 201
      Height = 17
      Caption = #24405#21046#40736#26631#31227#21160#36335#24452
      TabOrder = 1
    end
  end
  object Button1: TButton
    Left = 16
    Top = 232
    Width = 75
    Height = 25
    Caption = #30830'    '#23450
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 104
    Top = 232
    Width = 75
    Height = 25
    Caption = #21462'    '#28040
    TabOrder = 2
    OnClick = Button2Click
  end
end
