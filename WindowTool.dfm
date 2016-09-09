object Form_WINTOOL: TForm_WINTOOL
  Left = 475
  Top = 190
  Width = 214
  Height = 413
  BorderStyle = bsSizeToolWin
  Caption = #31383#21475#24037#20855
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 206
    Height = 81
    Align = alTop
    TabOrder = 0
    object Button1: TButton
      Left = 8
      Top = 8
      Width = 89
      Height = 25
      Caption = #21015#20986#25152#26377#31383#20307
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #26032#23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object Edit1: TEdit
      Left = 10
      Top = 40
      Width = 183
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
    object Button2: TButton
      Left = 104
      Top = 8
      Width = 89
      Height = 25
      Caption = #31227#21160#36873#20013#21040'0,0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #26032#23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 81
    Width = 206
    Height = 298
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    object ListBox1: TListBox
      Left = 1
      Top = 1
      Width = 204
      Height = 296
      Align = alClient
      ItemHeight = 13
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = ListBox1Click
    end
  end
end
