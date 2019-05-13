with Ada.Text_IO;
with Ada.Numerics.Discrete_Random;
with Ada.Numerics.Float_Random;
with Ada.Calendar;
use Ada.Calendar;

procedure main is 

    Students: constant Integer:= 100;
    LessonLength: constant Duration:= 15.0;
    LessonEnd: constant Time:= clock+LessonLength;
    subtype Nametype is String (1..4);
    subtype Percent is Integer Range 1..100;

    subtype Capitals is Character Range 'A'..'Z';
    type Captcha is array (1..6) of Capitals;
    type Location is (Home, Lecture);
    type NameLoc is record
        Name: Nametype:= "----";
        Loc: Location:= Home;
    end record;
    type Attendance_Sheet is array(1..Students) of NameLoc;
    type StudentPtr is access NameLoc;

    --captcha teszthez
    procedure Put_Line(C: Captcha) is 
    begin 
        for I in Captcha'Range loop
            Ada.Text_IO.Put(C(I));
        end loop;
        Ada.Text_IO.New_Line;
    end Put_Line;

    --Printer
    Protected Printer is  
        procedure Put_Line(S: String);
    end Printer;

    --Generator
    

    Protected Captcha_Generator is 
        procedure Create;
        function Get return Captcha;
        function Get_Wrong return Captcha;
    private
        Cap: Captcha;
    end Captcha_Generator;

    --Katalogus
    Task Catalog is 
        Entry Start(D: Duration);
        Entry Join(N: Nametype; L: Location; C: Captcha; Succesful: out Boolean);
    end Catalog;

    --Tanterem
    Protected Classroom is 
        procedure Add(N: Nametype; L: Location);
        procedure Leave(N: Nametype);
        procedure Check_Random;
        procedure Print_Final;
    private
        Attendees: Attendance_Sheet;
        InRoom: Integer:= 0;
    end Classroom;

    --Hallgato 
    task type Student(S: StudentPtr);

    --Tanar
    Task Teacher is 
       Entry Student_Left;
    end Teacher;

    --Random generator
    package randInteger is new Ada.Numerics.Discrete_Random(Integer); 
    package randPercent is new Ada.Numerics.Discrete_Random(Percent);
    package randCapitals is new Ada.Numerics.Discrete_Random(Capitals);
    package randFloat renames Ada.Numerics.Float_Random;

    Protected Safe_Random is
        function GetPercent return Percent;
        function GetRandStudent return Integer;
        function GetDuration(Min: Duration; Max: Duration) return Duration;
        function GetCaptcha return Captcha;
        procedure Reset;
    private
        IntegerGenerator: randInteger.Generator;
        PercentGenerator: randPercent.Generator;
        CapitalsGenerator: randCapitals.Generator;
        FloatGenerator: randFloat.Generator;
    end Safe_Random;

    

    Protected body Printer is separate;
    Protected body Captcha_Generator is separate;
    Task body Catalog is separate;
    Protected body Classroom is separate;
    Task body Teacher is separate;
    Task body Student is separate;
    Protected body Safe_Random is separate;


begin
    Safe_Random.Reset;
end main;