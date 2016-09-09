object AboutBox: TAboutBox
  Left = 401
  Top = 118
  BorderStyle = bsDialog
  Caption = 'About'
  ClientHeight = 213
  ClientWidth = 298
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #26032#23435#20307
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Label3: TLabel
    Left = 48
    Top = 96
    Width = 104
    Height = 16
    Caption = #20316#32773':'#28201#26580#30340#37239
  end
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 281
    Height = 161
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentColor = True
    TabOrder = 0
    object Label1: TLabel
      Left = 48
      Top = 64
      Width = 168
      Height = 16
      Cursor = crHandPoint
      Caption = 'http://www.monijl.com'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = #26032#23435#20307
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = Label1Click
    end
    object Label2: TLabel
      Left = 48
      Top = 96
      Width = 168
      Height = 16
      Caption = 'MAIL:zhude111@163.com'
    end
  end
  object OKButton: TButton
    Left = 111
    Top = 180
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = OKButtonClick
  end
end
