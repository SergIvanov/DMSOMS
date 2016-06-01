object fOrg: TfOrg
  Left = 0
  Top = 0
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1081
  ClientHeight = 294
  ClientWidth = 504
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 504
    Height = 253
    Align = alClient
    DataGrouping.GroupLevels = <>
    DataSource = fDM.DSTRZD
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    IndicatorOptions = [gioShowRowIndicatorEh]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ny'
        Footers = <>
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 'Name'
        Footers = <>
        Width = 383
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 253
    Width = 504
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = 96
    ExplicitTop = 280
    ExplicitWidth = 185
    object DBNavigator1: TDBNavigator
      Left = 248
      Top = 6
      Width = 240
      Height = 25
      DataSource = fDM.DSTRZD
      TabOrder = 0
    end
  end
end
