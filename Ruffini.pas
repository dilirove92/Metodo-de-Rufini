//********************MÉTODO DE RUFFINI*********************
//Programa que evalúa una función aplicando el método de Ruffini
//Autora: Srta. Romero Vera Diana Lissette
//Curso: TERCERO "A"

unit Ruffini;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Mensaje: TLabel;
    txtNBase: TEdit;
    Imprimir: TButton;
    Salir: TButton;
    StringGrid1: TStringGrid;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    lbxFuncion: TListBox;
    txtNPotencias: TEdit;
    btnAgregar: TButton;
    Label3: TLabel;
    txtEvaluar_F: TEdit;
    Funcion: TImage;
    btnGraficar: TButton;
    Label7: TLabel;
    lblSumas: TLabel;
    lblMultiplicaciones: TLabel;
    Label8: TLabel;
    txtEscalaX: TEdit;
    Label9: TLabel;
    txtEscalaY: TEdit;
    txtEvaluar_F1: TEdit;
    Label10: TLabel;
    StringGrid2: TStringGrid;
    Borrar: TButton;
    procedure SalirClick(Sender: TObject);
    procedure btnAgregarClick(Sender: TObject);
    procedure txtNPotenciaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure ImprimirClick(Sender: TObject);
    procedure txtNPotenciasChange(Sender: TObject);
    procedure btnGraficarClick(Sender: TObject);
    procedure txtxtNBaseKeyPress(Sender: TObject; var Key: Char);
    procedure txtEvaluar_FKeyPress(Sender: TObject; var Key: Char);
    procedure txtEscalaXKeyPress(Sender: TObject; var Key: Char);
    procedure txtEscalaYKeyPress(Sender: TObject; var Key: Char);
    procedure txtEvaluar_F1KeyPress(Sender: TObject; var Key: Char);
    procedure BorrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Type
  Vector_Potencia= array [0..25] of Double;
  Vector_A= array[0..25] of Double;
  Vector_B= array [0..25] of Double;
  Vector_Suma= array [0..25] of Double;
  Vector_A1=array[0..25] of Double;

var  //Variables globales
  Form1: TForm1;
  N_Potencias: Integer;
  Potencia: Integer;
  VectorA: Vector_A;
  VectorB: Vector_B;
  VectorSuma: Vector_Suma;
  VectorA1: Vector_A1;
  Aux: Double;
  sumas:Integer;
  multiplicaciones: Integer;
  valor_inicial: Integer;
  valor_final: integer;

implementation

{$R *.dfm}

// _________________________
//|Al cargarse el Formulario|
//'''''''''''''''''''''''''''
procedure TForm1.FormCreate(Sender: TObject);
var origenx, origeny: integer;
begin
    txtNBase.Enabled:=False;
    txtEvaluar_F.Enabled:=False;
    txtEvaluar_F1.Enabled:=False;
    Potencia:=1;
    aux:=0;
    sumas:=0;
    multiplicaciones:=0;

    //Encabezado del StringGrid
     StringGrid1.Cells[0,0]:='Nº Base';
     StringGrid1.Cells[1,0]:='Nº Evaluador';
     StringGrid1.Cells[2,0]:='  Potencia';
     StringGrid1.Cells[3,0]:='     Multiplicación';
     StringGrid1.Cells[4,0]:='           Suma';

     StringGrid2.Cells[0,0]:='Nº Base';
     StringGrid2.Cells[1,0]:='Nº Evaluador';
     StringGrid2.Cells[2,0]:='  Potencia';
     StringGrid2.Cells[3,0]:='     Multiplicación';
     StringGrid2.Cells[4,0]:='           Suma';

     with Funcion.Canvas do //Hoja es una TImage en este caso
     begin
      origenx:= Trunc(Funcion.Width/2); //establezco el origen (0,0) en la mitad de la hoja
      origeny:= Trunc(Funcion.Height/2);
      MoveTo(origenx,0); //dibujo los ejes
      LineTo(origenx,Funcion.Height);
      MoveTo(0,origeny);
      LineTo(Funcion.Width,origeny);
    end;
end;

// ____________________
//|Ingreso de Potencias|
//'''''''''''''''''''''
procedure TForm1.txtNPotenciaKeyPress(Sender: TObject; var Key: Char);
begin
      //Si se ingresan caracteres no permitidos muestra un mensaje de error
  if ((key<chr(48))or(key>chr(57)))then
      begin
      Key := chr(0) ;
      showmessage('Error. Debe ingresar Numeros');
      end;
      txtNBase.Enabled:=True;
      txtEscalaX.Text:='10';
      txtEscalaY.Text:='10';
