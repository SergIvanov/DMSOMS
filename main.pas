unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, GridsEh, DBGridEh, ExtCtrls, DBCtrls, EhLibADO,
  Menus, StdCtrls, ComCtrls, DateUtils, ToolCtrlsEh, DBGridEhToolCtrls,
  DynVarsEh, EhLibVCL, DBAxisGridsEh;

type
  TfMain = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    Panel4: TPanel;
    Panel3: TPanel;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    Panel5: TPanel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Label3: TLabel;
    Label4: TLabel;
    N8: TMenuItem;
    N9: TMenuItem;
    N21: TMenuItem;
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure Panel2Exit(Sender: TObject);
    procedure Panel1Exit(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N21Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

uses DM, user, susl, polis, polisdms, sorg, sum,reestr2;

{$R *.dfm}




procedure TfMain.CheckBox1Click(Sender: TObject);
begin
 if CheckBox1.Checked then
 begin
  fDM.TBase.Active:=false;
  fDM.TBase.CommandText:='SELECT * FROM base WHERE D_zap BETWEEN :date AND :date2';
  fDM.TBase.Parameters.ParamByName('date').Value:=FormatDateTime('dd.mm.yyyy',DateTimePicker1.Date);
  fDM.TBase.Parameters.ParamByName('date2').Value:=FormatDateTime('dd.mm.yyyy',DateTimePicker2.Date);
  fDM.TBase.Active:=true;
 end else
 begin
  fDM.TBase.Active:=false;
  fDM.TBase.CommandText:='SELECT * FROM base';
  fDM.TBase.Active:=true;
 end;
end;

procedure TfMain.CheckBox2Click(Sender: TObject); //показать данные за мес€ц\год
begin
  if CheckBox2.Checked then
   begin
    fDM.TBase.Active:=false;
    if user.us<>'јдминистратор' then
    fDM.TBase.CommandText:='SELECT * FROM base where user='+quotedstr(us)
    else fDM.TBase.CommandText:='SELECT * FROM base';
    fDM.TBase.Active:=true;
   end else
   begin
    fDM.TBase.Active:=false;
    if user.us<>'јдминистратор' then
    fDM.TBase.CommandText:='SELECT * FROM base where user=('+quotedstr(us)+') AND (D_zap BETWEEN :date1 AND :date2)'
    else fDM.TBase.CommandText:='SELECT * FROM base where D_zap BETWEEN :date1 AND :date2';
    fDM.TBase.Parameters.ParamByName('date1').Value:=StartOfTheMonth(Date);
    fDM.TBase.Parameters.ParamByName('date2').Value:=EndOfTheMonth(Date);
    fDM.TBase.Active:=true;
   end;
end;

procedure TfMain.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

     if (Key=13) or (Key=9)  Then
   begin
    fDM.TBase.Edit;
  // fDM.TBase.FieldByName('D_Zap').Value:=Date;
    fDM.TBase.Post;
   end;



end;

procedure TfMain.DBGridEh2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

 if (Key=13) or (Key=9) Then
 begin
fDM.TUsl.Edit;
fDM.TUsl.Post;
 end;

end;

procedure TfMain.FormCreate(Sender: TObject);
begin
 DateTimePicker1.Date:=Date;
 DateTimePicker2.Date:=Date;



end;

procedure TfMain.FormShow(Sender: TObject);
begin
 fUser.ShowModal;
end;

procedure TfMain.N21Click(Sender: TObject);
begin
         Freestr2.ShowModal;


end;

procedure TfMain.N5Click(Sender: TObject);
begin
 fUsl.Show;
end;

procedure TfMain.N6Click(Sender: TObject);
begin
 fPolis.Show;
end;

procedure TfMain.N7Click(Sender: TObject);
begin
 fPolisDMS.Show;
end;

procedure TfMain.N8Click(Sender: TObject);
begin
 fOrg.ShowModal;
end;

procedure TfMain.N9Click(Sender: TObject);
begin
fSum.ShowModal;
end;

procedure TfMain.Panel1Exit(Sender: TObject);
begin
 if fDM.TBase.Modified Then fDM.TBase.Post;
end;

procedure TfMain.Panel2Exit(Sender: TObject);
begin
 if fDM.TUsl.Modified Then fDM.TUsl.Post;
end;

end.
