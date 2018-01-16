unit ��������;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.Imaging.GIFImg, Vcl.Menus, StrUtils,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, httpapp, System.NetEncoding,
  IdIPWatch;
Type
  TFriendPanel = Class(Tpanel);
type
  TRazm = class(TForm)
    Fon: TImage;
    Ravno2: TImage;
    Ravno1: TImage;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel5: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Ravno3: TImage;
    Ravno4: TImage;
    MainMenu1: TMainMenu;
    Control: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Letter: TMenuItem;
    Autor: TMenuItem;
    Low: TMenuItem;
    NOrmal: TMenuItem;
    Hi: TMenuItem;
    VeryHi: TMenuItem;
    Sopos: TMenuItem;
    N21: TMenuItem;
    N31: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    ImageLevel: TImage;
    Panel10: TPanel;
    ResultButton: TButton;
    Stopwatch: TLabel;
    Timer1: TTimer;
    Registration: TMenuItem;
    RegLabel: TLabel;
    IdTCPClient1: TIdTCPClient;
    Edit1: TEdit;
    ServerOption: TMenuItem;
    ServerOptionPanel: TPanel;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    OptionCloseButton: TButton;
    SendButton: TButton;
    IdIPWatch1: TIdIPWatch;
    ConnectLabel: TLabel;
    ExitImage: TImage;
    ExitPanel: TPanel;
    Panel14: TPanel;
    Ravno5: TImage;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;

    procedure �����Click(Sender: TObject);
    procedure Panel2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure Panel5MouseLeave(Sender: TObject);
    procedure AutorClick(Sender: TObject);
    procedure LowClick(Sender: TObject);
    procedure NOrmalClick(Sender: TObject);
    procedure HiClick(Sender: TObject);
    procedure VeryHiClick(Sender: TObject);
    procedure ResultButtonClick(Sender: TObject);
    procedure SoposClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure RegistrationClick(Sender: TObject);
    procedure ServerOptionClick(Sender: TObject);
    procedure OptionCloseButtonClick(Sender: TObject);
    procedure SendButtomClick(Sender: TObject);
    procedure Image9MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);


  private
    { Private declarations }
     Gif,ExitGif: TGifImage;
  Procedure ClearFormRazm;
  public
    { Public declarations }

    procedure SendButtonClick;
  end;
Type
   MyRndmNmbr = Record
      MyNumber : Word; {�����}
      MySize : Byte;   {������� ������}
      MyMeasure : Byte;  {������� ���������}
      MyColor  : Tcolor; {����}
      End;
var
  Razm: TRazm;
  PanelL: Array [1..5, 1..2] of Tpanel;
  PanelA: Array [1..5, 1..2] of Tpanel;
  ImageL: Array [1..5, 1..2] of TImage;
  NumberOnImage: Array [1..5, 1..2] of MyRndmNmbr;
  Level, LevelTime: Byte;
  TimeNow, TimeOne : TTime;
  LastName, NameI, School: String;
  SendText:String;

implementation

{$R *.dfm}

uses Oprogr, Registration, ExprDraw, ExprMake;
    // ����� ������ ���������
procedure TRazm.LowClick(Sender: TObject);
begin
      IF Not Low.Checked Then
      Begin
        Low.Checked := True;
        Hi.Checked := False;
        Normal.Checked := False;
        VeryHi.Checked := False;
        ImageLevel.Picture.LoadFromFile('Pictures\Level\Low.png');
        Panel10.Caption := '˨���� �������';
        Level := 1;
      End;
end;
procedure TRazm.NOrmalClick(Sender: TObject);
begin
     IF Not Normal.Checked Then
      Begin
        Low.Checked := False;
        Hi.Checked := False;
        VeryHi.Checked := False;
        Normal.Checked := True;
        ImageLevel.Picture.LoadFromFile('Pictures\Level\Normal.png');
        Panel10.Caption := '������� �������';
        Level := 2;
      End;
