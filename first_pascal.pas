program HelloWorld;
uses crt;
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


function count(idx: i32; pr: i32; s1: i32; s2: i32; n: String): i64;
var
   res, tmp, len, i: i64;
begin
   len := Length(n);
   tmp := 0;
   if(idx = len) then
      Exit(s1);
   res := 0;

   if(s1 = 1) then
   begin
      for i := 0 to 9 do begin
         if(s2 = 0) then
         begin
            if(pr <= i) then
               res := res + count(idx+1, i, s1, 0, n) 
            else res := res + count(idx+1, i, s1, 1, n);
         end
         else if(pr >= i) then
              res := res + count(idx+1, i, s1, 1, n);
      end;
   end
   else
   begin
      for i := 0 to i32(n[idx]) do begin
         if(i < i32(n[idx])) then tmp := 1
         else tmp := 0;
         if(s2 = 0) then
         begin
            if(pr <= i) then
               res := res + count(idx+1, i, tmp, 0, n)
            else
               res := res + count(idx+1, i, tmp, 1, n);
         end
         else if(pr >= i) then
            res := res + count(idx+1, i, tmp, 1, n);
      end;
   end;
   Exit(res);
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
