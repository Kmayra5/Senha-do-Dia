unit SenhadoDia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls;

type
  TSenha = class(TForm)
    pnlTopo: TPanel;
    pnlRodape: TPanel;
    btnGeraSenha: TButton;
    lblData: TLabel;
    medtData: TMaskEdit;
    lblSenha: TLabel;
    edtSenha: TEdit;
    btnSair: TButton;
    btnLimpar: TButton;
    rg1: TRadioGroup;
    procedure btnGeraSenhaClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure rg1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtSenhaKeyPress(Sender: TObject; var Key: Char);
  private
    function ValidaData(data: string): Boolean;
    procedure GeraSenha(data: string);
    function ValidaSenha(senha: string): Boolean;
    function GeraData(senha: string): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Senha: TSenha;

implementation

{$R *.dfm}

function TSenha.ValidaData(data:string):Boolean;
begin
  Result:= False;
   if (data = '  /  /    ')then
   begin
      if (MessageDlg('A data não pode ficar em branco! Mudar para data atual?',
                      mtConfirmation, [mbYes, mbNo],0) = mrYes )then
         medtData.Text := DateToStr(Now());
   end
   else
   begin
      try
         StrToDate(data);
         Result := True;
         except on EConvertError do
         begin
            if (MessageDlg('Data inválida! Mudar para data atual?',
                           mtConfirmation, [mbYes, mbNo],0) = mrYes)then
               medtData.Text := DateToStr(Now())
            else
               medtData.Text := '';
         end;
      end;
   end;
end;

procedure TSenha.GeraSenha(data:string);
var
   dia, mes, ano : Word;
   senha         : Double;
   aux           : string;
begin
   senha := 0 ;
   try
     Screen.Cursor := crHourGlass;
     DecodeDate((StrToDate(data)),ano,mes,dia);
     aux := inttostr(ano);

     if (mes <=9)then
        aux := aux +'0'+ Inttostr(mes)
     else
       aux := aux + Inttostr(mes);

     if(dia <=9)then
       aux := aux +'0'+ IntToStr(dia)
     else
        aux := aux + IntToStr(dia);

     senha := StrToFloat(aux)* 2 * dia;
     edtSenha.Text    := FloatToStr(senha);
     edtSenha.Enabled := True;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TSenha.btnGeraSenhaClick(Sender: TObject);
begin
   if rg1.ItemIndex = 0 then
   begin
      if(ValidaData(medtData.text))then
         GeraSenha(medtData.Text);
   end
   else
   begin
     medtData.Text := '';
     if(ValidaSenha(edtSenha.Text))then
     begin
        if(not GeraData(edtSenha.Text))then
           MessageDlg('A Senha não é válida!',mtWarning,[mbOK],0);
     end
   end;
end;

function TSenha.ValidaSenha(senha:string):Boolean;
   var xsenha: Double;
begin
   Result := False;
   xsenha := 0;

   if Senha = '' then
   begin
      MessageDlg('A Senha não pode ficar vazia!',mtWarning,[mbOK],0);
      if(edtSenha.CanFocus)then
         edtSenha.SetFocus;
      Exit;
   end;

   xsenha := (StrToFloat(senha)/2);
   if ((StrToFloat(senha) /2) = Trunc((StrToFloat(senha)/2)))and
       (Length(senha) >= 8 )then
   begin
      Result := True;
   end
   else
      MessageDlg('A Senha não é válida!',mtWarning,[mbOK],0);
end;

function TSenha.GeraData(senha: string):Boolean;
var
   xsenha        : Double;
   i             : Integer;
   data          : TDateTime;
   ssenha        : string;
   dia, mes, ano : Word;
begin
   xsenha := 0;
   i      := 0;
   ssenha := '';
   data   := Now;
   Result := False;

   try
      Screen.Cursor := crHourGlass;
      for i:=1 to 31 do
      begin
        xsenha := (StrToFloat(senha)) / 2;
        xsenha := xsenha/i;
        ssenha := FloatToStr(xsenha);

        if (xsenha <> Trunc(xsenha)) or
           (Length(ssenha) > 8 )then
        begin
           Continue;
        end
        else
        begin
           dia := StrToInt(Copy(ssenha, Length(ssenha)-1,2));
           if(dia = i)then
           begin
              ano := StrToInt(Copy(ssenha,1,4));
              mes := StrToInt(Copy(ssenha,5,2));
              try
                 data := EncodeDate(ano,mes,dia);
                 medtData.Text := DateToStr(data);
                 Result := True;
              except on EConvertError do
                 Result := False;
              end;
           end
           else
              Continue;
        end;
      end;
   finally
      Screen.Cursor := crDefault;
   end;
end;

procedure TSenha.btnSairClick(Sender: TObject);
begin
   Application.Terminate;
end;

procedure TSenha.btnLimparClick(Sender: TObject);
begin
   medtData.Text := '';
   edtSenha.Text := '';
end;

procedure TSenha.rg1Click(Sender: TObject);
begin
   if rg1.ItemIndex = 0 then
   begin
      btnLimparClick(Self);
      edtSenha.Enabled := False;
      lblSenha.Enabled := False;
      medtData.Enabled := True;
      lblData.Enabled  := True;
      if(medtData.CanFocus)then
         medtData.SetFocus
   end
   else
   begin
     MessageDlg('Será aceito senha apenas para anos a partir de 1000',
               mtWarning,[mbOK],0);
     btnLimparClick(Self);
     edtSenha.Enabled := True;
     lblSenha.Enabled := True;
     medtData.Enabled := False;
     lblData.Enabled  := False;
     if(edtSenha.CanFocus)then
         edtSenha.SetFocus;
   end;
end;

procedure TSenha.FormCreate(Sender: TObject);
begin
   rg1.ItemIndex    := 0;
   lblSenha.Enabled := False;
   edtSenha.Enabled := False;
end;

procedure TSenha.edtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
   if (( not (Key in ['0'..'9'])) and (word(Key) <> vk_back ))then
      Key := #0;
end;

end.
