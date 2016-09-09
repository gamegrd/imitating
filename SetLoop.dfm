object Form_SetLoop: TForm_SetLoop
  Left = 466
  Top = 294
  BorderStyle = bsToolWindow
  Caption = #33050#26412#24490#29615
  ClientHeight = 222
  ClientWidth = 238
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #26032#23435#20307
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 24
    Top = 8
    Width = 193
    Height = 169
    Caption = #25105#24819#35753#36825#20123#21160#20316
    TabOrder = 0
    object Label2: TLabel
      Left = 144
      Top = 24
      Width = 14
      Height = 13
      Caption = #27425
    end
    object Label1: TLabel
      Left = 104
      Top = 96
      Width = 28
      Height = 13
      Caption = #23567#26102
    end
    object Label3: TLabel
      Left = 104
      Top = 120
      Width = 14
      Height = 13
      Caption = #20998
    end
    object Label4: TLabel
      Left = 104
      Top = 144
      Width = 14
      Height = 13
      Caption = #31186
    end
    object SpinEdit1: TSpinEdit
      Left = 72
      Top = 19
      Width = 60
      Height = 22
      MaxLength = 4
      MaxValue = 9999
      MinValue = 1
      TabOrder = 0
      Value = 1
    end
    object RadioButton1: TRadioButton
      Left = 16
      Top = 24
      Width = 57
      Height = 17
      Caption = #24490#29615':'
      Checked = True
      TabOrder = 1
      TabStop = True
    end
    object RadioButton2: TRadioButton
      Left = 16
      Top = 48
      Width = 161
      Height = 17
      Caption = #24490#29615#21040#25353#20572#27490#38190#20026#27490
      TabOrder = 2
    end
    object RadioButton3: TRadioButton
      Left = 16
      Top = 72
      Width = 161
      Height = 17
      Caption = #24490#29615#19968#27573#26102#38388
      TabOrder = 3
    end
    object SpinEdit2: TSpinEdit
      Left = 40
      Top = 91
      Width = 60
      Height = 22
      MaxLength = 3
      MaxValue = 240
      MinValue = 0
      TabOrder = 4
      Value = 0
    end
    object SpinEdit3: TSpinEdit
      Left = 40
      Top = 115
      Width = 60
      Height = 22
      MaxLength = 2
      MaxValue = 60
      MinValue = 0
      TabOrder = 5
      Value = 0
    end
    object SpinEdit4: TSpinEdit
      Left = 40
      Top = 139
      Width = 60
      Height = 22
      MaxLength = 2
      MaxValue = 60
      MinValue = 0
      TabOrder = 6
      Value = 0
    end
  end
  object Button1: TButton
    Left = 48
    Top = 184
    Width = 49
    Height = 25
    Caption = #30830#23450
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 128
    Top = 184
    Width = 49
    Height = 25
    Caption = #21462#28040
    TabOrder = 2
    OnClick = Button2Click
  end
end
