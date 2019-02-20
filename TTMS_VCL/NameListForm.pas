unit NameListForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TfrmNameList = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    LabeledEdit1: TLabeledEdit;
    Bevel2: TBevel;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    btnPost: TButton;
    ¿¢¼¿: TButton;
    Button4: TButton;
    Label11: TLabel;
    edtDepartMonth: TLabeledEdit;
    edtDepartDay: TLabeledEdit;
    edtDepartHour: TLabeledEdit;
    edtDepartMinute: TLabeledEdit;
    edtDepartPlace: TLabeledEdit;
    edtReturnPlace: TLabeledEdit;
    edtReturnMInute: TLabeledEdit;
    edtReturnHour: TLabeledEdit;
    edtReturnDay: TLabeledEdit;
    edtReturnMonth: TLabeledEdit;
    LabeledEdit6: TLabeledEdit;
    LabeledEdit7: TLabeledEdit;
    LabeledEdit8: TLabeledEdit;
    ScrollBox1: TScrollBox;
    Panel3: TPanel;
    Panel4: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit7: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Edit8: TEdit;
    Panel5: TPanel;
    Label10: TLabel;
    Label12: TLabel;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Label13: TLabel;
    Edit17: TEdit;
    LabeledEdit9: TLabeledEdit;
    LabeledEdit10: TLabeledEdit;
    LabeledEdit11: TLabeledEdit;
    LabeledEdit12: TLabeledEdit;
    Label1: TLabel;
    Label14: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Button5: TButton;
    Label15: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNameList: TfrmNameList;

implementation

{$R *.dfm}

uses RoomingListForm;


procedure TfrmNameList.Button1Click(Sender: TObject);
begin
  frmRoomingList.Show;
end;

end.
