program HelloWorld;
type
  i8 = ShortInt;
  i16 = SmallInt;
  i32 = LongInt;
  i64 = Int64;
  ps = ^String;
  C = array[0..75,0..10,0..2,0..2] of i64;
  pc = ^C;

var
   n:String;
   countc, i, j, k, len: i64;
   cache: C;

function check(n: String): Boolean;
var
   i: i16;
   up,res: Boolean;
begin
   up := true;
   res := true;
   for i := 2 to Length(n) do begin
      if n[i-1] < n[i] then
         if not up then
            res := false;
      if n[i-1] > n[i] then
         up := false;
   end;

   check := res;
end;


function count(idx: i32; pr: i32; s1: i8; s2: i8; n: ps):i64;
var
   res: i64;
   tmp, t,i: i16;
begin
   res := cache[idx,pr,s1,s2];
   if(res<>-1) then Exit(res);
   tmp := 0;
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
               res := res + count(idx+1, i, s1, 0, n) 
            else res := res + count(idx+1, i, s1, 1, n);
         end
         else if(pr >= i) then
              res := res + count(idx+1, i, s1, 1, n);
      end;
   end
   else
   begin
      t := i32(n^[idx+1])-48;
      for i := 0 to t do begin
         if(i < t) then tmp := 1
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
   cache[idx,pr,s1,s2] := res;
   Exit(res);
end;


begin
   readln(countc);
   for k := 0 to countc-1 do begin
      for i := 0 to 75 do
         for j := 0 to 10 do begin
            cache[i,j,0,0] := -1;
            cache[i,j,0,1] := -1;
            cache[i,j,1,0] := -1;
            cache[i,j,1,1] := -1;
         end;
      readln(n);
      len := Length(n);
      if(check(n))then
      Writeln(count(0,0,0,0,@n))
      else Writeln('-1');
   end;
end.
