object Form1: TForm1
  Left = 204
  Top = 127
  Width = 777
  Height = 489
  Caption = 'M'#233'todo de Rufini'
  Color = clInactiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 85
    Width = 73
    Height = 17
    Caption = 'N'#186' de Base'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 52
    Width = 78
    Height = 17
    Caption = 'N Potencias'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 272
    Top = 8
    Width = 246
    Height = 30
    Caption = 'M'#201'TODO DE RUFINI'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -27
    Font.Name = 'Algerian'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Mensaje: TLabel
    Left = 144
    Top = 36
    Width = 3
    Height = 13
  end
  object Label3: TLabel
    Left = 24
    Top = 119
    Width = 115
    Height = 16
    Caption = 'Evaluar la Funci'#243'n'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Funcion: TImage
    Left = 424
    Top = 56
    Width = 321
    Height = 313
  end
  object TLabel
    Left = 16
    Top = 424
    Width = 42
    Height = 16
    Caption = 'Sumas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 112
    Top = 424
    Width = 86
    Height = 16
    Caption = 'Multiplicaci'#243'n'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblSumas: TLabel
    Left = 64
    Top = 424
    Width = 3
    Height = 13
  end
  object lblMultiplicaciones: TLabel
    Left = 208
    Top = 424
    Width = 3
    Height = 13
  end
  object Label8: TLabel
    Left = 424
    Top = 384
    Width = 53
    Height = 16
    Caption = 'Escala X'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 536
    Top = 384
    Width = 53
    Height = 16
    Caption = 'Escala Y'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label10: TLabel
    Left = 200
    Top = 119
    Width = 7
    Height = 21
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object txtNBase: TEdit
    Left = 144
    Top = 85
    Width = 73
    Height = 21
    TabOrder = 0
    OnKeyPress = txtxtNBaseKeyPress
  end
  object Imprimir: TButton
    Left = 23
    Top = 156
    Width = 75
    Height = 33
    Cursor = crHandPoint
    Caption = 'Imprimir'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = ImprimirClick
  end
  object Salir: TButton
    Left = 199
    Top = 156
    Width = 75
    Height = 32
    Cursor = crHandPoint
    Caption = 'Salir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = SalirClick
  end
  object StringGrid1: TStringGrid
    Left = 17
    Top = 197
    Width = 384
    Height = 108
    Color = clMenu
    FixedColor = clCream
    FixedCols = 0
    RowCount = 32
    TabOrder = 3
    ColWidths = (
      43
      68
      57
      96
      94)
  end
  object GroupBox1: TGroupBox
    Left = 304
    Top = 48
    Width = 97
    Height = 136
    TabOrder = 4
    object Label5: TLabel
      Left = 18
      Top = 10
      Width = 56
      Height = 16
      Caption = 'FUNCI'#211'N '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object lbxFuncion: TListBox
      Left = 16
      Top = 32
      Width = 65
      Height = 93
      Cursor = crHandPoint
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 0
    end
  end
  object txtNPotencias: TEdit
    Left = 144
    Top = 52
    Width = 73
    Height = 21
    TabOrder = 5
    OnChange = txtNPotenciasChange
    OnKeyPress = txtNPotenciaKeyPress
  end
  object btnAgregar: TButton
    Left = 232
    Top = 84
    Width = 33
    Height = 20
    Caption = '>>'
    TabOrder = 6
    OnClick = btnAgregarClick
  end
  object txtEvaluar_F: TEdit
    Left = 144
    Top = 119
    Width = 49
    Height = 21
    TabOrder = 7
    OnKeyPress = txtEvaluar_FKeyPress
  end
  object btnGraficar: TButton
    Left = 664
    Top = 376
    Width = 81
    Height = 33
    Caption = 'Graficar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = btnGraficarClick
  end
  object txtEscalaX: TEdit
    Left = 480
    Top = 384
    Width = 49
    Height = 21
    TabOrder = 9
    OnKeyPress = txtEscalaXKeyPress
  end
  object txtEscalaY: TEdit
    Left = 592
    Top = 384
    Width = 49
    Height = 21
    TabOrder = 10
    OnKeyPress = txtEscalaYKeyPress
  end
  object txtEvaluar_F1: TEdit
    Left = 216
    Top = 119
    Width = 49
    Height = 21
    TabOrder = 11
    OnKeyPress = txtEvaluar_F1KeyPress
  end
  object StringGrid2: TStringGrid
    Left = 18
    Top = 311
    Width = 383
    Height = 106
    Color = clMenu
    FixedColor = clMenuBar
    FixedCols = 0
    RowCount = 32
    TabOrder = 12
    ColWidths = (
      39
      71
      55
      95
      93)
  end
  object Borrar: TButton
    Left = 110
    Top = 155
    Width = 74
    Height = 33
    Caption = 'Borrar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 13
    OnClick = BorrarClick
  end
end
