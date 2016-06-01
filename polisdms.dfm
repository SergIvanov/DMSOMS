object fPolisDMS: TfPolisDMS
  Left = 0
  Top = 0
  Caption = 'fPolisDMS'
  ClientHeight = 300
  ClientWidth = 658
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 658
    Height = 300
    Align = alClient
    TabOrder = 0
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 656
      Height = 298
      Align = alClient
      ColumnDefValues.Title.TitleButton = True
      DataSource = ds1
      DynProps = <>
      FooterParams.Color = clWindow
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
      ReadOnly = True
      STFilter.InstantApply = True
      STFilter.Visible = True
      TabOrder = 0
      OnApplyFilter = DBGridEh1ApplyFilter
      OnSortMarkingChanged = DBGridEh1SortMarkingChanged
      Columns = <
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'FAM'
          Footers = <>
          Width = 120
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'IM'
          Footers = <>
          Width = 120
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'OT'
          Footers = <>
          Width = 120
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'DR'
          Footers = <>
          Width = 69
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'SER'
          Footers = <>
          Width = 82
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'POLIS'
          Footers = <>
          Width = 90
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object ds1: TDataSource
    DataSet = fdqry1
    Left = 320
    Top = 152
  end
  object fdqry1: TFDQuery
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    Connection = fDM.con1
    SQL.Strings = (
      'Select * from POLISDMS')
    Left = 440
    Top = 224
  end
end
