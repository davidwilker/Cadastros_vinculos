unit uSobre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ShellAPI;

type
  TformSobre = class(TForm)
    Image1: TImage;
    Label2: TLabel;
    procedure Label2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formSobre: TformSobre;

implementation

{$R *.dfm}

procedure TformSobre.Label2Click(Sender: TObject);
var
  buffer: String;
begin
  buffer := 'https://github.com/davidwilker';
  ShellExecute(Application.Handle, 'open', PChar(buffer), '', '', SW_SHOWNORMAL);
end;

end.
