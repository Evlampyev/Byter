object FormRegistration: TFormRegistration
  Left = 0
  Top = 0
  Align = alCustom
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103
  ClientHeight = 260
  ClientWidth = 321
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 59
    Top = 200
    Width = 193
    Height = 33
    Caption = #1047#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1090#1100#1089#1103
    TabOrder = 0
    OnClick = Button1Click
  end
  object LastNameEdit: TEdit
    Left = 7
    Top = 8
    Width = 297
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = #1042#1074#1077#1076#1080#1090#1077' '#1092#1072#1084#1080#1083#1080#1102
    OnClick = LastNameEditClick
  end
  object NameEdit: TEdit
    Left = 7
    Top = 56
    Width = 297
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Text = #1042#1074#1077#1076#1080#1090#1077' '#1080#1084#1103
    OnClick = NameEditClick
  end
  object Klass: TComboBox
    Left = 32
    Top = 152
    Width = 89
    Height = 27
    Hint = #1059#1082#1072#1078#1080#1090#1077' '#1089#1074#1086#1081' '#1082#1083#1072#1089#1089
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    Items.Strings = (
      '5'
      '6'
      '7'
      '8'
      '9'
      '10'
      '11')
  end
  object KlassLetter: TComboBox
    Left = 184
    Top = 152
    Width = 89
    Height = 27
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Items.Strings = (
      #1040
      #1041
      #1042
      #1043
      #1044
      #1045)
  end
  object Panel1: TPanel
    Left = 7
    Top = 104
    Width = 297
    Height = 25
    Caption = #1042#1099#1073#1077#1088#1077#1090#1077' '#1082#1083#1072#1089#1089
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
end
