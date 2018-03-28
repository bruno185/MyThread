object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 437
  ClientWidth = 240
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 24
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Thread 1 on'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 24
    Top = 112
    Width = 195
    Height = 317
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object Button2: TButton
    Left = 24
    Top = 55
    Width = 75
    Height = 25
    Caption = 'Thread 1 off'
    Enabled = False
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 144
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Thread 2 on'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 144
    Top = 55
    Width = 75
    Height = 25
    Caption = 'Thread 2 off'
    Enabled = False
    TabOrder = 4
    OnClick = Button4Click
  end
  object Edit1: TEdit
    Left = 24
    Top = 86
    Width = 75
    Height = 21
    TabOrder = 5
    Text = '1000000'
  end
  object CheckBox1: TCheckBox
    Left = 144
    Top = 86
    Width = 75
    Height = 17
    Caption = 'Clear'
    Checked = True
    State = cbChecked
    TabOrder = 6
  end
end
