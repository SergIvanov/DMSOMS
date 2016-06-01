object fUsl: TfUsl
  Left = 0
  Top = 0
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1091#1089#1083#1091#1075
  ClientHeight = 431
  ClientWidth = 687
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
    Width = 687
    Height = 390
    Align = alClient
    DataSource = ds1
    DynProps = <>
    FooterParams.Color = clWindow
    STFilter.Local = True
    STFilter.Visible = True
    TabOrder = 0
    Columns = <
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'Kod'
        Footers = <>
        Width = 100
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'KodSt'
        Footers = <>
        Width = 75
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'Name_usl'
        Footers = <>
        Width = 400
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'Zena'
        Footers = <>
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 390
    Width = 687
    Height = 41
    Align = alBottom
    TabOrder = 1
    object DBNavigator1: TDBNavigator
      Left = 432
      Top = 6
      Width = 240
      Height = 25
      DataSource = ds1
      TabOrder = 0
    end
  end
  object ds1: TDataSource
    DataSet = fDM.tblPrice
    Left = 336
    Top = 224
  end
end
