object fSum: TfSum
  Left = 0
  Top = 0
  Caption = #1057#1091#1084#1084#1072' '#1079#1072' '#1086#1090#1095#1077#1090#1085#1099#1081' '#1087#1077#1088#1080#1086#1076
  ClientHeight = 289
  ClientWidth = 299
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 96
    Top = 80
    Width = 75
    Height = 25
    Caption = #1054#1082
    TabOrder = 0
    OnClick = Button1Click
  end
  object DateTimePicker1: TDateTimePicker
    Left = 8
    Top = 32
    Width = 113
    Height = 21
    Date = 41429.394512349540000000
    Time = 41429.394512349540000000
    TabOrder = 1
  end
  object DateTimePicker2: TDateTimePicker
    Left = 152
    Top = 32
    Width = 113
    Height = 21
    Date = 41429.394558946760000000
    Time = 41429.394558946760000000
    TabOrder = 2
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 136
    Width = 297
    Height = 153
    DataGrouping.GroupLevels = <>
    DataSource = fDM.DSSumma
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    IndicatorOptions = [gioShowRowIndicatorEh]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
end
