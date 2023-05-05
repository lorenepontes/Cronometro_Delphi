program Cronometro_2;

uses
  System.StartUpCopy,
  FMX.Forms,
  Cronometro2 in 'Cronometro2.pas' {FrmCronometro};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmCronometro, FrmCronometro);
  Application.Run;
end.
