unit susl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, GridsEh, DBGridEh, DBCtrls, ExtCtrls, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, DBAxisGridsEh, Data.DB, Data.Win.ADODB;

type
  TfUsl = class(TForm)
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    ds1: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fUsl: TfUsl;

implementation

uses DM;

{$R *.dfm}

end.
