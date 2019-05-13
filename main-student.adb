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
        Printer.Put_Line("A Diak( " & S.Name &" ) kapcsaja: " & Printer.ToString(C));
        select
            Catalog.Join(S.Name, S.Loc, C, Succesful);
                if Succesful then
                    Printer.Put_Line("A Diak( " & S.Name &" ) csatlakozasa sikeres");
                    WaitTime := Safe_Random.GetDuration(0.0, 15.0);
                    if WaitTime < LessonEnd-clock then  
                        delay WaitTime;
                        Printer.Put_Line("A Diak( " & S.Name &" ) elhagyja az orat...");
                        Classroom.Leave(S.Name);
                        Printer.Put_Line("A Diak( " & S.Name &" ) elhagyta az orat.");
                        exit;
                    else
                        delay LessonEnd-clock;
                        Printer.Put_Line("A Diak( " & S.Name &" ) az ora vegeig maradt.");
                        exit;
                    end if;
                else
                    Printer.Put_Line("A Diak( " & S.Name &" ) csatlakozasa sikertelen");
                    delay 1.0;
                end if;
            else 
                Printer.Put_Line("A Diak( " & S.Name &" ) zarva talalta a katalogust");
                exit;
        end select;
    end loop;
    
    Printer.Put_Line("A Diak( " & S.Name &" ) kilepett.");

end Student;