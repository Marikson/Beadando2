with Ada.Text_IO;

separate(main)

Protected body Safe_Random is 

    function GetPercent return Percent is
        Chance: Percent;
    begin 
        Chance:= randPercent.random(PercentGenerator);
        return Chance;
    end GetPercent;

    function GetRandStudent return Integer is
        RndNum: Integer;
    begin 
        RndNum:= randInteger.random(IntegerGenerator);
        return RndNum;
    end GetRandStudent;

    function GetDuration(Min: Duration; Max: Duration) return Duration is
        Rnd: Duration;
    begin
        Rnd:= Duration(randFloat.random(FloatGenerator));
        return Rnd * (Max-Min) + Min;
    end GetDuration;

    function GetCaptcha return Captcha is 
        Cap: Captcha;
    begin 
        for I in Captcha'Range loop
            Cap(I):= randCapitals.random(CapitalsGenerator);
        end loop;
        return Cap;
    end GetCaptcha;

    procedure Reset is 
    begin 
        randPercent.reset(PercentGenerator);
        randInteger.reset(IntegerGenerator);
        randFloat.reset(FloatGenerator);
        randCapitals.reset(CapitalsGenerator);
    end Reset;

end Safe_Random;