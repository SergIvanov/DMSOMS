object fUser: TfUser
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'fUser'
  ClientHeight = 164
  ClientWidth = 214
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 8
    Width = 76
    Height = 13
    Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100':'
  end
  object Button1: TButton
    Left = 72
    Top = 80
    Width = 75
    Height = 25
    Caption = #1042#1093#1086#1076
    TabOrder = 0
    OnClick = Button1Click
  end
  object ComboBox1: TComboBox
    Left = 40
    Top = 40
    Width = 145
    Height = 21
    TabOrder = 1
    Items.Strings = (
      ' ')
  end
end
