unit reestr2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,DM, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, Vcl.StdCtrls, Data.DB, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ComCtrls, Vcl.Mask, DBCtrlsEh, Vcl.ExtCtrls,
  Vcl.WinXCtrls,DBUtilsEh,ComObj;

type
  TFreestr2 = class(TForm)
    dbgrdh1: TDBGridEh;
    ds1: TDataSource;
    btn1: TButton;
    dtp2: TDateTimePicker;
    lbl2: TLabel;
    lbl1: TLabel;
    chk1: TDBCheckBoxEh;
    chk2: TDBCheckBoxEh;
    dtp1: TDateTimePicker;
    pnl1: TPanel;
    pnl2: TPanel;
    btn2: TButton;
    procedure btn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgrdh1ApplyFilter(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Freestr2: TFreestr2;

implementation

{$R *.dfm}

procedure TFreestr2.btn1Click(Sender: TObject);

var
q:string;
begin



  fDM.QStat.Close;

  if chk1.Checked then
  begin

    q := 'SELECT * FROM BSunionSTOneDMS WHERE (D_zap between :date AND :date2)';
    fDM.QStat.SQL.Clear;
    fDM.QStat.SQL.Add(q);

    fDM.QStat.Parameters.ParamByName('date').Value := FormatDateTime('dd.mm.yyyy', dtp1.Date);
    fDM.QStat.Parameters.ParamByName('date2').Value := FormatDateTime('dd.mm.yyyy', dtp2.Date);
    fDM.QStat.Open;

  end;

  if chk2.Checked then
  begin

    q := 'SELECT * FROM BSunionSTOneOMS WHERE (BSunionSTOneOMS.D_zap between :date AND :date2)';
    fDM.QStat.SQL.Clear;
    fDM.QStat.SQL.Add(q);

    fDM.QStat.Parameters.ParamByName('date').Value := FormatDateTime('dd.mm.yyyy', dtp1.Date);
    fDM.QStat.Parameters.ParamByName('date2').Value := FormatDateTime('dd.mm.yyyy', dtp2.Date);
    fDM.QStat.Open;
  end;

  if chk1.Checked and chk2.Checked then
  begin

    q := 'SELECT * FROM BSunionST2 WHERE (D_zap between :date AND :date2)';
    fDM.QStat.SQL.Clear;
    fDM.QStat.SQL.Add(q);

    fDM.QStat.Parameters.ParamByName('date').Value := FormatDateTime('dd.mm.yyyy', dtp1.Date);
    fDM.QStat.Parameters.ParamByName('date2').Value := FormatDateTime('dd.mm.yyyy', dtp2.Date);
    fDM.QStat.Open;

  end;


end;

procedure TFreestr2.btn2Click(Sender: TObject);
 var
 ExelTab: Variant;
st_in, q, fam, im, ot, dr: string;
Sum, Sum2, ComSum, Summa, ComSum2, Summa2: integer;
 i, k, l: integer;

begin

st_in := ExtractFilePath(Application.ExeName);
  ExelTab := CreateOleObject('Excel.Application');
  ExelTab.Workbooks.Open[st_in + '\Шаблоны\render.xls'];

  i := 9; // начать с 9 строки
  k := 1;
  l := 1;
  while (not(fDM.QStat.Eof)) do
  begin
    // ОМС в ДМС
   { fDM.QOMStoDMS.SQL.Clear;
    fDM.QOMStoDMS.SQL.Add
      ('SELECT polisDMS.ser As ser, polisDMS.polis As polis, polisDMS.Fam,polisDMS.Im,polisDMS.Ot,polisDMS.DR FROM polisDMS WHERE (polisDMS.Fam=:f) AND (polisDMS.Im=:i) AND (polisDMS.Ot=:o) AND (polisDMS.DR=:dr)');
    fDM.QOMStoDMS.Parameters.ParamByName('f').Value :=
      fDM.QStat.FieldByName('FAM').AsString;
    fDM.QOMStoDMS.Parameters.ParamByName('i').Value :=
      fDM.QStat.FieldByName('Im').AsString;
    fDM.QOMStoDMS.Parameters.ParamByName('o').Value :=
      fDM.QStat.FieldByName('Ot').AsString;
    fDM.QOMStoDMS.Parameters.ParamByName('dr').Value :=
      fDM.QStat.FieldByName('Dr').AsString;
    fDM.QOMStoDMS.Open;
    // Не записывать если нет полиса ДМС
    if (RadioButton2.Checked = true) AND
      (fDM.QOMStoDMS.FieldByName('polis').AsString = '') then
    begin
      fDM.QStat.Next;
      Continue;
    end;
    if (RadioButton2.Checked = true) AND
      (fDM.QOMStoDMS.FieldByName('polis').AsString <> '') then
      ExelTab.Cells.Item[i, 4].Value := fDM.QOMStoDMS.FieldByName('ser').AsString + ' ' + fDM.QOMStoDMS.FieldByName('polis').AsString;
    // ------------------
               }
        fDM.fdqryDMS.Close;
        fDM.fdqryDMS.SQL.Clear;
        fDM.fdqryDMS.SQL.Add('SELECT SER , POLIS , PODR from POLISDMS WHERE (FAM=:FAM) AND (IM=:IM) AND (OT=:OT) AND (DR=:DR)');

        fDM.fdqryDMS.Params.ParamByName('FAM').Value := ANSIUpperCase(fDM.QStat.FieldByName('FAM').AsString);
        fDM.fdqryDMS.Params.ParamByName('IM').Value := ANSIUpperCase(fDM.QStat.FieldByName('IM').AsString);
        fDM.fdqryDMS.Params.ParamByName('OT').Value := ANSIUpperCase(fDM.QStat.FieldByName('OT').AsString);
        fDM.fdqryDMS.Params.ParamByName('DR').Value := fDM.QStat.FieldByName('DR').AsString;
        fDM.fdqryDMS.Open();
fDM.fdqryDMS.First;
        if fDM.fdqryDMS.FieldByName('POLIS').AsString = '' then
        begin
          fDM.QStat.Next;
          Continue;
        end;

         ExelTab.Cells.Item[i, 4].Value := fDM.fdqryDMS.FieldByName('SER').AsString + ' ' + fDM.fdqryDMS.FieldByName('POLIS').AsString + '/' + fDM.fdqryDMS.FieldByName('PODR').AsString;



    ExelTab.Cells.Item[i, 1].Value := inttostr(k);
    ExelTab.Cells.Item[i, 2].Value := fDM.QStat.FieldByName('FAM').AsString +
      ' ' + fDM.QStat.FieldByName('Im').AsString + '. ' +
      fDM.QStat.FieldByName('Ot').AsString + '. ';
    ExelTab.Cells.Item[i, 3].Value := fDM.QStat.FieldByName('Dr').AsString;
    ExelTab.Cells.Item[i, 16].Value := fDM.QStat.FieldByName('nub_k').AsString;

    // Записать Номер ДМС
    // ExelTab.Cells.Item[i,6].Value:=fDM.QOMStoDMS.FieldByName('ser').AsString+' '+fDM.QOMStoDMS.FieldByName('polis').AsString;




    // ------------------------------
    inc(k);
    fam := fDM.QStat.FieldByName('FAM').AsString;
    im := fDM.QStat.FieldByName('Im').AsString;
    ot := fDM.QStat.FieldByName('Ot').AsString;
    dr := fDM.QStat.FieldByName('Dr').AsString;

    while (fam = fDM.QStat.FieldByName('FAM').AsString) and
      (im = fDM.QStat.FieldByName('Im').AsString) and
      (ot = fDM.QStat.FieldByName('Ot').AsString) and
      (dr = fDM.QStat.FieldByName('Dr').AsString) and (not(fDM.QStat.Eof)) do
    begin
      ExelTab.Cells.Item[i, 5].Value := fDM.QStat.FieldByName('K_Usl').AsString;
      ExelTab.Cells.Item[i, 6].Value :=
        fDM.QStat.FieldByName('Name_usl').AsString;
      ExelTab.Cells.Item[i, 7].Value := fDM.QStat.FieldByName('Kol').AsString;
      ExelTab.Cells.Item[i, 8].Value := fDM.QStat.FieldByName('Zena').AsString;
      ExelTab.Cells.Item[i, 9].Value := fDM.QStat.FieldByName('D_okaz')
        .AsString;
      if fDM.QStat.FieldByName('K_vr').AsString <> '' then
        ExelTab.Cells.Item[i, 10].Value :=
          fDM.QStat.FieldByName('K_vr').AsString
      else
        ExelTab.Cells.Item[i, 10].Value :=
          fDM.QStat.FieldByName('K_ss').AsString;
      ExelTab.Cells.Item[i, 11].Value := fDM.QStat.FieldByName('Diag').AsString;
      Sum := fDM.QStat.FieldByName('Zena').AsInteger * fDM.QStat.FieldByName
        ('Kol').AsInteger;
      Sum2 := fDM.QStat.FieldByName('GV').AsInteger * fDM.QStat.FieldByName
        ('Kol').AsInteger;
      ExelTab.Cells.Item[i, 12].Value := Sum;
      ExelTab.Cells.Item[i, 13].Value := fDM.QStat.FieldByName('D_Zap')
        .AsString;
      ExelTab.Cells.Item[i, 14].Value := fDM.QStat.FieldByName('GV').AsString;
      // выделить ячейки
      ExelTab.Range[ExelTab.Cells[i, 1], ExelTab.Cells[i, 12]].Select;
      ExelTab.Selection.Borders.LineStyle := 1;
      // ---------
      ComSum := ComSum + Sum;
      ComSum2 := ComSum2 + Sum2;
      Summa := Summa + Sum;
      Summa2 := Summa2 + Sum2;

      inc(i);
      inc(l);
      fDM.QStat.Next;
    end;
    // inc(i);
    // Если сумма услуг больше Едит1.Текст тогда выйти из цикла
    { if Edit1.Text<>'' then
      begin
      if (Summa>StrToInt(Edit1.Text)) then break;
      end; }

    ExelTab.Cells.Item[i, 12].Font.Bold := true;
    //ExelTab.Cells.Item[i, 12].Value := FloatToStr(ComSum);
    //ExelTab.Cells.Item[i, 14].Value := FloatToStr(ComSum2);
    ExelTab.Cells.Item[i, 10].Font.Bold := true;
    ExelTab.Cells.Item[i, 14].Font.Bold := true;
    ExelTab.Cells.Item[i, 10].Value := 'Итого по пациенту:';

    ComSum := 0;
    ComSum2 := 0;
    inc(i);
  end;

  ExelTab.Cells.Item[i + 1, 2].Font.Bold := true;
  ExelTab.Cells.Item[i + 1, 2].Value := 'Всего:';
  ExelTab.Cells.Item[i + 1, 12].Font.Bold := true;
  ExelTab.Cells.Item[i + 1, 12].Value := Summa;
  ExelTab.Cells.Item[i + 1, 14].Value := Summa2;
  // выделить ячейки
  ExelTab.Range[ExelTab.Cells[i + 1, 1], ExelTab.Cells[i + 1, 15]].Select;
  ExelTab.Selection.Borders.LineStyle := 1;
  // ---------

  ExelTab.ActiveWorkbook.SaveAs(st_in + 'report/' +
    FormatDateTime('_yyyy_mm_dd', Date) + FormatDateTime('_hh_mm', time) +
    '.xls', EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
    EmptyParam, false, EmptyParam, EmptyParam, EmptyParam);
  ExelTab.Quit;

  ShowMessage('Выгрузка завершена!');

  // ExelTab.Quit;
end;

procedure TFreestr2.dbgrdh1ApplyFilter(Sender: TObject);
begin
TDBGridEh(Sender).DataSource.DataSet.Filter :=
      GetExpressionAsFilterString(TDBGridEh(Sender),
        GetOneExpressionAsLocalFilterString, nil, False, True);
end;

procedure TFreestr2.FormCreate(Sender: TObject);
begin
  dtp1.Date := Date;
  dtp2.Date := Date;


end;

end.
