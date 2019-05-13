with Ada.Text_IO;

separate(main)

task body Teacher is 

begin 
    Catalog.Start(5.0);
    loop
        select
            accept Student_Left do 
            Classroom.Check_Random;
            end Student_Left;
        or 
            delay until LessonEnd;
            exit;
        end select;
    end loop;
    Classroom.Print_Final;
end Teacher;