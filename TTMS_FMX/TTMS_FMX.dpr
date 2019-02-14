program TTMS_FMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  MainForm in 'MainForm.pas' {frmMain},
  DataModuleDataSnap in 'DataModuleDataSnap.pas' {DMDataSnap: TDataModule},
  EventFrame in 'EventFrame.pas' {FrameEvent: TFrame},
  PartnerFrame in 'PartnerFrame.pas' {FramePartner: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDMDataSnap, DMDataSnap);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
