unit sorg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, ExtCtrls, GridsEh, DBGridEh, DBCtrls;

type
  TfOrg = class(TForm)
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fOrg: TfOrg;

implementation

uses DM;

{$R *.dfm}

end.
