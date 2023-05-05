unit Cronometro2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView, FMX.Edit,
  FMX.Layouts, FMX.ListBox;

type
  TFrmCronometro = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    TBIniciar: TButton;
    TBZerar: TButton;
    TBMarcar: TButton;
    Edit1: TEdit;
    LbContador: TLabel;
    Timer1: TTimer;
    ListBox1: TListBox;
    TBLimparLista: TButton;
    procedure Timer1Timer(Sender: TObject);
    procedure TBIniciarClick(Sender: TObject);
    procedure TBZerarClick(Sender: TObject);
    procedure TBMarcarClick(Sender: TObject);
    procedure TBLimparListaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCronometro: TFrmCronometro;
  h,m,s : Integer;



implementation

{$R *.fmx}

procedure TFrmCronometro.TBIniciarClick(Sender: TObject);
begin
 Timer1.Enabled := True;
end;

procedure TFrmCronometro.TBLimparListaClick(Sender: TObject);
begin
ListBox1.Clear;
end;

procedure TFrmCronometro.TBMarcarClick(Sender: TObject);
begin

if ((Edit1.Text = EmptyStr) or (Timer1.Enabled = False))  then
begin
  MessageDlg('Campo do nome vazio.', TMsgDlgType.mtInformation ,[TMsgDlgBtn.mbOK],0);
  Edit1.SetFocus;
  Exit
end else
begin
  ListBox1.Items.Add(Edit1.Text);
  ListBox1.Items.Add(LbContador.Text);
  ListBox1.Items.Add('-----------');
end;

end;

procedure TFrmCronometro.TBZerarClick(Sender: TObject);
begin
Timer1.Enabled := False;
Edit1.Text := '';
LbContador.Text := '00:00:00';
h := 0;
m := 0;
s := 0;

end;

procedure TFrmCronometro.Timer1Timer(Sender: TObject);
begin
 Inc(s);

 if h = 24 then
  begin
  //ShowMessage('24');
  Timer1.Enabled := False;
  end;

 if m = 60 then
  begin
  Inc(h);
  m:= 0;
  end;

 if s = 60 then
  begin
  Inc(m);
  s:= 0;
  end;

  LbContador.Text := Format('%.2d:%.2d:%.2d',[h,m,s])



end;

end.
