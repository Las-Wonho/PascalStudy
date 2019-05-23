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

var
   n:String;
   arr_len:i8;
   countc, i: i16;
begin
   readln(n);
   writeln(i16(n[0]));
   for i := 0 to i16(n[0]) do begin
      writeln(i);
   end
end.
