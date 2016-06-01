unit DM;

interface

uses
  System.SysUtils, Classes, DB, ADODB, MemTableDataEh, DataDriverEh, ADODataDriverEh,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait,
  FireDAC.Phys.IBBase, FireDAC.Comp.Client, System.IniFiles, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TfDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    TBase: TADODataSet;
    DSBase: TDataSource;
    TBaseid: TAutoIncField;
    TBaseserOMS: TWideStringField;
    TBasePolisOMS: TWideStringField;
    TBaseFAM: TWideStringField;
    TBaseIM: TWideStringField;
    TBaseOt: TWideStringField;
    TBaseDR: TDateTimeField;
    TBaseserDMS: TWideStringField;
    TBasePolisDMS: TWideStringField;
    TUsl: TADODataSet;
    DSUsl: TDataSource;
    QDMS: TADOQuery;
    QCena: TADOQuery;
    TBaseD_Zap: TDateTimeField;
    TUser: TADODataSet;
    DSUser: TDataSource;
    QUser: TADOQuery;
    TBaseUser: TWideStringField;
    TSMKB: TADODataSet;
    DSSMKB: TDataSource;
    QStat: TADOQuery;
    QSum: TADOQuery;
    TRZD: TADODataSet;
    DSTRZD: TDataSource;
    TRZDny: TWideStringField;
    TRZDName: TWideStringField;
    TBaseny: TWideStringField;
    TBaselookNy: TStringField;
    QSumma: TADOQuery;
    DSSumma: TDataSource;
    con1: TFDConnection;
    fdphysfbdrvrlnk1: TFDPhysFBDriverLink;
    fdtrnsctn1: TFDTransaction;
    atncfldTUslid: TAutoIncField;
    intgrfldTUslBase_id: TIntegerField;
    wdstrngfldTUslKodUSL: TWideStringField;
    intgrfldTUslKol: TIntegerField;
    intgrfldTUslPrice: TIntegerField;
    dtmfldTUslD_okaz: TDateTimeField;
    wdstrngfldTUslDiag: TWideStringField;
    wdstrngfldTUslK_vr: TWideStringField;
    wdstrngfldTUslK_ss: TWideStringField;
    fdqryRead: TFDQuery;
    tblPrice: TADOTable;
    fdqryDMS: TFDQuery;
    procedure TBasePolisOMSChange(Sender: TField);
    procedure TBaseAfterInsert(DataSet: TDataSet);
    procedure TBasePolisDMSChange(Sender: TField);
    procedure DataModuleCreate(Sender: TObject);
    procedure wdstrngfldTUslKodUSLChange(Sender: TField);
    procedure intgrfldTUslKolChange(Sender: TField);
    procedure TBaseDRChange(Sender: TField);
    procedure dsTSPriceAfterEdit(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fDM: TfDM;
  hb: Byte = 0;


implementation

uses user;

{$R *.dfm}

procedure TfDM.DataModuleCreate(Sender: TObject);
 var

  xIniFile:TIniFile;

begin

ADOConnection1.Close;

ADOConnection1.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=db.mdb';
ADOConnection1.Open();

TSMKB.Open;
tblPrice.Open;
TRZD.Open;


TBase.Open;
TUsl.Open;





  fdphysfbdrvrlnk1.VendorLib :=ExtractFileDir(ParamStr(0)) +pathdelim+'fbclient' + pathdelim +'fbclient.dll';


   xIniFile := TIniFile.Create('.\config.ini');

  try

    xIniFile.ReadSectionValues('connection', con1.Params);
 finally
    xIniFile.Free;
  end;



end;

Function GetFIO(Str : string):string;
begin
    Str:=Trim(Str);
    Str:=AnsiLowerCase(Str);
    Str:=AnsiUpperCase(Str[1])+Copy(Str,2,Length(Str));


  Result := Str;
end;

procedure GetOMSDate(n: Byte);
begin
// n= 1 ищем по фио и др n=2 по серии и номеру полиса
      hb:=hb+1;;

  if n = 1 then
  begin
    fDM.fdqryRead.SQL.Clear;
    fDM.fdqryRead.Params.Clear;

    fDM.fdqryRead.SQL.Add('Select SERIA, NUMBER from polis where (FAMILY=:FAMILY) and (NAME=:NAME) and (FATHER=:FATHER) and (BIRTHDAY=:BIRTHDAY)');

    fDM.fdqryRead.Params.ParamByName('FAMILY').Value := AnsiUpperCase(trim(fDM.TBase.FieldByName('FAM').AsString));
    fDM.fdqryRead.Params.ParamByName('NAME').Value := AnsiUpperCase(trim(fDM.TBase.FieldByName('Im').AsString));
    fDM.fdqryRead.Params.ParamByName('FATHER').Value := AnsiUpperCase(trim(fDM.TBase.FieldByName('Ot').AsString));
    fDM.fdqryRead.Params.ParamByName('BIRTHDAY').Value := trim(fDM.TBase.FieldByName('Dr').AsString);
    fDM.fdqryRead.Open;

    if fDM.fdqryRead.RecordCount <> 0 then
    begin

      fDM.fdqryRead.First;

      fDM.TBase.Edit;
      fDM.TBase.FieldByName('serOMS').AsString := fDM.fdqryRead.FieldByName('SERIA').AsString;
      fDM.TBase.FieldByName('PolisOMS').AsString := fDM.fdqryRead.FieldByName('NUMBER').AsString;
    end;

  end;

  if n = 2 then
  begin
    fDM.fdqryRead.SQL.Clear;
    fDM.fdqryRead.Params.Clear;



    if trim(fDM.TBase.FieldByName('serOMS').AsString) = '' then
    begin
      fDM.fdqryRead.SQL.Add('Select FAMILY, NAME, FATHER, BIRTHDAY from polis where  (NUMBER=:num)');
      fDM.fdqryRead.Params.ParamByName('num').Value := trim(fDM.TBase.FieldByName('PolisOMS').AsString);
    end
    else
    begin
      fDM.fdqryRead.SQL.Add('Select FAMILY, NAME, FATHER, BIRTHDAY from polis where (SERIA=:ser) and (NUMBER=:num)');
      fDM.fdqryRead.Params.ParamByName('num').Value := trim(fDM.TBase.FieldByName('PolisOMS').AsString);
      fDM.fdqryRead.Params.ParamByName('ser').Value := trim(fDM.TBase.FieldByName('serOMS').AsString);
    end;




    fDM.fdqryRead.Open;
    if fDM.fdqryRead.RecordCount <> 0 then
    begin

      fDM.fdqryRead.First;

      fDM.TBase.Edit;

      fDM.TBase.FieldByName('FAM').AsString := GetFIO(fDM.fdqryRead.FieldByName('FAMILY').AsString);
      fDM.TBase.FieldByName('IM').AsString := GetFIO(fDM.fdqryRead.FieldByName('NAME').AsString);
      fDM.TBase.FieldByName('OT').AsString := GetFIO(fDM.fdqryRead.FieldByName('FATHER').AsString);
      fDM.TBase.FieldByName('DR').AsDateTime := fDM.fdqryRead.FieldByName('BIRTHDAY').AsDateTime;
    end;

  end;
  fDM.fdqryRead.Close;

end;

procedure GetDMSDate(n: Byte);
begin
// n= 1 ищем по фио и др n=2 по серии и номеру полиса
  hb:=hb+1;

  if n = 1 then
  begin
    fDM.fdqryRead.SQL.Clear;
    fDM.fdqryRead.Params.Clear;

    fDM.fdqryRead.SQL.Add('Select SER, POLIS from polisdms where (FAM=:FAMILY) and (IM=:NAME) and (OT=:FATHER) and (DR=:BIRTHDAY)');

    fDM.fdqryRead.Params.ParamByName('FAMILY').Value := AnsiUpperCase(trim(fDM.TBase.FieldByName('FAM').AsString));
    fDM.fdqryRead.Params.ParamByName('NAME').Value := AnsiUpperCase(trim(fDM.TBase.FieldByName('Im').AsString));
    fDM.fdqryRead.Params.ParamByName('FATHER').Value := AnsiUpperCase(trim(fDM.TBase.FieldByName('Ot').AsString));
    fDM.fdqryRead.Params.ParamByName('BIRTHDAY').Value := trim(fDM.TBase.FieldByName('Dr').AsString);
    fDM.fdqryRead.Open;

    if fDM.fdqryRead.RecordCount <> 0 then
    begin
      fDM.fdqryRead.First;

      fDM.TBase.Edit;
      fDM.TBase.FieldByName('serDMS').AsString := fDM.fdqryRead.FieldByName('SER').AsString;
      fDM.TBase.FieldByName('PolisDMS').AsString := fDM.fdqryRead.FieldByName('POLIS').AsString;
    end;

  end;

  if n = 2 then
  begin
    fDM.fdqryRead.SQL.Clear;
    fDM.fdqryRead.Params.Clear;
    fDM.fdqryRead.SQL.Add('Select FAM, IM, OT, DR from polisdms where (SER=:ser) and (POLIS=:num)');

    fDM.fdqryRead.Params.ParamByName('ser').Value := trim(fDM.TBase.FieldByName('serDMS').AsString);
    fDM.fdqryRead.Params.ParamByName('num').Value := trim(fDM.TBase.FieldByName('PolisDMS').AsString);

    fDM.fdqryRead.Open;

    if fDM.fdqryRead.RecordCount <> 0 then
    begin
      fDM.fdqryRead.First;
      fDM.TBase.Edit;

      fDM.TBase.FieldByName('FAM').AsString := GetFIO(fDM.fdqryRead.FieldByName('FAM').AsString);
      fDM.TBase.FieldByName('IM').AsString := GetFIO(fDM.fdqryRead.FieldByName('IM').AsString);
      fDM.TBase.FieldByName('OT').AsString := GetFIO(fDM.fdqryRead.FieldByName('OT').AsString);
      fDM.TBase.FieldByName('DR').AsDateTime := fDM.fdqryRead.FieldByName('DR').AsDateTime;
    end;

  end;
  fDM.fdqryRead.Close;

end;

procedure GetInfoPeople();
begin
  if hb=0 then
  begin

    if (Trim(fDM.TBase.FieldByName('FAM').AsString) <> '') and (Trim(fDM.TBase.FieldByName('Im').AsString) <> '') and (Trim(fDM.TBase.FieldByName('Ot').AsString) <> '') and (Trim(fDM.TBase.FieldByName('Dr').AsString) <> '') then
    begin
      GetOMSDate(1);
      GetDMSDate(1);
      hb:=0;
    end;

    if trim(fDM.TBase.FieldByName('PolisOMS').AsString)<>'' then
    begin
      GetOMSDate(2);
      GetDMSDate(1);
            hb:=0;
    end;

    if trim(fDM.TBase.FieldByName('PolisDMS').AsString)<>'' then
    begin
      GetDMSDate(2);
      GetOMSDate(1);
            hb:=0;

    end;
  end;

end;



procedure TfDM.dsTSPriceAfterEdit(DataSet: TDataSet);
begin

DataSet.Post;

end;

procedure TfDM.intgrfldTUslKolChange(Sender: TField);
begin
      if TUsl.FieldByName('kol').AsInteger > 0 then
  begin
   QCena.SQL.Clear;
  QCena.SQL.Add('Select Zena From Price Where Kod=:codeUsl');
  QCena.Parameters.ParamByName('codeUsl').Value :=
    TUsl.FieldByName('KodUsl').AsString;
  QCena.Open;

  TUsl.Edit;

  TUsl.FieldByName('Price').AsInteger := TUsl.FieldByName('kol').AsInteger * QCena.FieldByName('Zena').AsInteger;

  end;


end;

procedure TfDM.TBaseAfterInsert(DataSet: TDataSet);
begin
  if user.us <> 'јдминистратор' then
  begin
    TBase.FieldByName('D_zap').AsDateTime := Date;
    TBase.FieldByName('user').AsString := user.us;
  end;
end;

procedure TfDM.TBaseDRChange(Sender: TField);
begin
GetInfoPeople();
end;

procedure TfDM.TBasePolisDMSChange(Sender: TField);
begin
GetInfoPeople();
end;

procedure TfDM.TBasePolisOMSChange(Sender: TField);
begin
GetInfoPeople();
end;

procedure TfDM.wdstrngfldTUslKodUSLChange(Sender: TField);
begin
       QCena.SQL.Clear;
  QCena.SQL.Add('Select Zena From Price Where Kod=:codeUsl');
  QCena.Parameters.ParamByName('codeUsl').Value :=
    TUsl.FieldByName('KodUsl').AsString;
  QCena.Open;

  TUsl.Edit;
  TUsl.FieldByName('kol').AsInteger := 1;
  TUsl.FieldByName('Price').AsInteger := QCena.FieldByName('Zena').AsInteger;
  TUsl.FieldByName('D_okaz').AsDateTime := Date;



end;

end.