end;

// _______________________________
//|Cuando se ingresa una Potencias|
//''''''''''''''''''''''''''''''''
procedure TForm1.txtNPotenciasChange(Sender: TObject);
begin
  //Si se ingresan caracteres no permitidos muestra un mensaje de error
  txtEvaluar_F.Enabled:=True;
end;

// ____________________
//|Ingreso de las Bases|
//'''''''''''''''''''''
procedure TForm1.txtxtNBaseKeyPress(Sender: TObject; var Key: Char);
begin
  //Si se ingresan caracteres no permitidos muestra un mensaje de error
  if ((key<chr(16))or (key>chr(16)))and((key<chr(44))or (key>chr(45)))and((key<chr(48))or(key>chr(57)))then
  begin
      Key := chr(0) ;
      showmessage('Error. Debe ingresar Numeros');
  end;
end;

// ________________
//|Botón Agregar >>|
//''''''''''''''''''
procedure TForm1.btnAgregarClick(Sender: TObject);
  var //Variables que se utilizarán en el botón Agregar
  NPotencia: Integer;

  begin
      //Se toman los valores de base
      N_Potencias:=StrtoInt(txtNPotencias.Text);
      //Estos valores serán receptasos dependiendo de la potencia
      if (N_Potencias>=Potencia) then
      begin
        NPotencia:=(N_Potencias)-Potencia;
        //Se los agrega al ListBox
        if (txtNBase.Text<>'') then
        begin
          VectorA[Potencia-1]:=StrtoFloat(txtNBase.Text);
          lbxFuncion.Items.Add((txtNBase.Text)+'X^'+InttoStr(NPotencia));
          Potencia:=Potencia+1;
        end;
        //Si no hay un valor en el textbox se pide ingresarlo
        if (txtNBase.Text='')  then
        begin
           showmessage('Error. Debe ingresar Numero de Base');
        end;
        //Cuando se hallan ingresado todos los valores de base se ingresa la cantidad evaluadora
        if Npotencia=0 then
        begin
          txtEvaluar_F.Enabled:=True;
          txtEvaluar_F1.Enabled:=True;
        end;
        //Se borra el contenido del del TextBox
        txtNBase.Text:='';
      end;
end;

// ________________________________________________
//|Ingreso de Valor Inicial para Evaluar la Función|
//'''''''''''''''''''''''''''''''''''''''''''''''''
procedure TForm1.txtEvaluar_FKeyPress(Sender: TObject; var Key: Char);
begin
    //Si se ingresan caracteres no permitidos muestra un mensaje de error
      if ((key<chr(16))or (key>chr(16)))and((key<chr(44))or (key>chr(45)))and((key<chr(48))or(key>chr(57)))then
      begin
      Key := chr(0) ;
      showmessage('Error. Debe ingresar Numeros');
      end;
end;

// ______________________________________________
//|Ingreso de Valor Final para Evaluar la Función|
//'''''''''''''''''''''''''''''''''''''''''''''''
procedure TForm1.txtEvaluar_F1KeyPress(Sender: TObject; var Key: Char);
begin
//Si se ingresan caracteres no permitidos muestra un mensaje de error
      if ((key<chr(16))or (key>chr(16)))and((key<chr(44))or (key>chr(45)))and((key<chr(48))or(key>chr(57)))then
      begin
      Key := chr(0) ;
      showmessage('Error. Debe ingresar Numeros');
      end;
end;

// ______________
//|Botón Imprimir|
// ''''''''''''''
procedure TForm1.ImprimirClick(Sender: TObject);

  var //Variables a utilizar dentro del Botón Imprimir
  n: Integer;
  i: Integer;
  j: Integer;
  k: Integer;
  l: Integer;
  m: Integer;
  contador: integer;
  contador1: integer;
