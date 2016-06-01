unit reestr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleServer, ComObj, StdCtrls, ComCtrls, Excel2000, Mask, ExcelXP;

type
  TfReestr = class(TForm)
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button2: TButton;
    Label4: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fReestr: TfReestr;

implementation

uses DM;

{$R *.dfm}

procedure TfReestr.Button1Click(Sender: TObject);
var
  ExelTab: Variant;
  st_in, q, fam, im, ot, dr: string;
  i, k, l: integer;
  Sum, Sum2, ComSum, Summa, ComSum2, Summa2: integer;
begin
  st_in := ExtractFilePath(Application.ExeName);
  ExelTab := CreateOleObject('Excel.Application');
  ExelTab.Workbooks.Open[st_in + '\Шаблоны\render.xls'];

  q := 'SELECT * FROM BSunionST2 WHERE (D_zap between :date AND :date2)';
  fDM.QStat.SQL.Clear;
  fDM.QStat.SQL.Add(q);
  // fDM.QStat.Parameters
  fDM.QStat.Parameters.ParamByName('date').Value :=
    FormatDateTime('dd.mm.yyyy', DateTimePicker1.Date);
  fDM.QStat.Parameters.ParamByName('date2').Value :=
    FormatDateTime('dd.mm.yyyy', DateTimePicker2.Date);
  fDM.QStat.Open;

  // ExelTab.Visible := true;

  i := 9; // начать с 9 строки
  k := 1;
  l := 1;
  while (not(fDM.QStat.Eof)) and (Summa <= StrToInt(Edit1.Text)) do
  begin
    // ОМС в ДМС
    fDM.QOMStoDMS.SQL.Clear;
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

    ExelTab.Cells.Item[i, 1].Value := inttostr(k);
    ExelTab.Cells.Item[i, 2].Value := fDM.QStat.FieldByName('FAM').AsString +
      ' ' + fDM.QStat.FieldByName('Im').AsString + '. ' +
      fDM.QStat.FieldByName('Ot').AsString + '. ';
    ExelTab.Cells.Item[i, 3].Value := fDM.QStat.FieldByName('Dr').AsString;
    ExelTab.Cells.Item[i, 16].Value := fDM.QStat.FieldByName('nub_k').AsString;

    // Записать Номер ДМС
    // ExelTab.Cells.Item[i,6].Value:=fDM.QOMStoDMS.FieldByName('ser').AsString+' '+fDM.QOMStoDMS.FieldByName('polis').AsString;

    // 01.2013
    if (RadioButton1.Checked = true) AND
      (fDM.QStat.FieldByName('name').AsString = '') then
    begin
      fDM.QStat.Next;
      Continue;
    end;
    // --------------

    // Записать Наменование орг-ции
    if (RadioButton1.Checked = true) then
      ExelTab.Cells.Item[i, 4].Value := fDM.QStat.FieldByName('name').AsString +
        ' ' + fDM.QOMStoDMS.FieldByName('ser').AsString + ' ' +
        fDM.QOMStoDMS.FieldByName('polis').AsString;
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

procedure TfReestr.Button2Click(Sender: TObject);
begin
  fDM.QSum.SQL.Clear;
  fDM.QSum.SQL.Add
    ('Select Sum(Zena*Kol)as Summa From BSunionST2 Where (D_okaz between :date AND :date2)');
  fDM.QSum.Parameters.ParamByName('date').Value :=
    FormatDateTime('dd.mm.yyyy', DateTimePicker1.Date);
  fDM.QSum.Parameters.ParamByName('date2').Value :=
    FormatDateTime('dd.mm.yyyy', DateTimePicker2.Date);
  fDM.QSum.Open;
  Label4.Caption := fDM.QSum.FieldByName('Summa').AsString;
  Edit1.Text := fDM.QSum.FieldByName('Summa').AsString;
end;

procedure TfReestr.FormCreate(Sender: TObject);
begin
  DateTimePicker1.Date := Date;
  DateTimePicker2.Date := Date;
end;

end.
