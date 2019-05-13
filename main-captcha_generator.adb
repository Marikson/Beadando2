with Ada.Text_IO;

separate(main)

Protected body Captcha_Generator is 
    
    procedure Create is
    begin
        Printer.Put_Line("Captcha le lett generalva!"); 
        Cap:= Safe_Random.GetCaptcha;
    end Create;

    function Get return Captcha is 
    begin
        Printer.Put_Line("Valaki a JO captchat kerte le!");
        return Cap;
    end Get;

    function Get_Wrong return Captcha is
    begin
        Printer.Put_Line("Valaki a ROSSZ captchat kerte le!"); 
        return ('A','B','C','D','E','F');
    end Get_Wrong;

end Captcha_Generator;