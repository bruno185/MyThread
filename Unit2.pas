unit Unit2;

interface

uses
  System.Classes,Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  MyThread = class(TThread)
  private
    { D�clarations priv�es }
  protected
    procedure Execute; override;
    procedure UpdateCaption;
  end;

implementation

{ 
  Important : Les m�thodes et les propri�t�s des objets des composants visuels peuvent seulement �tre
  utilis�es dans une m�thode appel�e avec Synchronize, par exemple

      Synchronize(UpdateCaption);  

  et UpdateCaption pourrait ressembler �

    procedure MyThread.UpdateCaption;
    begin
      Form1.Caption := 'Mis � jour dans un thread';
    end; 
    
    ou 
    
    Synchronize( 
      procedure 
      begin
        Form1.Caption := 'Mis � jour dans un thread via une m�thode anonyme'
      end
      )
    );
    
  o� une m�thode anonyme est transmise.
  
  De m�me, le d�veloppeur peut appeler la m�thode Queue avec des param�tres similaires � 
  ceux ci-dessus, au lieu de passer une autre classe TThread en premier param�tre, en
  pla�ant le thread appelant dans une file d'attente avec l'autre thread.
    
}

{ MyThread }

procedure MyThread.UpdateCaption;
begin
  Form1.Caption := 'toto';
end;

procedure MyThread.Execute;
var
   i : integer;
begin
  for i := 1 to 100 do
  begin
    //Unit1.Form1.Memo1.Lines.Add(IntToStr(i));
    Application.ProcessMessages;
  end;

end;

end.
