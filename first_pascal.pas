program HelloWorld;
uses crt;




(* Here the main program block starts *)
type
  i8 = ShortInt;
  i16 = SmallInt;
  i32 = LongInt;
  i64 = Int64;
  u8 = Byte;
  u16 = Word;
  u32 = Cardinal;
  f32 = Single;
  f64 = Double;
  IntArray = Array of i32;
  IntArrayPtr = ^IntArray;


function check(n: String): Boolean;
var
   i: i8;
   up,res: Boolean;
begin
   up := true;
   res := true;
   for i := 1 to Length(n) do begin
      if n[i-1] < n[i] then
         if not up then
            res := false;
      if n[i-1] > n[i] then
         up := false;
   end;

   check := res;
end;


function count(idx: i8, pr: i8, s1: i8, s2: i8,len: i8, n: String): i8;
var
   res, tmp: i8;
begin
   res := 0
   if idx == len then
      res := s1;
   else
      if s1 > 0 then
         for i := 0 to 10 do begin
            if s2 == 0 then
               if pr <= i then
                  res := res + count(idx + 1, i, s1, 0, n);
               else
                  res := res + count(idx + 1, i, s1, 1, n);
            else
               if pr >= i then
                  res := res + count(idx + 1, i, s1, 1, n);
         end;
      else
        for i := 0 to n[idx] do begin
        
        end;
end


var
   n:String;
   arr_len:i8;
   count, i: i16;
begin
   readln(count);
   for i := 0 to count-1 do begin
      readln(n);
      
      writeln(check(n));
   end
end.
