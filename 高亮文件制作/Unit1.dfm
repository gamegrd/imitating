object Form1: TForm1
  Left = 192
  Top = 114
  Width = 829
  Height = 619
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 821
    Height = 41
    Align = alTop
    TabOrder = 0
    object Edit1: TEdit
      Left = 640
      Top = 10
      Width = 121
      Height = 21
      TabOrder = 0
      OnClick = Edit1Click
    end
    object Button1: TButton
      Left = 560
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 8
      Top = 8
      Width = 81
      Height = 25
      Caption = #29983#25104#25152#26377'(&R)'
      TabOrder = 2
      OnClick = Button2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 281
    Width = 821
    Height = 304
    Align = alBottom
    Caption = 'Panel2'
    TabOrder = 1
    object memo1: TMemo
      Left = 1
      Top = 1
      Width = 819
      Height = 302
      Align = alClient
      ScrollBars = ssBoth
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 41
    Width = 821
    Height = 240
    Align = alClient
    Caption = 'Panel3'
    TabOrder = 2
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 184
      Height = 238
      Align = alLeft
      Caption = 'Panel4'
      TabOrder = 0
      object Memo_cmd: TMemo
        Left = 1
        Top = 1
        Width = 182
        Height = 236
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
    object Panel5: TPanel
      Left = 185
      Top = 1
      Width = 360
      Height = 238
      Align = alLeft
      Caption = 'Panel5'
      TabOrder = 1
      object Memo_sm: TMemo
        Left = 1
        Top = 1
        Width = 358
        Height = 236
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
    object Panel6: TPanel
      Left = 545
      Top = 1
      Width = 275
      Height = 238
      Align = alClient
      Caption = 'Panel6'
      TabOrder = 2
      object Memo_dy: TMemo
        Left = 1
        Top = 1
        Width = 273
        Height = 236
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
  end
end