end;
procedure TRazm.HiClick(Sender: TObject);
begin
     IF Not Hi.Checked Then
      Begin
        Low.Checked := False;
        Hi.Checked := True;
        Normal.Checked := False;
        VeryHi.Checked := False;
        ImageLevel.Picture.LoadFromFile('Pictures\Level\Hi.png');
        Panel10.Caption := '������� �������';
        Level := 3;
      End;
end;
procedure TRazm.Image9MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
 const
    SC_DRAGMOVE = $F012;
begin
    ReleaseCapture;
    ((Sender as TImage).Parent as TPAnel).Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
end;

procedure TRazm.VeryHiClick(Sender: TObject);
begin
     IF Not VeryHi.Checked Then
      Begin
        Low.Checked := False;
        Hi.Checked := False;
        Normal.Checked := False;
        VeryHi.Checked := True;
        ImageLevel.Picture.LoadFromFile('Pictures\Level\VeryHi.png');
        Panel10.Caption := '���������� ������';
        Level := 4;
      End;
end;

Function Stepen (k: Byte): Word;  // ���������� ������� ������
    Var
      i:Byte;
      Step: Word;
    Begin
      Step := 1;
      for i := 1 to k do
        Step := Step*2;
      Stepen := Step;
    End;

Procedure TRazm.ClearFormRazm;
Var
  i:byte;
Begin
  for i  := 1 to 5 do
    Begin
      PanelL[i,1].Visible := False;
      PanelL[i,2].Visible := False;
    End;
  StopWatch.Caption := '0:00:0';
  ResultButton.Enabled := False;
End;

procedure TRazm.AutorClick(Sender: TObject);
begin
  About.Visible := True;
  About.SetFocus;
end;

procedure TRazm.�����Click(Sender: TObject);  // �������� ����� �� ������ �����
begin
  Close;
end;

procedure TRazm.OptionCloseButtonClick(Sender: TObject);
begin
  IdTCPClient1.Port := StrToInt(Edit2.Text);
  IdTCPClient1.Host := Edit3.Text;
  ServerOptionPanel.Visible := False;
end;

procedure TRazm.SendButtomClick(Sender: TObject);
Begin
  SendText:= 'IP =' + IdIPWatch1.LocalIP;
  SendButtonClick;
End;

procedure TRazm.SendButtonClick;
var
    s:TStringStream;
begin
  try
        Razm.IdTCPClient1.Connect; //����������
    Try
        s:=TStringStream.Create; //������������� ������ s
        s.WriteString(SendText);  //������ ��������� � ����� s
        s.Position:=0; //��������� ������� �� ������ ������ s
        Razm.IdTCPClient1.IOHandler.Write(s, s.Size, true); //�������� ���������
        s.Free; //����������� ������ s
      ConnectLabel.Caption := '����� ����';
    Except
      ConnectLabel.Caption := '��� �����';
    End;
  finally
      Razm.IdTCPClient1.Disconnect; //������������
  end;
end;

procedure TRazm.FormCreate(Sender: TObject);
 Var
    i, k, l: Byte;
    Expr1: TExprClass;
begin
  for i := 0 to ComponentCount-1 do   // ���������� �������� ���������� ���������� � �����
    Begin
     if Components[i].Tag > 100 Then
        PanelA [(Components[i].Tag div 100), (Components[i].Tag mod 10)] := (Components[i] as TPanel)
        Else
          If Components[i].Tag > 10 then
            Begin
             IF Components[i].ClassType=TPanel Then PanelL [Components[i].Tag div 10, Components[i].Tag mod 10] := (Components[i] as TPanel);
             IF Components[i].ClassType=TImage Then ImageL [Components[i].Tag div 10, Components[i].Tag mod 10] := (Components[i] as TImage);
            End;
    End;

    Gif := TGifImage.Create;
    Gif.LoadFromFile('Pictures\Gif\Blink.gif');
    Gif.Animate := True;
    Gif.AnimateLoop := glEnabled;
    Ravno1.Picture.Assign(Gif);
    Ravno2.Picture.Assign(Gif);
    Ravno3.Picture.Assign(Gif);
    Ravno4.Picture.Assign(Gif);
    Ravno5.Picture.Assign(Gif);

    ExitGif := TGifImage.Create;
    ExitGif.LoadFromFile('Pictures\Gif\ExitLive.gif');
    ExitGif.Animate := True;
    ExitImage.Picture.Assign(ExitGif);

  Level := 1;
  ImageLevel.Picture.LoadFromFile('Pictures\Level\Low.png');
  Panel10.Caption := '˨���� �������';
  try
    IdTCPClient1.Connect;
    ConnectLabel.Caption := 'C���� ����';
    IdTCPClient1.DisConnect;
  except
    ConnectLabel.Caption := '��� �����';
  end;

