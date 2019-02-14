program TTMS_FMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  EventForm in 'EventForm.pas' {MainForm},
  DataModuleDataSnap in 'DataModuleDataSnap.pas' {DMDataSnap: TDataModule},
  EventFrame in 'EventFrame.pas' {FrameEvent: TFrame},
  PartnerFrame in 'PartnerFrame.pas' {Frame1: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDMDataSnap, DMDataSnap);
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
