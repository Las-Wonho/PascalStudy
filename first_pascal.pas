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


function count(idx: ShortInt; pr: ShortInt; s1: ShortInt; s2: ShortInt; n: String): ShortInt;
var
   res, tmp, len, i: i8;
begin
   len := Length(n);
   res := 0;
   if idx = len then res := s1;
   if idx <> len then
      if s1 > 0 then
         for i := 0 to 10 do begin
            if s2 = 0 
            then
            begin
               if pr <= i
               then begin
                  res := res + count(idx + 1, i, s1, 0, n);
               end;
               else begin
                  res := res + count(idx + 1, i, s1, 1, n);
               end;
            end;
            else
            begin
               if pr >= i then
                  res := res + count(idx + 1, i, s1, 1, n);
            end;
         end;
      if not s1 > 0 then
         for i := 0 to ShortInt(n[idx])-48 do begin
            if i < ShortInt(n[idx]) - 48
            then tmp := 1;
            else tmp := 0;

            if s2 = 0
            then begin
               if pr <= i 
               then begin
                  res := res + count(idx + 1, i, tmp, 0, n);
               end;
               else begin
                  res := res + count(idx + 1, i, tmp, 1, n);
               end;
            end;
            else begin
               if pr >= i then
                  res := res + count(idx + 1, i, tmp, 1, n);        
            end;
         end;
      writeln(res);
      count := res;
end;

var
   n:String;
   arr_len:i8;
   countc, i: i16;
begin
   readln(countc);
   for i := 0 to countc-1 do begin
      readln(n);
      writeln(check(n));
      writeln(count(0,0,0,0,n));
   end
end.