object Form1: TForm1
  Left = 754
  Top = 269
  Width = 310
  Height = 323
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 60
    Width = 302
    Height = 233
    Align = alBottom
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 128
    Top = 8
    Width = 105
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 4
    Top = 9
    Width = 113
    Height = 40
    Caption = 'Button1'
    TabOrder = 2
    OnClick = Button1Click
  end
  object ComboBox1: TComboBox
    Left = 128
    Top = 32
    Width = 105
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 3
    Text = #26684#24335
    Items.Strings = (
      #26684#24335
      #35828#26126
      #20363#23376
      #27880#24847)
  end
end