begin
  //Se realiza al proceso si hay un valor de Potencias ingresado
  if (txtNPotencias.Text<>'') then
  begin
      //Se ingresan al proceso si hay una cantidad evaluadora
      if((txtEvaluar_F.Text<>'') and  (txtEvaluar_F1.Text<>''))then
      begin
        contador:=1;
        contador1:=1;
        n:=N_Potencias;
        valor_inicial:=StrtoInt(txtEvaluar_F.Text);
        valor_final:=StrtoInt(txtEvaluar_F1.Text);
        StringGrid1.RowCount:=2;
        StringGrid2.RowCount:=2;
        //Cálculo de los valores
        for k:=valor_inicial to valor_final do
        begin
          //Encera los vectores B y de Suma
          for i := 0 to (n-1) do
          begin
            VectorB[i] := 0;
            VectorSuma[i] := 0;
          end;
          aux:=0;
          //Proceso calcula los valores del rango de numeros de evaluaciòn
          for j := 0 to (n-1) do
          begin
            VectorB[j]:=(k*aux);
            aux := VectorA[j]+VectorB[j];
            VectorSuma[j] := aux + VectorSuma[j];
            sumas:=sumas+1;
            multiplicaciones:=multiplicaciones+1;
            //Mostrar los datos
            StringGrid1.Cells[0,j+contador]:=FloattoStr(VectorA[j]);
            StringGrid1.Cells[1,j+contador]:=InttoStr(k);
            StringGrid1.Cells[2,j+contador]:=FloattoStr(n-j-1);
            StringGrid1.Cells[3,j+contador]:=FloattoStr(VectorB[j]);
            StringGrid1.Cells[4,j+contador]:=FloattoStr(VectorSuma[j]);
            //Aumentar una Fila
            StringGrid1.RowCount := StringGrid1.RowCount + 1;
          end;

          //Primera derivada
          for l := 0 to (n-1) do
          begin
            VectorA1[l]:=VectorSuma[l];
            VectorB[l] := 0;
            VectorSuma[l] := 0;
          end;
          VectorA1[n-1]:=0;
          aux:=0;
          //Proceso calcula los valores del rango de numeros de evaluaciòn
          for m := 0 to (n-1) do
          begin
            VectorB[m]:=(k*aux);
            aux := VectorA1[m]+VectorB[m];
            VectorSuma[m] := aux + VectorSuma[m];
            //Mostrar los datos
            StringGrid2.Cells[0,m+contador1]:=FloattoStr(VectorA1[m]);
            StringGrid2.Cells[1,m+contador1]:=InttoStr(k);
            StringGrid2.Cells[2,m+contador1]:=FloattoStr(n-m-1);
            StringGrid2.Cells[3,m+contador1]:=FloattoStr(VectorB[m]);
            StringGrid2.Cells[4,m+contador1]:=FloattoStr(VectorSuma[m]);
            //Aumentar una Fila
            StringGrid2.RowCount := StringGrid2.RowCount + 1;
          end;
          contador:=contador+n;
          contador1:=contador1+n-1;
        end;
        //Mostrar el Nº de Sumas y Multiplicaciones
        lblSumas.Caption:=IntToStr(sumas);
        lblMultiplicaciones.Caption:=IntToStr(multiplicaciones);
    end;
    //Si no hay una cantidad evaluadora se la pide ingresar
    if ((txtEvaluar_F.Text='') or (txtEvaluar_F1.Text='')) then
    begin
      showmessage('Error. Debe ingresar Números para evaluar la Función');
    end;
  end;
  //si no hay un número de potencias ingresado se lo pide ingresar
  if (txtNPotencias.Text='') then
  begin
    showmessage('Error. Debe ingresar el Numero de Potencias >0');
  end;
end;


// ____________
//|Botón Borrar|
// ''''''''''''
procedure TForm1.BorrarClick(Sender: TObject);
var //variables a utilizar en el botón borrar
  i: integer;
  origenx:integer;
  origeny:integer;

begin
    Potencia:=1;
    aux:=0;
    sumas:=0;
    multiplicaciones:=0;

    //Encerar vectores
    for i := 0 to (N_Potencias-1) do
    begin
      VectorA[i]:=0;
      VectorB[i] := 0;
      VectorSuma[i] := 0;
    end;
    //Encerar cuadros de ingresos de datos
    txtNPotencias.Text:='';
    txtNBase.Text:='';
    txtEvaluar_F.Text:='';
    txtEvaluar_F1.Text:='';
    lbxFuncion.Clear;

    //Limpiar el StringGrid
    for I := 1 to StringGrid1.RowCount - 1 do
    begin
      StringGrid1.Rows[i].Clear;
    end;
    StringGrid1.Cells[0,0]:='Nº Base';
    StringGrid1.Cells[1,0]:='Nº Evaluador';
    StringGrid1.Cells[2,0]:='  Potencia';
    StringGrid1.Cells[3,0]:='     Multiplicación';
    StringGrid1.Cells[4,0]:='           Suma';

    StringGrid2.Cells[0,0]:='Nº Base';
    StringGrid2.Cells[1,0]:='Nº Evaluador';
    StringGrid2.Cells[2,0]:='  Potencia';
    StringGrid2.Cells[3,0]:='     Multiplicación';
    StringGrid2.Cells[4,0]:='           Suma';

    lblsumas.Caption:='';
    lblmultiplicaciones.Caption:='';

    //Limpiar la Gráfica
    Funcion.Picture := nil;
    with Funcion.Canvas do //Hoja es una TImage en este caso
    begin
      origenx:= Trunc(Funcion.Width/2); //establezco el origen (0,0) en la mitad de la hoja
      origeny:= Trunc(Funcion.Height/2);
      MoveTo(origenx,0); //dibujo los ejes
      LineTo(origenx,Funcion.Height);
      MoveTo(0,origeny);
      LineTo(Funcion.Width,origeny);
    end;
