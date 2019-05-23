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
  C = array[0..75,0..10,0..2,0..2] of i64;
  pc = ^C;

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


function count(idx: i32; pr: i32; s1: i32; s2: i32; n: String; cache:pc):i64;
var
   res, tmp, len, i: i64;
begin
   len := Length(n);
   tmp := 0;
   if(cache^[idx,pr,s1,s2]<>-5) then Exit(cache^[idx,pr,s1,s2]);
   if(idx = len) then begin
      Exit(s1);
   end;
   res := 0;

   if(s1 = 1) then
   begin
      for i := 0 to 9 do begin
         if(s2 = 0) then
         begin
            if(pr <= i) then
               res := res + count(idx+1, i, s1, 0, n, cache) 
            else res := res + count(idx+1, i, s1, 1, n, cache);
         end
         else if(pr >= i) then
              res := res + count(idx+1, i, s1, 1, n, cache);
      end;
   end
   else
   begin
      for i := 0 to (i32(n[idx+1])-48) do begin
         if(i < i32(n[idx+1])-48) then tmp := 1
         else tmp := 0;
         if(s2 = 0) then
         begin
            if(pr <= i) then
               res := res + count(idx+1, i, tmp, 0, n,cache)
            else
               res := res + count(idx+1, i, tmp, 1, n,cache);
         end
         else if(pr >= i) then
            res := res + count(idx+1, i, tmp, 1, n,cache);
      end;
   end;
   cache^[idx,pr,s1,s2] := res;
   Exit(cache^[idx,pr,s1,s2]);
end;

var
   n:String;
   countc, i, j, k: i32;
   cache: C;

begin
   readln(countc);
   for k := 0 to countc-1 do begin
      for i := 0 to 75 do
         for j := 0 to 10 do begin
            cache[i,j,0,0] := -5;
            cache[i,j,0,1] := -5;
            cache[i,j,1,0] := -5;
            cache[i,j,1,1] := -5;
         end;
      readln(n);
      if(check(n))then
      writeln(count(0,0,0,0,n, @cache))
      else writeln('-1');
   end
end.
