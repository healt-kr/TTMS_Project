unit EventManager;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Vcl.ExtCtrls, Vcl.DBCtrls, Data.Bind.Components,
  Data.Bind.DBScope, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.ComCtrls, Vcl.WinXPickers,
  Vcl.WinXCalendars;

type
  TfrmEvent = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    DBText1: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    DBTextReservationDate: TDBText;
    DBTextProcessDate: TDBText;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    DBNavigator1: TDBNavigator;
    DBEditManagerName: TDBEdit;
    edtPartner: TDBEdit;
    DBEditEvent: TDBEdit;
    DBEditNight: TDBEdit;
    DBEditDay: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit17: TDBEdit;
    DBEditHotel: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    edtDepartHour: TEdit;
    edtDepartMinute: TEdit;
    edtLocalHour: TEdit;
    edtLocalMinute: TEdit;
    edtFromYear: TEdit;
    edtFromMonth: TEdit;
    edtFromDay: TEdit;
    edtToYear: TEdit;
    edtToMonth: TEdit;
    edtToDay: TEdit;
    edtDepartMonth: TEdit;
    edtDepartDay: TEdit;
    edtLocalMonth: TEdit;
    edtLocalDay: TEdit;
    DataSource1: TDataSource;
    FDTable1: TFDTable;
    FDQuerySerial: TFDQuery;
    btnPost: TButton;
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FDTable1NewRecord(DataSet: TDataSet);
    procedure FDTable1BeforePost(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EventDateExit(Sender: TObject);
    procedure FDTable1AfterScroll(DataSet: TDataSet);
    procedure btnPostClick(Sender: TObject);
    procedure DBEditEventDblClick(Sender: TObject);
    procedure edtPartnerDblClick(Sender: TObject);
    procedure DBEditHotelDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetDate2Edit(Date: TDate; edtYear: TEdit; edtMonth: TEdit; edtDay: TEdit);
    procedure SetTime2edit(Time: TDateTime; edtMonth: TEdit; edtDay: TEdit; edtHour: TEdit; edtMinute: TEdit);
    function GetNewSerial: string;
  public
    { Public declarations }
  end;

var
  frmEvent: TfrmEvent;

implementation

{$R *.dfm}

uses DataModule, DateUtils, MyLib, SearchForm;

{** ���Ⱓ �Է½� ��� ������ �ڵ����� ���
*}
procedure TfrmEvent.btnPostClick(Sender: TObject);
begin
  FDTable1.Post;
end;

procedure TfrmEvent.DBEditHotelDblClick(Sender: TObject);
begin
  frmSearch.DataSource1.DataSet := frmSearch.FDTableHotel;
  frmSearch.FDTableHotel.Open;

  if frmSearch.ShowModal = mrOk then
  begin
    FDTable1.Edit;
    FDTable1.FieldByName('hotel_name').AsString := frmSearch.SearchResult;
  end;

  frmSearch.FDTableEvent.Close;
end;

procedure TfrmEvent.DBEditEventDblClick(Sender: TObject);
begin
  frmSearch.DataSource1.DataSet := frmSearch.FDTableEvent;
  frmSearch.FDTableEvent.Open;

  if frmSearch.ShowModal = mrOk then
  begin
    FDTable1.Edit;
    FDTable1.FieldByName('event_name').AsString := frmSearch.SearchResult;
  end;

  frmSearch.FDTableEvent.Close;
end;

procedure TfrmEvent.edtPartnerDblClick(Sender: TObject);
begin
  frmSearch.DataSource1.DataSet := frmSearch.FDTablePartner;
  frmSearch.FDTablePartner.Open;

  if frmSearch.ShowModal = mrOk then
  begin
    FDTable1.Edit;
    FDTable1.FieldByName('partner_name').AsString := frmSearch.SearchResult;
  end;

  frmSearch.FDTablePartner.Close;
end;

procedure TfrmEvent.EventDateExit(Sender: TObject);
var
  fromDate, toDate : TDate;
  Night: Integer;
begin
  Convert3TextToDate(fromDate, edtFromYear.Text, edtFromMonth.Text, edtFromDay.Text);
  Convert3TextToDate(ToDate, edtToYear.Text, edtToMonth.Text, edtToDay.Text);

//  fromDate := EncodeDate(StrToInt(edtFromYear.Text),
//    StrToInt(edtFromMonth.Text), StrToInt(edtFromDay.Text));
//  toDate := EncodeDate(StrToInt(edtToYear.Text),
//    StrToInt(edtToMonth.Text), StrToInt(edtToDay.Text));

  if (toDate <> 0) and (fromDate <> 0) then
  begin
    Night := DaysBetween(toDate, fromDate);
    with FDTable1 do
    begin
      Edit;
      FieldByName('night').AsString := IntToStr(Night);
      DBEditNight.Text := IntToStr(Night);
      FieldByName('day').AsString := IntToStr(Night + 1);
      DBEditDay.Text := IntToStr(Night + 1);
    end;
  end;

end;

{** �����(TDate)�� ������ TEdit.Text������
  @param Date �����
  @param Year �⵵ TEdit
  @param Month �� TMonth
  @param Day ��  TEdit
*}
procedure TfrmEvent.SetDate2Edit(Date: TDate; edtYear: TEdit; edtMonth: TEdit; edtDay: TEdit);
var
  Year, Month, Day: Word;
begin
    if Date = 0 then
    begin
      edtYear.Clear;
      edtMonth.Clear;
      edtDay.Clear;
    end  else
    begin
      DecodeDate(Date, Year, Month, Day);
      edtYear.Text := IntToStr(Year);
      edtMonth.Text := IntToStr(Month);
      edtDay.Text := IntToStr(Day);
    end;
end;

{** ���Ͻú��� �װ��� TEdit�� �Է�
  @param Time �����
  @param Month �� TMonth
  @param Day ��  TEdit
  @param Hour ��  TEdit
  @param Minute ��
+}
procedure TfrmEvent.SetTime2edit(Time: TDateTime; edtMonth: TEdit; edtDay: TEdit; edtHour: TEdit; edtMinute: TEdit);
var
  Year, Month, Day, Hour, Minute, Second, Mili: Word;
begin
  if Time = 0 then
  begin
    edtMonth.Clear;
    edtDay.Clear;
    edtHour.Clear;
    edtMinute.Clear;
  end
  else begin
    DecodeDateTime(Time, Year, Month, Day, Hour, Minute, Second, Mili);
    edtMonth.Text   := IntToStr(Month);
    edtDay.Text     := IntToStr(Day);
    edtHour.Text    := IntToStr(Hour);
    edtMinute.Text  := IntToStr(Minute);
  end;
end;

{** ��� ���̺��� ���ڵ� �̵��� TEdit�� ����ϴ� Field ���� �ݿ�
*}
procedure TfrmEvent.FDTable1AfterScroll(DataSet: TDataSet);
begin
  with FDTable1 do
  begin
    // DB�� ���Ⱓ�� TEdit.Text�� �ݿ�
    SetDate2Edit(FieldByName('event_start_date').AsDateTime,
      edtFromYear, edtFromMonth, edtFromDay);
    SetDate2Edit(FieldByName('event_end_date').AsDateTime,
      edtToYear, edtToMonth, edtToDay);

    // DB�� �װ� ��߽ð��� TEdit.Text�� �ݿ�
    SetTime2Edit(FieldByName('start_time').AsDateTime,
      edtDepartMonth, edtDepartDay, edtDepartHour, edtDepartMinute);

    // DB�� ���� ��߽ð��� TEdit.Text�� �ݿ�
    SetTime2Edit(FieldByName('local_start_time').AsDateTime,
      edtLocalMonth, edtLocalDay, edtLocalHour, edtLocalMinute);
  end;
end;

{**
  1. TEdit�� ����ϴ� �ʵ�(���Ⱓ, �װ����, �������)�� �����͸� �ݿ�
  2. �����ð� ������Ʈ
*}
procedure TfrmEvent.FDTable1BeforePost(DataSet: TDataSet);
var
  EventStartDate, EventEndDate: TDate;
  DepartTime, LocalTime: TDateTime;
begin
  // ���Ⱓ(TDate)�� ���Ѵ�
  EventStartDate := EncodeDate(StrToInt(edtFromYear.Text),
    StrToInt(edtFromMonth.Text), StrToInt(edtFromDay.Text));
  EventEndDate := EncodeDate(StrToInt(edtToYear.Text),
    StrToInt(edtToMonth.Text), StrToInt(edtToDay.Text));

  // �װ� ��� �ð�(TDateTime)�� ���Ѵ�
  DepartTime := EncodeDateTime(StrToInt(edtFromYear.Text),
    StrToInt(edtDepartMonth.Text), StrToInt(edtDepartDay.Text),
    StrToInt(edtDepartHour.Text), StrToInt(edtDepartMinute.Text), 0, 0);

  // ���� ��� �ð�(TDateTime)�� ���Ѵ�
  LocalTime := EncodeDateTime(StrToInt(edtFromYear.Text),
    StrToInt(edtLocalMonth.Text), StrToInt(edtLocalDay.Text),
    StrToInt(edtLocalHour.Text), StrToInt(edtLocalMinute.Text), 0, 0);

  with FDTable1 do
  begin
    FieldByName('event_start_date').AsDateTime  := EventStartDate;
    FieldByName('event_end_date').AsDateTime    := EventEndDate;
    FieldByName('start_time').AsDateTime        := DepartTime;
    FieldByName('local_start_time').AsDateTime  := EventEndDate;
    FieldByName('modified_at').AsDateTime       := now;
  end;
end;


{** �� ���ڵ� �߰��� ����ϴ� serial ���Ѵ�
  @return ���ο� serial�� ���ڿ�
  �Ϸù�ȣ(serial) ���� yyyymmdd001 ex) 20190131001
*}
function TfrmEvent.GetNewSerial: string;
var
  Serial: Integer;
