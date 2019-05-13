with Ada.Text_IO;
use Ada.Text_IO;

separate(main)

Task body Catalog is 
    Dur: Duration;
    Kapcsa: Captcha;
begin 
    accept Start(D: Duration) do 
        Captcha_Generator.Create;
        Kapcsa:= Captcha_Generator.Get;
        Dur:= D;
    end Start;
    loop
        select
            accept Join(N: Nametype; L: Location; C: Captcha; Succesful: out Boolean) do
            Succesful:= Kapcsa = C; 
            if Succesful then 
                Classroom.Add(N, L);
            end if;
            end Join;
        or
            delay Dur;
            exit;
        end select;
    end loop;

end Catalog;