unit Unit2;

interface

uses
  System.Classes,Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  MyThread = class(TThread)
  private
    { Déclarations privées }
  protected
    procedure Execute; override;
    procedure UpdateCaption;
  end;

implementation

{ 
  Important : Les méthodes et les propriétés des objets des composants visuels peuvent seulement être
  utilisées dans une méthode appelée avec Synchronize, par exemple

      Synchronize(UpdateCaption);  

  et UpdateCaption pourrait ressembler à

    procedure MyThread.UpdateCaption;
    begin
      Form1.Caption := 'Mis à jour dans un thread';
    end; 
    
    ou 
    
    Synchronize( 
      procedure 
      begin
        Form1.Caption := 'Mis à jour dans un thread via une méthode anonyme'
      end
      )
    );
    
  où une méthode anonyme est transmise.
  
  De même, le développeur peut appeler la méthode Queue avec des paramètres similaires à 
  ceux ci-dessus, au lieu de passer une autre classe TThread en premier paramètre, en
  plaçant le thread appelant dans une file d'attente avec l'autre thread.
    
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
