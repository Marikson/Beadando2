with Ada.Text_IO;

separate(main)

protected body Printer is 

    procedure Put_Line(S: String) is 
    begin
        Ada.Text_IO.Put_Line(S);
    end Put_Line;

end Printer;