end;

// _________________________
//|Ingreso de valor Escala X|
//''''''''''''''''''''''''''
procedure TForm1.txtEscalaXKeyPress(Sender: TObject; var Key: Char);
begin
    //Si se ingresan caracteres no permitidos muestra un mensaje de error
      if ((key<chr(48))or(key>chr(57)))then
      begin
      Key := chr(0) ;
      showmessage('Error. Debe ingresar Numeros');
      end;
end;

// _________________________
//|Ingreso de valor Escala Y|
//''''''''''''''''''''''''''
procedure TForm1.txtEscalaYKeyPress(Sender: TObject; var Key: Char);
begin
    //Si se ingresan caracteres no permitidos muestra un mensaje de error
      if ((key<chr(48))or(key>chr(57)))then
      begin
      Key := chr(0) ;
      showmessage('Error. Debe ingresar Numeros');
      end;
end;

// _______________
//|Botón Graficar|
//''''''''''''''''
procedure TForm1.btnGraficarClick(Sender: TObject);
var escx,escy, cont: integer;
origenx,origeny,i,j,k,l,m,red1,aum1,red2,aum2: integer;
X_elevado,val,x,fx,aux: Double;
begin
    //escx:= StrtoInt(txtEvaluar_F.Text);
    escx:=StrtoInt(txtEscalaX.Text) ;
    //escy:= escx*(-1);
    escy:=StrtoInt(txtEscalaY.Text);
    //valores para cuadrícula
    red1:=escy;
    aum1:=escy;
    red2:=escx;
    aum2:=escx;
    //Limpiar la Gráfica
    Funcion.Picture := nil;
    with Funcion.Canvas do //Hoja es una TImage en este caso
    begin
      origenx:= Trunc(Funcion.Width/2); //establezco el origen (0,0) en la mitad de la hoja
      origeny:= Trunc(Funcion.Height/2);

      //cuadrícula
      Funcion.Canvas.Pen.Color:=clWhite;
      for j:=0  to Funcion.Width do //genero el grafico en todo el ancho de TImage
      begin
            MoveTo(0,origeny+aum2);
            LineTo(Funcion.Width,origeny+aum2);
            MoveTo(0,origeny-red2);
            LineTo(Funcion.Width,origeny-red2);
            aum2:=aum2+escx;
            red2:=red2+escx;
      end;
      for m:=0  to Funcion.Width do //genero el grafico en todo el ancho de TImage
      begin
            MoveTo(origenx+aum1,0);
            LineTo(origenx+aum1,Funcion.Height);
            MoveTo(origenx-red1,0);
            LineTo(origenx-red1,Funcion.Height);
            aum1:=aum1+escy;
            red1:=red1+escy;
      end;
      //Dibujar los Ejes
      Funcion.Canvas.Pen.Color:=clBlack;
      MoveTo(origenx,0); //dibujo los ejes
      LineTo(origenx,Funcion.Height);
      MoveTo(0,origeny);
      LineTo(Funcion.Width,origeny);
      //Función
      Funcion.Canvas.Pen.Color:=clBlue;
      for i:=0  to Funcion.Width do //genero el grafico en todo el ancho de TImage
      begin
          x:= -escx + 2*escx*i/Funcion.Width; // simplemente observar los valores extremos de i
          fx:=0;
          for k:=0 to (N_Potencias) do
          begin
            cont:=N_potencias-k-2;
            X_elevado:=1;
            for l:=0 to cont do
            begin
              X_elevado:=X_elevado*x;
            end;
            val:=VectorA[k]*X_elevado;
            fx:=fx+val;
          end;
            if i = 0 then //La primera vez solo muevo
            begin
            MoveTo(0,Trunc(origeny - fx*origeny/escy));
            end;
            if i <> 0 then
            begin
            LineTo(i,Trunc(origeny - fx*origeny/escy));
            end;
      end;

end;
end;

// ___________
//|Botón Salir|
//'''''''''''''
procedure TForm1.SalirClick(Sender: TObject);
begin
    close;
end;


end.
