object fMain: TfMain
  Left = 0
  Top = 0
  Caption = #1056#1077#1077#1089#1090#1088' '#1044#1052#1057
  ClientHeight = 577
  ClientWidth = 925
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 925
    Height = 405
    Align = alClient
    TabOrder = 0
    OnExit = Panel1Exit
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 41
      Width = 923
      Height = 319
      Align = alClient
      DataSource = fDM.DSBase
      DynProps = <>
      FooterParams.Color = clWindow
      STFilter.InstantApply = True
      STFilter.Local = True
      STFilter.Visible = True
      TabOrder = 0
      OnKeyDown = DBGridEh1KeyDown
      Columns = <
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'D_Zap'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1103
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 60
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'serOMS'
          Footers = <>
          Title.Caption = #1057#1077#1088#1080#1103' '#1054#1052#1057
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'PolisOMS'
          Footers = <>
          Title.Caption = #1053#1086#1084#1077#1088' '#1054#1052#1057
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 150
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'FAM'
          Footers = <>
          Title.Caption = #1060#1072#1084#1080#1083#1080#1103
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 150
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'IM'
          Footers = <>
          Title.Caption = #1048#1084#1103
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 150
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'Ot'
          Footers = <>
          Title.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 150
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'DR'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 70
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'lookNy'
          Footers = <>
          Title.Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 50
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'serDMS'
          Footers = <>
          Title.Caption = #1057#1077#1088#1080#1103' '#1044#1052#1057
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 50
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'PolisDMS'
          Footers = <>
          Title.Caption = #1053#1086#1084#1077#1088' '#1044#1052#1057
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 150
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'User'
          Footers = <>
          Title.Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 50
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 360
      Width = 923
      Height = 44
      Align = alBottom
      TabOrder = 1
      object Label3: TLabel
        Left = 288
        Top = 16
        Width = 40
        Height = 13
        Caption = #1057#1091#1084#1084#1072':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 344
        Top = 16
        Width = 37
        Height = 13
        Caption = 'Label4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBNavigator1: TDBNavigator
        Left = 8
        Top = 6
        Width = 240
        Height = 25
        DataSource = fDM.DSBase
        TabOrder = 0
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 923
      Height = 40
      Align = alTop
      TabOrder = 2
      object Label1: TLabel
        Left = 19
        Top = 12
        Width = 12
        Height = 13
        Caption = #1086#1090
      end
      object Label2: TLabel
        Left = 155
        Top = 11
        Width = 13
        Height = 13
        Caption = #1076#1086
      end
      object DateTimePicker1: TDateTimePicker
        Left = 37
        Top = 9
        Width = 97
        Height = 21
        Date = 40998.645220243060000000
        Time = 40998.645220243060000000
        TabOrder = 0
      end
      object DateTimePicker2: TDateTimePicker
        Left = 174
        Top = 9
        Width = 97
        Height = 21
        Date = 40998.645296770830000000
        Time = 40998.645296770830000000
        TabOrder = 1
      end
      object CheckBox1: TCheckBox
        Left = 288
        Top = 10
        Width = 73
        Height = 17
        Caption = #1092#1080#1083#1100#1090#1088
        TabOrder = 2
        OnClick = CheckBox1Click
      end
      object CheckBox2: TCheckBox
        Left = 367
        Top = 10
        Width = 182
        Height = 17
        Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1079#1072' '#1084#1077#1089#1103#1094'/'#1075#1086#1076
        TabOrder = 3
        OnClick = CheckBox2Click
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 405
    Width = 925
    Height = 172
    Align = alBottom
    TabOrder = 1
    OnExit = Panel2Exit
    object DBGridEh2: TDBGridEh
      Left = 1
      Top = 1
      Width = 923
      Height = 129
      Align = alClient
      DataSource = fDM.DSUsl
      DynProps = <>
      FooterParams.Color = clWindow
      TabOrder = 0
      OnKeyDown = DBGridEh2KeyDown
      Columns = <
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'id'
          Footers = <>
          Visible = False
        end
        item
          DynProps = <>
          EditButtons = <>
          Footers = <>
          LookupParams.KeyFieldNames = 'KodUSL'
          LookupParams.LookupDataSet = fDM.tblPrice
          LookupParams.LookupDisplayFieldName = 'KodSt'
          LookupParams.LookupKeyFieldNames = 'Kod'
          Title.Caption = #1050#1086#1088#1086#1090#1099#1096
          Width = 133
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'Base_id'
          Footers = <>
          Visible = False
          Width = 50
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'KodUSL'
          Footers = <>
          Title.Caption = #1050#1086#1076
          Width = 102
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'Kol'
          Footers = <>
          Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
          Width = 74
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'Price'
          Footers = <>
          Title.Caption = #1057#1091#1084#1084#1072
          Width = 76
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'D_okaz'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' '#1086#1082#1072#1079#1072#1085#1080#1103
          Width = 108
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'Diag'
          Footers = <>
          LookupParams.KeyFieldNames = 'Diag'
          LookupParams.LookupDataSet = fDM.TSMKB
          LookupParams.LookupDisplayFieldName = 'CODE'
          LookupParams.LookupKeyFieldNames = 'CODE'
          Title.Caption = #1044#1080#1072#1075#1085#1086#1079
          Width = 96
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'K_vr'
          Footers = <>
          Title.Caption = #1050#1086#1076' '#1074#1088#1072#1095#1072
          Width = 80
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'K_ss'
          Footers = <>
          Title.Caption = #1050#1086#1076' '#1084#1077#1076#1089#1077#1089#1090#1088#1099
          Width = 82
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 130
      Width = 923
      Height = 41
      Align = alBottom
      TabOrder = 1
      object DBNavigator2: TDBNavigator
        Left = 8
        Top = 6
        Width = 240
        Height = 25
        DataSource = fDM.DSUsl
        TabOrder = 0
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 872
    Top = 248
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
    end
    object N2: TMenuItem
      Caption = #1054#1090#1095#1077#1090#1099
      object N9: TMenuItem
        Caption = #1057#1091#1084#1084#1072
        OnClick = N9Click
      end
      object N21: TMenuItem
        Caption = #1056#1077#1077#1089#1090#1088' '#1087#1086' '#1091#1089#1083#1091#1075#1072#1084' 2'
        OnClick = N21Click
      end
    end
    object N4: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      object N5: TMenuItem
        Caption = #1059#1089#1083#1091#1075#1080
        OnClick = N5Click
      end
      object N6: TMenuItem
        Caption = #1041#1072#1079#1072' '#1079#1072#1089#1090#1088#1072#1093#1086#1074#1072#1085#1085#1099#1093' '#1087#1086' '#1054#1052#1057
        OnClick = N6Click
      end
      object N7: TMenuItem
        Caption = #1041#1072#1079#1072' '#1079#1072#1089#1090#1088#1072#1093#1086#1074#1072#1085#1085#1099#1093' '#1087#1086' '#1044#1052#1057
        OnClick = N7Click
      end
      object N8: TMenuItem
        Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
        OnClick = N8Click
      end
    end
  end
end
