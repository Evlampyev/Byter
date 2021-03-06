unit ServerForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdBaseComponent, IdComponent,
  IdCustomTCPServer, IdTCPServer, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids,
  IdContext, Vcl.ExtCtrls, WinProcs, Vcl.Imaging.GIFImg;

type
  TForm1 = class(TForm)
    IdTCPServer1: TIdTCPServer;
    ResultTable: TStringGrid;
    PanelOption: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Port: TLabel;
    IPAdress: TLabel;
    OptionApplyBtn: TButton;
    Memo1: TMemo;
    Edit3: TEdit;
    Label1: TLabel;
    ChampionPanel: TPanel;
    Panel3: TPanel;
    ChampionGrid: TStringGrid;
    ResetBitBtn: TBitBtn;
    ButLev1: TBitBtn;
    ButLev2: TBitBtn;
    ButLev3: TBitBtn;
    ButLev4: TBitBtn;
    BreakChampionButton: TBitBtn;
    ExitPanel: TPanel;
    ExitImage: TImage;
    BtnOption: TBitBtn;

    procedure �����Click(Sender: TObject);
    procedure IdTCPServer1Execute(AContext: TIdContext);
    procedure OptionApplyBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ResultTableDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure ChampionGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure ResetBitBtnClick(Sender: TObject);
    procedure ButLev1Click(Sender: TObject);
    procedure ButLev2Click(Sender: TObject);
    procedure ButLev3Click(Sender: TObject);
    procedure ButLev4Click(Sender: TObject);
    procedure BreakChampionButtonClick(Sender: TObject);
    procedure BtnOptionClick(Sender: TObject);
  private
    { Private declarations }
    GifExit: TGifImage;
    Procedure OutputPerson;
    Procedure SortPerson;
    Procedure ChangePerson (i,z:byte);

  public
    { Public declarations }
    Procedure ClearStrigGrid;
    Procedure ChampionSave;
    Procedure ChampionReadData(Sender:TObject);
    Procedure ChampionChange(OldPlace:byte);
    Procedure ChampionShow (ButtonLevel:byte);

  end;
Const
  V = 50; // ������������ ���������� ����������

Type
   MyRecord = Record
      MyName  : String [22];
      MyClass : String [5];
      MyLevel : Byte;
      MyTime  : String [7];
      MyAnswer: Byte;
  End;
var
  Form1: TForm1;
  Person: Array [1..V] of MyRecord;
  ChampionPerson: array [1..4, 1..6] of MyRecord;
  Contestant, NumberOfCadet: Byte;

implementation

{$R *.dfm}

Procedure TForm1.ClearStrigGrid;
Var i,j:Byte;
Begin
      For i := 1 to Contestant do
        For j := 0 to 6 do
            ResultTable.Cells [j,i] := '';
End;

Procedure TForm1.ChampionReadData(Sender:TObject);
Var
 FChampion: File of MyRecord;
 NewLevel,i: byte;
 RecordChampion: MyRecord;
Begin
  For NewLevel := 1 to 4 do
    Begin
       AssignFile(FChampion, 'Champion_'+IntToStr(NewLevel)+'.txt');
       if FileExists ('Champion_'+IntToStr(NewLevel)+'.txt')  Then
         begin
          Reset (FChampion);
          i:=1;
          while (not EOF(FChampion)) do
            Begin
              Read(FChampion, RecordChampion);
              ChampionPerson[NewLevel,i] := RecordChampion;
              i:=i+1;
            End;
         CloseFile(FChampion);
         End;
    End;
End;

procedure TForm1.FormCreate(Sender: TObject);
var
  i,j: Integer;
