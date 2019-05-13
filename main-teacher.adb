with Ada.Text_IO;

separate(main)

task body Teacher is 

begin 
    Catalog.Start(5.0);
    Printer.Put_Line("A Tanar elinditotta a katalogust.");
    loop
        select
            accept Student_Left do 
            Printer.Put_Line("A Tanar eszrevette,hogy valaki kiment.");
            Classroom.Check_Random;
            Printer.Put_Line("A Tanar elvegezte a szuroprobat.");
            end Student_Left;
        or 
            delay until LessonEnd;
            Printer.Put_Line("A Tanar befejezte az orat.");
            exit;
        end select;
        Printer.Put_Line("A Tanar folytatja az orat.");
    end loop;
    Printer.Put_Line("A Tanar megnezi a vegso katalogust:");
    Classroom.Print_Final;
    Printer.Put_Line("A Tanar kilepett.");
end Teacher;