end;

procedure TRazm.Panel2MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);// ����������� �������� �� �����
 const
    SC_DRAGMOVE = $F012;
 begin
    ReleaseCapture;
    (Sender as TPanel).Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
 end;

procedure TRazm.Panel5MouseLeave(Sender: TObject); // ����������� ��������� ��� �������� �� �����
var
  aRect : TRect;
  I: Integer;
  Lx,Ly, Ax,Ay, Px, Py,Xx, Yy : Byte;
begin
  Lx := 1;
  Ly := 1;
  Ax := 1;
  Ay := 1;
  if Sender.ClassType = TPanel then
    While Sender <> PanelL[Lx,Ly] do
      Begin
        Ly := Ly+1;
        if Ly > 2  then
        Begin
          Ly := 1;
          Lx := Lx+1;
        End;
      End Else
    While ((Sender as TImage).Parent as TPanel) <> PanelL[Lx,Ly] do
      Begin
        Ly := Ly+1;
        if Ly > 2  then
        Begin
          Ly := 1;
          Lx := Lx+1;
        End;
      End;

 for Ax := 1 to 5 do
   for Ay := 1 to 2 do
     if IntersectRect(aRect, PanelL[Lx,Ly].BoundsRect, PanelA[Ax,Ay].BoundsRect) then
        Begin
          Px := 1; Py := 1; Xx:=0;
          While (Xx=0) And (Px < 5) do
            Begin
                if IntersectRect(aRect, PanelL[Lx,Ly].BoundsRect, PanelL[Px,Py].BoundsRect) then
                  Begin
                    Xx := Px;
                    Yy := Py;
                  End;
                Py := Py +1;
                if Py = 3 then
                  Begin
                    Py := 1;
                    Px := Px +1;
                  End
            End;
         if Xx > 0 then PanelL[Xx,Yy].Left := PanelL[Xx,Yy].Left - 200;
            PanelL[Lx,Ly].Top := PanelA[Ax,Ay].Top+6;
            PanelL[Lx,Ly].Left := PanelA[Ax,Ay].Left+6;
          End;
        End;

procedure TRazm.RegistrationClick(Sender: TObject);
Begin
  FormRegistration.Visible := True;
  FormRegistration.SetFocus;
  StopWatch.Visible := False;
  ResultButton.Enabled := False;
End;

procedure TRazm.ResultButtonClick(Sender: TObject); // ��������� ������������ ���������� �������
Var
  i, mark : Byte;
begin
 TimeOne := Time-TimeNow;
 Timer1.Enabled := False;
 Mark := 0;
 for i := 1 to 5 do
    Begin
      if PanelL[i,1].Top = PanelL[i,2].Top then Mark := Mark +1;
    End;
 ShowMessage ('����� - ' + IntToStr (Mark));
 SendText := RegLabel.Caption + ' ' + IntToStr(Level) + ' ' + StopWatch.Caption + ' ' + IntToStr (Mark);
 SendButtonClick;
 ClearFormRazm;
End;

procedure TRazm.ServerOptionClick(Sender: TObject);
begin
  ServerOptionPanel.Visible:=True;
  ServerOptionPanel.SetFocus;
end;

