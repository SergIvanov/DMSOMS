unit sum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, GridsEh, DBGridEh, ComCtrls, StdCtrls, DateUtils;

type
  TfSum = class(TForm)
    Button1: TButton;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    DBGridEh1: TDBGridEh;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fSum: TfSum;

implementation

uses DM;

{$R *.dfm}

procedure TfSum.Button1Click(Sender: TObject);
var q:string;
begin
 //q:='Select sum(Price) as summa From Uslugy inner join Base On uslugy.base_id=base.id WHERE base_id='+fDM.TBase.FieldByName('id').AsString;
 fDM.QSumma.Close;
 fDM.QSumma.SQL.Clear;
 q:='Select sum(Price) as summa, USER From Uslugy inner join Base On uslugy.base_id=base.id WHERE (D_Zap Between :date1 And :date2) GROUP BY USER';
 fDM.QSumma.SQL.Add(q);
 fDM.QSumma.Parameters.ParamByName('date1').Value:=FormatDateTime('dd.mm.yyyy',DateTimePicker1.Date);
 fDM.QSumma.Parameters.ParamByName('date2').Value:=FormatDateTime('dd.mm.yyyy',DateTimePicker2.Date);
 fDM.QSumma.Open;
 //fDM.QSum.FieldByName('summa').AsString;

 end;

procedure TfSum.FormClose(Sender: TObject; var Action: TCloseAction);
begin
fDM.QSumma.Close;
end;

procedure TfSum.FormCreate(Sender: TObject);
begin
 DateTimePicker1.Date:=StartOfTheMonth(Date);
 DateTimePicker2.Date:=EndOfTheMonth(Date);
end;

end.
