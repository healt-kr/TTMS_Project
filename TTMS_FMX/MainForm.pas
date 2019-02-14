unit MainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FMX.ListView, FMX.Controls.Presentation, FMX.StdCtrls,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait, FMX.Edit,
  FMX.Objects, FMX.ListBox, FMX.Layouts, FMX.MultiView, FMX.TabControl,
  System.Actions, FMX.ActnList, FMX.DateTimeCtrls, Datasnap.DBClient,
  FMX.Calendar, FMX.Gestures, EventFrame, PartnerFrame;

type
  TfrmMain = class(TForm)
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    Text1: TText;
    MultiView1: TMultiView;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    StyleBook1: TStyleBook;
    ListBoxItem3: TListBoxItem;
    Layout1: TLayout;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListBoxItem1Click(Sender: TObject);
    procedure ListBoxItem2Click(Sender: TObject);
    procedure ListBoxItem3Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure HideFrame(Frame: TFrame);
    procedure HideAllFrames;
  public
    { Public declarations }
    FrameEvent1: TFrameEvent;
    FramePartner1: TFramePartner;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses DataModuleDataSnap;


procedure TfrmMain.HideFrame(Frame: TFrame);
begin
  if Frame <> nil then
  begin
    Frame.Align := TAlignLayout.None;
    Frame.Position.X := - Frame.Width;
  end;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  if FrameEvent1 <> nil then
    FrameEvent1.Free;
  if FramePartner1 <> nil then
    FramePartner1.Free;
end;

procedure TfrmMain.HideAllFrames;
begin
  HideFrame(FrameEvent1);
  HideFrame(FramePartner1);
end;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  DMDataSnap.SQLConnection1.Connected := True;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  MultiView1.Mode := TMultiViewMode.Drawer;

  HideAllFrames;
end;

procedure TfrmMain.ListBoxItem1Click(Sender: TObject);
begin
  HideAllFrames;

  MultiView1.HideMaster;

  if FrameEvent1 = nil then
  begin
    FrameEvent1 := TFrameEvent.Create(Self);
    FrameEvent1.Parent := Self;
    FrameEvent1.Align := TAlignLayout.None;
  end;

  FrameEvent1.Position.X := 1;
  FrameEvent1.Align := TAlignLayout.Client;
end;

procedure TfrmMain.ListBoxItem2Click(Sender: TObject);
begin
  HideAllFrames;

  MultiView1.HideMaster;
end;

procedure TfrmMain.ListBoxItem3Click(Sender: TObject);
begin
  HideAllFrames;

  MultiView1.HideMaster;

  if FramePartner1 = nil then
  begin
    FramePartner1 := TFramePartner.Create(Self);
    FramePartner1.Parent := Self;
    FramePartner1.Align := TAlignLayout.None;
  end;

  FramePartner1.Position.X := 1;
  FramePartner1.Align := TAlignLayout.Client;
end;

procedure TfrmMain.SpeedButton1Click(Sender: TObject);
begin
  MultiView1.ShowMaster;
end;



end.
