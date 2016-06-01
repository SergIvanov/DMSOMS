unit user;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, DateUtils;

type
  TfUser = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    ComboBox1: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fUser: TfUser;
  us:string;

implementation

uses DM, main;

{$R *.dfm}

procedure TfUser.Button1Click(Sender: TObject);
var i:integer;
begin
 i:=ComboBox1.ItemIndex;
 if i>0 then
 begin
 us:=ComboBox1.Items[i];
 fDM.TBase.Active:=false;
 if us<>'Администратор' then
 begin
// fDM.TBase.CommandText:='SELECT * FROM Base WHERE user=:user';
 fDM.TBase.CommandText:='SELECT * FROM base where (user=:user) AND (D_zap BETWEEN :date1 AND :date2)';
 fDM.TBase.Parameters.ParamByName('date1').Value:=StartOfTheMonth(Date);
 fDM.TBase.Parameters.ParamByName('date2').Value:=EndOfTheMonth(Date);

 fDM.TBase.Parameters.ParamByName('user').Value:=us;
 fDM.TBase.Active:=true;
 fUser.Close;
 end;
 if us='Администратор' then
 begin
// fDM.TBase.CommandText:='SELECT * FROM Base';
 fDM.TBase.CommandText:='SELECT * FROM base where D_zap BETWEEN :date1 AND :date2';
 fDM.TBase.Parameters.ParamByName('date1').Value:=StartOfTheMonth(Date);
 fDM.TBase.Parameters.ParamByName('date2').Value:=EndOfTheMonth(Date);
 fDM.TBase.Active:=true;
 fUser.Close;
 end;
 end else
 begin
  fUser.Close;
  fMain.Close;
 end;
end;

procedure TfUser.FormCreate(Sender: TObject);
var i:integer;
begin
 fDM.QUser.SQL.Clear;
 fDM.QUser.SQL.Add('SELECT User.Naim FROM [User]');
 fDM.QUser.Open;
 i:=1;
 while not fDM.QUser.Eof do begin
 Combobox1.Items[i]:=fDM.QUser.FieldByName('Naim').AsString;
 inc(i);
 fDM.QUser.Next;
end;
end;

end.

