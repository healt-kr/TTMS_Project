unit PartnerFrame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, FMX.ListView,
  FMX.TabControl, Data.DB, Datasnap.DBClient, System.Actions, FMX.ActnList,
  FMX.ScrollBox, FMX.Memo, FMX.Controls.Presentation, FMX.Edit, FMX.ListBox,
  FMX.Layouts;

type
  TFramePartner = class(TFrame)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    ListView1: TListView;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    담당자: TListBoxItem;
    연락처: TListBoxItem;
    WWW: TListBoxItem;
    메모: TListBoxItem;
    edtName: TEdit;
    edtPresident: TEdit;
    edtDepart: TEdit;
    edtStaff: TEdit;
    edtPhone: TEdit;
    edtWeb: TEdit;
    Memo1: TMemo;
    ActionList1: TActionList;
    ChangeTabAction1: TChangeTabAction;
    ClientDataSet2: TClientDataSet;
    ClientDataSet3: TClientDataSet;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    BindSourceDB2: TBindSourceDB;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    LinkControlToField6: TLinkControlToField;
    LinkControlToField7: TLinkControlToField;
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

uses DataModuleDataSnap;

procedure TFramePartner.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  with ClientDataSet2 do begin
    Close;
    ParamByName('serial').AsInteger
      := ClientDataSet3.FieldByName('serial').AsInteger;
    Open;
  end;

  ChangeTabAction1.Tab := TabItem2;
  ChangeTabAction1.ExecuteTarget(nil);
end;

end.