begin
  With ResultTable do
    Begin
      ColCount := 6;
      RowCount := 11;
      FixedRows := 1;
      FixedCols := 0;
      ColWidths [0] := 60;
      ColWidths [1] := 160; // ���
      ColWidths [2] := 55;  // �����
      ColWidths [3] := 75;  // �������
      ColWidths [4] := 60;  // �����
      ColWidths [5] := 55;  // �����
    Rows[0].CommaText := '"� �/�","������� � ���",�����,�������,�����,�����';
    End;
     With ChampionGrid do
    Begin
      ColCount := 5;
      RowCount := 6;
      FixedRows := 1;
      FixedCols := 0;
      ColWidths [0] := 40;
      ColWidths [1] := 100;  //���
      ColWidths [2] := 41;  // �����
      ColWidths [3] := 47;  // �����
      ColWidths [4] := 41;  // �����
      Rows[0].CommaText := '"� �/�","������� � ���",�����,�����,�����';
    End;
    ChampionPanel.Width := Form1.ClientWidth-30-ResultTable.Width;
    ButLev1.Left := ChampionPanel.Padding.Left;
    ButLev1.Top := 20+Panel3.Height;
    ButLev2.Top := ButLev1.Top;
    ButLev3.Top := ButLev1.Top;
    ButLev4.Top := ButLev1.Top;
    Memo1.Top := ChampionPanel.Height + 20;
    ResetBitBtn.Left := Trunc ((Form1.ClientWidth - 20 - ResultTable.Width - ResetBitBtn.Width - ExitPanel.Width)/2)+10 + ResultTable.Width;
    BtnOption.Left := ResetBitBtn.Left;
    ResetBitBtn.Top := Trunc((Form1.ClientHeight - 20 - Memo1.Height - ChampionPanel.Height-2*ResetBitBtn.Height)/3) + (20 + Memo1.Height + ChampionPanel.Height);
    BtnOption.Top := ResetBitBtn.Top + Trunc((Form1.ClientHeight - 20 - Memo1.Height - ChampionPanel.Height-2*ResetBitBtn.Height)/3) + ResetBitBtn.Height;



   Contestant := 1;
   GifExit := TGifImage.Create;
   GifExit.LoadFromFile('Pictures\Gif\ExitLive.gif');
   GifExit.Animate := True;
   GifExit.AnimateLoop := glEnabled;
   ExitPanel.Width := GifExit.Width+4-8;
   ExitPanel.Height := GifExit.Height+4-9;
   ExitPanel.Left := Form1.ClientWidth - 8 - ExitPanel.Width;
   ExitPanel.Top := Form1.ClientHeight - 8 - ExitPanel.Height;
   ExitImage.Top := 2;
   ExitImage.Left := 2;
   ExitImage.Picture.Assign(GifExit);
   ChampionReadData(Sender);
end;

Procedure TForm1.ChampionSave;       //���������� ������� �������� (����������)
Var
 FChampion: File of MyRecord;
 NewLevel,i: byte;
Begin
  For NewLevel := 1 to 4 do
    Begin
      Try
        AssignFile(FChampion, 'Champion_'+IntToStr(NewLevel)+'.txt');
        Rewrite(FChampion);
        For i := 1 to 5 do
           Write (FChampion, ChampionPerson[NewLevel,i]);
        CloseFile(FChampion);
      Except
        MessageDlg('������ ���������� �����!',mtError,[mbOk],0);
      end;
    End;
  End;

Procedure TForm1.ChampionShow (ButtonLevel:byte);
 Var
    i:byte;
Begin
ButLev1.Font.Color := 0;         //������ ������ ������ � ������
ButLev2.Font.Color := 0;
ButLev3.Font.Color := 0;
ButLev4.Font.Color := 0;

case ButtonLevel of
  1: ButLev1.Font.Color := ClRed;   //������ ������ ������ � �������
  2: ButLev2.Font.Color := ClRed;
  3: ButLev3.Font.Color := ClRed;
  4: ButLev4.Font.Color := ClRed;
end;

For i:=1 to 5 do
  Begin
      With ChampionGrid do
    Begin
          Cells[0,i] := IntToStr(i);
          Cells[1,i] := ChampionPerson[ButtonLevel, i].MyName;
          Cells[2,i] := ChampionPerson[ButtonLevel, i].MyClass;
          Cells[3,i] := ChampionPerson[ButtonLevel, i].MyTime;
          Cells[4,i] := IntToSTR(ChampionPerson[ButtonLevel, i].MyAnswer);
    End;
  End;
End;


procedure TForm1.BreakChampionButtonClick(Sender: TObject);
Const MyRecordNull: Myrecord = ();
Var
  NewLevel,i:Byte; s :String;
begin
  if ButLev1.Font.Color = ClRed then NewLevel := 1
    Else if ButLev2.Font.Color = ClRed then NewLevel := 2
      Else if ButLev3.Font.Color = ClRed then NewLevel := 3
        Else NewLevel := 4;
s:= 'Champion_'+IntToStr(NewLevel)+'.txt';
  If FileExists (Pchar(s)) Then
  Begin
    DeleteFile (Pchar(s));
    for  i := 1 to 5 do
            ChampionPerson[NewLevel,i] := MyRecordNull;
    ShowMessage ('���� �������� ���������');
  End
                           Else ShowMessage ('����� ���');
  ChampionShow(NewLevel);
end;

