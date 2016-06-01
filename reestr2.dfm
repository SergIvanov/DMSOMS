object Freestr2: TFreestr2
  Left = 0
  Top = 0
  Caption = 'Freestr2'
  ClientHeight = 643
  ClientWidth = 991
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 991
    Height = 78
    Align = alTop
    TabOrder = 0
    DesignSize = (
      991
      78)
    object lbl1: TLabel
      Left = 31
      Top = 20
      Width = 14
      Height = 13
      Anchors = []
      Caption = #1054#1090
    end
    object lbl2: TLabel
      Left = 174
      Top = 20
      Width = 13
      Height = 13
      Anchors = []
      Caption = #1076#1086
    end
    object btn1: TButton
      Left = 316
      Top = 8
      Width = 121
      Height = 21
      Anchors = []
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100
      TabOrder = 0
      OnClick = btn1Click
    end
    object chk1: TDBCheckBoxEh
      Left = 24
      Top = 44
      Width = 57
      Height = 17
      Anchors = []
      Caption = #1044#1052#1057
      Checked = True
      DynProps = <>
      State = cbChecked
      TabOrder = 1
    end
    object chk2: TDBCheckBoxEh
      Left = 104
      Top = 39
      Width = 53
      Height = 28
      Anchors = []
      Caption = #1054#1052#1057
      DynProps = <>
      TabOrder = 2
    end
    object dtp1: TDateTimePicker
      Left = 49
      Top = 12
      Width = 121
      Height = 21
      Anchors = []
      Date = 40952.696910914350000000
      Time = 40952.696910914350000000
      TabOrder = 3
    end
    object dtp2: TDateTimePicker
      Left = 191
      Top = 12
      Width = 121
      Height = 21
      Anchors = []
      Date = 40952.696960810200000000
      Time = 40952.696960810200000000
      TabOrder = 4
    end
    object btn2: TButton
      Left = 449
      Top = 8
      Width = 121
      Height = 21
      Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100
      TabOrder = 5
      OnClick = btn2Click
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 78
    Width = 991
    Height = 565
    Align = alClient
    TabOrder = 1
    object dbgrdh1: TDBGridEh
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 983
      Height = 557
      Align = alClient
      AutoFitColWidths = True
      DataSource = ds1
      DynProps = <>
      FooterRowCount = 1
      HorzScrollBar.ExtraPanel.NavigatorButtons = [nbFirstEh, nbPriorEh, nbNextEh, nbLastEh]
      HorzScrollBar.ExtraPanel.Visible = True
      HorzScrollBar.Height = 50
      IndicatorOptions = [gioShowRowIndicatorEh, gioShowRecNoEh]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDblClickOptimizeColWidth, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
      ReadOnly = True
      STFilter.Visible = True
      SumList.Active = True
      TabOrder = 0
      OnApplyFilter = dbgrdh1ApplyFilter
      Columns = <
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'Iden'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'FAM'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'IM'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'Ot'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'DR'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'D_zap'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'Name'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'Name_usl'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'Zena'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'K_usl'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'Kol'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'K_vr'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'K_ss'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'D_okaz'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'Diag'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'Sh'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'GV'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'nub_k'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'SUMMA'
          Footer.ValueType = fvtSum
          Footers = <>
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object ds1: TDataSource
    DataSet = fDM.QStat
    Left = 744
    Top = 24
  end
end