begin
  with FDQuerySerial do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT serial FROM event WHERE serial like "'
      + formatDateTime('yyyymmdd', now) + '%" ORDER BY serial DESC');
    Open;

    // ���ó�¥�� ������ ���� �� '001' ���� ����
    if FieldByName('serial').AsString = '' then
      result := formatDateTime('yyyymmdd', now) + '001'
    // ���� ��¥�� ������ ������ 1 ����
    else begin
      Serial := StrToInt(Copy(FieldByName('serial').AsString, 9, 3));
      result := formatDateTime('yyyymmdd', now) + IntToStr(Serial + 1);
    end;
  end;
end;

{** ��� ���̺��� �� ���ڵ� �߰���
  1. ���ο� �Ϸù�ȣ ����
  2. �����ϰ� ������� ���� ��¥��
  3. ����ڸ� �α����� ����ڷ�
  4. �����ۼ��ð��� ��������
  5. ���Ⱓ�� �⵵�� ���ط�,  ������ Clear
  6. �װ���߽ð��� Clear
*}
procedure TfrmEvent.FDTable1NewRecord(DataSet: TDataSet);
var
  NowDate: string;
  NowYear: string;
begin
  NowDate := formatDateTime('yyyy-mm-dd', now);
  NowYear := formatDateTime('yyyy', now);

  // 1 ~ 4
  with FDTable1 do
  begin
    FieldByName('serial').AsString := GetNewSerial;
    FieldByName('reservation_date').AsString := NowDate;
    FieldByName('process_date').AsString := NowDate;
    FieldByName('manager_name').AsString := DataModule1.FDQueryManager.FieldByName('name').AsString;
    FieldByName('created_at').AsDateTime := now;
  end;
  DBTextReservationDate.Field.AsString := NowDate;

  // 5. ���Ⱓ�� �⵵�� ���ط�,  ������ Clear
  edtFromYear.Text := NowYear;    edtToYear.Text := NowYear;
  edtFromMonth.Clear;             edtToMonth.Clear;
  edtFromDay.Clear;               edtToDay.Clear;

  // 6. �װ���߽ð��� Clear
  edtDepartMonth.Clear;           edtLocalMonth.Clear;
  edtDepartDay.Clear;             edtLocalDay.Clear;
  edtDepartHour.Clear;            edtLocalHour.Clear;
  edtDepartMinute.Clear;          edtLocalMinute.Clear;

  edtPartner.SetFocus;
end;


procedure TfrmEvent.FormActivate(Sender: TObject);
begin
  FDTable1.Open;
end;

procedure TfrmEvent.FormDeactivate(Sender: TObject);
begin
  FDTable1.Close;
end;

procedure TfrmEvent.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    SelectNext(Activecontrol, True, True);
end;


end.