procedure TForm1.BtnOptionClick(Sender: TObject);
Var
  NewLevel:String;
  begin
  PanelOption.Height := ChampionPanel.Height;
  PanelOption.Width := ChampionPanel.Width;
  NewLevel :='';
  if ButLev1.Font.Color = ClRed then NewLevel := 'I'
    Else if ButLev2.Font.Color = ClRed then NewLevel := 'II'
      Else if ButLev3.Font.Color = ClRed then NewLevel := 'III'
        Else if ButLev4.Font.Color = ClRed then NewLevel := 'IV';
 If NewLevel = '' Then
    Begin
      BreakChampionButton.Visible := False;
      OptionApplyBtn.Left := Round((PanelOption.Width - OptionApplyBtn.Width)/2);
    End Else
    Begin
      BreakChampionButton.Visible := True;
      OptionApplyBtn.Left := 2*Round((PanelOption.Width - OptionApplyBtn.Width - BreakChampionButton.Width)/3)+BreakChampionButton.Width;
      BreakChampionButton.Left := Round((PanelOption.Width - OptionApplyBtn.Width - BreakChampionButton.Width)/3);
      BreakChampionButton.Caption := '����������'#13 + '�������'#13 + NewLevel + #13 + '������';
    End;
  ChampionPanel.Visible := False;
  PanelOption.Visible := True;
  PanelOption.Top := ChampionPanel.Top;
  PanelOption.Left := ChampionPanel.Left;

end;

procedure TForm1.ButLev1Click(Sender: TObject);
Begin
     ChampionShow(1);
end;
procedure TForm1.ButLev2Click(Sender: TObject);
Begin
     ChampionShow(2);
end;
procedure TForm1.ButLev3Click(Sender: TObject);
Begin
     ChampionShow(3);
end;
procedure TForm1.ButLev4Click(Sender: TObject);
Begin
     ChampionShow(4);
End;

Procedure TForm1.ChampionChange (OldPlace:byte);
Const   NullRecType:MyRecord = ();
Var
  i:byte;
  Level,j:Byte;
  s:MyRecord;
Begin
  Level := Person [OldPlace].MyLevel;
  ChampionPerson[Level,6] := Person[OldPlace];

for j:=1 to 5 do
 for I := 5 downto j do
    Begin
      if ChampionPerson[Level,i+1].MyAnswer > ChampionPerson[Level,i].MyAnswer   then
        Begin
          S := ChampionPerson[Level,i];
          ChampionPerson[Level,i] := ChampionPerson[Level,i+1];
          ChampionPerson[Level,i+1] := S;
        End Else
          if (ChampionPerson[Level,i+1].MyAnswer = ChampionPerson[Level,i].MyAnswer) and (ChampionPerson[Level,i+1].MyTime < ChampionPerson[Level,i].MyTime) then
        Begin
          S := ChampionPerson[Level,i+1];
          ChampionPerson[Level,i+1] := ChampionPerson[Level,i];
          ChampionPerson[Level,i] := S;
        End
    End;
    ChampionPerson[Level,6] :=  NullRecType;
case Level of
  1: ChampionShow (1);
  2: ChampionShow (2);
  3: ChampionShow (3);
  4: ChampionShow (4);
  end;

End;

Procedure TForm1.OutputPerson;    // ��������� ������ ������� �� �����
Var
  i:byte;
Begin
 For i := 1 to Contestant-1 do
  Begin
    With Form1.ResultTable do
      Begin
          Cells[0,i] := IntToStr(i);
          Cells[1,i] := Person [i].MyName;
          Cells[2,i] := Person [i].MyClass;
          Cells[3,i] := IntToStr(Person [i].MyLevel);
          Cells[4,i] := Person [i].MyTime;
          Cells[5,i] := IntToStr(Person [i].MyAnswer);
      End;
    End;
End;

Procedure TForm1.ChangePerson (i,z: byte);
Var
  s:String;
  j:Byte;
  q:MyRecord;
Begin
      q := Person[i];
      Person[i] := Person[z];
      Person[z] := q;
End;

Procedure TForm1.SortPerson; // ���������� �������
Var
  i,j,z: Byte;
  s: String;
Begin
 For i := (Contestant-1) downto 2 do
  Begin
   if Person[i].MyAnswer > Person[i-1].MyAnswer then
    Begin
      z:=i-1;
      ChangePerson (i,z);
      OutPutPerson;
    End;
    if (Person[i].MyAnswer = Person[i-1].MyAnswer) and (Person[i].MyTime < Person[i-1].MyTime) then
      Begin
        z:=i-1;
        ChangePerson (i,z);
        OutPutPerson;
      End;
   End;
End;

procedure TForm1.ResetBitBtnClick(Sender: TObject);
Const   NullRecType:MyRecord = ();
Var
  i:Byte;
begin
 ClearStrigGrid;
 for i := 1 to Contestant do
    Person[i] := NullRecType;
    Contestant := 1;
end;

procedure TForm1.ResultTableDrawCell(Sender: TObject; ACol, ARow: Integer;  Rect: TRect; State: TGridDrawState);
Var
  Format: Word;
  C: array[0..255] of Char;
