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
    FrameEvent1: TFrameEvent;
    ListBoxItem3: TListBoxItem;
    FramePartner1: TFramePartner;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListBoxItem1Click(Sender: TObject);
    procedure ListBoxItem2Click(Sender: TObject);
    procedure ListBoxItem3Click(Sender: TObject);
  private
    { Private declarations }
    procedure HideAllFrames;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses DataModuleDataSnap;


{** 타이틀 변경 *}

procedure TfrmMain.HideAllFrames;
begin
  FrameEvent1.Align := TAlignLayout.None;
  FrameEvent1.Position.X := - FrameEvent1.Width;

  FramePartner1.Align := TAlignLayout.None;
  FramePartner1.Position.X := - FramePartner1.Width;
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
  FrameEvent1.Position.X := 1;
end;

procedure TfrmMain.ListBoxItem2Click(Sender: TObject);
begin
  HideAllFrames;

  MultiView1.HideMaster;
  FramePartner1.Position.X := 1;
end;

procedure TfrmMain.ListBoxItem3Click(Sender: TObject);
begin
  HideAllFrames;

  MultiView1.HideMaster;
  FramePartner1.Position.X := 1;
end;

procedure TfrmMain.SpeedButton1Click(Sender: TObject);
begin
  MultiView1.ShowMaster;
end;



end.
