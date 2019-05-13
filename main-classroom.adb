with Ada.Text_IO;

separate(main)

Protected body Classroom is

    procedure Add(N: Nametype; L: Location) is
    begin 
        InRoom := InRoom+1;
        Attendees(InRoom).Name:= N;
        Attendees(InRoom).Loc:= L; 
    end Add;

    procedure Leave(N: Nametype) is
        DS: access Door_Slam;   
    begin 
        for I in Attendees'Range loop
            if Attendees(I).Name = N and Attendees(I).Loc = Lecture then 
                Attendees(I).Loc:= Home;
                DS := new Door_Slam;
            end if;
        end loop;
    end Leave;

    procedure Check_Random is 
        Num: Positive;
    begin 
        
        Num:= Safe_Random.GetRandStudent mod InRoom +1;
        if Attendees(Num).Loc = Home then 
            Attendees(Num):= Attendees(InRoom);
            InRoom:= InRoom-1;
        end if;
    end Check_Random;

    procedure Print_Final is 
    begin 
        for I in 1..InRoom loop
            Printer.Put_Line(Integer'Image(I) & " " & Attendees(I).Name & ": " & Location'Image(Attendees(I).Loc));
        end loop;
    end Print_Final;

end Classroom;