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

{** 행사기간 입력시 몇박 몇일을 자동으로 계산
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

{** 년월일(TDate)을 세개의 TEdit.Text에저장
  @param Date 년월일
  @param Year 년도 TEdit
  @param Month 월  TEdit
  @param Day 일    TEdit
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

{** 월일시분을 네개의 TEdit에 입력
  @param Time 년월일
  @param Month 월 TMonth
  @param Day 일  TEdit
  @param Hour 시  TEdit
  @param Minute 분
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

{** 행사 테이블의 레코드 이동시 TEdit를 사용하는 Field 값을 반영
*}
procedure TfrmEvent.FDTable1AfterScroll(DataSet: TDataSet);
begin
  with FDTable1 do
  begin
    // DB의 행사기간을 TEdit.Text에 반영
    SetDate2Edit(FieldByName('event_start_date').AsDateTime,
      edtFromYear, edtFromMonth, edtFromDay);
    SetDate2Edit(FieldByName('event_end_date').AsDateTime,
      edtToYear, edtToMonth, edtToDay);

    // DB의 항공 출발시간을 TEdit.Text에 반영
    SetTime2Edit(FieldByName('start_time').AsDateTime,
      edtDepartMonth, edtDepartDay, edtDepartHour, edtDepartMinute);

    // DB의 현지 출발시간을 TEdit.Text에 반영
    SetTime2Edit(FieldByName('local_start_time').AsDateTime,
      edtLocalMonth, edtLocalDay, edtLocalHour, edtLocalMinute);
  end;
end;

{**
  1. TEdit를 사용하는 필드(행사기간, 항공출발, 현지출발)에 데이터를 반영
  2. 수정시간 업데이트
*}
procedure TfrmEvent.FDTable1BeforePost(DataSet: TDataSet);
var
  EventStartDate, EventEndDate: TDate;
  DepartTime, LocalTime: TDateTime;
begin
  // 행사기간(TDate)을 구한다
  EventStartDate := EncodeDate(StrToInt(edtFromYear.Text),
    StrToInt(edtFromMonth.Text), StrToInt(edtFromDay.Text));
  EventEndDate := EncodeDate(StrToInt(edtToYear.Text),
    StrToInt(edtToMonth.Text), StrToInt(edtToDay.Text));

  // 항공 출발 시간(TDateTime)을 구한다
  DepartTime := EncodeDateTime(StrToInt(edtFromYear.Text),
    StrToInt(edtDepartMonth.Text), StrToInt(edtDepartDay.Text),
    StrToInt(edtDepartHour.Text), StrToInt(edtDepartMinute.Text), 0, 0);

  // 현지 출발 시간(TDateTime)을 구한다
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


{** 새 레코드 추가시 사용하는 serial 구한다
  @return 새로운 serial의 문자열
  일련번호(serial) 생성 yyyymmdd001 ex) 20190131001
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

    // 오늘날짜의 예약이 없을 때 '001' 부터 시작
    if FieldByName('serial').AsString = '' then
      result := formatDateTime('yyyymmdd', now) + '001'
    // 오늘 날짜의 예약이 있으면 1 증가
    else begin
      Serial := StrToInt(Copy(FieldByName('serial').AsString, 9, 3));
      result := formatDateTime('yyyymmdd', now) + IntToStr(Serial + 1);
    end;
  end;
end;

{** 행사 테이블에 새 레코드 추가시
  1. 새로운 일련번호 생성
  2. 접수일과 진행앵을 오늘 날짜로
  3. 담당자를 로그인한 사용자로
  4. 최초작성시간을 지금으로
  5. 행사기간의 년도를 올해로,  월일은 Clear
  6. 항공출발시간을 Clear
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

  // 5. 행사기간의 년도를 올해로,  월일은 Clear
  edtFromYear.Text := NowYear;    edtToYear.Text := NowYear;
  edtFromMonth.Clear;             edtToMonth.Clear;
  edtFromDay.Clear;               edtToDay.Clear;

  // 6. 항공출발시간을 Clear
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
