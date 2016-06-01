unit polisdms;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBGridEhGrouping, GridsEh, DBGridEh, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, DBAxisGridsEh, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, DBUtilsEh;

type
  TfPolisDMS = class(TForm)
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    ds1: TDataSource;
    fdqry1: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBGridEh1ApplyFilter(Sender: TObject);
    procedure DBGridEh1SortMarkingChanged(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPolisDMS: TfPolisDMS;

implementation

uses DM;

{$R *.dfm}

procedure TfPolisDMS.DBGridEh1ApplyFilter(Sender: TObject);
begin

TDBGridEh(Sender).DataSource.DataSet.Filter :=
      GetExpressionAsFilterString(TDBGridEh(Sender),
        GetOneExpressionAsLocalFilterString, nil, False, True);

end;

function LeftStr(const Str: string; Size: Word): string;
begin
  LeftStr := Copy(Str, 1, Size)
end {LeftStr};

procedure TfPolisDMS.DBGridEh1SortMarkingChanged(Sender: TObject);
var
  i: Integer;
  SelectSQL:string;
begin

    if   fdqry1.Active then begin

     // Формируем SelectSQL

    if Pos('ORDER BY',AnsiUpperCase(fdqry1.SQL.Text)) > 0 then
      SelectSQL := LeftStr( fdqry1.SQL.Text, Pos('ORDER BY',AnsiUpperCase(fdqry1.SQL.Text))-1)
    else
      SelectSQL := fdqry1.SQL.Text ;
    if         DBGridEh1.SortMarkedColumns.Count <>0 then
       SelectSQL := SelectSQL + ' order By ';

    for i := 0 to DBGridEh1.SortMarkedColumns.Count-1 do
     if DBGridEh1.SortMarkedColumns[i].Title.SortMarker = smUpEh then begin
       SelectSQL := SelectSQL +
          IntToStr(DBGridEh1.SortMarkedColumns[i].Field.FieldNo) + ' DESC , ';
     end else begin
       SelectSQL := SelectSQL +
          IntToStr(DBGridEh1.SortMarkedColumns[i].Field.FieldNo) + ', ';
     end;
    if DBGridEh1.SortMarkedColumns.Count <>0 then
       SelectSQL := Copy(SelectSQL,1,Length(SelectSQL)-2);

    if fdqry1.Active then fdqry1.Close;
    fdqry1.SQL.Text := SelectSQL;
    fdqry1.Open();
  end;


end;

procedure TfPolisDMS.FormCreate(Sender: TObject);
begin
fdqry1.Open();
end;

procedure TfPolisDMS.FormDestroy(Sender: TObject);
begin
fdqry1.Close;
end;

end.
