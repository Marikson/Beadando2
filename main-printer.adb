with Ada.Text_IO;

separate(main)

protected body Printer is 

    procedure Put_Line(S: String) is 
    begin
        Ada.Text_IO.Put_Line(S);
    end Put_Line;

    function toString(C: Captcha) return String is 
        S: String(1..6);
    begin 
        for I in Captcha'Range loop
            S(I):= C(I);
        end loop;
        return S;
    end ToString;

end Printer;