begin
ResultTable.Canvas.Font.Size:=12;
  if ACol = 0 then Format := DT_CENTER // ������ ������� - ��������� ������ �� ������
              else if ACol = 1 then Format := DT_LEFT // ������ ������� � ��������� ������ �� ������ ����
                  Else if (ACol=4) then Format := DT_RIGHT// ����� - ��������� ������ �� ������� ����
                    Else Format := DT_Center;// ��������� � �� ������.
  if ARow = 0 then Format := DT_CENTER;// ������ ������ � ��������� ������ �� ������
  ResultTable.Canvas.FillRect(Rect); // ����������� ������
  StrPCopy(C, ResultTable.Cells[ACol, ARow]); // �������������� ������ � ������ PChar
  WinProcs.DrawText(ResultTable.Canvas.Handle, C, StrLen(C), Rect, Format); // ����� ������
end;

procedure TForm1.ChampionGridDrawCell(Sender: TObject; ACol, ARow: Integer;  Rect: TRect; State: TGridDrawState);
Var
  Format: Word;
  C: array[0..255] of Char;
begin
ChampionGrid.Canvas.Font.Size:=8;
  if ACol = 0 then Format := DT_CENTER // ������ ������� - ��������� ������ �� ������
              else if ACol = 1 then Format := DT_LEFT // ������ ������� � ��������� ������ �� ������ ����
                  Else if (ACol=3) then Format := DT_RIGHT// ����� - ��������� ������ �� ������� ����
                    Else Format := DT_Center;// ��������� � �� ������.
  if ARow = 0 then Format := DT_CENTER;// ������ ������ � ��������� ������ �� ������
  ChampionGrid.Canvas.FillRect(Rect); // ����������� ������
  StrPCopy(C, ChampionGrid.Cells[ACol, ARow]); // �������������� ������ � ������ PChar
  WinProcs.DrawText(ChampionGrid.Canvas.Handle, C, StrLen(C), Rect, Format); // ����� ������
end;

procedure TForm1.IdTCPServer1Execute(AContext: TIdContext);
Var
  F, W: String;
  l:WideString;
  Position,i, Next, Posit, Place: Byte;
  s:TStringStream;
begin
  s:=TStringStream.Create;  //������������� ������ s
  AContext.Connection.IOHandler.ReadStream(s); //������ �� ��������� � �����
  s.Position:=0;  //��������� ������� �� ������ ������ s
  l := s.ReadString(s.Size); //������ ��������� ��������� � Memo
  s.Free;  //����������� ������ s

  Memo1.Lines.Add(l);
  f:=l;
  if l[1]+l[2]<>'IP' then
  BEGIN
  for I := 1 to 2 do
     Begin
       Position:=Pos (' ',f);
       W := W+Copy (f,1,Position);
       Delete (f,1,Position);
     End;
  Delete (W,Length(W),1);
  Next := 1;
  Place:=0;
  i:=1;
  While i < Contestant do
     if (Person[i].MyName = W) then
        begin
          Place := i;
          i := Contestant;
        end Else
            If (Person[i].MyName = '') Then i := Contestant Else i:=i+1;
   if Place = 0 then
      Begin
       Position:=Pos (' ',l);
       While Next < 6 do
        Begin
         case next of
          1: Begin
              Person[Contestant].MyName := Copy (l,1,Position-1);
              Delete (l,1,Position);
              Position:=Pos (' ',l);
              Person[Contestant].MyName := Person[Contestant].MyName + ' ' + Copy (l,1,Position-1);
             End;
          2: Begin
              Position := Position +2;
              Person[Contestant].MyClass := Copy (l,1,Position-1);
             End;
          3: Person[Contestant].MyLevel := StrToInt(Copy (l,1,Position-1));
          4: Person[Contestant].MyTime := Copy (l,1,Position-1);
         end;
         Delete (l,1,Position);
         Inc(Next);
         Position := Pos(' ',l);
        End;
      Person[Contestant].MyAnswer := StrToInt(l);
      Inc(Contestant);
    End Else
    Begin
     For I := 1 to 2 do
      Begin
        Position:=Pos (' ',F);
        Delete (F,1,Position);
      End;
     Position := Pos(' ',F);
     Person[Place].MyLevel := StrToInt(Copy (F,1,Position-1));
     Delete (F,1,Position);
     Position := Pos(' ',F);
     Person[Place].MyTime := Copy (F,1,Position-1);
     Delete (F,1,Position);
     Person[Place].MyAnswer := StrToInt(F);
     End;
    if Place=0 then Place:=Contestant-1;
    If Person[Place].MyAnswer>0 Then ChampionChange(Place);
    SortPerson;
    OutputPerson;
  END;
end;

procedure TForm1.�����Click(Sender: TObject);
begin
  ChampionSave;
  close;
end;

procedure TForm1.OptionApplyBtnClick(Sender: TObject);
begin
   IdTCPServer1.DefaultPort := StrToInt(Edit1.Text);
   PanelOption.Visible := False;
   ChampionPanel.Visible := True;
   NumberOfCadet := StrToInt (Edit3.Text);

end;

end.
