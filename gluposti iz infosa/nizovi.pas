unit nizovi;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    ListBox1: TListBox;
    ListBox2: TListBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }
 //prikazivanje brojeva cije su prva i poslednja cifra ista (fixed)
procedure TForm1.Button1Click(Sender: TObject);
var n, i, first_digit, last_digit, input, number : integer;
var x : array[1..50] of integer;
begin
  n := StrToInt(Edit1.Text);

  for i := 1 to n do
      begin
        input := strToInt(InputBox('unesi clanove', 'x[' + IntToStr(i) + ']=', ''));
        listBox2.Items.Add(IntToStr(x[i]));

        last_digit := input mod 10;
        number := input;
        while input >= 10 do
               begin
                 input := input div 10;
                 first_digit := input;
               end;

        if first_digit = last_digit then ListBox1.Items.Add(IntToStr(number));
      end;
end;
///////////////////////////////////////////////////////////
 //niz od n slucajno generisanih clanova i prikazivanje clanova na parnim indexima
procedure TForm1.Button2Click(Sender: TObject);
var n, i : integer;
var x : array[1..100] of integer;
begin
n := StrTOInt(Edit1.Text);

for i := 1 to n do
    begin
      x[i] := random(100);
      if i mod 2 <> 0 then listBox1.Items.Add('x[' + intToStr(i) + ']=' + IntToStr(x[i]));
    end;
end;
///////////////////////////////////////////////////////////
//100 slucajno generisanih brojeva i racunanje njihove usme
procedure TForm1.Button3Click(Sender: TObject);
var n, i, s : integer;
var x : array[1..50] of integer;
begin
  n := StrToInt(Edit1.Text);
  s := 0;

  for i := 1 to n do
      begin
        x[i] := random(100);
        listBox1.Items.Add('x[' + intToStr(i) + ']=' + IntToStr(x[i]));
        s := s + x[i];
      end;
  showMessage(IntToStr(s));
end;
//////////////////////////////////////////////////////////
//niz od slucajno generisanih 200 clanova od -100 do 99 i racunanje sume parnih i neparnih br
procedure TForm1.Button4Click(Sender: TObject);
var n, i, sp, sn : integer;
var x : array[1..200] of integer;
begin
 n := StrToInt(Edit1.Text);
 sp := 0;
 sn := 0;

 for i := 1 to n do
     begin
       x[i] := random(200) - 100;
       listBox1.Items.Add('x[' + intToStr(i) + ']=' + IntToStr(x[i]));

       if x[i] mod 2 = 0 then sp := sp + x[i];
       if x[i] mod 2 <> 0 then sn := sn + x[i];
     end;
  showMessage(IntToStr(sp));
  showMessage(IntToStr(sn));
end;
////////////////////////////////////////////////////////
//niz (n clanova) u kom se trazi srednja vrenost clanova
procedure TForm1.Button5Click(Sender: TObject);
var n, i, _sum, input, max_value : integer;
var avg : real;
var x : array[1..200] of integer;
begin
 n := StrToInt(Edit1.Text);

 _sum := 0;
 max_value := 0;
 for i := 1 to n do
     begin
       input := StrToInt(InputBox('unesi clanove niza', 'x[' + intToStr(i) + ']=', ''));
       //maksimalna vrednost niza (neki drugi zad samo ubacen ovde da ne bih radio
       //dva puta isto
       if input > max_value then max_value := input;
       //////////////////////////
       listBox1.Items.Add('x[' + intToStr(i) + ']=' + IntToStr(input));
       _sum := _sum + input;
     end;
 avg := _sum / n;
 showMessage(FloatTostr(avg));
 showMessage(IntToStr(max_value));
end;
////////////////////////////////////////////////////////////
//niz od 8 clanova iz kog se prebrojavaju dvocifreni brojevi
procedure TForm1.Button6Click(Sender: TObject);
var n, i, counter, input : integer;
var x : array[1..8] of integer;
begin
counter := 0;

for i := 1 to 8 do
    begin
      input := strToInt(InputBox('unesi clanove niza', 'x[' + intToStr(i) + ']=', ''));
      listBox1.Items.Add('x[' + intToStr(i) + ']=' + IntToStr(input));
      if input > 9 then
         if input < 100 then counter := counter + 1;
    end;
edit2.Text := intToStr(counter);
end;
//////////////////////////////////////////////////////////
//niz od n clanova iz kog se u listbox-u ucitavaju samo neparni brojevi, a u drugom listboxu
//svi clanovi
procedure TForm1.Button7Click(Sender: TObject);
var n, i, neparni_clanovi, input : integer;
var x : array[1..100] of integer;
begin
n := StrToInt(Edit1.Text);

for i := 1 to n do
    begin
         input := strToInt(inputbox('unesi clanove niza', 'x[' + intToStr(i) + ']=', ''));
         ListBox1.Items.Add(IntToStr(input));
         if input mod 2 <> 0 then ListBox2.Items.Add(intTostr(input));
    end;
end;

procedure TForm1.Button8Click(Sender: TObject);
var x : array[1..10] of integer;
var i : integer;
begin
 for i := 1 to 10 do
     begin
         ListBox1.Items.Add(intToStr(random(100)+50));
     end;
end;

end.

