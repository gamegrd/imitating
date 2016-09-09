object FrmMain: TFrmMain
  Left = 195
  Top = 113
  Width = 831
  Height = 624
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #32534#36753#22120
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  Icon.Data = {
    0000010001001010010000000000680400001600000028000000100000002000
    0000010020000000000000000000000000000000000000000000000000000000
    0000623B30A9663420AC48231596270E06760700004F00000034000000140000
    0005000000000000000000000000000000000000000000000000000000000000
    0000D2B8A1FFDBE1AFFFDECA9DFFD1AF84FFBC8E66F39B6846E171402DC14C23
    16A12B10097D0702014900000003000000000000000000000000000000000000
    0000CDC3B4FFCFFFDAFFC5F6C9FFD7EAB0FFBFE491FFC7EB9DFFDCE3A3FFD8D4
    98FFD8B27CFF472113B20000000D000000000000000000000000000000000000
    0000CCC0AEFFC9F7D0FFD4EDC1FFE2B061FFC99D48FFD1AB56FFDBBC6CFFDBCE
    7AFFD4D67EFF866134DB3B2F1C8E1E180E6C0202014300000005000000000000
    0000CDC0B0FFD1FBDAFFD7DFA3FFD8A250FFBD9141FFBB8E40FFC68D47FFC58D
    43FFCA8A40FFD58A51FFDBA06FFFDDA56CFF644D2FB90000000A000000000000
    0000CDC1B0FFC9FAD2FFE1CE86FFDCA54AFFC7A041FFCA9D45FFCD9B49FFC896
    48FFC28C3FFFC37C48FFCB8D69FFE8A872FF644E2F9300000000000000000000
    0000CCC1B1FFD2F7CFFFE6BF6AFFE2AE4AFFD3AA44FFCFA642FFD6A449FFD5A2
    49FFCD983FFFD08949FFDC9E6AFFDAA368F9251D124D00000000000000000000
    0000CCC3B5FFD1EBB2FFEBBB57FFEDBB52FFDAB442FFDCB043FFE3AF4CFFDBAB
    47FFD5A13EFFDB9449FFF1B270FFB08553D50000001A00000000000000000000
    0000CCC4B7FFE0DF9EFFF0C15EFFEDC45EFFE2BD4BFFE4BA47FFEAB84BFFE7B5
    46FFE1AB3FFFE69D48FFFEC074FF6F54359C0000000200000000000000000000
    0000CCC1B2FFE3D585FFECCC74FFF1CC73FFE2C45DFFE1C155FFECC056FFEEBE
    4FFFE7B440FFF4AC49FFF1B86FFC291F14550000000000000000000000000000
    0000D2B79FFFEDD384FFEDD890FFEED386FFE0CC70FFE4CA6AFFEFC96BFFEBC6
    5FFFE7BC4DFFFEB752FFB98F59DA000000190000000000000000000000000000
    0000DAAB85FFEDDF93FFE7DF9FFFECDC96FFE2D584FFE4D37EFFE7D07BFFE6CE
    71FFEAC664FFFEBB64FF68503398000000000000000000000000000000000000
    0000E0AD8BFFF2E4B8FFFAEEC3FFF4E6B8FFE8E2A1FFE8DC94FFF3DF98FFF6DD
    8FFFF3D27CFFEAA75AFB2C211459000000000000000000000000000000000000
    0000DD998AFF97A1A9FFDFCDBAFF9FB7BBFFDCCBBAFFA0A9A8FFE7CCABFFBDC0
    B6FFF4D5AAFF92876FF106060540000000000000000000000000000000000000
    0000A6887EE763A4B7FF888B92FF689DAAFF8B8991FF6695A7FF968C92FF719C
    ABFFBB9A9CFF4E798DDE00050822000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000807F
    0000800F0000800F79F5800192FF8001AAFF8003A9FF8003A6FF8003AFFF8003
    85FF800754FF800755FF800F61FF800F45FF800F4BFF800F57FFFFFF52FF}
  Menu = mm1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 551
    Width = 823
    Height = 19
    Panels = <>
  end
  object Panel1: TPanel
    Left = 0
    Top = 27
    Width = 823
    Height = 524
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 1
    object Splitter2: TSplitter
      Left = 273
      Top = 1
      Height = 522
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 272
      Height = 522
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object Splitter3: TSplitter
        Left = 0
        Top = 417
        Width = 272
        Height = 2
        Cursor = crVSplit
        Align = alBottom
      end
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 272
        Height = 417
        Align = alClient
        Caption = 'Panel6'
        TabOrder = 0
        object PageControl1: TPageControl
          Left = 1
          Top = 1
          Width = 270
          Height = 415
          ActivePage = TabSheet2
          Align = alClient
          TabOrder = 0
          object TabSheet2: TTabSheet
            Caption = #38190#30424#40736#26631
            ImageIndex = 1
            object GroupBox3: TGroupBox
              Left = 0
              Top = 0
              Width = 262
              Height = 387
              Align = alClient
              TabOrder = 0
              object GroupBox4: TGroupBox
                Left = 8
                Top = 80
                Width = 249
                Height = 57
                TabOrder = 1
                object Label4: TLabel
                  Left = 8
                  Top = 10
                  Width = 59
                  Height = 13
                  Caption = #40736#26631#21160#20316' '
                end
                object Label6: TLabel
                  Left = 104
                  Top = 10
                  Width = 52
                  Height = 13
                  Caption = #25191#34892#27425#25968
                end
                object SpinEdit2: TSpinEdit
                  Left = 104
                  Top = 24
                  Width = 41
                  Height = 22
                  MaxLength = 4
                  MaxValue = 1000
                  MinValue = 1
                  TabOrder = 2
                  Value = 1
                end
                object Button2: TButton
                  Left = 192
                  Top = 22
                  Width = 49
                  Height = 25
                  Caption = #25554' '#20837
                  TabOrder = 0
                  OnClick = Button2Click
                end
                object ComboBox2: TComboBox
                  Left = 8
                  Top = 24
                  Width = 89
                  Height = 21
                  Style = csDropDownList
                  ItemHeight = 13
                  ItemIndex = 0
                  TabOrder = 1
                  Text = #24038#38190#21333#20987
                  OnEnter = ComboBox2Enter
                  Items.Strings = (
                    #24038#38190#21333#20987
                    #21491#38190#21333#20987
                    #20013#38190#21333#20987
                    #24038#38190#21452#20987
                    #24038#38190#25353#19979
                    #24038#38190#25918#24320
                    #21491#38190#25353#19979
                    #21491#38190#25918#24320)
                end
              end
              object GroupBox5: TGroupBox
                Left = 5
                Top = 144
                Width = 249
                Height = 57
                TabOrder = 2
                object Label5: TLabel
                  Left = 8
                  Top = 10
                  Width = 105
                  Height = 13
                  Caption = #40736#26631#31227#21160#21040#22352#26631'  '
                end
                object Button3: TButton
                  Left = 192
                  Top = 25
                  Width = 49
                  Height = 25
                  Caption = #25554' '#20837
                  TabOrder = 0
                  OnClick = Button3Click
                end
                object ComboBox_Mouse: TspSkinColorComboBox
                  Left = 8
                  Top = 29
                  Width = 169
                  Height = 20
                  TabOrder = 1
                  DrawDefault = True
                  SkinDataName = 'combobox'
                  OnMouseEnter = ComboBox_MouseMouseEnter
                  AlphaBlend = False
                  AlphaBlendValue = 200
                  UseSkinCursor = False
                  DefaultFont.Charset = DEFAULT_CHARSET
                  DefaultFont.Color = clWindowText
                  DefaultFont.Height = 14
                  DefaultFont.Name = #23435#20307
                  DefaultFont.Style = []
                  UseSkinFont = True
                  DefaultWidth = 0
                  DefaultHeight = 0
                  UseSkinSize = True
                  HideSelection = True
                  AutoComplete = True
                  ListBoxWidth = 0
                  ListBoxCaptionMode = False
                  ListBoxAlphaBlend = False
                  ListBoxAlphaBlendValue = 200
                  ListBoxAlphaBlendAnimation = False
                  ItemIndex = 0
                  DropDownCount = 8
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = 14
                  Font.Name = #23435#20307
                  Font.Style = []
                  Sorted = False
                  ShowNames = True
                end
              end
              object GroupBox6: TGroupBox
                Left = 5
                Top = 208
                Width = 249
                Height = 57
                TabOrder = 3
                object Label7: TLabel
                  Left = 8
                  Top = 10
                  Width = 85
                  Height = 13
                  Caption = #40736#26631#30456#23545#31227#21160' '
                end
                object Label8: TLabel
                  Left = 8
                  Top = 30
                  Width = 21
                  Height = 13
                  Caption = 'DX:'
                end
                object Label9: TLabel
                  Left = 99
                  Top = 30
                  Width = 21
                  Height = 13
                  Caption = 'DY:'
                end
                object Button4: TButton
                  Left = 192
                  Top = 22
                  Width = 49
                  Height = 25
                  Caption = #25554' '#20837
                  TabOrder = 0
                  OnClick = Button4Click
                end
                object SpinEdit3: TSpinEdit
                  Left = 32
                  Top = 26
                  Width = 60
                  Height = 22
                  MaxLength = 5
                  MaxValue = 9999
                  MinValue = -9999
                  TabOrder = 1
                  Value = 0
                  OnEnter = SpinEdit3Enter
                end
                object SpinEdit4: TSpinEdit
                  Left = 123
                  Top = 26
                  Width = 60
                  Height = 22
                  MaxLength = 5
                  MaxValue = 9999
                  MinValue = -9999
                  TabOrder = 2
                  Value = 0
                end
              end
              object Button7: TButton
                Left = 8
                Top = 280
                Width = 75
                Height = 25
                Caption = #25235#28857
                TabOrder = 4
                OnClick = Button7Click
              end
              object GroupBox2: TGroupBox
                Left = 5
                Top = 8
                Width = 249
                Height = 65
                Caption = #27169#25311#25353#38190
                TabOrder = 0
                object Label1: TLabel
                  Left = 8
                  Top = 18
                  Width = 33
                  Height = 13
                  Caption = #25353#38190' '
                end
                object Label2: TLabel
                  Left = 99
                  Top = 18
                  Width = 33
                  Height = 13
                  Caption = #31867#22411' '
                end
                object Label3: TLabel
                  Left = 146
                  Top = 18
                  Width = 52
                  Height = 13
                  Caption = #25191#34892#27425#25968
                end
                object ComboBox1: TComboBox
                  Left = 99
                  Top = 32
                  Width = 51
                  Height = 21
                  Style = csDropDownList
                  ItemHeight = 13
                  ItemIndex = 0
                  TabOrder = 2
                  Text = #25353#38190
                  OnSelect = ComboBox1Select
                  Items.Strings = (
                    #25353#38190
                    #25353#19979
                    #25918#24320)
                end
                object Edit_Key: TEdit
                  Left = 6
                  Top = 32
                  Width = 91
                  Height = 21
                  ReadOnly = True
                  TabOrder = 1
                  OnClick = Edit_KeyClick
                  OnEnter = Edit_KeyEnter
                  OnExit = Edit_KeyExit
                  OnKeyDown = Edit_KeyKeyDown
                end
                object SpinEdit1: TSpinEdit
                  Left = 150
                  Top = 32
                  Width = 41
                  Height = 22
                  MaxLength = 4
                  MaxValue = 1000
                  MinValue = 1
                  TabOrder = 3
                  Value = 1
                end
                object Button1: TButton
                  Left = 192
                  Top = 30
                  Width = 49
                  Height = 25
                  Caption = #25554' '#20837
                  TabOrder = 0
                  OnClick = Button1Click
                end
              end
            end
          end
          object TabSheet3: TTabSheet
            Caption = #39068#33394#22270#29255
            ImageIndex = 2
            object GroupBox10: TGroupBox
              Left = 6
              Top = 5
              Width = 249
              Height = 105
              Caption = #22270#29255#26597#25214
              TabOrder = 0
              object Label11: TLabel
                Left = 8
                Top = 18
                Width = 40
                Height = 13
                Caption = #36215#22987'X:'
              end
              object Label13: TLabel
                Left = 88
                Top = 18
                Width = 40
                Height = 13
                Caption = #36215#22987'Y:'
              end
              object Label15: TLabel
                Left = 88
                Top = 37
                Width = 40
                Height = 13
                Caption = #32467#26463'Y:'
              end
              object Label16: TLabel
                Left = 8
                Top = 37
                Width = 40
                Height = 13
                Caption = #32467#26463'X:'
              end
              object Label18: TLabel
                Left = 8
                Top = 56
                Width = 33
                Height = 13
                Caption = #36335#24452':'
              end
              object Label17: TLabel
                Left = 168
                Top = 16
                Width = 39
                Height = 13
                Caption = #30456#20284#24230
              end
              object Label29: TLabel
                Left = 8
                Top = 80
                Width = 66
                Height = 13
                Caption = #23384#20837#21464#37327': '
              end
              object Edit2: TEdit
                Left = 51
                Top = 14
                Width = 33
                Height = 21
                TabOrder = 1
                Text = '0'
                OnClick = Edit2Click
              end
              object Edit3: TEdit
                Left = 128
                Top = 14
                Width = 33
                Height = 21
                TabOrder = 2
                Text = '0'
                OnClick = Edit2Click
              end
              object Edit4: TEdit
                Left = 51
                Top = 33
                Width = 33
                Height = 21
                TabOrder = 3
                Text = '1024'
                OnClick = Edit2Click
              end
              object Edit5: TEdit
                Left = 128
                Top = 33
                Width = 33
                Height = 21
                TabOrder = 4
                Text = '768'
                OnClick = Edit2Click
              end
              object Edit7: TEdit
                Left = 211
                Top = 13
                Width = 30
                Height = 21
                TabOrder = 0
                Text = '0.9'
                OnClick = Edit2Click
              end
              object Button8: TButton
                Left = 183
                Top = 76
                Width = 49
                Height = 25
                Caption = #25554' '#20837
                TabOrder = 7
                OnClick = Button8Click
              end
              object Edit6: TEdit
                Left = 51
                Top = 55
                Width = 153
                Height = 21
                TabOrder = 5
                OnClick = Edit2Click
              end
              object Button10: TButton
                Left = 208
                Top = 56
                Width = 23
                Height = 18
                Caption = #8230
                TabOrder = 6
                OnClick = Button10Click
              end
              object Edit13: TEdit
                Left = 67
                Top = 79
                Width = 70
                Height = 21
                TabOrder = 8
                Text = 'x,y'
                OnClick = Edit2Click
              end
            end
            object GroupBox12: TGroupBox
              Left = 5
              Top = 111
              Width = 249
              Height = 137
              Caption = #25214#33394' '#27169#31946#25214#33394
              TabOrder = 1
              object Label21: TLabel
                Left = 8
                Top = 42
                Width = 40
                Height = 13
                Caption = #36215#22987'X:'
              end
              object Label22: TLabel
                Left = 88
                Top = 42
                Width = 40
                Height = 13
                Caption = #36215#22987'Y:'
              end
              object Label23: TLabel
                Left = 88
                Top = 61
                Width = 40
                Height = 13
                Caption = #32467#26463'Y:'
              end
              object Label24: TLabel
                Left = 8
                Top = 61
                Width = 40
                Height = 13
                Caption = #32467#26463'X:'
              end
              object Label26: TLabel
                Left = 168
                Top = 40
                Width = 39
                Height = 13
                Caption = #30456#20284#24230
              end
              object Label25: TLabel
                Left = 128
                Top = 19
                Width = 59
                Height = 13
                Caption = #26597#25214#26041#24335':'
              end
              object Label27: TLabel
                Left = 8
                Top = 19
                Width = 33
                Height = 13
                Caption = #31867#22411':'
              end
              object Label28: TLabel
                Left = 8
                Top = 88
                Width = 52
                Height = 13
                Caption = #30446#26631#39068#33394
              end
              object Label30: TLabel
                Left = 8
                Top = 112
                Width = 66
                Height = 13
                Caption = #23384#20837#21464#37327': '
              end
              object Edit8: TEdit
                Left = 51
                Top = 38
                Width = 33
                Height = 21
                TabOrder = 3
                Text = '0'
                OnClick = ComboBox3Click
              end
              object Edit9: TEdit
                Left = 128
                Top = 38
                Width = 33
                Height = 21
                TabOrder = 4
                Text = '0'
                OnClick = ComboBox3Click
              end
              object Edit10: TEdit
                Left = 51
                Top = 57
                Width = 33
                Height = 21
                TabOrder = 5
                Text = '1024'
                OnClick = ComboBox3Click
              end
              object Edit11: TEdit
                Left = 128
                Top = 57
                Width = 33
                Height = 21
                TabOrder = 6
                Text = '768'
                OnClick = ComboBox3Click
              end
              object Edit12: TEdit
                Left = 211
                Top = 37
                Width = 30
                Height = 21
                TabOrder = 2
                Text = '0.9'
                OnClick = ComboBox3Click
              end
              object Button11: TButton
                Left = 191
                Top = 104
                Width = 49
                Height = 22
                Caption = #25554' '#20837
                TabOrder = 8
                OnClick = Button11Click
              end
              object ComboBox3: TComboBox
                Left = 51
                Top = 15
                Width = 78
                Height = 21
                Style = csDropDownList
                ItemHeight = 13
                ItemIndex = 0
                TabOrder = 0
                Text = #25214#33394
                OnClick = ComboBox3Click
                Items.Strings = (
                  #25214#33394
                  #27169#31946#25214#33394)
              end
              object ComboBox5: TComboBox
                Left = 190
                Top = 15
                Width = 51
                Height = 21
                Style = csDropDownList
                ItemHeight = 13
                ItemIndex = 0
                TabOrder = 1
                Text = #30697#24418
                OnClick = ComboBox3Click
                Items.Strings = (
                  #30697#24418
                  #22278#24418)
              end
              object ComboBox_findcolo: TspSkinColorComboBox
                Left = 63
                Top = 82
                Width = 98
                Height = 20
                TabOrder = 7
                DrawDefault = True
                SkinDataName = 'combobox'
                AlphaBlend = False
                AlphaBlendValue = 200
                UseSkinCursor = False
                DefaultFont.Charset = DEFAULT_CHARSET
                DefaultFont.Color = clWindowText
                DefaultFont.Height = 14
                DefaultFont.Name = #23435#20307
                DefaultFont.Style = []
                UseSkinFont = True
                DefaultWidth = 0
                DefaultHeight = 0
                UseSkinSize = True
                HideSelection = True
                AutoComplete = True
                ListBoxWidth = 0
                ListBoxCaptionMode = False
                ListBoxAlphaBlend = False
                ListBoxAlphaBlendValue = 200
                ListBoxAlphaBlendAnimation = False
                ItemIndex = 0
                DropDownCount = 8
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = 14
                Font.Name = #23435#20307
                Font.Style = []
                Sorted = False
                OnClick = ComboBox3Click
                ShowNames = True
              end
              object Edit14: TEdit
                Left = 67
                Top = 111
                Width = 94
                Height = 21
                TabOrder = 9
                Text = 'x,y'
                OnClick = ComboBox3Click
              end
            end
            object GroupBox11: TGroupBox
              Left = 5
              Top = 248
              Width = 249
              Height = 89
              Caption = #39068#33394#27604#36739
              TabOrder = 2
              object Label19: TLabel
                Left = 8
                Top = 16
                Width = 66
                Height = 13
                Caption = #22914#26524#22352#26631'  '
              end
              object Label20: TLabel
                Left = 200
                Top = 16
                Width = 39
                Height = 13
                Caption = #30340#39068#33394
              end
              object Label31: TLabel
                Left = 8
                Top = 68
                Width = 59
                Height = 13
                Caption = #26368#22823#33394#24046':'
                Visible = False
              end
              object Button9: TButton
                Left = 199
                Top = 33
                Width = 44
                Height = 25
                Caption = #25554' '#20837
                TabOrder = 1
                OnClick = Button9Click
              end
              object ComboBox6: TComboBox
                Left = 8
                Top = 37
                Width = 41
                Height = 21
                ItemHeight = 13
                ItemIndex = 0
                TabOrder = 2
                Text = #65309
                OnChange = ComboBox6Change
                Items.Strings = (
                  #65309
                  #8800
                  #8776)
              end
              object ComboBox_ifPos: TspSkinColorComboBox
                Left = 63
                Top = 11
                Width = 133
                Height = 20
                TabOrder = 0
                DrawDefault = True
                SkinDataName = 'combobox'
                OnMouseEnter = ComboBox_ifPosMouseEnter
                AlphaBlend = False
                AlphaBlendValue = 200
                UseSkinCursor = False
                DefaultFont.Charset = DEFAULT_CHARSET
                DefaultFont.Color = clWindowText
                DefaultFont.Height = 14
                DefaultFont.Name = #23435#20307
                DefaultFont.Style = []
                UseSkinFont = True
                DefaultWidth = 0
                DefaultHeight = 0
                UseSkinSize = True
                HideSelection = True
                AutoComplete = True
                ListBoxWidth = 0
                ListBoxCaptionMode = False
                ListBoxAlphaBlend = False
                ListBoxAlphaBlendValue = 200
                ListBoxAlphaBlendAnimation = False
                ItemIndex = 0
                DropDownCount = 8
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = 14
                Font.Name = #23435#20307
                Font.Style = []
                Sorted = False
                ShowNames = True
              end
              object ComboBox_ifColo: TspSkinColorComboBox
                Left = 63
                Top = 37
                Width = 133
                Height = 20
                TabOrder = 3
                DrawDefault = True
                SkinDataName = 'combobox'
                OnMouseEnter = ComboBox_ifColoMouseEnter
                AlphaBlend = False
                AlphaBlendValue = 200
                UseSkinCursor = False
                DefaultFont.Charset = DEFAULT_CHARSET
                DefaultFont.Color = clWindowText
                DefaultFont.Height = 14
                DefaultFont.Name = #23435#20307
                DefaultFont.Style = []
                UseSkinFont = True
                DefaultWidth = 0
                DefaultHeight = 0
                UseSkinSize = True
                HideSelection = True
                AutoComplete = True
                ListBoxWidth = 0
                ListBoxCaptionMode = False
                ListBoxAlphaBlend = False
                ListBoxAlphaBlendValue = 200
                ListBoxAlphaBlendAnimation = False
                ItemIndex = 0
                DropDownCount = 8
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = 14
                Font.Name = #23435#20307
                Font.Style = []
                Sorted = False
                ShowNames = False
              end
              object SpinEdit6: TSpinEdit
                Left = 71
                Top = 62
                Width = 58
                Height = 22
                MaxValue = 2000
                MinValue = 0
                TabOrder = 4
                Value = 100
                Visible = False
                OnClick = SpinEdit6Click
              end
            end
          end
          object TabSheet4: TTabSheet
            Caption = #20854#23427#21629#20196
            ImageIndex = 3
            object GroupBox7: TGroupBox
              Left = 0
              Top = 0
              Width = 262
              Height = 387
              Align = alClient
              TabOrder = 0
              object GroupBox8: TGroupBox
                Left = 8
                Top = 8
                Width = 249
                Height = 57
                TabOrder = 0
                object Label10: TLabel
                  Left = 8
                  Top = 10
                  Width = 26
                  Height = 13
                  Caption = #24310#26102
                end
                object Label12: TLabel
                  Left = 96
                  Top = 10
                  Width = 26
                  Height = 13
                  Caption = #21333#20301
                end
                object SpinEdit5: TSpinEdit
                  Left = 8
                  Top = 24
                  Width = 81
                  Height = 22
                  MaxLength = 4
                  MaxValue = 1000
                  MinValue = 1
                  TabOrder = 1
                  Value = 1
                  OnEnter = SpinEdit5Enter
                end
                object Button5: TButton
                  Left = 192
                  Top = 22
                  Width = 49
                  Height = 25
                  Caption = #25554' '#20837
                  TabOrder = 0
                  OnClick = Button5Click
                end
                object ComboBox4: TComboBox
                  Left = 88
                  Top = 24
                  Width = 49
                  Height = 21
                  Style = csDropDownList
                  ItemHeight = 13
                  ItemIndex = 0
                  TabOrder = 2
                  Text = #31186
                  Items.Strings = (
                    #31186
                    #27627#31186)
                end
              end
              object GroupBox9: TGroupBox
                Left = 5
                Top = 64
                Width = 249
                Height = 52
                TabOrder = 1
                object Label14: TLabel
                  Left = 8
                  Top = 10
                  Width = 66
                  Height = 13
                  Caption = #36755#20837#25991#26412'  '
                end
                object Button6: TButton
                  Left = 194
                  Top = 21
                  Width = 49
                  Height = 25
                  Caption = #25554' '#20837
                  TabOrder = 0
                  OnClick = Button6Click
                end
                object Edit1: TEdit
                  Left = 8
                  Top = 24
                  Width = 179
                  Height = 21
                  TabOrder = 1
                  OnClick = Edit1Click
                  OnEnter = Edit1Enter
                end
              end
            end
          end
          object TabSheet1: TTabSheet
            Caption = #39640#32423#21629#20196
            ImageIndex = 3
            object TreeView1: TTreeView
              Left = 0
              Top = 0
              Width = 262
              Height = 387
              Align = alClient
              BiDiMode = bdLeftToRight
              Ctl3D = True
              Indent = 19
              ParentBiDiMode = False
              ParentCtl3D = False
              ParentShowHint = False
              ReadOnly = True
              ShowHint = False
              TabOrder = 0
              OnClick = TreeView1Click
              OnDblClick = TreeView1DblClick
              Items.Data = {
                05000000210000000000000000000000FFFFFFFFFFFFFFFF0000000002000000
                08B4B0BFDACFE0B9D8210000000000000000000000FFFFFFFFFFFFFFFF000000
                000000000008B2E9D5D2B4B0BFDA250000000000000000000000FFFFFFFFFFFF
                FFFF00000000000000000CC9E8D6C3B4B0BFDAD7F8B1EA210000000000000000
                000000FFFFFFFFFFFFFFFF000000000000000008B2A5B7C5C9F9D2F421000000
                0000000000000000FFFFFFFFFFFFFFFF000000000000000008CFB5CDB3BCC7CA
                B1210000000000000000000000FFFFFFFFFFFFFFFF000000000000000008C6F4
                B6AFB3CCD0F2210000000000000000000000FFFFFFFFFFFFFFFF000000000000
                000008CDA3D6B9BDC5B1BE}
            end
          end
        end
      end
      object Panel8: TPanel
        Left = 0
        Top = 419
        Width = 272
        Height = 103
        Align = alBottom
        Caption = 'Panel8'
        TabOrder = 1
        object Memo_help: TMemo
          Left = 1
          Top = 1
          Width = 270
          Height = 101
          Align = alClient
          Color = clNone
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
    end
    object Panel3: TPanel
      Left = 276
      Top = 1
      Width = 546
      Height = 522
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Splitter1: TSplitter
        Left = 0
        Top = 417
        Width = 546
        Height = 2
        Cursor = crVSplit
        Align = alBottom
      end
      object Panel5: TPanel
        Left = 264
        Top = 104
        Width = 356
        Height = 410
        BevelOuter = bvNone
        TabOrder = 1
      end
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 546
        Height = 417
        Align = alClient
        Caption = 'Panel7'
        TabOrder = 0
        object SynEditor1: TSynEditor
          Left = 1
          Top = 1
          Width = 544
          Height = 415
          Align = alClient
          Color = clWhite
          CodeFolding.CaseSensitive = False
          CodeFolding.FolderBarLinesColor = 12562872
          ActiveLine.Background = 11927551
          ActiveLine.Foreground = clNavy
          ActiveLine.Indicator.Glyph.Data = {
            0A020000424D0A0200000000000036000000280000000B0000000D0000000100
            180000000000D4010000C40E0000C40E00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00
            FFFF00FFFF00FFFF00FF840000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
            0000FF00FFFF00FFFF00FFFF00FF840000840000FF00FFFF00FFFF00FFFF00FF
            FF00FF000000FF00FFFF00FFFF00FFFF00FF840000FF0000840000FF00FFFF00
            FFFF00FFFF00FF000000FF00FF840000840000840000840000FF0000FF000084
            0000FF00FFFF00FFFF00FF000000FF00FF840000FF0000FF0000FF0000FF0000
            FF0000FF0000840000FF00FFFF00FF000000FF00FF840000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000840000FF00FF000000FF00FF840000848200FF
            FF00848200FFFF00FF0000FF0000840000FF00FFFF00FF000000FF00FF840000
            840000840000840000848200FFFF00840000FF00FFFF00FFFF00FF000000FF00
            FFFF00FFFF00FFFF00FF840000FFFF00840000FF00FFFF00FFFF00FFFF00FF00
            0000FF00FFFF00FFFF00FFFF00FF840000840000FF00FFFF00FFFF00FFFF00FF
            FF00FF000000FF00FFFF00FFFF00FFFF00FF840000FF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FF000000}
          ActiveLine.Indicator.MaskColor = clFuchsia
          ActiveLine.Visible = True
          LineDivider.Visible = True
          LineDivider.Color = clRed
          LineDivider.Style = psSolid
          RightEdge.MouseMove = False
          RightEdge.Visible = True
          RightEdge.Position = 80
          RightEdge.Color = clSilver
          RightEdge.Style = psSolid
          LineSpacing = 8
          LineSpacingRule = lsSpecified
          Background.Visible = False
          Background.RepeatMode = brmNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #26032#23435#20307
          Font.Pitch = fpFixed
          Font.Style = []
          TabOrder = 0
          OnClick = SynEditor1Click
          BookMarkOptions.BookmarkImages = il1
          BookMarkOptions.GlyphsVisible = False
          Gutter.ShowLineModified = False
          Gutter.LineModifiedColor = clYellow
          Gutter.LineNormalColor = clLime
          Gutter.AutoSize = True
          Gutter.DigitCount = 3
          Gutter.Font.Charset = ANSI_CHARSET
          Gutter.Font.Color = clWindowText
          Gutter.Font.Height = -11
          Gutter.Font.Name = #23435#20307
          Gutter.Font.Style = []
          Gutter.LeftOffset = 12
          Gutter.LeftOffsetColor = clNone
          Gutter.RightOffsetColor = clNone
          Gutter.ShowLineNumbers = True
          Gutter.UseFontStyle = False
          Gutter.Width = 42
          Gutter.GradientSteps = 2
          WordWrap.Enabled = False
          WordWrap.Position = 80
          WordWrap.Style = wwsClientWidth
          OnChange = SynEditor1Change
          DocumentState = smsNormal
          DocumentFormat = sffDos
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 419
        Width = 546
        Height = 103
        Align = alBottom
        Caption = 'Panel4'
        TabOrder = 2
        object Memo_debug: TRichEdit
          Left = 1
          Top = 1
          Width = 544
          Height = 101
          Align = alClient
          Color = clNone
          Font.Charset = GB2312_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 823
    Height = 27
    ButtonHeight = 25
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Flat = True
    Images = ImageList1
    TabOrder = 0
    object ToolButton5: TToolButton
      Left = 0
      Top = 0
      Caption = #20445#23384'(&S)'
      Enabled = False
      ImageIndex = 10
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton5Click
    end
    object ToolButton6: TToolButton
      Left = 25
      Top = 0
      Width = 14
      Caption = 'ToolButton6'
      ImageIndex = 14
      Style = tbsDivider
    end
    object ToolButton8: TToolButton
      Left = 39
      Top = 0
      Action = aSynUndo1
      ImageIndex = 20
    end
    object toolcx: TToolButton
      Left = 64
      Top = 0
      Action = aSynRedo1
      ImageIndex = 12
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton7: TToolButton
      Left = 89
      Top = 0
      Width = 16
      Caption = 'ToolButton7'
      ImageIndex = 14
      Style = tbsDivider
    end
    object toolcut: TToolButton
      Left = 105
      Top = 0
      Action = aSynCut1
      ImageIndex = 5
      ParentShowHint = False
      ShowHint = True
    end
    object toolcopy: TToolButton
      Left = 130
      Top = 0
      Action = aSynCopy1
      ImageIndex = 3
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton9: TToolButton
      Left = 155
      Top = 0
      Action = aSynPaste1
      ImageIndex = 13
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton11: TToolButton
      Left = 180
      Top = 0
      Width = 10
      Caption = 'ToolButton11'
      ImageIndex = 14
      Style = tbsDivider
    end
    object ToolButton12: TToolButton
      Left = 190
      Top = 0
      Action = aSynFind1
      ImageIndex = 6
    end
    object ToolButton13: TToolButton
      Left = 215
      Top = 0
      Width = 17
      Caption = 'ToolButton13'
      ImageIndex = 7
      Style = tbsDivider
    end
    object ToolButton14: TToolButton
      Left = 232
      Top = 0
      Action = aSynOptionsSetting1
      ImageIndex = 22
    end
    object ToolButton15: TToolButton
      Left = 257
      Top = 0
      Width = 17
      Caption = 'ToolButton15'
      ImageIndex = 23
      Style = tbsDivider
    end
    object ToolButton16: TToolButton
      Left = 274
      Top = 0
      Hint = #35821#27861#26816#26597
      Caption = 'ToolButton16'
      ImageIndex = 23
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton16Click
    end
    object ToolButton17: TToolButton
      Left = 299
      Top = 0
      Hint = #20572#27490#33050#26412
      Caption = 'ToolButton17'
      Enabled = False
      ImageIndex = 25
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton17Click
    end
  end
  object mm1: TMainMenu
    Left = 464
    Top = 40
    object N1: TMenuItem
      Caption = #25991#20214'(&F)'
      object S1: TMenuItem
        Caption = #20445#23384'(&S)'
        ShortCut = 16467
        OnClick = ToolButton5Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Q1: TMenuItem
        Caption = #36864#20986'(&Q)'
        OnClick = Q1Click
      end
    end
    object x1: TMenuItem
      Caption = #32534#36753'(&E)'
      object U1: TMenuItem
        Action = aSynUndo1
      end
      object R1: TMenuItem
        Action = aSynRedo1
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object X2: TMenuItem
        Action = aSynCut1
      end
      object N32: TMenuItem
        Action = aSynAppendCut1
      end
      object C1: TMenuItem
        Action = aSynCopy1
      end
      object N33: TMenuItem
        Action = aSynAppendCopy1
      end
      object P1: TMenuItem
        Action = aSynPaste1
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object D1: TMenuItem
        Action = aSynDeleteNextchar1
      end
      object t1: TMenuItem
        Caption = #21024#38500#34892
        object N10: TMenuItem
          Action = aSynDeleteLine1
        end
        object N11: TMenuItem
          Action = aSynDeleteLineToEnd1
        end
        object N12: TMenuItem
          Action = aSynDeleteLineToStart1
        end
      end
      object N17: TMenuItem
        Caption = #21024#38500#35789
        object N14: TMenuItem
          Action = aSynDeleteWord1
        end
        object N15: TMenuItem
          Action = aSynDeleteWordToEnd1
        end
        object N16: TMenuItem
          Action = aSynDeleteWordToStart1
        end
      end
      object aSynClearAll11: TMenuItem
        Action = aSynClearAll1
      end
      object N13: TMenuItem
        Caption = '-'
      end
      object N18: TMenuItem
        Caption = #36873#25321#34892
        object N19: TMenuItem
          Action = aSynSelectLine1
        end
        object N20: TMenuItem
          Action = aSynSelectNextLine1
        end
        object N21: TMenuItem
          Action = aSynSelectLastLine1
        end
      end
      object N22: TMenuItem
        Caption = #36873#25321#35789
        object N23: TMenuItem
          Action = aSynSelectWrod1
        end
        object N24: TMenuItem
          Action = aSynSelectNextWord1
        end
        object N25: TMenuItem
          Action = aSynSelectLastWord1
        end
      end
      object N28: TMenuItem
        Caption = #36873#25321#27169#24335
        object N29: TMenuItem
          Action = aSynNormalSelect1
        end
        object N30: TMenuItem
          Action = aSynColumnSelect1
        end
        object N31: TMenuItem
          Action = aSynLineSelect1
        end
      end
      object N26: TMenuItem
        Caption = '-'
      end
      object N27: TMenuItem
        Action = aSynReadOnly1
      end
    end
    object N34: TMenuItem
      Caption = #25628#32034'(&S)'
      object F1: TMenuItem
        Action = aSynFind1
      end
      object N35: TMenuItem
        Action = aSynFindNext1
      end
      object N36: TMenuItem
        Action = aSynFindLast1
      end
      object N37: TMenuItem
        Action = aSynFindNextWord1
      end
      object N38: TMenuItem
        Action = aSynFindLastWord1
      end
      object N39: TMenuItem
        Caption = '-'
      end
      object N40: TMenuItem
        Action = aSynReplace1
      end
      object aSynReplaceNext11: TMenuItem
        Action = aSynReplaceNext1
      end
      object aSynReplaceLast11: TMenuItem
        Action = aSynReplaceLast1
      end
    end
    object O2: TMenuItem
      Caption = #36873#39033'(&O)'
      object E1: TMenuItem
        Action = aSynOptionsSetting1
      end
    end
    object N6: TMenuItem
      Caption = #25235#28857#24037#20855
      object N7: TMenuItem
        Caption = #25235#28857
        OnClick = Button7Click
      end
    end
    object N57: TMenuItem
      Caption = #20854#23427#24037#20855
      object N58: TMenuItem
        Caption = #31383#21475#24037#20855
        OnClick = N58Click
      end
    end
    object N2: TMenuItem
      Caption = #24110#21161
      object N5: TMenuItem
        Caption = #24110#21161
      end
      object N4: TMenuItem
        Caption = #20851#20110
        OnClick = N4Click
      end
    end
  end
  object actlst1: TActionList
    Left = 504
    Top = 40
    object aSynReadOnly1: TaSynReadOnly
      Category = 'SynEdit'
      Caption = #21482#35835
    end
    object aSynNormalSelect1: TaSynNormalSelect
      Category = 'SynEdit'
      Caption = #27491#24120#36873#25321#27169#24335
    end
    object aSynColumnSelect1: TaSynColumnSelect
      Category = 'SynEdit'
      Caption = #21015#36873#25321#27169#24335
    end
    object aSynLineSelect1: TaSynLineSelect
      Category = 'SynEdit'
      Caption = #34892#36873#25321#27169#24335
    end
    object aSynUndo1: TaSynUndo
      Category = 'SynEdit'
      Caption = #25746#28040'(&U)'
      ShortCut = 16474
    end
    object aSynRedo1: TaSynRedo
      Category = 'SynEdit'
      Caption = #37325#20570'(&R)'
      ShortCut = 16473
    end
    object aSynCut1: TaSynCut
      Category = 'SynEdit'
      Caption = #21098#20999'(&X)'
    end
    object aSynAppendCut1: TaSynAppendCut
      Category = 'SynEdit'
      Caption = #21098#20999#24182#38468#21152
    end
    object aSynCopy1: TaSynCopy
      Category = 'SynEdit'
      Caption = #22797#21046'(&C)'
    end
    object aSynAppendCopy1: TaSynAppendCopy
      Category = 'SynEdit'
      Caption = #22797#21046#24182#38468#21152
    end
    object aSynPaste1: TaSynPaste
      Category = 'SynEdit'
      Caption = #31896#36148'(&P)'
    end
    object aSynDeleteNextchar1: TaSynDeleteNextchar
      Category = 'SynEdit'
      Caption = #21024#38500'(&D)'
      ShortCut = 46
    end
    object aSynDeleteLastChar1: TaSynDeleteLastChar
      Category = 'SynEdit'
      Caption = 'aSynDeleteLastChar1'
    end
    object aSynDeleteWordToEnd1: TaSynDeleteWordToEnd
      Category = 'SynEdit'
      Caption = #21024#38500#33267#35789#23614
    end
    object aSynDeleteWordToStart1: TaSynDeleteWordToStart
      Category = 'SynEdit'
      Caption = #21024#38500#33267#35789#39318
    end
    object aSynDeleteWord1: TaSynDeleteWord
      Category = 'SynEdit'
      Caption = #21024#38500#20809#26631#22788#35789
    end
    object aSynDeleteLineToEnd1: TaSynDeleteLineToEnd
      Category = 'SynEdit'
      Caption = #21024#38500#33267#34892#23614
    end
    object aSynDeleteLineToStart1: TaSynDeleteLineToStart
      Category = 'SynEdit'
      Caption = #21024#38500#33267#34892#39318
    end
    object aSynDeleteLine1: TaSynDeleteLine
      Category = 'SynEdit'
      Caption = #21024#38500#20809#26631#22788#34892
    end
    object aSynClearAll1: TaSynClearAll
      Category = 'SynEdit'
      Caption = #28165#38500#20840#37096
    end
    object aSynSelectAll1: TaSynSelectAll
      Category = 'SynEdit'
      Caption = #20840#37096#36873#25321'(&A)'
    end
    object aSynSelectLine1: TaSynSelectLine
      Category = 'SynEdit'
      Caption = #36873#25321#24403#21069#34892
    end
    object aSynSelectNextLine1: TaSynSelectNextLine
      Category = 'SynEdit'
      Caption = #36873#25321#19979#19968#34892
    end
    object aSynSelectLastLine1: TaSynSelectLastLine
      Category = 'SynEdit'
      Caption = #36873#25321#19978#19968#34892
    end
    object aSynSelectWrod1: TaSynSelectWrod
      Category = 'SynEdit'
      Caption = #36873#25321#24403#21069#35789
    end
    object aSynSelectNextWord1: TaSynSelectNextWord
      Category = 'SynEdit'
      Caption = #36873#25321#19979#19968#35789
      ShortCut = 40999
    end
    object aSynSelectLastWord1: TaSynSelectLastWord
      Category = 'SynEdit'
      Caption = #36873#25321#19978#19968#35789
      ShortCut = 40997
    end
    object aSynGotoBookmark1: TaSynGotoBookmark
      Category = 'SynEdit'
      Caption = #20070#31614'0'
      ShortCut = 16432
      Bookmark = 0
    end
    object aSynSetBookmark1: TaSynSetBookmark
      Category = 'SynEdit'
      Caption = #20070#31614'0'
      ShortCut = 24624
      Bookmark = 0
    end
    object aSynClearBookmark1: TaSynClearBookmark
      Category = 'SynEdit'
      Caption = #28165#38500#25152#26377#20070#31614
      Bookmark = -1
    end
    object aSynGotoLastChange1: TaSynGotoLastChange
      Category = 'SynEdit'
      Caption = #36339#36716#21040#19978#27425#20462#25913#22788
      ShortCut = 49223
    end
    object aSynMatchBracket1: TaSynMatchBracket
      Category = 'SynEdit'
      Caption = #21305#37197#36339#36716
    end
    object aSynCommentBlock1: TaSynCommentBlock
      Category = 'SynEdit'
      Caption = #27880#37322#22359
    end
    object aSynFind1: TaSynFind
      Category = 'SynEdit'
      Caption = #26597#25214'(&F)...'
      ShortCut = 16454
    end
    object aSynFindNext1: TaSynFindNext
      Category = 'SynEdit'
      Caption = #26597#25214#19979#19968#20010
      ShortCut = 16462
    end
    object aSynFindLast1: TaSynFindLast
      Category = 'SynEdit'
      Caption = #26597#25214#19978#19968#20010
    end
    object aSynFindNextWord1: TaSynFindNextWord
      Category = 'SynEdit'
      Caption = #26597#25214#19979#19968#20010#21333#35789
    end
    object aSynFindLastWord1: TaSynFindLastWord
      Category = 'SynEdit'
      Caption = #26597#25214#19978#19968#20010#21333#35789
    end
    object aSynReplace1: TaSynReplace
      Category = 'SynEdit'
      Caption = #26367#25442'(&R)...'
      ShortCut = 16466
    end
    object aSynReplaceNext1: TaSynReplaceNext
      Category = 'SynEdit'
      Caption = #26367#25442#19979#19968#20010
    end
    object aSynReplaceLast1: TaSynReplaceLast
      Category = 'SynEdit'
      Caption = #26367#25442#19978#19968#20010
    end
    object aSynUpperCase1: TaSynUpperCase
      Category = 'SynEdit'
      Caption = 'aSynUpperCase1'
    end
    object aSynLowerCase1: TaSynLowerCase
      Category = 'SynEdit'
      Caption = 'aSynLowerCase1'
    end
    object aSynToggleCase1: TaSynToggleCase
      Category = 'SynEdit'
      Caption = 'aSynToggleCase1'
    end
    object aSynTitleCase1: TaSynTitleCase
      Category = 'SynEdit'
      Caption = 'aSynTitleCase1'
    end
    object aSynBlockIndent1: TaSynBlockIndent
      Category = 'SynEdit'
      Caption = 'aSynBlockIndent1'
    end
    object aSynBlockUnindent1: TaSynBlockUnindent
      Category = 'SynEdit'
      Caption = 'aSynBlockUnindent1'
    end
    object aSynInsertLine1: TaSynInsertLine
      Category = 'SynEdit'
      Caption = 'aSynInsertLine1'
    end
    object aSynLineBreak1: TaSynLineBreak
      Category = 'SynEdit'
      Caption = 'aSynLineBreak1'
    end
    object aSynFileFormatDos1: TaSynFileFormatDos
      Category = 'SynEdit'
      Caption = 'aSynFileFormatDos1'
    end
    object aSynFileFormatMac1: TaSynFileFormatMac
      Category = 'SynEdit'
      Caption = 'aSynFileFormatMac1'
    end
    object aSynFileFormatUnix1: TaSynFileFormatUnix
      Category = 'SynEdit'
      Caption = 'aSynFileFormatUnix1'
    end
    object aSynPrint1: TaSynPrint
      Category = 'SynEdit'
      Caption = #25171#21360'(&P)...'
      ShortCut = 16464
    end
    object aSynQuickPrint1: TaSynQuickPrint
      Category = 'SynEdit'
      Caption = #24555#36895#25171#21360
    end
    object aSynExporter1: TaSynExporter
      Category = 'SynEdit'
      Caption = #23548#20986#21040'RTF...'
    end
    object aSynExporter2: TaSynExporter
      Category = 'SynEdit'
      Caption = #23548#20986#21040'HTML...'
    end
    object aSynExporter3: TaSynExporter
      Category = 'SynEdit'
      Caption = #23548#20986#21040'TEX...'
    end
    object aSynSave1: TaSynSave
      Category = 'SynEdit'
      Caption = #20445#23384'(&S)'
      ShortCut = 16467
      SaveDialogOptions = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    end
    object aSynSaveAs1: TaSynSaveAs
      Category = 'SynEdit'
      Caption = #21478#23384#20026'(&A)...'
      SaveDialogOptions = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    end
    object aSynSaveSel1: TaSynSaveSel
      Category = 'SynEdit'
      Caption = #20445#23384#36873#25321#21306#22495'...'
      SaveDialogOptions = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    end
    object aSynNew1: TaSynNew
      Category = 'SynEdit'
      Caption = #26032#24314'(&N)'
      ShortCut = 16462
      DocumentName = #26032#24314#33050#26412
      OnCreateEditor = CreateEditor
    end
    object aSynGotoBookmark2: TaSynGotoBookmark
      Category = 'SynEdit'
      Caption = #20070#31614'1'
      ShortCut = 16433
      Bookmark = 1
    end
    object aSynSetBookmark2: TaSynSetBookmark
      Category = 'SynEdit'
      Caption = #20070#31614'1'
      ShortCut = 24625
      Bookmark = 1
    end
    object aSynGotoBookmark3: TaSynGotoBookmark
      Category = 'SynEdit'
      Caption = #20070#31614'2'
      ShortCut = 16434
      Bookmark = 2
    end
    object aSynSetBookmark3: TaSynSetBookmark
      Category = 'SynEdit'
      Caption = #20070#31614'2'
      ShortCut = 24626
      Bookmark = 2
    end
    object aSynGotoBookmark4: TaSynGotoBookmark
      Category = 'SynEdit'
      Caption = #20070#31614'3'
      ShortCut = 16435
      Bookmark = 3
    end
    object aSynGotoBookmark5: TaSynGotoBookmark
      Category = 'SynEdit'
      Caption = #20070#31614'4'
      ShortCut = 16436
      Bookmark = 4
    end
    object aSynSetBookmark5: TaSynSetBookmark
      Category = 'SynEdit'
      Caption = #20070#31614'4'
      ShortCut = 24628
      Bookmark = 4
    end
    object aSynGotoBookmark6: TaSynGotoBookmark
      Category = 'SynEdit'
      Caption = #20070#31614'5'
      ShortCut = 16437
      Bookmark = 5
    end
    object aSynSetBookmark6: TaSynSetBookmark
      Category = 'SynEdit'
      Caption = #20070#31614'5'
      ShortCut = 24629
      Bookmark = 5
    end
    object aSynGotoBookmark7: TaSynGotoBookmark
      Category = 'SynEdit'
      Caption = #20070#31614'6'
      ShortCut = 16438
      Bookmark = 6
    end
    object aSynSetBookmark7: TaSynSetBookmark
      Category = 'SynEdit'
      Caption = #20070#31614'6'
      ShortCut = 24630
      Bookmark = 6
    end
    object aSynGotoBookmark8: TaSynGotoBookmark
      Category = 'SynEdit'
      Caption = #20070#31614'7'
      ShortCut = 16439
      Bookmark = 7
    end
    object aSynSetBookmark8: TaSynSetBookmark
      Category = 'SynEdit'
      Caption = #20070#31614'7'
      ShortCut = 24631
      Bookmark = 7
    end
    object aSynGotoBookmark9: TaSynGotoBookmark
      Category = 'SynEdit'
      Caption = #20070#31614'8'
      ShortCut = 16440
      Bookmark = 8
    end
    object aSynSetBookmark9: TaSynSetBookmark
      Category = 'SynEdit'
      Caption = #20070#31614'8'
      ShortCut = 24632
      Bookmark = 8
    end
    object aSynGotoBookmark10: TaSynGotoBookmark
      Category = 'SynEdit'
      Caption = #20070#31614'9'
      ShortCut = 16441
      Bookmark = 9
    end
    object aSynSetBookmark10: TaSynSetBookmark
      Category = 'SynEdit'
      Caption = #20070#31614'9'
      ShortCut = 24633
      Bookmark = 9
    end
    object aSynSetBookmark4: TaSynSetBookmark
      Category = 'SynEdit'
      Caption = #20070#31614'3'
      ShortCut = 24627
      Bookmark = 3
    end
    object aSynOpen1: TaSynOpen
      Category = 'SynEdit'
      Caption = #25171#24320'(&O)...'
      ShortCut = 16463
      OpenDialogOptions = [ofHideReadOnly, ofEnableSizing]
      OnCreateEditor = CreateEditor
    end
    object aSynInsertFile1: TaSynInsertFile
      Category = 'SynEdit'
      Caption = #25554#20837#25991#26723#21040#20809#26631#22788'...'
      OpenDialogTitle = #25554#20837#25991#26723#21040'%s'
    end
    object aSynPageSetup1: TaSynPageSetup
      Category = 'SynEdit'
      Caption = #39029#38754#35774#32622
    end
    object aSynPreview1: TaSynPreview
      Category = 'SynEdit'
      Caption = #25171#21360#39044#35272
    end
    object aSynClose1: TaSynClose
      Category = 'SynEdit'
      Caption = #20851#38381#25991#26723'...'
      SaveDialogOptions = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    end
    object aSynJump1: TaSynJump
      Category = 'SynEdit'
      Caption = #36339#36716'(&G)...'
      ShortCut = 16455
    end
    object aSynOptionsSetting1: TaSynOptionsSetting
      Category = 'SynEdit'
      Caption = #32534#36753#22120#36873#39033'(&E)...'
    end
    object aSynToggleHighlighter1: TaSynToggleHighlighter
      Category = 'SynEdit'
      Caption = #20999#25442#39640#20142#35821#27861'(&H)...'
      ShortCut = 16468
    end
  end
  object il1: TImageList
    Left = 355
    Top = 40
  end
  object SynEditSource1: TSynEditSource
    Mask = [smCodeFolding, smActiveLine, smBlockWidth, smBookMarkOptions, smBorderStyle, smColor, smFont, smGutter, smHideSelection, smHighlighter, smInsertCaret, smInsertMode, smKeystrokes, smLines, smLineDivider, smLineSpacing, smLineSpacingRule, smMaxScrollWidth, smMaxUndo, smOptions, smOverwriteCaret, smPopupMenu, smReadOnly, smRightEdge, smSelectedColor, smSelectionMode, smScrollBars, smTabWidth, smWantTabs, smWordWrap]
    CodeFolding.CaseSensitive = False
    CodeFolding.FolderBarLinesColor = 12562872
    ActiveLine.Background = clYellow
    ActiveLine.Foreground = clNavy
    ActiveLine.Visible = True
    BlockWidth = 2
    Background.Visible = False
    Background.RepeatMode = brmNone
    BorderStyle = bsSingle
    Color = clWindow
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #26032#23435#20307
    Font.Style = []
    Gutter.ShowLineModified = False
    Gutter.LineModifiedColor = clYellow
    Gutter.LineNormalColor = clLime
    Gutter.Font.Charset = DEFAULT_CHARSET
    Gutter.Font.Color = clWindowText
    Gutter.Font.Height = -11
    Gutter.Font.Name = 'Courier New'
    Gutter.Font.Style = []
    Gutter.LeftOffsetColor = clNone
    Gutter.RightOffsetColor = clNone
    Gutter.ShowLineNumbers = True
    HideSelection = False
    InsertCaret = ctVerticalLine
    InsertMode = True
    Keystrokes = <
      item
        Command = ecUp
        ShortCut = 38
      end
      item
        Command = ecSelUp
        ShortCut = 8230
      end
      item
        Command = ecScrollUp
        ShortCut = 16422
      end
      item
        Command = ecDown
        ShortCut = 40
      end
      item
        Command = ecSelDown
        ShortCut = 8232
      end
      item
        Command = ecScrollDown
        ShortCut = 16424
      end
      item
        Command = ecLeft
        ShortCut = 37
      end
      item
        Command = ecSelLeft
        ShortCut = 8229
      end
      item
        Command = ecWordLeft
        ShortCut = 16421
      end
      item
        Command = ecSelWordLeft
        ShortCut = 24613
      end
      item
        Command = ecRight
        ShortCut = 39
      end
      item
        Command = ecSelRight
        ShortCut = 8231
      end
      item
        Command = ecWordRight
        ShortCut = 16423
      end
      item
        Command = ecSelWordRight
        ShortCut = 24615
      end
      item
        Command = ecPageDown
        ShortCut = 34
      end
      item
        Command = ecSelPageDown
        ShortCut = 8226
      end
      item
        Command = ecPageBottom
        ShortCut = 16418
      end
      item
        Command = ecSelPageBottom
        ShortCut = 24610
      end
      item
        Command = ecPageUp
        ShortCut = 33
      end
      item
        Command = ecSelPageUp
        ShortCut = 8225
      end
      item
        Command = ecPageTop
        ShortCut = 16417
      end
      item
        Command = ecSelPageTop
        ShortCut = 24609
      end
      item
        Command = ecLineStart
        ShortCut = 36
      end
      item
        Command = ecSelLineStart
        ShortCut = 8228
      end
      item
        Command = ecEditorTop
        ShortCut = 16420
      end
      item
        Command = ecSelEditorTop
        ShortCut = 24612
      end
      item
        Command = ecLineEnd
        ShortCut = 35
      end
      item
        Command = ecSelLineEnd
        ShortCut = 8227
      end
      item
        Command = ecEditorBottom
        ShortCut = 16419
      end
      item
        Command = ecSelEditorBottom
        ShortCut = 24611
      end
      item
        Command = ecToggleMode
        ShortCut = 45
      end
      item
        Command = ecCopy
        ShortCut = 16429
      end
      item
        Command = ecCut
        ShortCut = 8238
      end
      item
        Command = ecPaste
        ShortCut = 8237
      end
      item
        Command = ecDeleteChar
        ShortCut = 46
      end
      item
        Command = ecDeleteLastChar
        ShortCut = 8
      end
      item
        Command = ecDeleteLastChar
        ShortCut = 8200
      end
      item
        Command = ecDeleteLastWord
        ShortCut = 16392
      end
      item
        Command = ecUndo
        ShortCut = 32776
      end
      item
        Command = ecRedo
        ShortCut = 40968
      end
      item
        Command = ecLineBreak
        ShortCut = 13
      end
      item
        Command = ecLineBreak
        ShortCut = 8205
      end
      item
        Command = ecTab
        ShortCut = 9
      end
      item
        Command = ecShiftTab
        ShortCut = 8201
      end
      item
        Command = ecContextHelp
        ShortCut = 112
      end
      item
        Command = ecSelectAll
        ShortCut = 16449
      end
      item
        Command = ecCopy
        ShortCut = 16451
      end
      item
        Command = ecPaste
        ShortCut = 16470
      end
      item
        Command = ecCut
        ShortCut = 16472
      end
      item
        Command = ecBlockIndent
        ShortCut = 24649
      end
      item
        Command = ecBlockUnindent
        ShortCut = 24661
      end
      item
        Command = ecLineBreak
        ShortCut = 16461
      end
      item
        Command = ecInsertLine
        ShortCut = 16462
      end
      item
        Command = ecDeleteWord
        ShortCut = 16468
      end
      item
        Command = ecDeleteLine
        ShortCut = 16473
      end
      item
        Command = ecDeleteEOL
        ShortCut = 24665
      end
      item
        Command = ecUndo
        ShortCut = 16474
      end
      item
        Command = ecRedo
        ShortCut = 24666
      end
      item
        Command = ecGotoMarker0
        ShortCut = 16432
      end
      item
        Command = ecGotoMarker1
        ShortCut = 16433
      end
      item
        Command = ecGotoMarker2
        ShortCut = 16434
      end
      item
        Command = ecGotoMarker3
        ShortCut = 16435
      end
      item
        Command = ecGotoMarker4
        ShortCut = 16436
      end
      item
        Command = ecGotoMarker5
        ShortCut = 16437
      end
      item
        Command = ecGotoMarker6
        ShortCut = 16438
      end
      item
        Command = ecGotoMarker7
        ShortCut = 16439
      end
      item
        Command = ecGotoMarker8
        ShortCut = 16440
      end
      item
        Command = ecGotoMarker9
        ShortCut = 16441
      end
      item
        Command = ecSetMarker0
        ShortCut = 24624
      end
      item
        Command = ecSetMarker1
        ShortCut = 24625
      end
      item
        Command = ecSetMarker2
        ShortCut = 24626
      end
      item
        Command = ecSetMarker3
        ShortCut = 24627
      end
      item
        Command = ecSetMarker4
        ShortCut = 24628
      end
      item
        Command = ecSetMarker5
        ShortCut = 24629
      end
      item
        Command = ecSetMarker6
        ShortCut = 24630
      end
      item
        Command = ecSetMarker7
        ShortCut = 24631
      end
      item
        Command = ecSetMarker8
        ShortCut = 24632
      end
      item
        Command = ecSetMarker9
        ShortCut = 24633
      end
      item
        Command = ecNormalSelect
        ShortCut = 24654
      end
      item
        Command = ecColumnSelect
        ShortCut = 24643
      end
      item
        Command = ecLineSelect
        ShortCut = 24652
      end
      item
        Command = ecMatchBracket
        ShortCut = 24642
      end>
    LineDivider.Visible = True
    LineDivider.Color = clRed
    LineDivider.Style = psSolid
    LineSpacing = 8
    LineSpacingRule = lsDouble
    MaxScrollWidth = 1024
    MaxUndo = 32767
    Options = [eoAltSetsColumnMode, eoAutoIndent, eoDragDropEditing, eoDropFiles, eoGroupUndo, eoKeepCaretX, eoScrollPastEol, eoSmartTabs, eoTabsToSpaces, eoTrimTrailingSpaces]
    OverwriteCaret = ctBlock
    ReadOnly = False
    RightEdge.MouseMove = False
    RightEdge.Visible = False
    RightEdge.Position = 80
    RightEdge.Color = clSilver
    RightEdge.Style = psSolid
    SelectionMode = smNormal
    TabWidth = 8
    WantTabs = True
    WordWrap.Enabled = False
    WordWrap.Position = 80
    WordWrap.Style = wwsClientWidth
    Left = 544
    Top = 40
  end
  object ImageList1: TImageList
    Left = 424
    Top = 40
    Bitmap = {
      494C01011A001D00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000008000000001002000000000000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063393100633121004A21
      1000210800000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6BDA500DEE7AD00DECE
      9C00D6AD8400BD8C63009C6B4200734229004A21100029100800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CEC6B500CEFFDE00C6F7
      CE00D6EFB500BDE79400C6EF9C00DEE7A500DED69C00DEB57B00422110000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CEC6AD00CEF7D600D6EF
      C600E7B56300CE9C4A00D6AD5200DEBD6B00DECE7B00D6D67B00846331003929
      1800181808000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CEC6B500D6FFDE00D6DE
      A500DEA55200BD944200BD8C4200C68C4200C68C4200CE8C4200D68C5200DEA5
      6B00DEA56B00634A290000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CEC6B500CEFFD600E7CE
      8400DEA54A00C6A54200CE9C4200CE9C4A00CE944A00C68C3900C67B4A00CE8C
      6B00EFAD7300634A290000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CEC6B500D6F7CE00E7BD
      6B00E7AD4A00D6AD4200CEA54200D6A54A00D6A54A00CE9C3900D68C4A00DE9C
      6B00DEA56B002118100000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CEC6B500D6EFB500EFBD
      5200EFBD5200DEB54200DEB54200E7AD4A00DEAD4200D6A53900DE944A00F7B5
      7300B58452000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CEC6B500E7DE9C00F7C6
      5A00EFC65A00E7BD4A00E7BD4200EFBD4A00E7B54200E7AD3900E79C4A00FFC6
      73006B5231000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CEC6B500E7D68400EFCE
      7300F7CE7300E7C65A00E7C65200EFC65200EFBD4A00E7B54200F7AD4A00F7BD
      6B00291810000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6B59C00EFD68400EFDE
      9400EFD68400E7CE7300E7CE6B00EFCE6B00EFC65A00E7BD4A00FFB55200BD8C
      5A00000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DEAD8400EFDE9400E7DE
      9C00EFDE9400E7D68400E7D67B00E7D67B00E7CE7300EFC66300FFBD63006B52
      3100000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7AD8C00F7E7BD00FFEF
      C600F7E7BD00EFE7A500EFDE9400F7DE9C00F7DE8C00F7D67B00EFA55A002921
      1000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DE9C8C0094A5AD00DECE
      BD009CB5BD00DECEBD00A5ADAD00E7CEAD00BDC6B500F7D6AD0094846B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A58C7B0063A5B5008C8C
      94006B9CAD008C8C94006394A500948C9400739CAD00BD9C9C004A7B8C000000
      0800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004A4A4A004A4A4A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007B000000DE000000BD29004A4A4A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007B000000DE000000DE000000BD29004A4A4A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000009CADAD00000000000000
      00009CADAD0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007B000000DE000000DE000000DE000000BD29004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000009CADAD000000000000000000FFFF
      00009CADAD00FFFFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000007B000000DE000000FF080000DE000000DE000000BD29004A4A4A000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000008400000084000000000000000000000000000000000000000000
      0000000000000000000084000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00009CADAD000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000007B000000FF290000DE000000FF080000DE000000DE000000BD29004A4A
      4A00000000000000000000000000000000000000000000000000000000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000084000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF0000000000000000
      00009CADAD000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000000000000000
      00000000000000FFFF0000000000000000000000000000000000000000000000
      0000007B000052FF000000FF290000DE000000FF080000DE000000DE000000BD
      29004A4A4A000000000000000000000000000000000000000000000000008400
      0000840000000000000084000000000000000000000000000000000000000000
      0000000000000000000084000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000009CADAD00FFFF0000FFFF00000000
      00009CADAD00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF0000000000FFFFFF0000FFFF00000000000000000000000000000000000000
      0000007B000052FFAD0000FF080000FF290000DE000000FF080000DE000000DE
      0000007B00000000000000000000000000000000000000000000000000008400
      0000000000000000000000000000840000008400000000000000000000000000
      0000000000008400000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000009CADAD00000000000000
      00009CADAD000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF00FFFFFF0000FFFF00000000000000
      00000000000000FFFF00FFFFFF00000000000000000000000000000000000000
      0000007B000052FFAD0000FF080000FF080000FF290000DE000052FFAD00007B
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      0000007B0000ADFF290000FF080000FF080000FF080000FF2900007B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00000000000000000000000000FFFFFF0000FFFF00FFFFFF000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000007B0000ADFF290000FF080000FF0800ADFF2900007B0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF000000000084008400000000000000000000000000000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      0000007B0000ADFFAD0000FF0800ADFF2900007B000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000000000000000000000000000FF00FF000000000000FF
      FF00FFFFFF0000FFFF0000000000000000000000000000000000000000000000
      0000007B0000ADFFAD00ADFFAD00007B00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000FFFF00FFFFFF00000000000000000000000000FFFF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000007B0000ADFFAD00007B0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000007B000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000084840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000084840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000084840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000084840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000084840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF00008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF000084840000000000000000000000000000FFFF0000FFFF000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF00008484000000000000000000000000000000000000FFFF000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000848400000000000000000000FFFF0000FFFF000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400008484008484
      8400008484008484840084000000FFFFFF008400000084000000840000008400
      00008400000084000000FFFFFF00840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400848484000084
      8400848484000084840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400008484008484
      8400008484008484840084000000FFFFFF00840000008400000084000000FFFF
      FF00840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008400
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000000000000000000000000000000848400848484000084
      8400848484000084840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084000000FFFFFF0084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000008400000000000000000000000000000084848400008484008484
      8400008484008484840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000008400000000000000000000000000000000848400848484000084
      8400848484000084840084000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000840000000000
      0000840000008400000000000000000000000000000084848400008484008484
      8400008484008484840000848400848484000084840084848400008484008484
      840000848400000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008400
      0000000000000000000000000000000000008400000084000000000000000000
      0000000000008400000000000000000000000000000000848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400008484000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400848484000084
      84000000000000FFFF00000000000000000000FFFF0000000000848484000084
      8400848484000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00000000000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF0000FFFF000000
      0000008484000084840000848400008484000084840000848400008484000084
      8400008484000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000084840000848400008484000084840000848400008484000084
      8400008484000084840000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000000000000000000084000000000000000000000084000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000000000000000000084000000000000008400000000000000000000008400
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000000000000000000084000000000000008400000000000000000000008400
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000084000000000000008400000000000000000000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000000000008400000084000000840000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000000000008400000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000008400000084000000840000008400
      0000840000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000FFFFFF000000000000000000000000000000
      000000000000FFFFFF0084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084000000FFFFFF000000000000000000000000000000
      000000000000FFFFFF0084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084000000FFFFFF000000000000000000FFFFFF008400
      0000840000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF008400
      0000FFFFFF008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000084000000840000008400000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000800000000100010000000000000400000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000807FFFFF00000000800FFFFF00000000
      800FFFFF000000008001FFFF000000008001F00F000000008003F00F00000000
      8003F00F000000008003F00F000000008003F00F000000008007F00F00000000
      8007F00F00000000800FF00F00000000800FFFFF00000000800FFFFF00000000
      800FFFFF00000000FFFFFFFF00000000FFFF8006FFFFF9FFFFFF800411FFF0FF
      FFFF8000BBFFF07FFFFB8031820FF03FE0FB8060D403F01FE1FD80F5C541F00F
      E3FD80B5EE29F007E5FD8011ED40F007EE7B8033F028F00FFF878007E014F01F
      FFFF8007E508F03FFFFF8007E0B4F07FFFFF802FE501F0FFFFFF801FF0A3F1FF
      FFFF803FF807FBFFFFFFFFFFFE1FFFFFFFFFFFFFFFFFFFFFFFFFFE7FFFFFFFFF
      FFFFFC3FFFFFFFFFFFFFFC3FFFFFFFFFFFFFFE7FE07FE01F1039FC3FF8FFF18F
      38D6FC3FF8FFF18FBAD7FC3FFC7FF18F8237FC1FFC7FF01FD6D6F20FFE3FF18F
      D438E107FE3FF18FC7FFE187FF1FF18FEFFFE007FE0FE01FFFFFF00FFFFFFFFF
      FFFFF81FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFC00C007FFFF
      FFFF8000BFEBE00FFFFF00000005FFFFFFFF00007E31F83FE7FF00007E35F11F
      CF8300010006F39FDFC300037FEAF39FDFE300038014F39FDFD30003C00AF39F
      CF3B0003E001F39FE0FF0FC3E007F39FFFFF0003F007E10FFFFF8007F003FFFF
      FFFFF87FF803FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC001FFFF
      C007001F8031FFFFC007000F8031F003C00700078031FFFFC007000380010003
      C00700018001FFFFC00700008001F003C007001F8FF1FFFFC007001F8FF10003
      C007001F8FF1FFFFC0078FF18FF1F003C00FFFF98FF1FFFFC01FFF758FF50003
      C03FFF8F8001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3FFFFFFFFFF
      FFFFED9F07C1FFFFC00FED6F07C18003FFFFED6F07C1FFFF0003F16F0101803F
      FFFFFD1F0001FFFFC00FFC7F02018003FFFFFEFF0201FFFF0003FC7F8003803F
      FFFFFD7FC107FFFFC00FF93FC1078003FFFFFBBFE38FFFFF0003FBBFE38F803F
      FFFFFBBFE38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFEFFDFFFFFC010003C7FFC00FFC01FFFFC3FBFFFFFC010003E3F700030001
      FFFFF1E7FFFF00010003F8CFC00F0001FFFFFC1FFFFF00010003FE3F00030003
      FFFFFC1FFFFF00070003F8CFC00F000FFFFFE1E7FFFF00FF0003C3F3000301FF
      FFFFC7FDFFFF03FFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object OpenDialog1: TOpenDialog
    Filter = 'BMP'#25991#20214'|*.BMP'
    Left = 321
    Top = 39
  end
  object SkinData1: TSkinData
    Active = True
    DisableTag = 99
    SkinControls = [xcMainMenu, xcPopupMenu, xcToolbar, xcControlbar, xcCombo, xcCheckBox, xcRadioButton, xcProgress, xcEdit, xcButton, xcBitBtn, xcSpeedButton, xcPanel, xcGroupBox, xcStatusBar, xcTab, xcSystemMenu]
    Skin3rd.Strings = (
      'TTBDock=Panel'
      'TTBToolbar=Panel'
      'TImageEnMView=scrollbar'
      'TImageEnView=scrollbar'
      'TRzButton=button'
      'TRzCheckGroup=CheckGroup'
      'TRzRadioGroup=Radiogroup'
      'TRzRadioButton=Radiobutton'
      'TRzCheckBox=Checkbox'
      'TRzButtonEdit=Edit'
      'TRzDBRadioGroup=Radiogroup'
      'TRzDBRadioButton=Radiobutton'
      'TRzDBCheckBox=Checkbox'
      'TDBCheckboxEh=Checkbox'
      'TDBCheckboxEh=Checkbox'
      'TLMDCHECKBOX=Checkbox'
      'TLMDDBCHECKBOX=Checkbox'
      'TLMDRadiobutton=Radiobutton'
      'TLMDGROUPBOX=Panel'
      'TLMDSIMPLEPANEL=Panel'
      'TLMDDBCalendar=Panel'
      'TLMDButtonPanel=Panel'
      'TLMDLMDCalculator=Panel'
      'TLMDHeaderPanel=Panel'
      'TLMDTechnicalLine=Panel'
      'TLMDLMDClock=Panel'
      'TLMDTrackbar=trackbar'
      'TLMDListCombobox=combobox'
      'TLMDCheckListCombobox=combobox'
      'TLMDHeaderListCombobox=combobox'
      'TLMDImageCombobox=combobox'
      'TLMDColorCombobox=combobox'
      'TLMDFontCombobox=combobox'
      'TLMDFontSizeCombobox=combobox'
      'TLMDFontSizeCombobox=combobox'
      'TLMDPrinterCombobox=combobox'
      'TLMDDriveCombobox=combobox'
      'TLMDCalculatorComboBox=combobox'
      'TLMDTrackBarComboBox=combobox'
      'TLMDCalendarComboBox=combobox'
      'TLMDRADIOGROUP=radiogroup'
      'TLMDCheckGroup=CheckGroup'
      'TLMDDBRADIOGROUP=radiogroup'
      'TLMDDBCheckGroup=CheckGroup'
      'TLMDEDIT=Edit'
      'TLMDMASKEDIT=Edit'
      'TLMDBROWSEEDIT=Edit'
      'TLMDEXTSPINEDIT=Edit'
      'TLMDCALENDAREDIT=Edit'
      'TLMDFILEOPENEDIT=Edit'
      'TLMDFILESAVEEDIT=Edit'
      'TLMDCOLOREDIT=Edit'
      'TLMDDBEDIT=Edit'
      'TLMDDBMASKEDIT=Edit'
      'TLMDDBEXTSPINEDIT=Edit'
      'TLMDDBSPINEDIT=Edit'
      'TLMDDBEDITDBLookup=Edit'
      'TLMDEDITDBLookup=Edit'
      'TDBLookupCombobox=Combobox'
      'TWWDBCombobox=Combobox'
      'TWWDBLookupCombo=Combobox'
      'TWWDBCombobox=Combobox'
      'TWWKeyCombo=Combobox'
      'TWWTempKeyCombo=combobox'
      'TWWDBDateTimePicker=Combobox'
      'TWWRADIOGROUP=radiogroup'
      'TDXDBPICKEDIT=Combobox'
      'TDXDBCALCEDIT=Combobox'
      'TDXDBIMAGEEDIT=Combobox'
      'TDXDBPOPUPEDIT=Combobox'
      'TDXDBEXTLOOKUPEDIT=Combobox'
      'TDXDBLOOKUPEDIT=Combobox'
      'TDXDBDATEEDIT=Combobox'
      'TDXDATEEDIT=Combobox'
      'TDXPICKEDIT=Combobox'
      'TDXPOPUPEDIT=Combobox'
      'TDXDBCURRENCYEDIT=Edit'
      'TDXDBEDIT=Edit'
      'TDXDBMASKEDIT=Edit'
      'TDXDBHYPERLINKEDIT=Edit'
      'TDXEDIT=Edit'
      'TDXMASKEDIT=Edit'
      'TWWDBEDIT=Edit'
      'TDXBUTTONEDIT=Edit'
      'TDXCURRENCYEDIT=Edit'
      'TDXHYPERLINKEDIT=Edit'
      'TOVCPICTUREFIELD=Edit'
      'TOVCDBPICTUREFIELD=Edit'
      'TOVCSLIDEREDIT=Edit'
      'TOVCDBSLIDEREDIT=Edit'
      'TOVCSIMPLEFIELD=Edit'
      'TOVCDBSIMPLEFIELD=Edit'
      'TO32DBFLEXEDIT=Edit'
      'TOVCNUMERICFIELD=Edit'
      'TOVCDBNUMERICFIELD=Edit')
    SkinStore = '(Good)'
    SkinFormtype = sfOnlyThisForm
    MenuUpdate = True
    Left = 389
    Top = 40
    SkinStream = {
      BA2A00001C890300D676B19862F8EC180477DD3B8663007EEFC00FC7D7F2FF7B
      7F36C01FBFE6EAE6C6BB3396930954AFB09B3A6E042B7136D29CC84ECFEBF3FA
      59C294687EADEC446D97BFEF6325E1CD5C81574514C4E3AFA5EA5204B30DA1CA
      F84F32D437E5AC18D0ABE8EDCEAAF7FD4DA51866513275C8B0A7E3E5567126A1
      B4C9A825041AB957184D8CD986F20EDC4B0B78567C6C9E2880D0154527990B9B
      1C60521B35D4F10B235AAE0E4256E5A56A219B25F00E48FDFC0EB30D321802FE
      4A1AFAE7753A82D322DF502CC4529EF169A0B1C6561241132C25964C8B81F421
      37A66E95006154E79480764E8E43B23FA85E04A2337F0BE071211D85121ED983
      46935BC8255956AE37FE0EE98F1F23D0E5000EDC4FDF7787771FAF8B087789BA
      C0628481D97C7FE80B36FE15A64311EF8BDF17C8FAC0B90BEF39546CCE5DC8CD
      74D5891799887C8C190E01885DF5EF2EB901951C3EF37E5ED17E1BFBB039A330
      0743447BC2B01BA64DD007FF603EC8CF20A407374C06F58362B05C85243FEE00
      29600B200740006C0029AA00B000D800E200190022175ED3BDE014E02A805500
      8B602D147EA02DC05C009AA3DC02900A802A00A8A3E802A00B002CA8FC80B402
      D00B602DA8FD809404C02651EC02801400A4052A3E4052029014A8F901480A40
      5202B51F602B01580B147E00B005802C01628FC01600B005AA3F405A02202402
      EED47E90800800800801C900320020020030077200EB787A1B01301301301618
      04AA906C52C04C04C04C051402553BB81EA37CDF21C76D5280B74115C1680D60
      0120236BE00471C40D18FB5D2136F1C336FCF0EEE1208995C17F6DF706C2C0B6
      667AAB81D4C02A620E8AB86AB911E3840C10FB0C4D611C236F922D1985BC8E8A
      A87C153C3FACF3C402090139699CCE0E7C0A5609089C16C8743423C6876E8A22
      C543C0E09B7E910386920AB95633696405640D017BB5405A41AE01062C474E20
      70C13580BA26DA1C81F9072AF8DCF77D8D80B01B90533A11A2103C41088A5D13
      6E6840FC07447B143B110110110110131011D5C90010010077E1945EBEDE8920
      487680FC2D08ED9003E42203EA3F4EA098EA2F87C801001001000D17AF44D009
      009809809809809809B9B600600600971817D8FE9F5441D04FCD7CFAFE842705
      1475191E5606F32583D83D83D83D83D83D83D83E03E03E03E03E03E03E03E03E
      03F03E1607F909260F0611056808981FF5F962907FAF8B1983FD7A58EF4BBF7C
      2C7785C0BA581FA5DACD69ACD7887F0F5E29BC0FC0FC0FC0FC0FC0FC0FC0FC0F
      C0FC0FC0FC0FC0FC0FC0FC0FC0FAA01EBD963C03D8B2CF207F6CA5AB2F2C0F3B
      65FF01FDB29E565FDB356ECCBC5965F671F2CC81D97F6CEDF6CC80B35B3D995D
      9AD01D01D17F71ADBCFA1F3AC89818013600441BC00E4006F8A42BCA3C3DC4DE
      01626F13780589BC4DE01626F13780589BC4DE01626F1378050B26C1B8035401
      EEFFDDFF007BBFED2F80B937C9BE02E4DF26F80B937C9BE02E4DF26F80B937C9
      BE40726F80BDDFAD5DFE2BCECB598F6D61E6BC5BDDDB510DA1F4FB6AF849F81F
      017017016405CFBE02E02E7DF010020FB0040083EC010020FB0040083EC01002
      0FB0040083EC200010020FB0040083EC010020FB0040083EC010020FB0040083
      EC010020FB0040080127DA024049F68090127DA024049F68090127DA024049F6
      8090127DC028051F710100A0147DC028051F700A0147DC028051F700A0147DC0
      28051F700A0147DC0280500A3EE014028FB80500A3EE014028FB80500A3EE014
      028FB80500A3EE014028FB88080500A3EE014028FB80500A3EE014028FB80500
      A3EE014028FB80500A3EE014028051F700A0147DC028051F700A0147DC028051
      F700A0147DC028051F700A0147DC404028051F700A0147DC028051F700A0147D
      C028051F700B0167DE02C059F780B01602CFBC0580B3EF01602CFBC0580B3EF0
      1602CFBC0580B3EF01602CFBC0580B3EF20301602CFBC0580B3EF01602CFBC05
      80B3EF01602CFBC0580B3EF01602CFBC0580B0167DE02C059F780B0167DE02C0
      59F780B0167DE02C059F780B0167DE02C059F790180B0167DE02C059F780B016
      7DE02C059F780B0167DE02C059F780B012F07D8281A4BDBDB0002880EA9103CE
      A8DEEDC882C2AE376C2E76580F8600577A872405C01803004AC01145D07C0180
      30010C00C2482F1A6600C018017000E08600C009D821A358030033D1A691E32D
      444EA20541600C01802B8009853D95C4465408E9B39C01800FEC7E348E74C018
      0300276007291F8218030037C10D1AC01800251A9FA478B4250300600C00D800
      A948EE23A83600C01801B0018A2ED291F55180300598811548FC10C01801CA08
      68D600C00D68D748F803002E748EBBBF2CD07E00C01802BC01D23E00C01D23F0
      4300600E91F00600C01D23E00C01D23F48F80300748F80300600E91C0000148E
      4680000148E0000046D48E00000A470000000148E00000820A47000005238000
      0000A4700000523A91C0000148E0000000291C000008D291C0000148E0000000
      291C0000148E82000000A470000000148E00000A4752380000291C0000000523
      80000291C8D00000291C000000052380000291C000000052380000208291C000
      0148E46C0000148E00000A4752380000291C00000005238000011A5238000029
      1C000000052380000291D48E00000A470000000148E0000046D48E00000A4700
      00000148E00000A4723400000A470000000148E00000A4752380000291C00000
      0052380000291C8D80000291C0000148EA4700000523A0800000291C000008D2
      91C0000148EA470000052380000000A470000052380000000A4700000236A470
      000052380000000A470000041052380000291C000000052380000291D48E0000
      0A470000000148E00000A4723600000A470000000148E00000A4741000000523
      80000000A4700000523A91C0000148E0000000291C0000148E4680000148E000
      0046D48E00000A470000000148E00000820A470000052380000000A470000052
      3A91C0000148E0000000291C000008D291C0000390D2380000001FA009D25291
      C0000148E82000000A47000002359BD2380000001FE8026A2FD5A8FB00000001
      8600291C0000148E000000060C1023400001FF46AE6A3D17000003CF2DFFDA8F
      0080200B1A0252380000635D479BE800007E60811A00000A846AE6A3C0200802
      9796F9EA3CA8000002E8354291C0000000800053D4780401005D70408D004015
      DA3489E00001BDE5BE7A92000000029001F351E0000000788027A8F371000000
      000000000E04519917BFD57E0272A603C7D00FB72807C16803F2DBC75C2FF95E
      0FE429744D89DCE4988800290A7E0A7E79B570A069AB9BAE29D850E004FC29A7
      0737F66FC67A005C4E7E814D09CC473200E273F58A6B955C77BDD13DFB230BC4
      8057339FC853539EF1C5DE8654868039C73FA8A72E39EAD9473D80E7A82C73FE
      8E79D04073F9CE79F03473F339F69C324750E7DE70D21D439F99B7DCEA1CFDD6
      1F83A873EE2F0E4750E7E382DC8EA1CF26291CFD2148E754BAA5FC97BCC02ED3
      9FCC2984E7E900781CF122987D3FA30041910F7052C9BF645345D79D68C0290A
      6314B6CAD88852DB2B6CADB2B6CADB2B6CADB2AB3559A39F4697FD638E78C53A
      3B62B021CF01A5D40039E139E282639C738E71CE39C738E71CE39F68E7955223
      9FACA3C7A0D1CEA9754BB6CADB2B6CADB2B6CADB2B62214D8ED96ADF6F76D969
      C50DB2FB59C3F369BFDC003C7005179DD6E9014629DAAC9562F9FA54DB700572
      9273C79F643BC0424C4989312624C4989312624C4989312624F7E66FB004A25F
      B006C4262789777C67463203B87F959B3C7587E6C017B3F529C0005980192885
      2D3A52DF71FC9FD686000E9A5D14BD694B8A001A40014A2940014A000A514A21
      C52800294528A514A000A5000528A5000528002945288714A000A514A2945280
      02940014A2940014A000A514A21C52800294528A514A000A5000528A50005280
      02945288714A000A514A294528002940014A2940014A000A514A21C528002945
      28A514A000A5000528A5000528002945288714A000A514A294528002940014A2
      940014A000A514A21C52800294528A514A000A5000528A500052800294528871
      4A000A514A294528002940014A2940014A000A514A21C52800294528A514B004
      A580252CA580252C0129652C8794B004A594B29652C012960094B2960094B004
      A594B21E52C0129652CA594B004A580252CA580252C0129652C8794B004A594B
      29652C012960094B2960094B004A594B21E52C0129652CA594B004A580252CA5
      80252C0129652C8794B004A594B29652C012960094AE214B003200252890A580
      2008018C005D165329426C00A6901B192032CC905A0A903BB42DE421735AA0F8
      C005C321D6C7002DC009289194E0B5B8019800FC53E32BD481CA794F004A7802
      53CA794F29E0094F004A794F29E53C0129E0094F29E0094F004A794F29E53C01
      29E0094F29E53CA780253C0129E53CA794F004A780253CA780253C0129E53CA7
      94F004A780253CA794F29E0094F004A794F29E53C0129E0094F29E0094F004A7
      94F29E53C0129E0094F29E53CA780253C0129E53CA794F004A7801094F003A00
      0021F003B80021A9320A11099894172621D48015D20365240E249EE738D6905B
      FCEF65217649507CD0038DD8FD738020080040012EE282C010022A0B1F401005
      0580200A0B004000D41574EF9127F08CB8900401002E0024FF0277C510942CC0
      5014040009A20A2420080200030050580200A0B004000C20A573BE5140100400
      B53F064EF8383D22EC9B36D1C05014047E77D9C679EE4A1D004008D0023C8CD0
      580200A0B00400F282E77E008033BF01404FF277C6A845B2B51C3A4510CE8420
      24269F16646682C0541682C05013D20B9DF80200CEFC05010839DF927012E0FC
      7791993901505A0B01404CB4173BF004019DF80A02CEFC0501646682C0541682
      C0501677E008033BF53D014059DF80A02C8CC0501505A0B01505CEFC0100677E
      0280B3BF014057A74160280A82C0501677E008033BF9DF80A02CEFC050164660
      280A82D0580A82E77E008033BF014059DFBD380AF4E82C050150580A02CEFC01
      00677F3BF014059DF80A02C8CC0501505A0B01505CEFC0100677E0280B3BF7A7
      015E9E4660280A82C0501677E008033BF9DF80A02CEFC050164660280A82D058
      0A82E77E008033BF014059DF6CF4E028099D013BC8CC0501505A0B01404DD417
      3BF004019DF80A020793BF00400BC0009C8CC0100505A0B004007082E77E0080
      33BF0140443677E008000C001EF42AD16E4660080282D0580200794151277E00
      802004D4B1F9DF80A028092023F3BF00401003563E60080200A0B00400F882AC
      CDFC010040058BC99DF8020080282C010050580200A0B004010036414C6623F5
      C57F32C002BA406E3480D80480C3D2406786046617394A1F2C00077B4003191C
      D775B88051BC6F1BC6F1BC6F1BC6F1BC6F1BB50DC2EAD001BA55C45801A5515C
      256C9B51988E6D4CA43E58D4ACE515EC45C3C2F7F12B6A249F8BE2F9FF17C5F3
      FE67C5F3FE4FC5F3FE4FC5F3FE4FC5F17CFF8BE2F9FF33E2F9FF27E2F9FF27E2
      F9FF27E2F8BE7FC5F17CFF99F17CFF93F17CFF93F17CFF93EE82F69557B41D72
      F0D412480C2892F0D56121F060D513BE24C068BE1AB12180018BA001C0407B10
      50A6802440E48ED78480040591DC771DC771DC771DC771DC771DC771DC771D97
      C76EDE8DDC58D91FE0CAA91353514ED8955495187C9003E45234050140501270
      BE74598012266B0BE67C9F3E27D72C670271EAEA004986E117A4A20A0C70022E
      67B18042800802D492F06DEC1807A013925EB18BC54BC223E00074BCE04FA8A2
      7C05A5D104EFB8FC19173D05D2FA5F4BDEF25ED9B644016804FBFE85D7460181
      139B370979217D2F6A27DDD37E425834909451064BC28BC525E34D835A5E5A4F
      A0602014DFB44B0F944BA979D0BCFA5E6D51854BDB09F5AD0424DFAD4B0D289E
      69784179A978BB960C978F49F6A92F75737E0E960C00164BCDC2F6897B06224C
      D2F4193E1337EA4C8E804CE978917B7955EBB27CE90172FFC47F11E2EE5FCF27
      2E97D2FA5E0825E5F9BFF13FC4FF13C17D9F520424006F85EBA17CCF93F01405
      01404B02671653B4E80BF9ABB22C109CD09FCD4E1461F37F355BC01004010040
      100396003CDFCB898FA008020080200802008013800928020080160013FE0080
      0D17AA6FDC1802008016800A5FF1F401004FF802006B3FD5D816D90040100072
      998937F3FE0080199FEA9BF9FF0040050D6EFE008027FC01004FF80200CDFC01
      0066FE0080200BBF802009FF004013FE0080337F004019BF80200802EFE00802
      7FC01004FF80200CDFC010066FE0080200BBF802009FF004013FE0080337F004
      019BF80200802EFE008027FC01004FF80200CDFC010066FE0080200BBF802009
      FF004013FE0080337F004019BF80200802EFE008027FC01004FF80200CDFC010
      066FE0080200BBF802009FF004013FE0080337F004019BF80200802EFE008027
      FC01004FF80200CDFC010066FE0080200BBF802009FF004013FE0080337F0040
      19BF80200802EFE008027FC01004FF80200CDFC010066FE0080200BBF802009F
      F004013FE0080337F004019BF80200802EFE008027FC01004FF80200CDFC0100
      66FE0080200BBF802009FF004013FE0080337F004019BF80200802EFE008027F
      C01004FF80200CDFC010066FE0080200BBF802009FF0040034FF80200800A004
      FF80200345E5CDFC01004015FF004013FE00800B074032BCF789138016940308
      0A778A03B60A806644064E17419287CD001A489A80A0280A026900934C67DBC5
      80160024C8F266D0E0280A02769A18C8F0FE000268725991336870140501041A
      19F24A7183C419BFDC4CF77F00943B06D0E4CB2266D0D9500A687CF004B4B432
      974A1C6EB723E0085343933686DB0026AA5D0025A5A1D74DA1DA1C0501405015
      A1DA1C99B4380A0280A02AE9B43B4380A0280A02B43B4393368701405014055D
      36876870140501405687687266D0E0280A0280ABA6D0ED0E0280A0280AD0ED0E
      4CDA1C050140501574DA1DA1C0501405015A1DA1C99B4380A0280A02AE9B43B4
      3B4380A0280AD0EBA64CDA1C050140501574DA1C99B4380A0280AD0EBA6D0ED0
      E0280A0280AD0ED0E4CDA1C05014056875D368768701405014040C686060216D
      0E4CDA1C0501404B73431C00319098792CF499B4380A02808C530F0014009325
      89918DFD9CE73E0A6AAB690182240EE028C0E6440A5C17736626EAE00801522E
      631E2E74564A0432DCD3149210C8FF140B4010032E0049AA153AD34B376A8EE8
      0A027A0129279D7014EB9D7014EB9D7014EB92F014EB80A029D7014053AE0280
      A75C053AE75C053AE75C053AE75C053AE0280A75C05014EB80A029D7014EB9D7
      014EB9D7014EB9D7014EB92F014EB80A029D7014053AE0280A75C053AE75C053
      AE75C053AE75C053AE0280A75C05014EB80A029D7014EB9D7014EB9D7014EB9D
      7014EB92F014EB80A026A1D7004003000DD5AF00400E40007D786039CA04BA28
      062AA08A50FC6332140B431879422461F3C6AB5004010040100400F6801CB7D0
      5C2A4FA2F8BC48BE00802007432638DD901405014040A02585F22969A9FC3C80
      117C5F004CC8BD0C5F9EF8BE2F102F4E0045F178917E5AE0280A02D278AA4F20
      EFE2F48B3E0017067BE004A844A331118BD11000289FCF7C5F17C5F17C5EF42F
      CB5C0501405A4F73D0FBD7BF9A4F3E93DB913EF4D27AD99E7CD09117E93DC8FF
      104FBA19E1CBFF2BE0DB59B3FCA44FBD4CF9FEF143F33DEC5F96B80A0280B49E
      1D49EEC778502F98CFA523DC78417A5EA7DA727DAC753E74CF426F0299EA2293
      293CF1FE7E93DC727C62D279D33C757F8698F3CBFD0CDF8493F17CFF9FE102FC
      B5C0501405A4F0CA4F00B105CA50120A4F5A1785A4F23DE080125278833D2CDF
      B819E2693CD1FEE549EEC7F9BA4F10679C2FF7798F36BFC04AF8C6BFC7937E7C
      67CFF9FF33F49F0140501693F49EA0104211CA4F385EF349EA27CC693C699E0A
      6FDC1986A93D38BCCD27B83F0D5279E33F31F98FCC7C5F3FE7FE93E0280A0280
      B49E0DC7AA3F9B527AC1799A4F2C9F46A4F4267959BF38CF7FA4F1761E9293CF
      3FC0D279833CA2FF2858E9323331E5C5E9A63CF27C14C79F33CCBBF4549E0DDF
      A5A4F06BBF77CCFCB5C0501405A4FD27E93F49FA4FD27E93F49F98FCC7E63F4F
      FB0FD879833F2D70140501693FE77FCEFF9DFF3BFE77FCEFF9DFF0BFE17FC2F8
      BE7FCFFF9DF0140501405A4F565FEAA93CBB8F6B49EF6B8F69A93CC19E3E93DA
      BBF3B49E4CFF5349ED8FF4149ED0CFCC7E63F31F17CFF9FFA4F80A0280A02D27
      B75FE5800D693CB0BDB6A7CB727CB549EA0CF6F49E6C60DA93DB9FE7753ED193
      E8EA4F5067B52FF4531EE57FA395F6A27E2F9FF3FC9C5F96B80A0280B49E6F49
      E55E932001C17B14D7F9FA2B0213EFE001533CE2B9A0BCBD27B40137A4F647F9
      A27C119EE0BFCDCC7B45F805D07B63FCCE4F9499F3FDDF3FE6787CCFCB5C0501
      405A4F29A4F8BC8D2791001993E1DD0FB0EA4F6C000027F2BF17C5F17C5F179E
      17E5AE0280A02D27BB4F7BE8022F8BE00999179117BF0C8E92F8BE2F3C2FCF7C
      5F17E93E0280A02D27A668FE00802008020080200802002200CF7C5F17E93E02
      80A02D27B1D27BDB50A89419F0035200626801AA3400D72400CCC6247C2E9C93
      0FC00250016D9E00740018FE97B858F26E4DC0526E4DC0526E4DC0526E4DC052
      6E4DC0526C009BFA58E7CBADA080832F8D6861FAD37EAA197BF936BF572980F9
      A3573BD5FAFF9AB58B22F8BE2F8BE2F8BE2F8BE2F8BE2F8BE2F8BE2F8BE2F8BE
      2F8BE2F8BE2F8BE2F8BE2F8BE2F8BE2F8BE2F8BE2F8BE2F8BE2F8BE2F8BE2F8B
      E2F8BE2F8BE2F8BE2F8BE2F8BE2F8BE2F8BE2F8BE2F8BE2F8BE2F8BE2F8BE2F8
      BE2F8BE2F8BE2F8BE2F8BE2F8BE2F8BE2F8BE2F8BE2F8BE2F8BE2F8BE2F8BE2F
      345EFAE0858303600069580C5560751EB03B7EB019E8C85805DB3341F8020080
      2005AFF80200801FC00B48DCF003E000C4223202992D4D55B4765B61E8AB001E
      0005956902D064B21E6AB5355A246FD7ECFD11A86729FA011A91C8A1C8A6891C
      8A726A9A9181DC747068046523914D52391548E91D23A4723691D23A4723691D
      23A4748E45523A4748E91C8A3383B210093E0EE4538C1DC8A7491C01D01F406C
      DA03801D803BB953E32CC9786AAF95EBE33C01004003001F2C200800AC10F6EA
      969E7CEAD4AC0E6C3DFCEAFC137E753260ECF4171A95BC25F7E57E6EB05838BC
      E7E16E85E864FAB9C55867AEA1993EE6CE5019ED05EA4CF184FB7C568F8384C6
      7B8C80C9F99F33E67CCF99F33E67C5F33E67CCF93F33E67CCF99F33E67CCF8BE
      67CCF99F27E67CCF99F33E67CCF99F17CCF99F33E4FCCF99F33E67CCF99F33D8
      8BD6452A012733DC8BD819E309FF8BFF17DC93ECBEC6FAFE349F7C736E110B47
      C8A0F5FC72DFF2C277C8A6A8743E97C8AD5844003F52F0AF4A0B16A962C8B22C
      8B22C8B22C76DB8EB1E451783019B301A69000EE6E2C8B12162B9E7164591645
      91629163420A0074DBA2C8B0B4F38B22C8B22C8B22CB6E8B279C591645916459
      165B74593CE2C8B22C8B22C642C3F87B00326831618458C679C591614163A044
      5916151667762CC4FA8D8B22C712588A7762C8B2D062CB9BB418B22CB148B22C
      B418B2E6F799164597EB16459683165CDC591645916459165A0C597371645916
      45916459683165CDC591645916459162C99640049A0C5916171E716459164591
      630628500116459164591645916458C05825E0096682A000CAB01962C0E84160
      77209278479405CE2BD8203E9001830040100400DC0040CCF8436FC0100400FC
      C00B4C884ED9CDA762C17004010027400B4FA9DC01004014EE0080200A770040
      10053B802008029DC01004014EE9DC01004014EE0080200A770040100154ED64
      22D3E802008014E0071BD78020080200700012F020322DBE80B28B01BC207E80
      8DA20FA5E80BF500368002737C80C04900A45C8B91722E0291722E45C8B80A45
      C8B91722E023B916A7801C4001120450733FD549B9754A3207552C8A20FA5552
      ED0BF9B2025D6B4F19750140555675AF1002AAE0280A022155B1AF514A410155
      5C05014055575570140501555D55C05014055575570140501555D55C05014055
      575570140501555D55C05014055575570140501555D55C050140555755701405
      01555D55C050140555755701405017F3BAAB80A028088556DF00555C05010902
      51BDF0AA00352C0658C03BF9807345600D3C248A82E3E8C3F004010040100270
      00BAF72328CA328C960C82164AA26C446C7809C94F1946519464E064A0343D53
      715C600960ADC869C14E82322016B464F834F4A5741500171B0F83519218C9FD
      4027506905D7AB35F193EA1068AC1B2B34E8824178C940640A0E29506F422A62
      7A88C962B67A116252B2441E8463257193FCE824E899AC269406C8324DEAB358
      4D4A54DB7B351F19330C8DEB047AA0DA4BBA4B376E193ECDD8F295EA20DA5123
      278191D707092B6DA61ADE46492B6DA94A96AA2327A195DA5F3DF3DDA465ACF8
      CB59FA9C8C9D2B3E4DF937E4DE32E4DFB9FEE7FB9FEDB232F80FF01FE03FBA91
      927E69FDA38CA328CBF3798C008CA328CA32683280200802008011BE51CF6A19
      3A4025916033F5845FAB03938580D3024C9C424A8C3F00401004010027448BA0
      F2A008CA328CA326832DB6C65194651906F7AAA804EF7AA7064AA3A3BDB7AB00
      4643032AB3AB3AB3A808CBD09F427D09F35A32AB3AB3AB3A808CAACEACEACEA0
      232AB3AB3AB3A808CAACEACEACEACE32AB3AB3AB3AB3A80AB3AB3AB3AB3A808C
      BB6CEE7FB9FEDB232AB38CAACEA023271FCD3FB471946519464A4A73A008CA32
      8CA32723280200802008011BE51CFECB22C40259160341584469607674B01A68
      8F54884F1187E00802008020062AEC5D079F0046519465193A196DB6328CA328
      CBAA1EA87AA1E9BA32EF56ACEACEA023268D59FD71FAE3F5C632FAE356756756
      750119540559D59D4046556719559D4046556756756750119559D59D59D40465
      56756756743632072B3EE7FB9FEE7E32EE7EACEACEACEA0232FB471946519464
      F5599F0046519465193A19401004010040099F28D0EF3B384025996034458447
      56071C1603510A02B109EA70FC010040100400C75D8BA0F40008CA328CA32743
      2DB6C6519465197543D50F543D37465DEAD59D59D40465DEAE27C65194645DE6
      6E53C6519465194A78CA328CA32AB38CA328CA32AB394F1946519559CA78CA32
      8CAACE53C651946556729E328CA32AB394F1946519559CA78CA328CA327A53A0
      0046519465193B194010040100400A1F291A31C683652E2ACD08A6DA6805A4C2
      5B51E8538C2B4D5F8720FA67A26F87291E93BBE47F1B47655245162630053403
      E348AC1AC9173ADA56E2286AFD075835A7BE018F62A640A304CD921FC2EC40E2
      C302EAE2333A2019600F2C6661192D51284428D4B081637594EC026C65F35938
      EC18C090781A30837E1C58D560218634625A31ED08559287807982E3A888C204
      EE256E2BD104312CA808A4C44FE8A0C57911B53614824587C4B2B8A1A2BA208A
      3C2543039B1021C3C61B480405544A3E08651C6501C839AA4A9B032295AF83A4
      59A591B89DE62F1971D868D46D6105629D085AF712E80346CD28A5A8371EA687
      9B1A41C3B031447883D59021B164983B18B7A637978153CE4552A6A503D0D334
      122E2C8168341451BC52C74468AC54ACBA95B26A6D88209290ACCB6083D62B1A
      CA1100814252855B070BB49190819054A496224024B1AA9361A68048A1C81C63
      5A74320D19A7354D28C8030B36558980C10755405E602C975BAEA069A7F4AAEA
      AB725ACA5C3732B335C8FB784C28382E754F3EBA0365413EA22708EC63D04250
      25376A9D04A008046803C97691241A991040850C848FC2CC476775C819DD4737
      AFAA3B20609D881FC6670D30992954344A63B1DF1FC701CB24884CE8D6D8283E
      4C1B09D347809D6150F49D8A94B7131660296D92963A464B96A5E65EC48C091D
      E036141E1C4A090C06ACE604034C7180B2B022233F5734292A85C2BAC1ED1998
      7294D95AED676FCDD8348C96198655C8C198388AD808E2AD55845D8EB25418A9
      18FEBF83C1C7CD63D080C34BF2AE785A13890E8687878415CF428BB96B6ACEE4
      76F7D313BDF1272B82E8479652B6B77048F27E053543CAA49871E9E4EC1A976F
      08B8B335E07082359C0DD1C8F62A146D061E334AEAAA64F0A40CBBAE4997155E
      3300D7C868D769F839F8B10C04E65101E4D07273B07C215AE3B130407043B149
      E51836E9F32807D02650B1C3074B126DF0105127588897450193E34408142143
      174518B848D294B25CBF26C5CB8A83392C8A12B956196A42B8836B69699058F9
      36CC0597905DEC8724ED1A3073E170E5581A30ED782CE6619892D351AC497412
      B27902204702322846B897CCA4606B4E76FEB2E5CC1782650C84FD3EA5C94EAA
      8D805C884083295441C8152A89BCD5CBCA120AD94F1E59974BE3415C1C083402
      C8838B88527C94E086CB07A3786CCF099D18238D55998EEA25FD27A05CBAE182
      47C36E06906F20199A4BB250C167EA2831783B235B8FD2F1516ECD02B7E75C13
      AE6FA747C0D093D4A0A9DC548792978CA52214A4ACBC545BAA4A5F6695C34548
      BC3362D6786358F71016629DFCC014C329D0BB2EE515AD635B156DA3A7C540C0
      F7EB04343C934B319C751ED6DB132BD5CB96A64851496A3B8927BCADA6846E69
      32043B50F3F20AD4FC567BB873B28A043840E36619C7A9A5A4C7221B3F1DCB5D
      F52B8EE5BA8D14CCAE113360885961A6965C205CD53259931D6B352865D6A2D9
      B3583E994D2F985151BF5041CC2702F0A2CC01A9614572FBDBC36FB851697D6F
      78517927D3E1458FBCE60060D9160AD99BC6D97B07330F416640C51952331726
      1D1A5E45B65480ED69FB2FA6B476211654D1C03022FFDF44BB047C1443C79290
      6DAA97F6183334CBECC599D23466301ABB036FB5B06D9D0EAD19DA6E9B0A33C5
      0205F67AA01A533E501D02CFD584477424C91D6EAD09320601D0915302D6120B
      A123A1431759A130406CFE7E8B03A0B0C36409B32AC29E976E31A66A14A294CB
      E02F8CF1658CDB2B1ACCC9C5F4926655CDB3399996C87365196FA36D040903E0
      F4CA042AC5E074D3424B5F5A1A50D9A68191F2A4FE9D9A805DE6724304AF25DE
      F6AAEE603F5B552A4B3F16FC2D622F47EE6F1AE15BD2BB657137FE6DF8E1F8FE
      32936CD937A15DCF5D3B11DE9FCC6EE4FEEBAFB731C3095BFD32C3C9AC2943D8
      0ED33CA8E1FDCC891AB38215F7B015F5DBE342F9D7D0DE8714BE12DB6FE23E82
      DDFD6CC3F92E46F7F35FF05E2F5DFE8318F941C6F4782559D8BE2EE40889FAC2
      F731E20F7665D70BDECC0D785EEE20BDC2F65F1ABA66463AECCBE32C4C73FFC5
      95FCF92F5B7DEC9C69AC37F340D8DBAFCD7EFFEE0E4B3CE51BF63BE27D3F7ABA
      8EBB9CBB69BB53415B4FEF7BE57CABC00FB559D93BCB43662DBF6CC40780CFB4
      DED5FBDF5B2D3C0F661CFA3DC40C9E1E67F43034E50BA2BE7F37BF9AACC283C1
      A576358F2ACA7C4167F9581CFBAD495F6C0F93A5945916195D8BC3093135E08D
      82A41BC925461C615942A186CF6C3C447C01FAA8B143520E7C52DEFC5B6E3F7E
      FD57CFC324AACC365F257E01FAFA2687F993774CCE87C484A43321E00CD54186
      F12BF38BC67F001FCDF74A41F4CD5DFF22FD2D8E003F9F57FAC4F0905512934C
      1FE3DD93C3D94E8F7B01131DB729FDF117D2BF16B5EB69CB9938C0FD87704B7B
      1D474B059DEC6F727F776D3539544DE211A0C0B61DFF8F2C8074597E81D77BB7
      3FDBA6975FE5A3E4E78F4BFA36E819EA5C7CA4EF7A1FE03A219B2F911D0391A5
      6277DE55B56557E29C9457F94FA3CFAD6A645AECDA5028FEDBD0854BA3AEF1A5
      EFEDB375D6A37AD7B59FD76DD53C38FA86107CB12E96D9E797E869AE9475BA38
      B39FEBDCF97C7242FECE35869FD7BD9B2EDAF8B3E8F43B3DEC4E7DCCF50D7416
      FA873B9E551F4E8BADFB45BB7875E0DFA4E3D79380EB79BE78FE138D504619FE
      DE5B7EB07FC08759FC8420C8BF6A0437EC0C4DED79C82FAADE611F901BB135EF
      07F71DBD4BA89D3B69B44B8FCD35112097BF8B134141BC277A5E5E9A1FE64DCB
      99B2A3DF4BE03CF461AC955EF670FE9FC9EC3E7134FD86E7AFAD34D457537D17
      A7D7372E6BAEA43311AA2D7F7FBD32F57407D3F1A7C1EC024CDD5EBE14B519B9
      B1BDE277077664A41D636EF7DBC2AADDE688841B36AF541910A41928D20CFF51
      3CEFED2DB7CDD30693467CF2DB4BF1991BA3A0B5FA75A8F2FD14FB1B163FAB01
      DEFE228C325A0FF79F4C1F7606D9F9D6C1EB68CFC1EDCC6307BE69CFDD1CB7EF
      CB89EA3B5B73A9F98B8F981DDB7E375DC7FF9D57632238468C6147097B2B1046
      B794920226F3A6391380478113804AB913E7050795D92DDDEA5552A6AA676BE1
      3362E2B1934F7D41C6EE4AC7AA7B91DBF71CF23B7057AED37527F2B03C9AF9AD
      CEEFAC9FC89F57D49B9B309EFDCC09EDBA55D815903574728752F55BF6E50F8B
      EB250FB5B30CAF82C3CB8FA5877E7A585CF4FDB45FED8515FBE41F72836ACA88
      C5CFBE88E33B5FF2239881E3F897C96CC770FF92D99F8CB675D1BB35D4ED6CC8
      96EF297B14B1E35216EDF1FAB7FBAE79C9F06633DC688F73B27DC71F4E9C3EB8
      4EEB7C3A32C5BBF5D4659C82F4BE6AA32CCFC79A34FF6A7668D21781F695EBD1
      A590659A8D37B10A6177232233D4F796B1FD4EB0BE2377B15F82BF93192FA320
      FF949F27DD25927CBEE8CBE93C4C066782AF1819D8C2477693D324BCED7183AD
      B1EBE1B7F1AB5D26B58DFF292EB1CC92FA497CEE6041EEA737A4BFD64321A92E
      A7A7516B402CE91BCE85FEA3FCF6C6BE6D503EBF329D2B17BAFD03E204457E98
      FC62F75D08F29F5512EFD255DF642EFEDA7A62E1ABBFF95383A3C3521BC856D3
      D3C2CFCBC7A7523D3087A7A1C623D22546E35AA7D4F49251B71FE2B71FA0EE3F
      C436C5AD4AC07F53BD8D5D7CFA45187603FC94CB5CFFBC89D80FF20CC2603EE6
      313979F18AF76DF9F5E34C7A6B876A1477C157B6B7B94EA87FF77EB8C5D7CECF
      903A81BDE317B6FFBEFB00E8A536335F87C56EBEA5ACADE3C97DBDBBFB76DEDD
      87BEDD7F2FA2FDF3B6C03A85F328D76BA15E1073769FA4374AA0DE77BDC6F5E2
      441BFFFDFE4DD59F862BF036D2E97661FFAEB7DFD7E9A7129E78617F98F0}
  end
end
