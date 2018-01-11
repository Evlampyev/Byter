unit Registration;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFormRegistration = class(TForm)
    Button1: TButton;
    NameEdit: TEdit;
    Klass: TComboBox;
    KlassLetter: TComboBox;
    LastNameEdit: TEdit;
    Panel1: TPanel;
    procedure LastNameEditClick(Sender: TObject);
    procedure NameEditClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRegistration: TFormRegistration;

implementation

{$R *.dfm}

Uses ��������;

procedure TFormRegistration.Button1Click(Sender: TObject);
Var
  Len, i : Byte;
  Incorrect: Boolean;
  Sln, Sn : String;
  SendText: UnicodeString;
  s: TStringStream;


begin
    Incorrect := False;
    Sln := LastNameEdit.Text;
    Len := Length (Sln);
    for i := 1 to Len do
        if ((Ord (Sln[i]) < 1040) or (Ord (Sln[i]) > 1103)) then Incorrect := True; //�������� �� ������� ����
    Sln := NameEdit.Text;
    Len := Length (Sln);
    for i := 1 to Len do
        if ((Ord (Sln[i]) < 1040) or (Ord (Sln[i]) > 1103)) then Incorrect := True; // �������� �� ������� ����
  if Incorrect then ShowMessage ('�������� ����')
  Else
  if LastNameEdit.Text='' Then ShowMessage ('������� �������')
    Else if NameEdit.Text='' Then ShowMessage ('������� ���')
      Else If (klass.ItemIndex=-1) or (klassLetter.ItemIndex=-1) Then ShowMessage ('�������� �����')
    Else
    Begin
      NameI := NameEdit.Text;
      School := Klass.Items [Klass.ItemIndex]+ ' ' + KlassLetter.Items [Klass.ItemIndex];
      LastName := LastNameEdit.Text;
      Razm.RegLabel.Caption :=   LastName+ ' ' + NameI + ' ' + School;
      SendText := Razm.RegLabel.Caption + ' ' + IntToStr(Level) + ' ' + '0:0' + ' ' + '0';
// ������ ��������� ��� ������ ����� ��������� �����������
{Razm.RegLabel.Caption := '��������� ��������� 11 �';
SendText := Razm.RegLabel.Caption + ' ' + IntToStr(Level) + ' ' + '0:0' + ' ' + '0';        }

      Razm.RegLabel.Visible := True;

      try
        Razm.IdTCPClient1.Connect; //����������
        s:=TStringStream.Create; //������������� ������ s
        s.WriteString(SendText);  //������ ��������� � ����� s
        s.Position:=0; //��������� ������� �� ������ ������ s
        Razm.IdTCPClient1.IOHandler.Write(s, s.Size, true); //�������� ���������
        s.Free; //����������� ������ s
        Razm.IdTCPClient1.Disconnect; //������������
        Razm.ConnectLabel.Caption := 'C���� ����';

      except
        Razm.ConnectLabel.Caption := '��� �����';
      end;

      Close;
    End;

End;{}

procedure TFormRegistration.LastNameEditClick(Sender: TObject);
begin
LastNameEdit.Text := '';
end;

procedure TFormRegistration.NameEditClick(Sender: TObject);
begin
  NameEdit.Text := '';
end;


end.
