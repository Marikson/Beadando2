with Ada.Text_IO;

separate(main)

Protected body Captcha_Generator is 
    
    procedure Create is
    begin 
        Cap:= Safe_Random.GetCaptcha;
    end Create;

    function Get return Captcha is 
    begin 
        return Cap;
    end Get;

    function Get_Wrong return Captcha is
    begin 
        return ('A','B','C','D','E','F');
    end Get_Wrong;

end Captcha_Generator;