object fReestr: TfReestr
  Left = 0
  Top = 0
  Caption = 'fReestr'
  ClientHeight = 186
  ClientWidth = 330
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 64
    Width = 35
    Height = 13
    Caption = #1057#1091#1084#1084#1072':'
  end
  object Label2: TLabel
    Left = 8
    Top = 28
    Width = 14
    Height = 13
    Caption = #1054#1090
  end
  object Label3: TLabel
    Left = 169
    Top = 28
    Width = 13
    Height = 13
    Caption = #1076#1086
  end
  object Label4: TLabel
    Left = 248
    Top = 64
    Width = 4
    Height = 18
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMenuHighlight
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DateTimePicker1: TDateTimePicker
    Left = 32
    Top = 24
    Width = 121
    Height = 21
    Date = 40952.696910914350000000
    Time = 40952.696910914350000000
    TabOrder = 0
  end
  object DateTimePicker2: TDateTimePicker
    Left = 192
    Top = 24
    Width = 121
    Height = 21
    Date = 40952.696960810200000000
    Time = 40952.696960810200000000
    TabOrder = 1
  end
  object Button1: TButton
    Left = 16
    Top = 144
    Width = 81
    Height = 25
    Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100
    TabOrder = 2
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 57
    Top = 61
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object Button2: TButton
    Left = 192
    Top = 144
    Width = 75
    Height = 25
    Caption = #1054#1073#1097#1072#1103' '#1089#1091#1084#1084#1072
    TabOrder = 4
    OnClick = Button2Click
  end
  object RadioButton1: TRadioButton
    Left = 16
    Top = 88
    Width = 216
    Height = 17
    Caption = #1047#1072#1087#1080#1089#1099#1074#1072#1090#1100' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1086#1088#1075'-'#1094#1080#1080
    TabOrder = 5
  end
  object RadioButton2: TRadioButton
    Left = 16
    Top = 111
    Width = 216
    Height = 17
    Caption = #1047#1072#1087#1080#1089#1099#1074#1072#1090#1100' '#1085#1086#1084#1077#1088' '#1087#1086#1083#1080#1089#1072' '#1044#1052#1057
    Checked = True
    TabOrder = 6
    TabStop = True
  end
end
