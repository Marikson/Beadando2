with Ada.Text_IO;

separate(main)

task body Student is 
    C: Captcha;
    CH: Integer;
    WaitTime: Duration;
    Succesful: Boolean;
begin
    loop
        CH:= Safe_Random.GetPercent;
        if CH <= 80 and S.Loc = Lecture then
            C:= Captcha_Generator.Get;    
        elsif CH <= 10 and S.Loc = Home then 
            C:= Captcha_Generator.Get;
        else 
            C:= Captcha_Generator.Get_Wrong;
        end if;
        select
            Catalog.Join(S.Name, S.Loc, C, Succesful);
                if Succesful then
                    WaitTime:= Safe_Random.GetDuration(0.0, 15.0);
                    if WaitTime < LessonEnd-clock then  
                        delay WaitTime;
                        Classroom.Leave(S.Name);
                        exit;
                    else
                        delay LessonEnd-clock;
                        exit;
                    end if;
                else
                    delay 1.0;
                end if;
            else 
                exit;
        end select;
    end loop;

end Student;