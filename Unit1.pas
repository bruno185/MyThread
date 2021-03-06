unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    CheckBox1: TCheckBox;

    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);

  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

  MyThread = class(TThread)
  private
    { Déclarations privées }
    i : longint;
  protected
    procedure Execute; override;
    procedure DoSynchronize;
  public
   //constructor Create(CreateSuspended: Boolean) ;
  end;

var
  Form1: TForm1;
  myt : MyThread;
  myt2 : MyThread;

implementation

{$R *.dfm}

{constructor MyThread.Create(CreateSuspended: Boolean) ;
begin
  i := 0;
end;   }

procedure TForm1.Button1Click(Sender: TObject);

begin
  myt := MyThread.Create(false);
  Button1.Enabled := false;
  Button2.Enabled := true;
end;


procedure TForm1.Button2Click(Sender: TObject);
begin
  myt.Terminate;
  //TerminateThread(myt.Handle,0);
  Button1.Enabled := true;
  Button2.Enabled := false;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  myt2 := MyThread.Create(false);
  Button3.Enabled := false;
  Button4.Enabled := true;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  myt2.Terminate;
  //TerminateThread(myt.Handle,0);
  Button3.Enabled := true;
  Button4.Enabled := false;
end;

procedure MyThread.DoSynchronize;
var
  tempo : string;
begin
    Form1.Memo1.Lines.Add(IntToStr(i));
    if self = myt then tempo := 'Thread 1 : ' else tempo := 'Thread 2 : ';
    if Terminated then Form1.Memo1.Lines.Add(tempo + 'terminated')
    else Form1.Memo1.Lines.Add(tempo + 'not terminated');
    Application.ProcessMessages;
end;

procedure MyThread.Execute; register
begin
  if Form1.CheckBox1.Checked then Form1.Memo1.Clear;
  while not(Terminated) do
  begin
    if (i mod StrToInt(Form1.Edit1.Text) = 0)  then Synchronize(DoSynchronize);
    inc(i);
  end;
  Synchronize(DoSynchronize);
end;


end.
