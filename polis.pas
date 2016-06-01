unit polis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, GridsEh, DBGridEh, ExtCtrls, StdCtrls, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  Data.DB, FireDAC.Comp.DataSet, EhLibVCL, DBAxisGridsEh,DBUtilsEh;

type
  TfPolis = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ds1: TDataSource;
    fdqry1: TFDQuery;
    dbgrdh1: TDBGridEh;
    procedure FormShow(Sender: TObject);
    procedure dbgrdh1ApplyFilter(Sender: TObject);
    procedure dbgrdh1SortMarkingChanged(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPolis: TfPolis;

implementation

uses DM;

{$R *.dfm}

procedure TfPolis.dbgrdh1ApplyFilter(Sender: TObject);
begin

TDBGridEh(Sender).DataSource.DataSet.Filter :=
      GetExpressionAsFilterString(TDBGridEh(Sender),
        GetOneExpressionAsLocalFilterString, nil, False, True);

end;

function LeftStr(const Str: string; Size: Word): string;
begin
  LeftStr := Copy(Str, 1, Size)
end {LeftStr};
procedure TfPolis.dbgrdh1SortMarkingChanged(Sender: TObject);
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
    if dbgrdh1.SortMarkedColumns.Count <>0 then
       SelectSQL := SelectSQL + ' order By ';

    for i := 0 to dbgrdh1.SortMarkedColumns.Count-1 do
     if dbgrdh1.SortMarkedColumns[i].Title.SortMarker = smUpEh then begin
       SelectSQL := SelectSQL +
          IntToStr(dbgrdh1.SortMarkedColumns[i].Field.FieldNo) + ' DESC , ';
     end else begin
       SelectSQL := SelectSQL +
          IntToStr(dbgrdh1.SortMarkedColumns[i].Field.FieldNo) + ', ';
     end;
    if dbgrdh1.SortMarkedColumns.Count <>0 then
       SelectSQL := Copy(SelectSQL,1,Length(SelectSQL)-2);

    if fdqry1.Active then fdqry1.Close;
    fdqry1.SQL.Text := SelectSQL;
    fdqry1.Open();
  end;





end;

procedure TfPolis.FormClose(Sender: TObject; var Action: TCloseAction);
begin
fdqry1.Close;
end;

procedure TfPolis.FormShow(Sender: TObject);
begin
 //fDM.TPolis.Active:=true;
 fdqry1.Open();
// fdqry1.Active:=True;
end;

end.
