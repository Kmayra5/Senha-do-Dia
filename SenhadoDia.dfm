object Senha: TSenha
  Left = 686
  Top = 262
  Width = 386
  Height = 233
  Align = alCustom
  AutoSize = True
  Caption = 'Senha do Dia'
  Color = clHighlightText
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 370
    Height = 137
    Align = alTop
    Color = clMenu
    TabOrder = 0
    object lblData: TLabel
      Left = 24
      Top = 48
      Width = 32
      Height = 16
      Alignment = taCenter
      Caption = 'Data:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblSenha: TLabel
      Left = 14
      Top = 96
      Width = 42
      Height = 16
      Caption = 'Senha:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object medtData: TMaskEdit
      Left = 72
      Top = 40
      Width = 118
      Height = 24
      EditMask = '!99/99/9999;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 0
      Text = '  /  /    '
    end
    object edtSenha: TEdit
      Left = 72
      Top = 88
      Width = 121
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnKeyPress = edtSenhaKeyPress
    end
    object rg1: TRadioGroup
      Left = 224
      Top = 16
      Width = 121
      Height = 105
      ItemIndex = 0
      Items.Strings = (
        'Gerar Senha'
        'Gerar Data')
      TabOrder = 2
      OnClick = rg1Click
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 122
    Width = 370
    Height = 72
    Align = alBottom
    Color = clMenu
    TabOrder = 1
    object btnGeraSenha: TButton
      Left = 40
      Top = 17
      Width = 89
      Height = 33
      Caption = 'Gerar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnGeraSenhaClick
    end
    object btnSair: TButton
      Left = 242
      Top = 17
      Width = 89
      Height = 33
      Caption = 'Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnSairClick
    end
    object btnLimpar: TButton
      Left = 141
      Top = 16
      Width = 89
      Height = 33
      Caption = 'Limpar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnLimparClick
    end
  end
end