procedure TRazm.SoposClick(Sender: TObject);
Var
  k, l, i, x, FontSize: Byte;
  Top1, Top2, Left1, Left2: Word;
  Measure: array [1..5] of String[7];
  ColorFont : array [1..5] of TColor;
  Yes : Boolean;
  kStr:String[7];
  Expr: TExprClass;
   bitmap1: TBitMap;
   Bit:String[5];

begin
for i :=1 to 5 do
  for k := 1 to 2 do
          ImageL[i, k].Picture := nil;
FillChar(NumberOnImage,sizeof(NumberOnImage),0);  //��������� �������

    ColorFont [1] := 0;
    ColorFont [2] := 255;
    ColorFont [3] := 65280;
    ColorFont [4] := 16711935;
    Measure [1] := ' ���';
    Measure [2] := ' ����';
    Measure [3] := ' �����';
    Measure [4] := ' �����';
    Measure [5] := ' �����';

    for i := 1 to 4 do
        begin
          k := Random (4)+1;
          l := Random (4)+1;
          ColorFont [5] := ColorFont[k];
          ColorFont [k] := ColorFont[l];
          ColorFont [l] := ColorFont[5];
        end;
  for i := 1 to 5 do
    Begin
       NumberOnImage[i,1].MyColor := ColorFont[Random(3)+1];
       NumberOnImage[i,2].MyColor := ColorFont[Random(3)+1];

    End;
    TimeNow := Time;
    Timer1.Enabled := True;
    StopWatch.Visible := True;
   for i :=1 to 5 do
      Begin
          PanelL [i,1].Top := Random (600) + 25;
          PanelL [i,2].Top := Random (600) + 25;
          PanelL [i,1].Left := Random (450) + 200;
          PanelL [i,2].Left := Random (450) + 200;
          PanelL [i,1].Visible := True;
          PanelL [i,2].Visible := True;
      End;

   case Level of
    1: Begin
       l:=1;
       Repeat
         k := Random (24)+1; Yes := False; i := 1;
          While (Not Yes) and (i < 5) do
            Begin
              if k = NumberOnImage[i,1].MyNumber then Yes := True;
              i := i +1;
            End;
          if Not Yes Then
            Begin
              NumberOnImage [l,1].MyNumber := k; NumberOnImage [l,2].MyNumber := k*8;
              l := l+1;
            End;
       Until l=6;
       For i := 1 to 5 do
          Begin
            With NumberOnImage [i,1] do begin
              MyMeasure := 2;
            end;
            With NumberOnImage [i,2] do begin
              MyMeasure := 1;
            end;
          End;
        End;
    2: Begin
            NumberOnImage [1,1].MyNumber := Random (26)+5;
            NumberOnImage [1,1].MyMeasure := 2;
            NumberOnImage [1,2].MyNumber := NumberOnImage [1,1].MyNumber * 8;
            NumberOnImage [1,2].MyMeasure := 1;
            NumberOnImage [2,1].MyNumber := Random (5)+8;
            NumberOnImage [2,1].MyMeasure := 3;
            NumberOnImage [2,2].MyNumber := NumberOnImage [2,1].MyNumber * 1024;
            NumberOnImage [2,2].MyMeasure := 2;
            NumberOnImage [3,1].MyNumber := Random (8)+1;
            NumberOnImage [3,1].MyMeasure := 4;
            NumberOnImage [3,2].MyNumber := NumberOnImage [3,1].MyNumber * 1024;
            NumberOnImage [3,2].MyMeasure := 3;
            NumberOnImage [4,1].MyNumber := Random (4)+1;
            NumberOnImage [4,1].MyMeasure := 3;
            NumberOnImage [4,2].MyNumber := NumberOnImage [4,1].MyNumber * 1024*8;
            NumberOnImage [4,2].MyMeasure := 1;
            NumberOnImage [5,1].MyNumber := Random (3)+5;
            NumberOnImage [5,1].MyMeasure := 3;
            NumberOnImage [5,2].MyNumber := NumberOnImage [5,1].MyNumber * 1024*8;
            NumberOnImage [5,2].MyMeasure := 1;
       End;
    3: Begin
            for i := 1 to 5 do
              for k := 1 to 2 do
                           NumberOnImage [i,k].MyNumber := 0;
            NumberOnImage [1,1].MySize := Random (18)+9;
            NumberOnImage [1,1].MyMeasure := 1;
            NumberOnImage [1,2].MySize := NumberOnImage [1,1].MySize-3;
            NumberOnImage [1,2].MyMeasure := 2;
            NumberOnImage [2,1].MySize := Random (18)+14;
            NumberOnImage [2,1].MyMeasure := 1;
            NumberOnImage [2,2].MySize := NumberOnImage [2,1].MySize-13;
            NumberOnImage [2,2].MyMeasure := 3;
            NumberOnImage [3,1].MySize := Random (8)+24;
            NumberOnImage [3,1].MyMeasure := 1;
            NumberOnImage [3,2].MySize := NumberOnImage [3,1].MySize-23;
            NumberOnImage [3,2].MyMeasure := 4;
            NumberOnImage [4,1].MySize := Random (18)+21;
            NumberOnImage [4,1].MyMeasure := 2;
            NumberOnImage [4,2].MySize := NumberOnImage [4,1].MySize-20;
            NumberOnImage [4,2].MyMeasure := 4;
            NumberOnImage [5,1].MySize := Random (18)+17;
            NumberOnImage [5,1].MyMeasure := 1;
            NumberOnImage [5,2].MySize := NumberOnImage [5,1].MySize-13;
            NumberOnImage [5,2].MyMeasure := 3;
       End;
    4: Begin
            NumberOnImage [1,1].MyNumber := Random (18)+2;
            NumberOnImage [1,1].MySize := Random (6) + 4;
            NumberOnImage [1,1].MyMeasure := 1;
            NumberOnImage [1,2].MyNumber := NumberOnImage [1,1].MyNumber;
            NumberOnImage [1,2].MySize := NumberOnImage [1,1].MySize - 3;
            While NumberOnImage [1,2].MyNumber mod 2 = 0 do
              Begin
                NumberOnImage [1,2].MyNumber := NumberOnImage [1,2].MyNumber div 2;
                Inc(NumberOnImage [1,2].MySize);
              End;
            NumberOnImage [1,2].MyMeasure := 2;

            NumberOnImage [2,1].MyNumber := Random (25)+1;
            NumberOnImage [2,1].MySize := Random (10) + 13;
            NumberOnImage [2,1].MyMeasure := 1;     // ������ ������� ���������
            NumberOnImage [2,2].MyNumber := NumberOnImage [2,1].MyNumber;
            NumberOnImage [2,2].MySize := NumberOnImage [2,1].MySize - 13;
            While NumberOnImage [2,2].MyNumber mod 2 = 0 do
              Begin
                NumberOnImage [2,2].MyNumber := NumberOnImage [2,2].MyNumber div 2;
                Inc(NumberOnImage [2,2].MySize);
              End;
            NumberOnImage [2,2].MyMeasure := 3;     // ������ ������� ���������

            NumberOnImage [3,1].MyNumber := Random (37)+1;
            NumberOnImage [3,1].MySize := Random (10) + 23;
            NumberOnImage [3,1].MyMeasure := 1;     // ������ ������� ���������
            NumberOnImage [3,2].MyNumber := NumberOnImage [3,1].MyNumber;
            NumberOnImage [3,2].MySize := NumberOnImage [3,1].MySize - 23;
            While NumberOnImage [3,2].MyNumber mod 2 = 0 do
              Begin
                NumberOnImage [3,2].MyNumber := NumberOnImage [3,2].MyNumber div 2;
                Inc(NumberOnImage [3,2].MySize);
              End;
            NumberOnImage [3,2].MyMeasure := 4;     // ������ ������� ���������

            NumberOnImage [4,1].MyNumber := Random (25)+1;
            NumberOnImage [4,1].MySize := Random (10) + 20;
            NumberOnImage [4,1].MyMeasure := 2;     // ������ ������� ���������
            NumberOnImage [4,2].MyNumber := NumberOnImage [4,1].MyNumber;
            NumberOnImage [4,2].MySize := NumberOnImage [4,1].MySize - 20;
            While NumberOnImage [4,2].MyNumber mod 2 = 0 do
              Begin
                NumberOnImage [4,2].MyNumber := NumberOnImage [4,2].MyNumber div 2;
                Inc(NumberOnImage [4,2].MySize);
              End;
            NumberOnImage [4,2].MyMeasure := 4;     // ������ ������� ���������

            NumberOnImage [5,1].MyNumber := Random (36)+1;
            NumberOnImage [5,1].MySize := Random (10) + 13;
            NumberOnImage [5,1].MyMeasure := 1;     // ������ ������� ���������
            NumberOnImage [5,2].MyNumber := NumberOnImage [5,1].MyNumber;
            NumberOnImage [5,2].MySize := NumberOnImage [5,1].MySize - 13;
            While NumberOnImage [5,2].MyNumber mod 2 = 0 do
              Begin
                NumberOnImage [5,2].MyNumber := NumberOnImage [5,2].MyNumber div 2;
                Inc(NumberOnImage [5,2].MySize);
              End;
            NumberOnImage [5,2].MyMeasure := 3;     // ������ ������� ���������
       End;
   end;
      for i := 1 to 5 do
          with Expr do
          Begin
            FontSize := 18;
            If NumberOnImage[i,1].MyNumber > 0 Then
               Begin
                     Expr := TExprVar.Create(IntToStr(NumberOnImage[i,1].MyNumber));  // ������ �����
                          If NumberOnImage[i,1].MySize > 0 Then
                            Begin
                              AddNext(TExprSign.Create(esCrossMultiply));
                              AddNext(TExprIndex.Create(TExprVar.Create('2'),nil,TExprVar.Create(IntToStr(NumberOnImage[i,1].MySize))));     // ������ � �������
                              FontSize := 14;
                            End;
               End Else
                     Begin
                      Expr := TExprIndex.Create(TExprVar.Create('2'),nil,TExprVar.Create(IntToStr(NumberOnImage[i,1].MySize)));
                      FontSize := 16;
                     End;
                       AddNext (TExprVar.Create(Measure[NumberOnImage[i,1].MyMeasure]));                       // ������� ���������
                       Expr:=TExprChain.Create(Expr);
                       Canvas := ImageL[i,1].Canvas;
                       Font.Size := FontSize;
                       Font.Style:=[fsBold];
                       Color := NumberOnImage[i,1].MyColor;
                       Draw(75,32,ehCenter,evCenter);
                       Free;

            If NumberOnImage[i,2].MyNumber > 0 Then
               Begin
                     Expr := TExprVar.Create(IntToStr(NumberOnImage[i,2].MyNumber));  // ������ �����
                          If NumberOnImage[i,2].MySize > 0 Then
                            Begin
                              AddNext(TExprSign.Create(esCrossMultiply));
                              AddNext(TExprIndex.Create(TExprVar.Create('2'),nil,TExprVar.Create(IntToStr(NumberOnImage[i,2].MySize))));     // ������ � �������
                              FontSize := 14;
                            End;
               End Else
                     Begin
                      Expr := TExprIndex.Create(TExprVar.Create('2'),nil,TExprVar.Create(IntToStr(NumberOnImage[i,2].MySize)));
                      FontSize := 16;
                     End;
                       AddNext (TExprVar.Create(Measure[NumberOnImage[i,2].MyMeasure]));                       // ������� ���������
                       Expr:=TExprChain.Create(Expr);
                       Canvas := ImageL[i,2].Canvas;
                       Font.Size := FontSize;
                       Font.Style:=[fsBold];
                       Color := NumberOnImage[i,2].MyColor;
                       Draw(75,32,ehCenter,evCenter);
                       Free;

               End;
ResultButton.Enabled := True;
end;

procedure TRazm.Timer1Timer(Sender: TObject);
begin
  StopWatch.Caption := TimeToStr(Time-TimeNow);
end;

end.
