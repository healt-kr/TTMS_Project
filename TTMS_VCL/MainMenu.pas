unit MainMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls;

type
  TfrmMenu = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    edtPass: TEdit;
    btnPass: TButton;
    Panel1: TPanel;
    btnReservation: TButton;
    btnEvent: TButton;
    btnManager: TButton;
    btnTourist: TButton;
    btnPartner: TButton;
    btnCalculate: TButton;
    btnHotel: TButton;
    btnSubul: TButton;
    btnCustomer: TButton;
    btnBanking: TButton;
    btnCancel: TButton;
    btnBackup: TButton;
    Image1: TImage;
    procedure btnReservationClick(Sender: TObject);
    procedure edtPassKeyPress(Sender: TObject; var Key: Char);
    procedure btnManagerClick(Sender: TObject);
    procedure btnTouristClick(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure btnEventClick(Sender: TObject);
    procedure btnPartnerClick(Sender: TObject);
    procedure btnHotelClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetAllButton;
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

implementation

{$R *.dfm}

uses JSON, DataModule, EventManager, Manager, TouristStatusForm, CustomerForm,
  ManageEventForm, PartnerForm, HotelForm;

{** DB에서 사용권한을 읽어와서
  해당 버튼의 Enable을 설정한다
*}
procedure TfrmMenu.SetAllButton;
var
  JSONData: TJSONObject;
begin
    with DataModule1.FDQueryManager do
    begin
      Close;
      ParamByName('pass').AsString := edtPass.Text;
      Open;

      if FieldByName('name').AsString = '' then
      begin
        ShowMessage('일치하는 사용자가 없습니다');
        Exit
      end
      else begin
        JSONData := TJSONObject.ParseJSONValue(FieldByName('json_data').AsString)
    as TJSONObject;
        btnReservation.Enabled := JSONData.GetValue<Boolean>('authority.reservation');
        btnEvent.Enabled       := JSONData.GetValue<Boolean>('authority.event');
        btnTourist.Enabled     := JSONData.GetValue<Boolean>('authority.mogaek');
        btnPartner.Enabled     := JSONData.GetValue<Boolean>('authority.partner');
        btnCalculate.Enabled   := JSONData.GetValue<Boolean>('authority.calculate');
        btnHotel.Enabled       := JSONData.GetValue<Boolean>('authority.hotel');
        btnSubul.Enabled       := JSONData.GetValue<Boolean>('authority.subul');
        btnCustomer.Enabled    := JSONData.GetValue<Boolean>('authority.customer');
        btnBanking.Enabled     := JSONData.GetValue<Boolean>('authority.banking');
        btnCancel.Enabled      := JSONData.GetValue<Boolean>('authority.cancel');
        btnBackup.Enabled      := JSONData.GetValue<Boolean>('authority.backup');
        btnManager.Enabled     := JSONData.GetValue<Boolean>('authority.admin');
      end;
    end;
end;

procedure TfrmMenu.btnReservationClick(Sender: TObject);
begin
  frmEvent.Show;
end;

procedure TfrmMenu.btnTouristClick(Sender: TObject);
begin
  frmTouristStatus.Show;
end;

procedure TfrmMenu.btnCustomerClick(Sender: TObject);
begin
  frmCustomer.Show;
end;

procedure TfrmMenu.btnEventClick(Sender: TObject);
begin
  frmManageEvent.Show;
end;

procedure TfrmMenu.btnHotelClick(Sender: TObject);
begin
  frmHotel.Show;
end;

procedure TfrmMenu.btnManagerClick(Sender: TObject);
begin
  frmManager.Show;
end;

procedure TfrmMenu.btnPartnerClick(Sender: TObject);
begin
   frmPartner.Show;
end;

procedure TfrmMenu.edtPassKeyPress(Sender: TObject; var Key: Char);
begin
  if ord(Key) = VK_RETURN then
  begin
    Key := #0; // prevent beeping
    SetAllButton;
  end;
end;

end.
