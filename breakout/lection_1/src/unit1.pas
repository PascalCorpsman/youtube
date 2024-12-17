Unit Unit1;

{$MODE objfpc}{$H+}

Interface

Uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls;

Type

  { TForm1 }

  TForm1 = Class(TForm)
    Shape1: TShape;
    Timer1: TTimer;
    Procedure FormCreate(Sender: TObject);
    Procedure Timer1Timer(Sender: TObject);
  private
    RichtungX, RichtungY: Single;
    Procedure Pruefe_Kollision_mit_Fenster_Rand;
  public

  End;

Var
  Form1: TForm1;

Implementation

{$R *.lfm}

{ TForm1 }

Procedure TForm1.FormCreate(Sender: TObject);
Begin
  Randomize;
  Shape1.Top := Height Div 2;
  Shape1.Left := Width Div 2;
  RichtungX := Random(10) - 5;
  RichtungY := Random(10) - 5;
End;

Procedure TForm1.Timer1Timer(Sender: TObject);
Begin
  Shape1.Top := Shape1.Top + round(RichtungY);
  Shape1.Left := Shape1.Left + round(RichtungX);
  Pruefe_Kollision_mit_Fenster_Rand();
End;

Procedure TForm1.Pruefe_Kollision_mit_Fenster_Rand;
Begin
  If Shape1.Top < 0 Then Begin
    RichtungY := -RichtungY;
  End;
  If Shape1.Top + Shape1.Height > ClientHeight Then Begin
    RichtungY := -RichtungY;
  End;
  If Shape1.Left < 0 Then Begin
    Richtungx := -Richtungx;
  End;
  If Shape1.Left + Shape1.Width > ClientWidth Then Begin
    Richtungx := -Richtungx;
  End;
End;

End.

