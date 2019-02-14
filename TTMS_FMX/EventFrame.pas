unit EventFrame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListBox, FMX.DateTimeCtrls, FMX.Layouts, FMX.Controls.Presentation,
  FMX.Edit, FMX.ListView, FMX.TabControl, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.DB,
  Datasnap.DBClient, Data.Bind.Components, Data.Bind.DBScope, System.Actions,
  FMX.ActnList, FMX.Gestures;

type
  TFrameEvent = class(TFrame)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    ListView1: TListView;
    TabItem2: TTabItem;
    edtPartner: TEdit;
    ListBox2: TListBox;
    ListBoxItem3: TListBoxItem;
    edtManager: TEdit;
    ListBoxItem4: TListBoxItem;
    edtEvent: TEdit;
    ListBoxItem5: TListBoxItem;
    DateEditFrom: TDateEdit;
    ListBoxItem6: TListBoxItem;
    DateEditTo: TDateEdit;
    ListBoxItem9: TListBoxItem;
    edtNight: TEdit;
    Label1: TLabel;
    edtDay: TEdit;
    Label2: TLabel;
    ListBoxItem7: TListBoxItem;
    edtCustomer: TEdit;
    ListBoxItem8: TListBoxItem;
    edtMobile: TEdit;
    Button1: TButton;
    ListBoxHeader1: TListBoxHeader;
    GestureManager1: TGestureManager;
    ActionList1: TActionList;
    NextTabAction1: TNextTabAction;
    PreviousTabAction1: TPreviousTabAction;
    ChangeTabAction1: TChangeTabAction;
    ClientDataSet1: TClientDataSet;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    LinkControlToField6: TLinkControlToField;
    LinkControlToField7: TLinkControlToField;
    procedure TabControl1Change(Sender: TObject);
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

uses EventForm, MainForm;

procedure TFrameEvent.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  NextTabAction1.Execute;
end;

procedure TFrameEvent.TabControl1Change(Sender: TObject);
begin
  if TabControl1.ActiveTab = TabItem1 then
      frmMain.Text1.Text := '행사 목록'
  else if TabControl1.ActiveTab = TabItem2 then
      frmMain.Text1.Text := '행사 정보';
end;

end.
