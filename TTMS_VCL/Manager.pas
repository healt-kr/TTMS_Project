unit Manager;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.VCLUI.Wait, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, Vcl.Grids, Vcl.DBGrids;

type
  TfrmManager = class(TForm)
    DataSource1: TDataSource;
    FDTable1: TFDTable;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBNavigator1: TDBNavigator;
    cbReservation: TCheckBox;
    cbCalculate: TCheckBox;
    cbBanking: TCheckBox;
    cbManager: TCheckBox;
    cbPackage: TCheckBox;
    cbHotel: TCheckBox;
    cbEvent: TCheckBox;
    cbMogaek: TCheckBox;
    cbSubul: TCheckBox;
    cbCancel: TCheckBox;
    cbBackup: TCheckBox;
    cbCustomer: TCheckBox;
    cbPartner: TCheckBox;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FDTable1AfterScroll(DataSet: TDataSet);
    procedure FDTable1BeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManager: TfrmManager;

implementation

{$R *.dfm}

uses DataModule, JSON;

{** 사용권한에 따라 해당 TCheckbox의 Checked 값을 설정
*}
procedure TfrmManager.FDTable1AfterScroll(DataSet: TDataSet);
var
  TJSONData: TJSONObject;
begin
  TJSONData := TJSONObject.ParseJSONValue(FDTable1.FieldByName('json_data').AsString)
    as TJSONObject;
  cbReservation.Checked := TJSONData.GetValue<Boolean>('authority.reservation');
  cbEvent.Checked       := TJSONData.GetValue<Boolean>('authority.event');
  cbMogaek.Checked      := TJSONData.GetValue<Boolean>('authority.mogaek');
  cbPartner.Checked     := TJSONData.GetValue<Boolean>('authority.partner');
  cbCalculate.Checked   := TJSONData.GetValue<Boolean>('authority.calculate');
  cbHotel.Checked       := TJSONData.GetValue<Boolean>('authority.hotel');
  cbSubul.Checked       := TJSONData.GetValue<Boolean>('authority.subul');
  cbCustomer.Checked    := TJSONData.GetValue<Boolean>('authority.customer');
  cbBanking.Checked     := TJSONData.GetValue<Boolean>('authority.banking');
  cbPackage.Checked     := TJSONData.GetValue<Boolean>('authority.package');
  cbCancel.Checked      := TJSONData.GetValue<Boolean>('authority.cancel');
  cbBackup.Checked      := TJSONData.GetValue<Boolean>('authority.backup');
  cbManager.Checked     := TJSONData.GetValue<Boolean>('authority.admin');
end;

procedure TfrmManager.FDTable1BeforePost(DataSet: TDataSet);
var
  JSONData, JSONAuthority: TJSONObject;
begin
  JSONAuthority := TJSONObject.Create;
  JSONAuthority.AddPair('reservation',  TJSONBool.Create(cbReservation.Checked));
  JSONAuthority.AddPair('event',        TJSONBool.Create(cbEvent.Checked));
  JSONAuthority.AddPair('mogaek',       TJSONBool.Create(cbMogaek.Checked));
  JSONAuthority.AddPair('partner',      TJSONBool.Create(cbPartner.Checked));
  JSONAuthority.AddPair('calculate',    TJSONBool.Create(cbCalculate.Checked));
  JSONAuthority.AddPair('hotel',        TJSONBool.Create(cbHotel.Checked));
  JSONAuthority.AddPair('subul',        TJSONBool.Create(cbSubul.Checked));
  JSONAuthority.AddPair('customer',     TJSONBool.Create(cbCustomer.Checked));
  JSONAuthority.AddPair('banking',      TJSONBool.Create(cbBanking.Checked));
  JSONAuthority.AddPair('package',      TJSONBool.Create(cbPackage.Checked));
  JSONAuthority.AddPair('cancel',       TJSONBool.Create(cbCancel.Checked));
  JSONAuthority.AddPair('backup',       TJSONBool.Create(cbBackup.Checked));
  JSONAuthority.AddPair('admin',        TJSONBool.Create(cbManager.Checked));

  JSONData := TJSONOBject.Create;
  JSONData.AddPair('authority', JSONAuthority);

  FDTable1.FieldByName('json_data').AsString := JSONData.ToString;

  JSONAuthority.Free;
//  JsonData.Free;
end;

procedure TfrmManager.FormActivate(Sender: TObject);
begin
  DataModule1.FDConnection1.Connected := True;;
  FDTable1.Open;
end;

procedure TfrmManager.FormDeactivate(Sender: TObject);
begin
  FDTable1.Close;
  DataModule1.FDConnection1.Connected := False;
end;

end.
