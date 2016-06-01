object fPolis: TfPolis
  Left = 0
  Top = 0
  Caption = 'fPolis'
  ClientHeight = 455
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 455
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 413
      Width = 633
      Height = 41
      Align = alBottom
      TabOrder = 0
    end
    object dbgrdh1: TDBGridEh
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 627
      Height = 406
      Align = alClient
      DataSource = ds1
      DynProps = <>
      IndicatorTitle.TitleButton = True
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
      ReadOnly = True
      STFilter.InstantApply = True
      STFilter.Visible = True
      TabOrder = 1
      OnApplyFilter = dbgrdh1ApplyFilter
      OnSortMarkingChanged = dbgrdh1SortMarkingChanged
      Columns = <
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'SERIA'
          Footers = <>
          Title.TitleButton = True
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'NUMBER'
          Footers = <>
          Title.TitleButton = True
          Width = 116
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'FAMILY'
          Footers = <>
          Title.TitleButton = True
          Width = 106
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          Title.TitleButton = True
          Width = 108
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'FATHER'
          Footers = <>
          Title.TitleButton = True
          Width = 123
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'BIRTHDAY'
          Footers = <>
          Title.TitleButton = True
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object ds1: TDataSource
    DataSet = fdqry1
    Left = 280
    Top = 256
  end
  object fdqry1: TFDQuery
    Filtered = True
    Connection = fDM.con1
    Transaction = fDM.fdtrnsctn1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select SERIA, NUMBER, FAMILY, NAME, FATHER, BIRTHDAY '
      'from POLIS')
    Left = 353
    Top = 258
  end
end
